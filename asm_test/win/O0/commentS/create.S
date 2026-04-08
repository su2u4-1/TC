	.file	"create.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC1:
	.ascii "Error creating code member: unknown type %u\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
create_code_member:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; import_content, import_content
	movq	%r8, 32(%rbp)	 ; function_content, function_content
	movq	%r9, 40(%rbp)	 ; class_content, class_content
 ; D:/TC/src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, code_member
 ; D:/TC/src/create.c:5:     code_member->type = type;
	movq	-8(%rbp), %rax	 ; code_member, tmp89
	movl	16(%rbp), %edx	 ; type, tmp90
	movl	%edx, 8(%rax)	 ; tmp90, code_member_8->type
 ; D:/TC/src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L2	 ;,
 ; D:/TC/src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpq	$0, 24(%rbp)	 ;, import_content
	je	.L2	 ;,
 ; D:/TC/src/create.c:7:         code_member->content.import = import_content;
	movq	-8(%rbp), %rax	 ; code_member, tmp91
	movq	24(%rbp), %rdx	 ; import_content, tmp92
	movq	%rdx, (%rax)	 ; tmp92, code_member_8->content.import
	jmp	.L3	 ;
.L2:
 ; D:/TC/src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L4	 ;,
 ; D:/TC/src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpq	$0, 32(%rbp)	 ;, function_content
	je	.L4	 ;,
 ; D:/TC/src/create.c:9:         code_member->content.function = function_content;
	movq	-8(%rbp), %rax	 ; code_member, tmp93
	movq	32(%rbp), %rdx	 ; function_content, tmp94
	movq	%rdx, (%rax)	 ; tmp94, code_member_8->content.function
	jmp	.L3	 ;
.L4:
 ; D:/TC/src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, 16(%rbp)	 ;, type
	jne	.L5	 ;,
 ; D:/TC/src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpq	$0, 40(%rbp)	 ;, class_content
	je	.L5	 ;,
 ; D:/TC/src/create.c:11:         code_member->content.class = class_content;
	movq	-8(%rbp), %rax	 ; code_member, tmp95
	movq	40(%rbp), %rdx	 ; class_content, tmp96
	movq	%rdx, (%rax)	 ; tmp96, code_member_8->content.class
	jmp	.L3	 ;
.L5:
 ; D:/TC/src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	cmpq	$0, 24(%rbp)	 ;, import_content
	jne	.L6	 ;,
 ; D:/TC/src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	cmpq	$0, 32(%rbp)	 ;, function_content
	jne	.L6	 ;,
 ; D:/TC/src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	cmpq	$0, 40(%rbp)	 ;, class_content
	jne	.L6	 ;,
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
 ; D:/TC/src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L3	 ;
.L6:
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:/TC/src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movl	16(%rbp), %edx	 ; type, tmp98
	movl	%edx, %r8d	 ; tmp98,
	leaq	.LC1(%rip), %rdx	 ;, tmp99
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L3:
 ; D:/TC/src/create.c:16:     return code_member;
	movq	-8(%rbp), %rax	 ; code_member, _21
 ; D:/TC/src/create.c:17: }
	leave	
	ret	
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
create_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; members, members
	movq	%rdx, 24(%rbp)	 ; global_scope, global_scope
 ; D:/TC/src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, code
 ; D:/TC/src/create.c:21:     code->members = members;
	movq	-8(%rbp), %rax	 ; code, tmp85
	movq	16(%rbp), %rdx	 ; members, tmp86
	movq	%rdx, (%rax)	 ; tmp86, code_3->members
 ; D:/TC/src/create.c:22:     code->global_scope = global_scope;
	movq	-8(%rbp), %rax	 ; code, tmp87
	movq	24(%rbp), %rdx	 ; global_scope, tmp88
	movq	%rdx, 8(%rax)	 ; tmp88, code_3->global_scope
 ; D:/TC/src/create.c:23:     return code;
	movq	-8(%rbp), %rax	 ; code, _8
 ; D:/TC/src/create.c:24: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
create_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; source, source
 ; D:/TC/src/create.c:27:     if (name == NULL) {
	cmpq	$0, 16(%rbp)	 ;, name
	jne	.L11	 ;,
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$36, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:29:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L12	 ;
.L11:
 ; D:/TC/src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, import
 ; D:/TC/src/create.c:32:     import->name = name;
	movq	-8(%rbp), %rax	 ; import, tmp88
	movq	16(%rbp), %rdx	 ; name, tmp89
	movq	%rdx, (%rax)	 ; tmp89, import_8->name
 ; D:/TC/src/create.c:33:     import->source = source;
	movq	-8(%rbp), %rax	 ; import, tmp90
	movq	24(%rbp), %rdx	 ; source, tmp91
	movq	%rdx, 8(%rax)	 ; tmp91, import_8->source
 ; D:/TC/src/create.c:34:     return import;
	movq	-8(%rbp), %rax	 ; import, _3
.L12:
 ; D:/TC/src/create.c:35: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function_use_ptr
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
create_function_use_ptr:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; function, function
	movq	%rdx, 24(%rbp)	 ; name, name
	movq	%r8, 32(%rbp)	 ; return_type, return_type
	movq	%r9, 40(%rbp)	 ; parameters, parameters
 ; D:/TC/src/create.c:38:     if (name == NULL || return_type == NULL) {
	cmpq	$0, 24(%rbp)	 ;, name
	je	.L14	 ;,
 ; D:/TC/src/create.c:38:     if (name == NULL || return_type == NULL) {
	cmpq	$0, 32(%rbp)	 ;, return_type
	jne	.L15	 ;,
.L14:
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:40:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L16	 ;
.L15:
 ; D:/TC/src/create.c:42:     function->name = name;
	movq	16(%rbp), %rax	 ; function, tmp87
	movq	24(%rbp), %rdx	 ; name, tmp88
	movq	%rdx, (%rax)	 ; tmp88, function_8(D)->name
 ; D:/TC/src/create.c:43:     function->return_type = return_type;
	movq	16(%rbp), %rax	 ; function, tmp89
	movq	32(%rbp), %rdx	 ; return_type, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, function_8(D)->return_type
 ; D:/TC/src/create.c:44:     function->parameters = parameters;
	movq	16(%rbp), %rax	 ; function, tmp91
	movq	40(%rbp), %rdx	 ; parameters, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, function_8(D)->parameters
 ; D:/TC/src/create.c:45:     function->body = body;
	movq	16(%rbp), %rax	 ; function, tmp93
	movq	48(%rbp), %rdx	 ; body, tmp94
	movq	%rdx, 24(%rax)	 ; tmp94, function_8(D)->body
 ; D:/TC/src/create.c:46:     function->function_scope = function_scope;
	movq	16(%rbp), %rax	 ; function, tmp95
	movq	56(%rbp), %rdx	 ; function_scope, tmp96
	movq	%rdx, 32(%rax)	 ; tmp96, function_8(D)->function_scope
 ; D:/TC/src/create.c:47:     return function;
	movq	16(%rbp), %rax	 ; function, _3
.L16:
 ; D:/TC/src/create.c:48: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method_use_ptr
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
create_method_use_ptr:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; method, method
	movq	%rdx, 24(%rbp)	 ; name, name
	movq	%r8, 32(%rbp)	 ; return_type, return_type
	movq	%r9, 40(%rbp)	 ; parameters, parameters
 ; D:/TC/src/create.c:51:     if (name == NULL || return_type == NULL) {
	cmpq	$0, 24(%rbp)	 ;, name
	je	.L18	 ;,
 ; D:/TC/src/create.c:51:     if (name == NULL || return_type == NULL) {
	cmpq	$0, 32(%rbp)	 ;, return_type
	jne	.L19	 ;,
.L18:
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$51, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:53:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L20	 ;
.L19:
 ; D:/TC/src/create.c:55:     method->name = name;
	movq	16(%rbp), %rax	 ; method, tmp87
	movq	24(%rbp), %rdx	 ; name, tmp88
	movq	%rdx, (%rax)	 ; tmp88, method_8(D)->name
 ; D:/TC/src/create.c:56:     method->return_type = return_type;
	movq	16(%rbp), %rax	 ; method, tmp89
	movq	32(%rbp), %rdx	 ; return_type, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, method_8(D)->return_type
 ; D:/TC/src/create.c:57:     method->parameters = parameters;
	movq	16(%rbp), %rax	 ; method, tmp91
	movq	40(%rbp), %rdx	 ; parameters, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, method_8(D)->parameters
 ; D:/TC/src/create.c:58:     method->body = body;
	movq	16(%rbp), %rax	 ; method, tmp93
	movq	48(%rbp), %rdx	 ; body, tmp94
	movq	%rdx, 24(%rax)	 ; tmp94, method_8(D)->body
 ; D:/TC/src/create.c:59:     method->method_scope = method_scope;
	movq	16(%rbp), %rax	 ; method, tmp95
	movq	56(%rbp), %rdx	 ; method_scope, tmp96
	movq	%rdx, 32(%rax)	 ; tmp96, method_8(D)->method_scope
 ; D:/TC/src/create.c:60:     return method;
	movq	16(%rbp), %rax	 ; method, _3
.L20:
 ; D:/TC/src/create.c:61: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %u\12\0"
	.text
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
create_class_member:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; method_content, method_content
	movq	%r8, 32(%rbp)	 ; variable_content, variable_content
 ; D:/TC/src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, class_member
 ; D:/TC/src/create.c:65:     class_member->type = type;
	movq	-8(%rbp), %rax	 ; class_member, tmp89
	movl	16(%rbp), %edx	 ; type, tmp90
	movl	%edx, 8(%rax)	 ; tmp90, class_member_11->type
 ; D:/TC/src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L22	 ;,
 ; D:/TC/src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	cmpq	$0, 24(%rbp)	 ;, method_content
	je	.L22	 ;,
 ; D:/TC/src/create.c:67:         class_member->content.method = method_content;
	movq	-8(%rbp), %rax	 ; class_member, tmp91
	movq	24(%rbp), %rdx	 ; method_content, tmp92
	movq	%rdx, (%rax)	 ; tmp92, class_member_11->content.method
	jmp	.L23	 ;
.L22:
 ; D:/TC/src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L24	 ;,
 ; D:/TC/src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpq	$0, 32(%rbp)	 ;, variable_content
	je	.L24	 ;,
 ; D:/TC/src/create.c:69:         class_member->content.variable = variable_content;
	movq	-8(%rbp), %rax	 ; class_member, tmp93
	movq	32(%rbp), %rdx	 ; variable_content, tmp94
	movq	%rdx, (%rax)	 ; tmp94, class_member_11->content.variable
	jmp	.L23	 ;
.L24:
 ; D:/TC/src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	cmpq	$0, 24(%rbp)	 ;, method_content
	jne	.L25	 ;,
 ; D:/TC/src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	cmpq	$0, 32(%rbp)	 ;, variable_content
	jne	.L25	 ;,
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$45, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:/TC/src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	jmp	.L26	 ;
.L25:
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:/TC/src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movl	16(%rbp), %edx	 ; type, tmp96
	movl	%edx, %r8d	 ; tmp96,
	leaq	.LC6(%rip), %rdx	 ;, tmp97
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L26:
 ; D:/TC/src/create.c:75:         return NULL;
	movl	$0, %eax	 ;, _5
	jmp	.L27	 ;
.L23:
 ; D:/TC/src/create.c:77:     return class_member;
	movq	-8(%rbp), %rax	 ; class_member, _5
.L27:
 ; D:/TC/src/create.c:78: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class_use_ptr
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
create_class_use_ptr:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class, class
	movq	%rdx, 24(%rbp)	 ; name, name
	movq	%r8, 32(%rbp)	 ; members, members
	movq	%r9, 40(%rbp)	 ; class_scope, class_scope
 ; D:/TC/src/create.c:81:     if (name == NULL) {
	cmpq	$0, 24(%rbp)	 ;, name
	jne	.L29	 ;,
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:83:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L30	 ;
.L29:
 ; D:/TC/src/create.c:85:     class->name = name;
	movq	16(%rbp), %rax	 ; class, tmp87
	movq	24(%rbp), %rdx	 ; name, tmp88
	movq	%rdx, (%rax)	 ; tmp88, class_7(D)->name
 ; D:/TC/src/create.c:86:     class->members = members;
	movq	16(%rbp), %rax	 ; class, tmp89
	movq	32(%rbp), %rdx	 ; members, tmp90
	movq	%rdx, 8(%rax)	 ; tmp90, class_7(D)->members
 ; D:/TC/src/create.c:87:     class->class_scope = class_scope;
	movq	16(%rbp), %rax	 ; class, tmp91
	movq	40(%rbp), %rdx	 ; class_scope, tmp92
	movq	%rdx, 16(%rax)	 ; tmp92, class_7(D)->class_scope
 ; D:/TC/src/create.c:88:     class->size = size;
	movq	16(%rbp), %rax	 ; class, tmp93
	movq	48(%rbp), %rdx	 ; size, tmp94
	movq	%rdx, 24(%rax)	 ; tmp94, class_7(D)->size
 ; D:/TC/src/create.c:89:     return class;
	movq	16(%rbp), %rax	 ; class, _3
.L30:
 ; D:/TC/src/create.c:90: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
create_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; name, name
	movq	%r8, 32(%rbp)	 ; value, value
 ; D:/TC/src/create.c:93:     if (type == NULL || name == NULL) {
	cmpq	$0, 16(%rbp)	 ;, type
	je	.L32	 ;,
 ; D:/TC/src/create.c:93:     if (type == NULL || name == NULL) {
	cmpq	$0, 24(%rbp)	 ;, name
	jne	.L33	 ;,
.L32:
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:95:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L34	 ;
.L33:
 ; D:/TC/src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, variable
 ; D:/TC/src/create.c:98:     variable->type = type;
	movq	-8(%rbp), %rax	 ; variable, tmp88
	movq	16(%rbp), %rdx	 ; type, tmp89
	movq	%rdx, (%rax)	 ; tmp89, variable_9->type
 ; D:/TC/src/create.c:99:     variable->name = name;
	movq	-8(%rbp), %rax	 ; variable, tmp90
	movq	24(%rbp), %rdx	 ; name, tmp91
	movq	%rdx, 8(%rax)	 ; tmp91, variable_9->name
 ; D:/TC/src/create.c:100:     variable->value = value;
	movq	-8(%rbp), %rax	 ; variable, tmp92
	movq	32(%rbp), %rdx	 ; value, tmp93
	movq	%rdx, 16(%rax)	 ; tmp93, variable_9->value
 ; D:/TC/src/create.c:101:     return variable;
	movq	-8(%rbp), %rax	 ; variable, _3
.L34:
 ; D:/TC/src/create.c:102: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %u\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
create_statement:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; if_stmt, if_stmt
	movq	%r8, 32(%rbp)	 ; while_stmt, while_stmt
	movq	%r9, 40(%rbp)	 ; for_stmt, for_stmt
 ; D:/TC/src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, statement
 ; D:/TC/src/create.c:106:     statement->type = type;
	movq	-8(%rbp), %rax	 ; statement, tmp89
	movl	16(%rbp), %edx	 ; type, tmp90
	movl	%edx, 8(%rax)	 ; tmp90, statement_11->type
 ; D:/TC/src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L36	 ;,
 ; D:/TC/src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	cmpq	$0, 48(%rbp)	 ;, expr
	je	.L36	 ;,
 ; D:/TC/src/create.c:108:         statement->stmt.expr = expr;
	movq	-8(%rbp), %rax	 ; statement, tmp91
	movq	48(%rbp), %rdx	 ; expr, tmp92
	movq	%rdx, (%rax)	 ; tmp92, statement_11->stmt.expr
	jmp	.L37	 ;
.L36:
 ; D:/TC/src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L38	 ;,
 ; D:/TC/src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpq	$0, 56(%rbp)	 ;, var_stmt
	je	.L38	 ;,
 ; D:/TC/src/create.c:110:         statement->stmt.var = var_stmt;
	movq	-8(%rbp), %rax	 ; statement, tmp93
	movq	56(%rbp), %rdx	 ; var_stmt, tmp94
	movq	%rdx, (%rax)	 ; tmp94, statement_11->stmt.var
	jmp	.L37	 ;
.L38:
 ; D:/TC/src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, 16(%rbp)	 ;, type
	jne	.L39	 ;,
 ; D:/TC/src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpq	$0, 24(%rbp)	 ;, if_stmt
	je	.L39	 ;,
 ; D:/TC/src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	-8(%rbp), %rax	 ; statement, tmp95
	movq	24(%rbp), %rdx	 ; if_stmt, tmp96
	movq	%rdx, (%rax)	 ; tmp96, statement_11->stmt.if_stmt
	jmp	.L37	 ;
.L39:
 ; D:/TC/src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, 16(%rbp)	 ;, type
	jne	.L40	 ;,
 ; D:/TC/src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpq	$0, 32(%rbp)	 ;, while_stmt
	je	.L40	 ;,
 ; D:/TC/src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	-8(%rbp), %rax	 ; statement, tmp97
	movq	32(%rbp), %rdx	 ; while_stmt, tmp98
	movq	%rdx, (%rax)	 ; tmp98, statement_11->stmt.while_stmt
	jmp	.L37	 ;
.L40:
 ; D:/TC/src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, 16(%rbp)	 ;, type
	jne	.L41	 ;,
 ; D:/TC/src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpq	$0, 40(%rbp)	 ;, for_stmt
	je	.L41	 ;,
 ; D:/TC/src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	-8(%rbp), %rax	 ; statement, tmp99
	movq	40(%rbp), %rdx	 ; for_stmt, tmp100
	movq	%rdx, (%rax)	 ; tmp100, statement_11->stmt.for_stmt
	jmp	.L37	 ;
.L41:
 ; D:/TC/src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, 16(%rbp)	 ;, type
	jne	.L42	 ;,
 ; D:/TC/src/create.c:118:         statement->stmt.return_expr = expr;
	movq	-8(%rbp), %rax	 ; statement, tmp101
	movq	48(%rbp), %rdx	 ; expr, tmp102
	movq	%rdx, (%rax)	 ; tmp102, statement_11->stmt.return_expr
	jmp	.L37	 ;
.L42:
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$6, 16(%rbp)	 ;, type
	je	.L43	 ;,
 ; D:/TC/src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$7, 16(%rbp)	 ;, type
	jne	.L44	 ;,
.L43:
 ; D:/TC/src/create.c:120:         statement->stmt.expr = NULL;
	movq	-8(%rbp), %rax	 ; statement, tmp103
	movq	$0, (%rax)	 ;, statement_11->stmt.expr
	jmp	.L37	 ;
.L44:
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, 24(%rbp)	 ;, if_stmt
	jne	.L45	 ;,
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, 32(%rbp)	 ;, while_stmt
	jne	.L45	 ;,
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, 40(%rbp)	 ;, for_stmt
	jne	.L45	 ;,
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, 48(%rbp)	 ;, expr
	jne	.L45	 ;,
 ; D:/TC/src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, 56(%rbp)	 ;, var_stmt
	jne	.L45	 ;,
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$42, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:/TC/src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L46	 ;
.L45:
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:/TC/src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movl	16(%rbp), %edx	 ; type, tmp105
	movl	%edx, %r8d	 ; tmp105,
	leaq	.LC10(%rip), %rdx	 ;, tmp106
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L46:
 ; D:/TC/src/create.c:126:         return NULL;
	movl	$0, %eax	 ;, _5
	jmp	.L47	 ;
.L37:
 ; D:/TC/src/create.c:128:     return statement;
	movq	-8(%rbp), %rax	 ; statement, _5
.L47:
 ; D:/TC/src/create.c:129: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
create_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; condition, condition
	movq	%rdx, 24(%rbp)	 ; body, body
	movq	%r8, 32(%rbp)	 ; else_if, else_if
	movq	%r9, 40(%rbp)	 ; else_body, else_body
 ; D:/TC/src/create.c:132:     if (condition == NULL) {
	cmpq	$0, 16(%rbp)	 ;, condition
	jne	.L49	 ;,
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:134:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L50	 ;
.L49:
 ; D:/TC/src/create.c:136:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, if_
 ; D:/TC/src/create.c:137:     if_->condition = condition;
	movq	-8(%rbp), %rax	 ; if_, tmp88
	movq	16(%rbp), %rdx	 ; condition, tmp89
	movq	%rdx, (%rax)	 ; tmp89, if__8->condition
 ; D:/TC/src/create.c:138:     if_->body = body;
	movq	-8(%rbp), %rax	 ; if_, tmp90
	movq	24(%rbp), %rdx	 ; body, tmp91
	movq	%rdx, 8(%rax)	 ; tmp91, if__8->body
 ; D:/TC/src/create.c:139:     if_->else_if = else_if;
	movq	-8(%rbp), %rax	 ; if_, tmp92
	movq	32(%rbp), %rdx	 ; else_if, tmp93
	movq	%rdx, 16(%rax)	 ; tmp93, if__8->else_if
 ; D:/TC/src/create.c:140:     if_->else_body = else_body;
	movq	-8(%rbp), %rax	 ; if_, tmp94
	movq	40(%rbp), %rdx	 ; else_body, tmp95
	movq	%rdx, 24(%rax)	 ; tmp95, if__8->else_body
 ; D:/TC/src/create.c:141:     return if_;
	movq	-8(%rbp), %rax	 ; if_, _3
.L50:
 ; D:/TC/src/create.c:142: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
create_else_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; condition, condition
	movq	%rdx, 24(%rbp)	 ; body, body
 ; D:/TC/src/create.c:145:     if (condition == NULL) {
	cmpq	$0, 16(%rbp)	 ;, condition
	jne	.L52	 ;,
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:/TC/src/create.c:147:         return NULL;
	movl	$0, %eax	 ;, _3
	jmp	.L53	 ;
.L52:
 ; D:/TC/src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, else_if
 ; D:/TC/src/create.c:150:     else_if->condition = condition;
	movq	-8(%rbp), %rax	 ; else_if, tmp88
	movq	16(%rbp), %rdx	 ; condition, tmp89
	movq	%rdx, (%rax)	 ; tmp89, else_if_8->condition
 ; D:/TC/src/create.c:151:     else_if->body = body;
	movq	-8(%rbp), %rax	 ; else_if, tmp90
	movq	24(%rbp), %rdx	 ; body, tmp91
	movq	%rdx, 8(%rax)	 ; tmp91, else_if_8->body
 ; D:/TC/src/create.c:152:     return else_if;
	movq	-8(%rbp), %rax	 ; else_if, _3
.L53:
 ; D:/TC/src/create.c:153: }
	leave	
	ret	
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
create_for:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; initializer, initializer
	movq	%rdx, 24(%rbp)	 ; condition, condition
	movq	%r8, 32(%rbp)	 ; increment, increment
	movq	%r9, 40(%rbp)	 ; body, body
 ; D:/TC/src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, for_
 ; D:/TC/src/create.c:157:     for_->initializer = initializer;
	movq	-8(%rbp), %rax	 ; for_, tmp85
	movq	16(%rbp), %rdx	 ; initializer, tmp86
	movq	%rdx, (%rax)	 ; tmp86, for__3->initializer
 ; D:/TC/src/create.c:158:     for_->condition = condition;
	movq	-8(%rbp), %rax	 ; for_, tmp87
	movq	24(%rbp), %rdx	 ; condition, tmp88
	movq	%rdx, 8(%rax)	 ; tmp88, for__3->condition
 ; D:/TC/src/create.c:159:     for_->increment = increment;
	movq	-8(%rbp), %rax	 ; for_, tmp89
	movq	32(%rbp), %rdx	 ; increment, tmp90
	movq	%rdx, 16(%rax)	 ; tmp90, for__3->increment
 ; D:/TC/src/create.c:160:     for_->body = body;
	movq	-8(%rbp), %rax	 ; for_, tmp91
	movq	40(%rbp), %rdx	 ; body, tmp92
	movq	%rdx, 24(%rax)	 ; tmp92, for__3->body
 ; D:/TC/src/create.c:161:     return for_;
	movq	-8(%rbp), %rax	 ; for_, _12
 ; D:/TC/src/create.c:162: }
	leave	
	ret	
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
create_while:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; condition, condition
	movq	%rdx, 24(%rbp)	 ; body, body
 ; D:/TC/src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, while_
 ; D:/TC/src/create.c:166:     while_->condition = condition;
	movq	-8(%rbp), %rax	 ; while_, tmp85
	movq	16(%rbp), %rdx	 ; condition, tmp86
	movq	%rdx, (%rax)	 ; tmp86, while__3->condition
 ; D:/TC/src/create.c:167:     while_->body = body;
	movq	-8(%rbp), %rax	 ; while_, tmp87
	movq	24(%rbp), %rdx	 ; body, tmp88
	movq	%rdx, 8(%rax)	 ; tmp88, while__3->body
 ; D:/TC/src/create.c:168:     return while_;
	movq	-8(%rbp), %rax	 ; while_, _8
 ; D:/TC/src/create.c:169: }
	leave	
	ret	
	.section .rdata,"dr"
.LC13:
	.ascii "true\0"
.LC14:
	.ascii "false\0"
	.align 8
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\12\0"
	.align 8
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
create_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$64, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; operator, operator
	movq	%rdx, 24(%rbp)	 ; expr_left, expr_left
	movq	%r8, 32(%rbp)	 ; prim_left, prim_left
	movq	%r9, 40(%rbp)	 ; right, right
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, 16(%rbp)	 ;, operator
	sete	%dl	 ;, _1
	cmpq	$0, 40(%rbp)	 ;, right
	sete	%al	 ;, _2
	xorl	%edx, %eax	 ; _1, _3
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	testb	%al, %al	 ; _3
	jne	.L59	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpq	$0, 24(%rbp)	 ;, expr_left
	jne	.L60	 ;,
 ; D:/TC/src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpq	$0, 32(%rbp)	 ;, prim_left
	jne	.L60	 ;,
.L59:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpq	$0, 40(%rbp)	 ;, right
	jne	.L61	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rsi	 ;, iftmp.0_8
	jmp	.L62	 ;
.L61:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rsi	 ;, iftmp.0_8
.L62:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpq	$0, 32(%rbp)	 ;, prim_left
	jne	.L63	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rbx	 ;, iftmp.1_9
	jmp	.L64	 ;
.L63:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rbx	 ;, iftmp.1_9
.L64:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpq	$0, 24(%rbp)	 ;, expr_left
	jne	.L65	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %r12	 ;, iftmp.2_10
	jmp	.L66	 ;
.L65:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %r12	 ;, iftmp.2_10
.L66:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, 16(%rbp)	 ;, operator
	jne	.L67	 ;,
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rdi	 ;, iftmp.3_11
	jmp	.L68	 ;
.L67:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rdi	 ;, iftmp.3_11
.L68:
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	call	__getreent	 ;
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:/TC/src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	%rsi, 40(%rsp)	 ; iftmp.0_8,
	movq	%rbx, 32(%rsp)	 ; iftmp.1_9,
	movq	%r12, %r9	 ; iftmp.2_10,
	movq	%rdi, %r8	 ; iftmp.3_11,
	leaq	.LC15(%rip), %rdx	 ;, tmp95
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:/TC/src/create.c:178:         return NULL;
	movl	$0, %eax	 ;, _12
	jmp	.L69	 ;
.L60:
 ; D:/TC/src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -40(%rbp)	 ; tmp96, expression
 ; D:/TC/src/create.c:181:     expression->operator = operator;
	movq	-40(%rbp), %rax	 ; expression, tmp97
	movl	16(%rbp), %edx	 ; operator, tmp98
	movl	%edx, 24(%rax)	 ; tmp98, expression_21->operator
 ; D:/TC/src/create.c:182:     if (expr_left != NULL)
	cmpq	$0, 24(%rbp)	 ;, expr_left
	je	.L70	 ;,
 ; D:/TC/src/create.c:183:         expression->expr_left = expr_left;
	movq	-40(%rbp), %rax	 ; expression, tmp99
	movq	24(%rbp), %rdx	 ; expr_left, tmp100
	movq	%rdx, (%rax)	 ; tmp100, expression_21->expr_left
	jmp	.L71	 ;
.L70:
 ; D:/TC/src/create.c:184:     else if (prim_left != NULL)
	cmpq	$0, 32(%rbp)	 ;, prim_left
	je	.L72	 ;,
 ; D:/TC/src/create.c:185:         expression->prim_left = prim_left;
	movq	-40(%rbp), %rax	 ; expression, tmp101
	movq	32(%rbp), %rdx	 ; prim_left, tmp102
	movq	%rdx, 8(%rax)	 ; tmp102, expression_21->prim_left
	jmp	.L71	 ;
.L72:
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	24(%rax), %rax	 ; _6->_stderr, _7
 ; D:/TC/src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	%rax, %r9	 ; _7,
	movl	$65, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	fwrite	 ;
 ; D:/TC/src/create.c:188:         return NULL;
	movl	$0, %eax	 ;, _12
	jmp	.L69	 ;
.L71:
 ; D:/TC/src/create.c:190:     expression->right = right;
	movq	-40(%rbp), %rax	 ; expression, tmp104
	movq	40(%rbp), %rdx	 ; right, tmp105
	movq	%rdx, 16(%rax)	 ; tmp105, expression_21->right
 ; D:/TC/src/create.c:191:     return expression;
	movq	-40(%rbp), %rax	 ; expression, _12
.L69:
 ; D:/TC/src/create.c:192: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %u\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
create_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; str_value, str_value
	movq	%r8, 32(%rbp)	 ; expr_value, expr_value
	movq	%r9, 40(%rbp)	 ; prim_value, prim_value
 ; D:/TC/src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, primary
 ; D:/TC/src/create.c:196:     primary->type = type;
	movq	-8(%rbp), %rax	 ; primary, tmp89
	movl	16(%rbp), %edx	 ; type, tmp90
	movl	%edx, 8(%rax)	 ; tmp90, primary_11->type
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	je	.L74	 ;,
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	je	.L74	 ;,
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$2, 16(%rbp)	 ;, type
	je	.L74	 ;,
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$3, 16(%rbp)	 ;, type
	je	.L74	 ;,
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, 16(%rbp)	 ;, type
	jne	.L75	 ;,
.L74:
 ; D:/TC/src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpq	$0, 24(%rbp)	 ;, str_value
	je	.L75	 ;,
 ; D:/TC/src/create.c:198:         primary->value.literal_value = str_value;
	movq	-8(%rbp), %rax	 ; primary, tmp91
	movq	24(%rbp), %rdx	 ; str_value, tmp92
	movq	%rdx, (%rax)	 ; tmp92, primary_11->value.literal_value
	jmp	.L76	 ;
.L75:
 ; D:/TC/src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, 16(%rbp)	 ;, type
	jne	.L77	 ;,
 ; D:/TC/src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpq	$0, 32(%rbp)	 ;, expr_value
	je	.L77	 ;,
 ; D:/TC/src/create.c:200:         primary->value.expr = expr_value;
	movq	-8(%rbp), %rax	 ; primary, tmp93
	movq	32(%rbp), %rdx	 ; expr_value, tmp94
	movq	%rdx, (%rax)	 ; tmp94, primary_11->value.expr
	jmp	.L76	 ;
.L77:
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$6, 16(%rbp)	 ;, type
	je	.L78	 ;,
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$7, 16(%rbp)	 ;, type
	jne	.L79	 ;,
.L78:
 ; D:/TC/src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpq	$0, 40(%rbp)	 ;, prim_value
	je	.L79	 ;,
 ; D:/TC/src/create.c:202:         primary->value.operand = prim_value;
	movq	-8(%rbp), %rax	 ; primary, tmp95
	movq	40(%rbp), %rdx	 ; prim_value, tmp96
	movq	%rdx, (%rax)	 ; tmp96, primary_11->value.operand
	jmp	.L76	 ;
.L79:
 ; D:/TC/src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, 16(%rbp)	 ;, type
	jne	.L80	 ;,
 ; D:/TC/src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpq	$0, 48(%rbp)	 ;, variable_value
	je	.L80	 ;,
 ; D:/TC/src/create.c:204:         primary->value.var = variable_value;
	movq	-8(%rbp), %rax	 ; primary, tmp97
	movq	48(%rbp), %rdx	 ; variable_value, tmp98
	movq	%rdx, (%rax)	 ; tmp98, primary_11->value.var
	jmp	.L76	 ;
.L80:
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, 24(%rbp)	 ;, str_value
	jne	.L81	 ;,
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, 32(%rbp)	 ;, expr_value
	jne	.L81	 ;,
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, 40(%rbp)	 ;, prim_value
	jne	.L81	 ;,
 ; D:/TC/src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, 48(%rbp)	 ;, variable_value
	jne	.L81	 ;,
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	fwrite	 ;
 ; D:/TC/src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L82	 ;
.L81:
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:/TC/src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movl	16(%rbp), %edx	 ; type, tmp100
	movl	%edx, %r8d	 ; tmp100,
	leaq	.LC18(%rip), %rdx	 ;, tmp101
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L82:
 ; D:/TC/src/create.c:210:         return NULL;
	movl	$0, %eax	 ;, _5
	jmp	.L83	 ;
.L76:
 ; D:/TC/src/create.c:212:     return primary;
	movq	-8(%rbp), %rax	 ; primary, _5
.L83:
 ; D:/TC/src/create.c:213: }
	leave	
	ret	
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC21:
	.ascii "Error creating variable access: unknown type %u\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
create_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; base, base
	movq	%r8, 32(%rbp)	 ; name_content, name_content
	movq	%r9, 40(%rbp)	 ; expr_content, expr_content
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpq	$0, 24(%rbp)	 ;, base
	sete	%dl	 ;, _1
	cmpl	$0, 16(%rbp)	 ;, type
	sete	%al	 ;, _2
	xorl	%edx, %eax	 ; _1, _3
 ; D:/TC/src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testb	%al, %al	 ; _3
	je	.L85	 ;,
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L86	 ;,
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rsi	 ;, iftmp.4_10
	jmp	.L87	 ;
.L86:
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rsi	 ;, iftmp.4_10
.L87:
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpq	$0, 24(%rbp)	 ;, base
	jne	.L88	 ;,
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rbx	 ;, iftmp.5_11
	jmp	.L89	 ;
.L88:
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rbx	 ;, iftmp.5_11
.L89:
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	__getreent	 ;
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:/TC/src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rsi, %r9	 ; iftmp.4_10,
	movq	%rbx, %r8	 ; iftmp.5_11,
	leaq	.LC19(%rip), %rdx	 ;, tmp95
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:/TC/src/create.c:218:         return NULL;
	movl	$0, %eax	 ;, _12
	jmp	.L90	 ;
.L85:
 ; D:/TC/src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -24(%rbp)	 ; tmp96, variable_access
 ; D:/TC/src/create.c:221:     variable_access->type = type;
	movq	-24(%rbp), %rax	 ; variable_access, tmp97
	movl	16(%rbp), %edx	 ; type, tmp98
	movl	%edx, 16(%rax)	 ; tmp98, variable_access_20->type
 ; D:/TC/src/create.c:222:     variable_access->base = base;
	movq	-24(%rbp), %rax	 ; variable_access, tmp99
	movq	24(%rbp), %rdx	 ; base, tmp100
	movq	%rdx, (%rax)	 ; tmp100, variable_access_20->base
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L91	 ;,
 ; D:/TC/src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	cmpq	$0, 32(%rbp)	 ;, name_content
	je	.L91	 ;,
 ; D:/TC/src/create.c:224:         variable_access->content.name = name_content;
	movq	-24(%rbp), %rax	 ; variable_access, tmp101
	movq	32(%rbp), %rdx	 ; name_content, tmp102
	movq	%rdx, 8(%rax)	 ; tmp102, variable_access_20->content.name
	jmp	.L92	 ;
.L91:
 ; D:/TC/src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L93	 ;,
 ; D:/TC/src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpq	$0, 48(%rbp)	 ;, args_content
	je	.L93	 ;,
 ; D:/TC/src/create.c:226:         variable_access->content.args = args_content;
	movq	-24(%rbp), %rax	 ; variable_access, tmp103
	movq	48(%rbp), %rdx	 ; args_content, tmp104
	movq	%rdx, 8(%rax)	 ; tmp104, variable_access_20->content.args
	jmp	.L92	 ;
.L93:
 ; D:/TC/src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, 16(%rbp)	 ;, type
	jne	.L94	 ;,
 ; D:/TC/src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpq	$0, 40(%rbp)	 ;, expr_content
	je	.L94	 ;,
 ; D:/TC/src/create.c:228:         variable_access->content.index = expr_content;
	movq	-24(%rbp), %rax	 ; variable_access, tmp105
	movq	40(%rbp), %rdx	 ; expr_content, tmp106
	movq	%rdx, 8(%rax)	 ; tmp106, variable_access_20->content.index
	jmp	.L92	 ;
.L94:
 ; D:/TC/src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, 16(%rbp)	 ;, type
	jne	.L95	 ;,
 ; D:/TC/src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpq	$0, 32(%rbp)	 ;, name_content
	je	.L95	 ;,
 ; D:/TC/src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	-24(%rbp), %rax	 ; variable_access, tmp107
	movq	32(%rbp), %rdx	 ; name_content, tmp108
	movq	%rdx, 8(%rax)	 ; tmp108, variable_access_20->content.attr_name
	jmp	.L92	 ;
.L95:
 ; D:/TC/src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	cmpq	$0, 32(%rbp)	 ;, name_content
	jne	.L96	 ;,
 ; D:/TC/src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	cmpq	$0, 40(%rbp)	 ;, expr_content
	jne	.L96	 ;,
 ; D:/TC/src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	cmpq	$0, 48(%rbp)	 ;, args_content
	jne	.L96	 ;,
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	__getreent	 ;
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	24(%rax), %rax	 ; _6->_stderr, _7
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	%rax, %r9	 ; _7,
	movl	$48, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
 ; D:/TC/src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L97	 ;
.L96:
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	call	__getreent	 ;
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:/TC/src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movl	16(%rbp), %edx	 ; type, tmp110
	movl	%edx, %r8d	 ; tmp110,
	leaq	.LC21(%rip), %rdx	 ;, tmp111
	movq	%rax, %rcx	 ; _9,
	call	fprintf	 ;
.L97:
 ; D:/TC/src/create.c:236:         return NULL;
	movl	$0, %eax	 ;, _12
	jmp	.L90	 ;
.L92:
 ; D:/TC/src/create.c:238:     return variable_access;
	movq	-24(%rbp), %rax	 ; variable_access, _12
.L90:
 ; D:/TC/src/create.c:239: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef

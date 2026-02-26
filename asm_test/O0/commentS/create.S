	.file	"D:\\TC\\src\\create.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Error creating code member: content is NULL\12\0"
	.align 8
.LC1:
	.ascii "Error creating code member: unknown type %d\12\0"
	.text
	.globl	create_code_member
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.seh_proc	create_code_member
create_code_member:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; import_content, import_content
	movq	%r8, 32(%rbp)	 ; function_content, function_content
	movq	%r9, 40(%rbp)	 ; class_content, class_content
 ; D:\TC\src\create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, code_member
 ; D:\TC\src\create.c:5:     code_member->type = type;
	movq	-8(%rbp), %rax	 ; code_member, tmp89
	movl	16(%rbp), %edx	 ; type, tmp90
	movl	%edx, 8(%rax)	 ; tmp90, code_member_11->type
 ; D:\TC\src\create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L2	 ;,
 ; D:\TC\src\create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpq	$0, 24(%rbp)	 ;, import_content
	je	.L2	 ;,
 ; D:\TC\src\create.c:7:         code_member->content.import = import_content;
	movq	-8(%rbp), %rax	 ; code_member, tmp91
	movq	24(%rbp), %rdx	 ; import_content, tmp92
	movq	%rdx, (%rax)	 ; tmp92, code_member_11->content.import
	jmp	.L3	 ;
.L2:
 ; D:\TC\src\create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L4	 ;,
 ; D:\TC\src\create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpq	$0, 32(%rbp)	 ;, function_content
	je	.L4	 ;,
 ; D:\TC\src\create.c:9:         code_member->content.function = function_content;
	movq	-8(%rbp), %rax	 ; code_member, tmp93
	movq	32(%rbp), %rdx	 ; function_content, tmp94
	movq	%rdx, (%rax)	 ; tmp94, code_member_11->content.function
	jmp	.L3	 ;
.L4:
 ; D:\TC\src\create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, 16(%rbp)	 ;, type
	jne	.L5	 ;,
 ; D:\TC\src\create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpq	$0, 40(%rbp)	 ;, class_content
	je	.L5	 ;,
 ; D:\TC\src\create.c:11:         code_member->content.class_ = class_content;
	movq	-8(%rbp), %rax	 ; code_member, tmp95
	movq	40(%rbp), %rdx	 ; class_content, tmp96
	movq	%rdx, (%rax)	 ; tmp96, code_member_11->content.class_
	jmp	.L3	 ;
.L5:
 ; D:\TC\src\create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	cmpq	$0, 24(%rbp)	 ;, import_content
	jne	.L6	 ;,
 ; D:\TC\src\create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	cmpq	$0, 32(%rbp)	 ;, function_content
	jne	.L6	 ;,
 ; D:\TC\src\create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	cmpq	$0, 40(%rbp)	 ;, class_content
	jne	.L6	 ;,
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$44, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
 ; D:\TC\src\create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	jmp	.L7	 ;
.L6:
 ; D:\TC\src\create.c:16:             fprintf(stderr, "Error creating code member: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:16:             fprintf(stderr, "Error creating code member: unknown type %d\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\create.c:16:             fprintf(stderr, "Error creating code member: unknown type %d\n", type);
	movl	16(%rbp), %edx	 ; type, tmp98
	movl	%edx, %r8d	 ; tmp98,
	leaq	.LC1(%rip), %rdx	 ;, tmp99
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L7:
 ; D:\TC\src\create.c:17:         return 0;
	movl	$0, %eax	 ;, _5
	jmp	.L8	 ;
.L3:
 ; D:\TC\src\create.c:19:     return code_member;
	movq	-8(%rbp), %rax	 ; code_member, _5
.L8:
 ; D:\TC\src\create.c:20: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_code
	.def	create_code;	.scl	2;	.type	32;	.endef
	.seh_proc	create_code
create_code:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; members, members
	movq	%rdx, 24(%rbp)	 ; global_scope, global_scope
 ; D:\TC\src\create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, code
 ; D:\TC\src\create.c:24:     Code* code_ptr = code;
	movq	-8(%rbp), %rax	 ; code, tmp85
	movq	%rax, -16(%rbp)	 ; tmp85, code_ptr
 ; D:\TC\src\create.c:25:     code_ptr->members = members;
	movq	-16(%rbp), %rax	 ; code_ptr, tmp86
	movq	16(%rbp), %rdx	 ; members, tmp87
	movq	%rdx, (%rax)	 ; tmp87, code_ptr_4->members
 ; D:\TC\src\create.c:26:     code_ptr->global_scope = global_scope;
	movq	-16(%rbp), %rax	 ; code_ptr, tmp88
	movq	24(%rbp), %rdx	 ; global_scope, tmp89
	movq	%rdx, 8(%rax)	 ; tmp89, code_ptr_4->global_scope
 ; D:\TC\src\create.c:27:     return code;
	movq	-8(%rbp), %rax	 ; code, _9
 ; D:\TC\src\create.c:28: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Error creating import: name is NULL\12\0"
	.text
	.globl	create_import
	.def	create_import;	.scl	2;	.type	32;	.endef
	.seh_proc	create_import
create_import:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; source, source
 ; D:\TC\src\create.c:31:     if (name == 0) {
	cmpq	$0, 16(%rbp)	 ;, name
	jne	.L12	 ;,
 ; D:\TC\src\create.c:32:         fprintf(stderr, "Error creating import: name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:32:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:32:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$36, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:33:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L13	 ;
.L12:
 ; D:\TC\src\create.c:35:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, import
 ; D:\TC\src\create.c:36:     Import* import_ptr = import;
	movq	-8(%rbp), %rax	 ; import, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, import_ptr
 ; D:\TC\src\create.c:37:     import_ptr->name = name;
	movq	-16(%rbp), %rax	 ; import_ptr, tmp89
	movq	16(%rbp), %rdx	 ; name, tmp90
	movq	%rdx, (%rax)	 ; tmp90, import_ptr_9->name
 ; D:\TC\src\create.c:38:     import_ptr->source = source;
	movq	-16(%rbp), %rax	 ; import_ptr, tmp91
	movq	24(%rbp), %rdx	 ; source, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, import_ptr_9->source
 ; D:\TC\src\create.c:39:     return import;
	movq	-8(%rbp), %rax	 ; import, _3
.L13:
 ; D:\TC\src\create.c:40: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC3:
	.ascii "Error creating function: name or return_type is NULL\12\0"
	.text
	.globl	create_function
	.def	create_function;	.scl	2;	.type	32;	.endef
	.seh_proc	create_function
create_function:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; return_type, return_type
	movq	%r8, 32(%rbp)	 ; parameters, parameters
	movq	%r9, 40(%rbp)	 ; body, body
 ; D:\TC\src\create.c:43:     if (name == 0 || return_type == 0) {
	cmpq	$0, 16(%rbp)	 ;, name
	je	.L15	 ;,
 ; D:\TC\src\create.c:43:     if (name == 0 || return_type == 0) {
	cmpq	$0, 24(%rbp)	 ;, return_type
	jne	.L16	 ;,
.L15:
 ; D:\TC\src\create.c:44:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:44:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:44:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$53, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC3(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:45:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L17	 ;
.L16:
 ; D:\TC\src\create.c:47:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, function
 ; D:\TC\src\create.c:48:     Function* function_ptr = function;
	movq	-8(%rbp), %rax	 ; function, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, function_ptr
 ; D:\TC\src\create.c:49:     function_ptr->name = name;
	movq	-16(%rbp), %rax	 ; function_ptr, tmp89
	movq	16(%rbp), %rdx	 ; name, tmp90
	movq	%rdx, (%rax)	 ; tmp90, function_ptr_10->name
 ; D:\TC\src\create.c:50:     function_ptr->return_type = return_type;
	movq	-16(%rbp), %rax	 ; function_ptr, tmp91
	movq	24(%rbp), %rdx	 ; return_type, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, function_ptr_10->return_type
 ; D:\TC\src\create.c:51:     function_ptr->parameters = parameters;
	movq	-16(%rbp), %rax	 ; function_ptr, tmp93
	movq	32(%rbp), %rdx	 ; parameters, tmp94
	movq	%rdx, 16(%rax)	 ; tmp94, function_ptr_10->parameters
 ; D:\TC\src\create.c:52:     function_ptr->body = body;
	movq	-16(%rbp), %rax	 ; function_ptr, tmp95
	movq	40(%rbp), %rdx	 ; body, tmp96
	movq	%rdx, 24(%rax)	 ; tmp96, function_ptr_10->body
 ; D:\TC\src\create.c:53:     function_ptr->function_scope = function_scope;
	movq	-16(%rbp), %rax	 ; function_ptr, tmp97
	movq	48(%rbp), %rdx	 ; function_scope, tmp98
	movq	%rdx, 32(%rax)	 ; tmp98, function_ptr_10->function_scope
 ; D:\TC\src\create.c:54:     return function;
	movq	-8(%rbp), %rax	 ; function, _3
.L17:
 ; D:\TC\src\create.c:55: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC4:
	.ascii "Error creating method: name or return_type is NULL\12\0"
	.text
	.globl	create_method
	.def	create_method;	.scl	2;	.type	32;	.endef
	.seh_proc	create_method
create_method:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; return_type, return_type
	movq	%r8, 32(%rbp)	 ; parameters, parameters
	movq	%r9, 40(%rbp)	 ; body, body
 ; D:\TC\src\create.c:58:     if (name == 0 || return_type == 0) {
	cmpq	$0, 16(%rbp)	 ;, name
	je	.L19	 ;,
 ; D:\TC\src\create.c:58:     if (name == 0 || return_type == 0) {
	cmpq	$0, 24(%rbp)	 ;, return_type
	jne	.L20	 ;,
.L19:
 ; D:\TC\src\create.c:59:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:59:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:59:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$51, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:60:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L21	 ;
.L20:
 ; D:\TC\src\create.c:62:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, method
 ; D:\TC\src\create.c:63:     Method* method_ptr = method;
	movq	-8(%rbp), %rax	 ; method, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, method_ptr
 ; D:\TC\src\create.c:64:     method_ptr->name = name;
	movq	-16(%rbp), %rax	 ; method_ptr, tmp89
	movq	16(%rbp), %rdx	 ; name, tmp90
	movq	%rdx, (%rax)	 ; tmp90, method_ptr_10->name
 ; D:\TC\src\create.c:65:     method_ptr->return_type = return_type;
	movq	-16(%rbp), %rax	 ; method_ptr, tmp91
	movq	24(%rbp), %rdx	 ; return_type, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, method_ptr_10->return_type
 ; D:\TC\src\create.c:66:     method_ptr->parameters = parameters;
	movq	-16(%rbp), %rax	 ; method_ptr, tmp93
	movq	32(%rbp), %rdx	 ; parameters, tmp94
	movq	%rdx, 16(%rax)	 ; tmp94, method_ptr_10->parameters
 ; D:\TC\src\create.c:67:     method_ptr->body = body;
	movq	-16(%rbp), %rax	 ; method_ptr, tmp95
	movq	40(%rbp), %rdx	 ; body, tmp96
	movq	%rdx, 24(%rax)	 ; tmp96, method_ptr_10->body
 ; D:\TC\src\create.c:68:     method_ptr->method_scope = method_scope;
	movq	-16(%rbp), %rax	 ; method_ptr, tmp97
	movq	48(%rbp), %rdx	 ; method_scope, tmp98
	movq	%rdx, 32(%rax)	 ; tmp98, method_ptr_10->method_scope
 ; D:\TC\src\create.c:69:     return method;
	movq	-8(%rbp), %rax	 ; method, _3
.L21:
 ; D:\TC\src\create.c:70: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC5:
	.ascii "Error creating class member: content is NULL\12\0"
	.align 8
.LC6:
	.ascii "Error creating class member: unknown type %d\12\0"
	.text
	.globl	create_class_member
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.seh_proc	create_class_member
create_class_member:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; method_content, method_content
	movq	%r8, 32(%rbp)	 ; variable_content, variable_content
 ; D:\TC\src\create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, class_member
 ; D:\TC\src\create.c:74:     ClassMember* class_member_ptr = class_member;
	movq	-8(%rbp), %rax	 ; class_member, tmp89
	movq	%rax, -16(%rbp)	 ; tmp89, class_member_ptr
 ; D:\TC\src\create.c:75:     class_member_ptr->type = type;
	movq	-16(%rbp), %rax	 ; class_member_ptr, tmp90
	movl	16(%rbp), %edx	 ; type, tmp91
	movl	%edx, 8(%rax)	 ; tmp91, class_member_ptr_12->type
 ; D:\TC\src\create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L23	 ;,
 ; D:\TC\src\create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	cmpq	$0, 24(%rbp)	 ;, method_content
	je	.L23	 ;,
 ; D:\TC\src\create.c:77:         class_member_ptr->content.method = method_content;
	movq	-16(%rbp), %rax	 ; class_member_ptr, tmp92
	movq	24(%rbp), %rdx	 ; method_content, tmp93
	movq	%rdx, (%rax)	 ; tmp93, class_member_ptr_12->content.method
	jmp	.L24	 ;
.L23:
 ; D:\TC\src\create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L25	 ;,
 ; D:\TC\src\create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpq	$0, 32(%rbp)	 ;, variable_content
	je	.L25	 ;,
 ; D:\TC\src\create.c:79:         class_member_ptr->content.variable = variable_content;
	movq	-16(%rbp), %rax	 ; class_member_ptr, tmp94
	movq	32(%rbp), %rdx	 ; variable_content, tmp95
	movq	%rdx, (%rax)	 ; tmp95, class_member_ptr_12->content.variable
	jmp	.L24	 ;
.L25:
 ; D:\TC\src\create.c:81:         if (method_content == 0 && variable_content == 0)
	cmpq	$0, 24(%rbp)	 ;, method_content
	jne	.L26	 ;,
 ; D:\TC\src\create.c:81:         if (method_content == 0 && variable_content == 0)
	cmpq	$0, 32(%rbp)	 ;, variable_content
	jne	.L26	 ;,
 ; D:\TC\src\create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$45, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC5(%rip), %rax	 ;, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	fwrite	 ;
 ; D:\TC\src\create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	jmp	.L27	 ;
.L26:
 ; D:\TC\src\create.c:84:             fprintf(stderr, "Error creating class member: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:84:             fprintf(stderr, "Error creating class member: unknown type %d\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\create.c:84:             fprintf(stderr, "Error creating class member: unknown type %d\n", type);
	movl	16(%rbp), %edx	 ; type, tmp97
	movl	%edx, %r8d	 ; tmp97,
	leaq	.LC6(%rip), %rdx	 ;, tmp98
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L27:
 ; D:\TC\src\create.c:85:         return 0;
	movl	$0, %eax	 ;, _5
	jmp	.L28	 ;
.L24:
 ; D:\TC\src\create.c:87:     return class_member;
	movq	-8(%rbp), %rax	 ; class_member, _5
.L28:
 ; D:\TC\src\create.c:88: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Error creating class: name is NULL\12\0"
	.text
	.globl	create_class
	.def	create_class;	.scl	2;	.type	32;	.endef
	.seh_proc	create_class
create_class:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; members, members
	movq	%r8, 32(%rbp)	 ; class_scope, class_scope
 ; D:\TC\src\create.c:91:     if (name == 0) {
	cmpq	$0, 16(%rbp)	 ;, name
	jne	.L30	 ;,
 ; D:\TC\src\create.c:92:         fprintf(stderr, "Error creating class: name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:92:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:92:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$35, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:93:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L31	 ;
.L30:
 ; D:\TC\src\create.c:95:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, class
 ; D:\TC\src\create.c:96:     Class* class_ptr = class;
	movq	-8(%rbp), %rax	 ; class, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, class_ptr
 ; D:\TC\src\create.c:97:     class_ptr->name = name;
	movq	-16(%rbp), %rax	 ; class_ptr, tmp89
	movq	16(%rbp), %rdx	 ; name, tmp90
	movq	%rdx, (%rax)	 ; tmp90, class_ptr_9->name
 ; D:\TC\src\create.c:98:     class_ptr->members = members;
	movq	-16(%rbp), %rax	 ; class_ptr, tmp91
	movq	24(%rbp), %rdx	 ; members, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, class_ptr_9->members
 ; D:\TC\src\create.c:99:     class_ptr->class_scope = class_scope;
	movq	-16(%rbp), %rax	 ; class_ptr, tmp93
	movq	32(%rbp), %rdx	 ; class_scope, tmp94
	movq	%rdx, 16(%rax)	 ; tmp94, class_ptr_9->class_scope
 ; D:\TC\src\create.c:100:     return class;
	movq	-8(%rbp), %rax	 ; class, _3
.L31:
 ; D:\TC\src\create.c:101: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Error creating variable: type or name is NULL\12\0"
	.text
	.globl	create_variable
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable
create_variable:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; name, name
	movq	%r8, 32(%rbp)	 ; value, value
 ; D:\TC\src\create.c:104:     if (type == 0 || name == 0) {
	cmpq	$0, 16(%rbp)	 ;, type
	je	.L33	 ;,
 ; D:\TC\src\create.c:104:     if (type == 0 || name == 0) {
	cmpq	$0, 24(%rbp)	 ;, name
	jne	.L34	 ;,
.L33:
 ; D:\TC\src\create.c:105:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:105:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:105:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$46, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:106:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L35	 ;
.L34:
 ; D:\TC\src\create.c:108:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, variable
 ; D:\TC\src\create.c:109:     Variable* variable_ptr = variable;
	movq	-8(%rbp), %rax	 ; variable, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, variable_ptr
 ; D:\TC\src\create.c:110:     variable_ptr->type = type;
	movq	-16(%rbp), %rax	 ; variable_ptr, tmp89
	movq	16(%rbp), %rdx	 ; type, tmp90
	movq	%rdx, (%rax)	 ; tmp90, variable_ptr_10->type
 ; D:\TC\src\create.c:111:     variable_ptr->name = name;
	movq	-16(%rbp), %rax	 ; variable_ptr, tmp91
	movq	24(%rbp), %rdx	 ; name, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, variable_ptr_10->name
 ; D:\TC\src\create.c:112:     variable_ptr->value = value;
	movq	-16(%rbp), %rax	 ; variable_ptr, tmp93
	movq	32(%rbp), %rdx	 ; value, tmp94
	movq	%rdx, 16(%rax)	 ; tmp94, variable_ptr_10->value
 ; D:\TC\src\create.c:113:     return variable;
	movq	-8(%rbp), %rax	 ; variable, _3
.L35:
 ; D:\TC\src\create.c:114: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC9:
	.ascii "Error creating statement: content is NULL\12\0"
	.align 8
.LC10:
	.ascii "Error creating statement: unknown type %d\12\0"
	.text
	.globl	create_statement
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.seh_proc	create_statement
create_statement:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; if_stmt, if_stmt
	movq	%r8, 32(%rbp)	 ; while_stmt, while_stmt
	movq	%r9, 40(%rbp)	 ; for_stmt, for_stmt
 ; D:\TC\src\create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, statement
 ; D:\TC\src\create.c:118:     Statement* statement_ptr = statement;
	movq	-8(%rbp), %rax	 ; statement, tmp89
	movq	%rax, -16(%rbp)	 ; tmp89, statement_ptr
 ; D:\TC\src\create.c:119:     statement_ptr->type = type;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp90
	movl	16(%rbp), %edx	 ; type, tmp91
	movl	%edx, 8(%rax)	 ; tmp91, statement_ptr_12->type
 ; D:\TC\src\create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	cmpl	$0, 16(%rbp)	 ;, type
	jne	.L37	 ;,
 ; D:\TC\src\create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	cmpq	$0, 48(%rbp)	 ;, expr
	je	.L37	 ;,
 ; D:\TC\src\create.c:121:         statement_ptr->stmt.expr = expr;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp92
	movq	48(%rbp), %rdx	 ; expr, tmp93
	movq	%rdx, (%rax)	 ; tmp93, statement_ptr_12->stmt.expr
	jmp	.L38	 ;
.L37:
 ; D:\TC\src\create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpl	$1, 16(%rbp)	 ;, type
	jne	.L39	 ;,
 ; D:\TC\src\create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpq	$0, 56(%rbp)	 ;, var_stmt
	je	.L39	 ;,
 ; D:\TC\src\create.c:123:         statement_ptr->stmt.var = var_stmt;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp94
	movq	56(%rbp), %rdx	 ; var_stmt, tmp95
	movq	%rdx, (%rax)	 ; tmp95, statement_ptr_12->stmt.var
	jmp	.L38	 ;
.L39:
 ; D:\TC\src\create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpl	$2, 16(%rbp)	 ;, type
	jne	.L40	 ;,
 ; D:\TC\src\create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpq	$0, 24(%rbp)	 ;, if_stmt
	je	.L40	 ;,
 ; D:\TC\src\create.c:125:         statement_ptr->stmt.if_stmt = if_stmt;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp96
	movq	24(%rbp), %rdx	 ; if_stmt, tmp97
	movq	%rdx, (%rax)	 ; tmp97, statement_ptr_12->stmt.if_stmt
	jmp	.L38	 ;
.L40:
 ; D:\TC\src\create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpl	$3, 16(%rbp)	 ;, type
	jne	.L41	 ;,
 ; D:\TC\src\create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpq	$0, 32(%rbp)	 ;, while_stmt
	je	.L41	 ;,
 ; D:\TC\src\create.c:127:         statement_ptr->stmt.while_stmt = while_stmt;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp98
	movq	32(%rbp), %rdx	 ; while_stmt, tmp99
	movq	%rdx, (%rax)	 ; tmp99, statement_ptr_12->stmt.while_stmt
	jmp	.L38	 ;
.L41:
 ; D:\TC\src\create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpl	$4, 16(%rbp)	 ;, type
	jne	.L42	 ;,
 ; D:\TC\src\create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpq	$0, 40(%rbp)	 ;, for_stmt
	je	.L42	 ;,
 ; D:\TC\src\create.c:129:         statement_ptr->stmt.for_stmt = for_stmt;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp100
	movq	40(%rbp), %rdx	 ; for_stmt, tmp101
	movq	%rdx, (%rax)	 ; tmp101, statement_ptr_12->stmt.for_stmt
	jmp	.L38	 ;
.L42:
 ; D:\TC\src\create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpl	$5, 16(%rbp)	 ;, type
	jne	.L43	 ;,
 ; D:\TC\src\create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpq	$0, 48(%rbp)	 ;, expr
	je	.L43	 ;,
 ; D:\TC\src\create.c:131:         statement_ptr->stmt.return_expr = expr;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp102
	movq	48(%rbp), %rdx	 ; expr, tmp103
	movq	%rdx, (%rax)	 ; tmp103, statement_ptr_12->stmt.return_expr
	jmp	.L38	 ;
.L43:
 ; D:\TC\src\create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$6, 16(%rbp)	 ;, type
	je	.L44	 ;,
 ; D:\TC\src\create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$7, 16(%rbp)	 ;, type
	jne	.L45	 ;,
.L44:
 ; D:\TC\src\create.c:133:         statement_ptr->stmt.expr = 0;
	movq	-16(%rbp), %rax	 ; statement_ptr, tmp104
	movq	$0, (%rax)	 ;, statement_ptr_12->stmt.expr
	jmp	.L38	 ;
.L45:
 ; D:\TC\src\create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, 24(%rbp)	 ;, if_stmt
	jne	.L46	 ;,
 ; D:\TC\src\create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, 32(%rbp)	 ;, while_stmt
	jne	.L46	 ;,
 ; D:\TC\src\create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, 40(%rbp)	 ;, for_stmt
	jne	.L46	 ;,
 ; D:\TC\src\create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, 48(%rbp)	 ;, expr
	jne	.L46	 ;,
 ; D:\TC\src\create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, 56(%rbp)	 ;, var_stmt
	jne	.L46	 ;,
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$42, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC9(%rip), %rax	 ;, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	fwrite	 ;
 ; D:\TC\src\create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	jmp	.L47	 ;
.L46:
 ; D:\TC\src\create.c:138:             fprintf(stderr, "Error creating statement: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:138:             fprintf(stderr, "Error creating statement: unknown type %d\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\create.c:138:             fprintf(stderr, "Error creating statement: unknown type %d\n", type);
	movl	16(%rbp), %edx	 ; type, tmp106
	movl	%edx, %r8d	 ; tmp106,
	leaq	.LC10(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L47:
 ; D:\TC\src\create.c:139:         return 0;
	movl	$0, %eax	 ;, _5
	jmp	.L48	 ;
.L38:
 ; D:\TC\src\create.c:141:     return statement;
	movq	-8(%rbp), %rax	 ; statement, _5
.L48:
 ; D:\TC\src\create.c:142: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC11:
	.ascii "Error creating if statement: condition is NULL\12\0"
	.text
	.globl	create_if
	.def	create_if;	.scl	2;	.type	32;	.endef
	.seh_proc	create_if
create_if:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; condition, condition
	movq	%rdx, 24(%rbp)	 ; body, body
	movq	%r8, 32(%rbp)	 ; else_if, else_if
	movq	%r9, 40(%rbp)	 ; else_body, else_body
 ; D:\TC\src\create.c:145:     if (condition == 0) {
	cmpq	$0, 16(%rbp)	 ;, condition
	jne	.L50	 ;,
 ; D:\TC\src\create.c:146:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:146:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:146:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$47, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:147:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L51	 ;
.L50:
 ; D:\TC\src\create.c:149:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, if_
 ; D:\TC\src\create.c:150:     If* if_ptr = if_;
	movq	-8(%rbp), %rax	 ; if_, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, if_ptr
 ; D:\TC\src\create.c:151:     if_ptr->condition = condition;
	movq	-16(%rbp), %rax	 ; if_ptr, tmp89
	movq	16(%rbp), %rdx	 ; condition, tmp90
	movq	%rdx, (%rax)	 ; tmp90, if_ptr_9->condition
 ; D:\TC\src\create.c:152:     if_ptr->body = body;
	movq	-16(%rbp), %rax	 ; if_ptr, tmp91
	movq	24(%rbp), %rdx	 ; body, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, if_ptr_9->body
 ; D:\TC\src\create.c:153:     if_ptr->else_if = else_if;
	movq	-16(%rbp), %rax	 ; if_ptr, tmp93
	movq	32(%rbp), %rdx	 ; else_if, tmp94
	movq	%rdx, 16(%rax)	 ; tmp94, if_ptr_9->else_if
 ; D:\TC\src\create.c:154:     if_ptr->else_body = else_body;
	movq	-16(%rbp), %rax	 ; if_ptr, tmp95
	movq	40(%rbp), %rdx	 ; else_body, tmp96
	movq	%rdx, 24(%rax)	 ; tmp96, if_ptr_9->else_body
 ; D:\TC\src\create.c:155:     return if_;
	movq	-8(%rbp), %rax	 ; if_, _3
.L51:
 ; D:\TC\src\create.c:156: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC12:
	.ascii "Error creating else-if statement: condition is NULL\12\0"
	.text
	.globl	create_else_if
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.seh_proc	create_else_if
create_else_if:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; condition, condition
	movq	%rdx, 24(%rbp)	 ; body, body
 ; D:\TC\src\create.c:159:     if (condition == 0) {
	cmpq	$0, 16(%rbp)	 ;, condition
	jne	.L53	 ;,
 ; D:\TC\src\create.c:160:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:160:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:160:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$52, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	fwrite	 ;
 ; D:\TC\src\create.c:161:         return 0;
	movl	$0, %eax	 ;, _3
	jmp	.L54	 ;
.L53:
 ; D:\TC\src\create.c:163:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, else_if
 ; D:\TC\src\create.c:164:     ElseIf* else_if_ptr = else_if;
	movq	-8(%rbp), %rax	 ; else_if, tmp88
	movq	%rax, -16(%rbp)	 ; tmp88, else_if_ptr
 ; D:\TC\src\create.c:165:     else_if_ptr->condition = condition;
	movq	-16(%rbp), %rax	 ; else_if_ptr, tmp89
	movq	16(%rbp), %rdx	 ; condition, tmp90
	movq	%rdx, (%rax)	 ; tmp90, else_if_ptr_9->condition
 ; D:\TC\src\create.c:166:     else_if_ptr->body = body;
	movq	-16(%rbp), %rax	 ; else_if_ptr, tmp91
	movq	24(%rbp), %rdx	 ; body, tmp92
	movq	%rdx, 8(%rax)	 ; tmp92, else_if_ptr_9->body
 ; D:\TC\src\create.c:167:     return else_if;
	movq	-8(%rbp), %rax	 ; else_if, _3
.L54:
 ; D:\TC\src\create.c:168: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_for
	.def	create_for;	.scl	2;	.type	32;	.endef
	.seh_proc	create_for
create_for:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; initializer, initializer
	movq	%rdx, 24(%rbp)	 ; condition, condition
	movq	%r8, 32(%rbp)	 ; increment, increment
	movq	%r9, 40(%rbp)	 ; body, body
 ; D:\TC\src\create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, for_
 ; D:\TC\src\create.c:172:     For* for_ptr = for_;
	movq	-8(%rbp), %rax	 ; for_, tmp85
	movq	%rax, -16(%rbp)	 ; tmp85, for_ptr
 ; D:\TC\src\create.c:173:     for_ptr->initializer = initializer;
	movq	-16(%rbp), %rax	 ; for_ptr, tmp86
	movq	16(%rbp), %rdx	 ; initializer, tmp87
	movq	%rdx, (%rax)	 ; tmp87, for_ptr_4->initializer
 ; D:\TC\src\create.c:174:     for_ptr->condition = condition;
	movq	-16(%rbp), %rax	 ; for_ptr, tmp88
	movq	24(%rbp), %rdx	 ; condition, tmp89
	movq	%rdx, 8(%rax)	 ; tmp89, for_ptr_4->condition
 ; D:\TC\src\create.c:175:     for_ptr->increment = increment;
	movq	-16(%rbp), %rax	 ; for_ptr, tmp90
	movq	32(%rbp), %rdx	 ; increment, tmp91
	movq	%rdx, 16(%rax)	 ; tmp91, for_ptr_4->increment
 ; D:\TC\src\create.c:176:     for_ptr->body = body;
	movq	-16(%rbp), %rax	 ; for_ptr, tmp92
	movq	40(%rbp), %rdx	 ; body, tmp93
	movq	%rdx, 24(%rax)	 ; tmp93, for_ptr_4->body
 ; D:\TC\src\create.c:177:     return for_;
	movq	-8(%rbp), %rax	 ; for_, _13
 ; D:\TC\src\create.c:178: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_while
	.def	create_while;	.scl	2;	.type	32;	.endef
	.seh_proc	create_while
create_while:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; condition, condition
	movq	%rdx, 24(%rbp)	 ; body, body
 ; D:\TC\src\create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp84, while_
 ; D:\TC\src\create.c:182:     While* while_ptr = while_;
	movq	-8(%rbp), %rax	 ; while_, tmp85
	movq	%rax, -16(%rbp)	 ; tmp85, while_ptr
 ; D:\TC\src\create.c:183:     while_ptr->condition = condition;
	movq	-16(%rbp), %rax	 ; while_ptr, tmp86
	movq	16(%rbp), %rdx	 ; condition, tmp87
	movq	%rdx, (%rax)	 ; tmp87, while_ptr_4->condition
 ; D:\TC\src\create.c:184:     while_ptr->body = body;
	movq	-16(%rbp), %rax	 ; while_ptr, tmp88
	movq	24(%rbp), %rdx	 ; body, tmp89
	movq	%rdx, 8(%rax)	 ; tmp89, while_ptr_4->body
 ; D:\TC\src\create.c:185:     return while_;
	movq	-8(%rbp), %rax	 ; while_, _9
 ; D:\TC\src\create.c:186: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC13:
	.ascii "true\0"
.LC14:
	.ascii "false\0"
	.align 8
.LC15:
	.ascii "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\12\0"
	.align 8
.LC16:
	.ascii "Error creating expression: both expr_left and prim_left are NULL\12\0"
	.text
	.globl	create_expression
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.seh_proc	create_expression
create_expression:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	leaq	64(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 64
	.seh_endprologue
	movl	%ecx, 48(%rbp)	 ; operator, operator
	movq	%rdx, 56(%rbp)	 ; expr_left, expr_left
	movq	%r8, 64(%rbp)	 ; prim_left, prim_left
	movq	%r9, 72(%rbp)	 ; right, right
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpl	$19, 48(%rbp)	 ;, operator
	sete	%dl	 ;, _1
	cmpq	$0, 72(%rbp)	 ;, right
	sete	%al	 ;, _2
	xorl	%edx, %eax	 ; _1, _3
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	testb	%al, %al	 ; _3
	jne	.L60	 ;,
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpq	$0, 56(%rbp)	 ;, expr_left
	jne	.L61	 ;,
 ; D:\TC\src\create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpq	$0, 64(%rbp)	 ;, prim_left
	jne	.L61	 ;,
.L60:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpq	$0, 72(%rbp)	 ;, right
	jne	.L62	 ;,
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rsi	 ;, iftmp.0_8
	jmp	.L63	 ;
.L62:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rsi	 ;, iftmp.0_8
.L63:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpq	$0, 64(%rbp)	 ;, prim_left
	jne	.L64	 ;,
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rbx	 ;, iftmp.1_9
	jmp	.L65	 ;
.L64:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rbx	 ;, iftmp.1_9
.L65:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpq	$0, 56(%rbp)	 ;, expr_left
	jne	.L66	 ;,
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %r12	 ;, iftmp.2_10
	jmp	.L67	 ;
.L66:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %r12	 ;, iftmp.2_10
.L67:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpl	$19, 48(%rbp)	 ;, operator
	jne	.L68	 ;,
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rdi	 ;, iftmp.3_11
	jmp	.L69	 ;
.L68:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rdi	 ;, iftmp.3_11
.L69:
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	call	__getreent	 ;
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:\TC\src\create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rsi, 40(%rsp)	 ; iftmp.0_8,
	movq	%rbx, 32(%rsp)	 ; iftmp.1_9,
	movq	%r12, %r9	 ; iftmp.2_10,
	movq	%rdi, %r8	 ; iftmp.3_11,
	leaq	.LC15(%rip), %rdx	 ;, tmp95
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:\TC\src\create.c:195:         return 0;
	movl	$0, %eax	 ;, _12
	jmp	.L70	 ;
.L61:
 ; D:\TC\src\create.c:197:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, expression
 ; D:\TC\src\create.c:198:     Expression* expression_ptr = expression;
	movq	-8(%rbp), %rax	 ; expression, tmp97
	movq	%rax, -16(%rbp)	 ; tmp97, expression_ptr
 ; D:\TC\src\create.c:199:     expression_ptr->operator = operator;
	movq	-16(%rbp), %rax	 ; expression_ptr, tmp98
	movl	48(%rbp), %edx	 ; operator, tmp99
	movl	%edx, 24(%rax)	 ; tmp99, expression_ptr_22->operator
 ; D:\TC\src\create.c:200:     if (expr_left != 0)
	cmpq	$0, 56(%rbp)	 ;, expr_left
	je	.L71	 ;,
 ; D:\TC\src\create.c:201:         expression_ptr->expr_left = expr_left;
	movq	-16(%rbp), %rax	 ; expression_ptr, tmp100
	movq	56(%rbp), %rdx	 ; expr_left, tmp101
	movq	%rdx, (%rax)	 ; tmp101, expression_ptr_22->expr_left
	jmp	.L72	 ;
.L71:
 ; D:\TC\src\create.c:202:     else if (prim_left != 0)
	cmpq	$0, 64(%rbp)	 ;, prim_left
	je	.L73	 ;,
 ; D:\TC\src\create.c:203:         expression_ptr->prim_left = prim_left;
	movq	-16(%rbp), %rax	 ; expression_ptr, tmp102
	movq	64(%rbp), %rdx	 ; prim_left, tmp103
	movq	%rdx, 8(%rax)	 ; tmp103, expression_ptr_22->prim_left
	jmp	.L72	 ;
.L73:
 ; D:\TC\src\create.c:205:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:205:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	24(%rax), %rax	 ; _6->_stderr, _7
 ; D:\TC\src\create.c:205:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	%rax, %r9	 ; _7,
	movl	$65, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:\TC\src\create.c:206:         return 0;
	movl	$0, %eax	 ;, _12
	jmp	.L70	 ;
.L72:
 ; D:\TC\src\create.c:208:     expression_ptr->right = right;
	movq	-16(%rbp), %rax	 ; expression_ptr, tmp105
	movq	72(%rbp), %rdx	 ; right, tmp106
	movq	%rdx, 16(%rax)	 ; tmp106, expression_ptr_22->right
 ; D:\TC\src\create.c:209:     return expression;
	movq	-8(%rbp), %rax	 ; expression, _12
.L70:
 ; D:\TC\src\create.c:210: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC17:
	.ascii "Error creating primary: value is NULL\12\0"
	.align 8
.LC18:
	.ascii "Error creating primary: unknown type %d\12\0"
	.text
	.globl	create_primary
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.seh_proc	create_primary
create_primary:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)	 ; type, type
	movq	%rdx, 24(%rbp)	 ; str_value, str_value
	movq	%r8, 32(%rbp)	 ; expr_value, expr_value
	movq	%r9, 40(%rbp)	 ; prim_value, prim_value
 ; D:\TC\src\create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp88, primary
 ; D:\TC\src\create.c:214:     Primary* primary_ptr = primary;
	movq	-8(%rbp), %rax	 ; primary, tmp89
	movq	%rax, -16(%rbp)	 ; tmp89, primary_ptr
 ; D:\TC\src\create.c:215:     primary_ptr->type = type;
	movq	-16(%rbp), %rax	 ; primary_ptr, tmp90
	movl	16(%rbp), %edx	 ; type, tmp91
	movl	%edx, 8(%rax)	 ; tmp91, primary_ptr_12->type
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$0, 16(%rbp)	 ;, type
	je	.L75	 ;,
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$1, 16(%rbp)	 ;, type
	je	.L75	 ;,
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$2, 16(%rbp)	 ;, type
	je	.L75	 ;,
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$3, 16(%rbp)	 ;, type
	je	.L75	 ;,
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$4, 16(%rbp)	 ;, type
	jne	.L76	 ;,
.L75:
 ; D:\TC\src\create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpq	$0, 24(%rbp)	 ;, str_value
	je	.L76	 ;,
 ; D:\TC\src\create.c:217:         primary_ptr->value.literal_value = str_value;
	movq	-16(%rbp), %rax	 ; primary_ptr, tmp92
	movq	24(%rbp), %rdx	 ; str_value, tmp93
	movq	%rdx, (%rax)	 ; tmp93, primary_ptr_12->value.literal_value
	jmp	.L77	 ;
.L76:
 ; D:\TC\src\create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpl	$5, 16(%rbp)	 ;, type
	jne	.L78	 ;,
 ; D:\TC\src\create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpq	$0, 32(%rbp)	 ;, expr_value
	je	.L78	 ;,
 ; D:\TC\src\create.c:219:         primary_ptr->value.expr = expr_value;
	movq	-16(%rbp), %rax	 ; primary_ptr, tmp94
	movq	32(%rbp), %rdx	 ; expr_value, tmp95
	movq	%rdx, (%rax)	 ; tmp95, primary_ptr_12->value.expr
	jmp	.L77	 ;
.L78:
 ; D:\TC\src\create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$6, 16(%rbp)	 ;, type
	je	.L79	 ;,
 ; D:\TC\src\create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$7, 16(%rbp)	 ;, type
	jne	.L80	 ;,
.L79:
 ; D:\TC\src\create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpq	$0, 40(%rbp)	 ;, prim_value
	je	.L80	 ;,
 ; D:\TC\src\create.c:221:         primary_ptr->value.operand = prim_value;
	movq	-16(%rbp), %rax	 ; primary_ptr, tmp96
	movq	40(%rbp), %rdx	 ; prim_value, tmp97
	movq	%rdx, (%rax)	 ; tmp97, primary_ptr_12->value.operand
	jmp	.L77	 ;
.L80:
 ; D:\TC\src\create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpl	$8, 16(%rbp)	 ;, type
	jne	.L81	 ;,
 ; D:\TC\src\create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpq	$0, 48(%rbp)	 ;, variable_value
	je	.L81	 ;,
 ; D:\TC\src\create.c:223:         primary_ptr->value.var = variable_value;
	movq	-16(%rbp), %rax	 ; primary_ptr, tmp98
	movq	48(%rbp), %rdx	 ; variable_value, tmp99
	movq	%rdx, (%rax)	 ; tmp99, primary_ptr_12->value.var
	jmp	.L77	 ;
.L81:
 ; D:\TC\src\create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, 24(%rbp)	 ;, str_value
	jne	.L82	 ;,
 ; D:\TC\src\create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, 32(%rbp)	 ;, expr_value
	jne	.L82	 ;,
 ; D:\TC\src\create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, 40(%rbp)	 ;, prim_value
	jne	.L82	 ;,
 ; D:\TC\src\create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, 48(%rbp)	 ;, variable_value
	jne	.L82	 ;,
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	24(%rax), %rax	 ; _1->_stderr, _2
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	%rax, %r9	 ; _2,
	movl	$38, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:\TC\src\create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	jmp	.L83	 ;
.L82:
 ; D:\TC\src\create.c:228:             fprintf(stderr, "Error creating primary: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:228:             fprintf(stderr, "Error creating primary: unknown type %d\n", type);
	movq	24(%rax), %rax	 ; _3->_stderr, _4
 ; D:\TC\src\create.c:228:             fprintf(stderr, "Error creating primary: unknown type %d\n", type);
	movl	16(%rbp), %edx	 ; type, tmp101
	movl	%edx, %r8d	 ; tmp101,
	leaq	.LC18(%rip), %rdx	 ;, tmp102
	movq	%rax, %rcx	 ; _4,
	call	fprintf	 ;
.L83:
 ; D:\TC\src\create.c:229:         return 0;
	movl	$0, %eax	 ;, _5
	jmp	.L84	 ;
.L77:
 ; D:\TC\src\create.c:231:     return primary;
	movq	-8(%rbp), %rax	 ; primary, _5
.L84:
 ; D:\TC\src\create.c:232: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC19:
	.ascii "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\12\0"
	.align 8
.LC20:
	.ascii "Error creating variable access: content is NULL\12\0"
	.align 8
.LC21:
	.ascii "Error creating variable access: unknown type %d\12\0"
	.text
	.globl	create_variable_access
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.seh_proc	create_variable_access
create_variable_access:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	leaq	48(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movl	%ecx, 32(%rbp)	 ; type, type
	movq	%rdx, 40(%rbp)	 ; base, base
	movq	%r8, 48(%rbp)	 ; name_content, name_content
	movq	%r9, 56(%rbp)	 ; expr_content, expr_content
 ; D:\TC\src\create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	cmpq	$0, 40(%rbp)	 ;, base
	sete	%dl	 ;, _1
	cmpl	$0, 32(%rbp)	 ;, type
	sete	%al	 ;, _2
	xorl	%edx, %eax	 ; _1, _3
 ; D:\TC\src\create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	testb	%al, %al	 ; _3
	je	.L86	 ;,
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpl	$0, 32(%rbp)	 ;, type
	jne	.L87	 ;,
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rsi	 ;, iftmp.4_10
	jmp	.L88	 ;
.L87:
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rsi	 ;, iftmp.4_10
.L88:
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpq	$0, 40(%rbp)	 ;, base
	jne	.L89	 ;,
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rbx	 ;, iftmp.5_11
	jmp	.L90	 ;
.L89:
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rbx	 ;, iftmp.5_11
.L90:
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	call	__getreent	 ;
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	24(%rax), %rax	 ; _4->_stderr, _5
 ; D:\TC\src\create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rsi, %r9	 ; iftmp.4_10,
	movq	%rbx, %r8	 ; iftmp.5_11,
	leaq	.LC19(%rip), %rdx	 ;, tmp95
	movq	%rax, %rcx	 ; _5,
	call	fprintf	 ;
 ; D:\TC\src\create.c:237:         return 0;
	movl	$0, %eax	 ;, _12
	jmp	.L91	 ;
.L86:
 ; D:\TC\src\create.c:239:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp96, variable_access
 ; D:\TC\src\create.c:240:     VariableAccess* variable_access_ptr = variable_access;
	movq	-8(%rbp), %rax	 ; variable_access, tmp97
	movq	%rax, -16(%rbp)	 ; tmp97, variable_access_ptr
 ; D:\TC\src\create.c:241:     variable_access_ptr->type = type;
	movq	-16(%rbp), %rax	 ; variable_access_ptr, tmp98
	movl	32(%rbp), %edx	 ; type, tmp99
	movl	%edx, 16(%rax)	 ; tmp99, variable_access_ptr_21->type
 ; D:\TC\src\create.c:242:     variable_access_ptr->base = base;
	movq	-16(%rbp), %rax	 ; variable_access_ptr, tmp100
	movq	40(%rbp), %rdx	 ; base, tmp101
	movq	%rdx, (%rax)	 ; tmp101, variable_access_ptr_21->base
 ; D:\TC\src\create.c:243:     if (type == VAR_NAME && name_content != 0)
	cmpl	$0, 32(%rbp)	 ;, type
	jne	.L92	 ;,
 ; D:\TC\src\create.c:243:     if (type == VAR_NAME && name_content != 0)
	cmpq	$0, 48(%rbp)	 ;, name_content
	je	.L92	 ;,
 ; D:\TC\src\create.c:244:         variable_access_ptr->content.name = name_content;
	movq	-16(%rbp), %rax	 ; variable_access_ptr, tmp102
	movq	48(%rbp), %rdx	 ; name_content, tmp103
	movq	%rdx, 8(%rax)	 ; tmp103, variable_access_ptr_21->content.name
	jmp	.L93	 ;
.L92:
 ; D:\TC\src\create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpl	$1, 32(%rbp)	 ;, type
	jne	.L94	 ;,
 ; D:\TC\src\create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpq	$0, 64(%rbp)	 ;, args_content
	je	.L94	 ;,
 ; D:\TC\src\create.c:246:         variable_access_ptr->content.args = args_content;
	movq	-16(%rbp), %rax	 ; variable_access_ptr, tmp104
	movq	64(%rbp), %rdx	 ; args_content, tmp105
	movq	%rdx, 8(%rax)	 ; tmp105, variable_access_ptr_21->content.args
	jmp	.L93	 ;
.L94:
 ; D:\TC\src\create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpl	$3, 32(%rbp)	 ;, type
	jne	.L95	 ;,
 ; D:\TC\src\create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpq	$0, 56(%rbp)	 ;, expr_content
	je	.L95	 ;,
 ; D:\TC\src\create.c:248:         variable_access_ptr->content.index = expr_content;
	movq	-16(%rbp), %rax	 ; variable_access_ptr, tmp106
	movq	56(%rbp), %rdx	 ; expr_content, tmp107
	movq	%rdx, 8(%rax)	 ; tmp107, variable_access_ptr_21->content.index
	jmp	.L93	 ;
.L95:
 ; D:\TC\src\create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpl	$2, 32(%rbp)	 ;, type
	jne	.L96	 ;,
 ; D:\TC\src\create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpq	$0, 48(%rbp)	 ;, name_content
	je	.L96	 ;,
 ; D:\TC\src\create.c:250:         variable_access_ptr->content.attr_name = name_content;
	movq	-16(%rbp), %rax	 ; variable_access_ptr, tmp108
	movq	48(%rbp), %rdx	 ; name_content, tmp109
	movq	%rdx, 8(%rax)	 ; tmp109, variable_access_ptr_21->content.attr_name
	jmp	.L93	 ;
.L96:
 ; D:\TC\src\create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	cmpq	$0, 48(%rbp)	 ;, name_content
	jne	.L97	 ;,
 ; D:\TC\src\create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	cmpq	$0, 56(%rbp)	 ;, expr_content
	jne	.L97	 ;,
 ; D:\TC\src\create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	cmpq	$0, 64(%rbp)	 ;, args_content
	jne	.L97	 ;,
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	call	__getreent	 ;
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	24(%rax), %rax	 ; _6->_stderr, _7
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	%rax, %r9	 ; _7,
	movl	$48, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	fwrite	 ;
 ; D:\TC\src\create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	jmp	.L98	 ;
.L97:
 ; D:\TC\src\create.c:255:             fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
	call	__getreent	 ;
 ; D:\TC\src\create.c:255:             fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
	movq	24(%rax), %rax	 ; _8->_stderr, _9
 ; D:\TC\src\create.c:255:             fprintf(stderr, "Error creating variable access: unknown type %d\n", type);
	movl	32(%rbp), %edx	 ; type, tmp111
	movl	%edx, %r8d	 ; tmp111,
	leaq	.LC21(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; _9,
	call	fprintf	 ;
.L98:
 ; D:\TC\src\create.c:256:         return 0;
	movl	$0, %eax	 ;, _12
	jmp	.L91	 ;
.L93:
 ; D:\TC\src\create.c:258:     return variable_access;
	movq	-8(%rbp), %rax	 ; variable_access, _12
.L91:
 ; D:\TC\src\create.c:259: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef

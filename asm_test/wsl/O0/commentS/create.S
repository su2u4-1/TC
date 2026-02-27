	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Error creating code member: content is NULL\n"
	.align 8
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; import_content, import_content
	movq	%rdx, -40(%rbp)	; function_content, function_content
	movq	%rcx, -48(%rbp)	; class_content, class_content
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -8(%rbp)	; tmp86, code_member
; src/create.c:5:     code_member->type = type;
	movq	-8(%rbp), %rax	; code_member, tmp87
	movl	-20(%rbp), %edx	; type, tmp88
	movl	%edx, 8(%rax)	; tmp88, code_member_9->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L2	;,
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpq	$0, -32(%rbp)	;, import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	-8(%rbp), %rax	; code_member, tmp89
	movq	-32(%rbp), %rdx	; import_content, tmp90
	movq	%rdx, (%rax)	; tmp90, code_member_9->content.import
	jmp	.L3	;
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L4	;,
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpq	$0, -40(%rbp)	;, function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	-8(%rbp), %rax	; code_member, tmp91
	movq	-40(%rbp), %rdx	; function_content, tmp92
	movq	%rdx, (%rax)	; tmp92, code_member_9->content.function
	jmp	.L3	;
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, -20(%rbp)	;, type
	jne	.L5	;,
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpq	$0, -48(%rbp)	;, class_content
	je	.L5	;,
; src/create.c:11:         code_member->content.class_ = class_content;
	movq	-8(%rbp), %rax	; code_member, tmp93
	movq	-48(%rbp), %rdx	; class_content, tmp94
	movq	%rdx, (%rax)	; tmp94, code_member_9->content.class_
	jmp	.L3	;
.L5:
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	cmpq	$0, -32(%rbp)	;, import_content
	jne	.L6	;,
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	cmpq	$0, -40(%rbp)	;, function_content
	jne	.L6	;,
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	cmpq	$0, -48(%rbp)	;, class_content
	jne	.L6	;,
; src/create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.0_1
	movq	%rax, %rcx	; stderr.0_1,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	fwrite@PLT	;
	jmp	.L7	;
.L6:
; src/create.c:16:             fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.1_2
	movl	-20(%rbp), %edx	; type, tmp96
	leaq	.LC1(%rip), %rcx	;, tmp97
	movq	%rcx, %rsi	; tmp97,
	movq	%rax, %rdi	; stderr.1_2,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
.L7:
; src/create.c:17:         return 0;
	movl	$0, %eax	;, _3
	jmp	.L8	;
.L3:
; src/create.c:19:     return code_member;
	movq	-8(%rbp), %rax	; code_member, _3
.L8:
; src/create.c:20: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
.LFB7:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; members, members
	movq	%rsi, -32(%rbp)	; global_scope, global_scope
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp84, code
; src/create.c:24:     Code* code_ptr = code;
	movq	-16(%rbp), %rax	; code, tmp85
	movq	%rax, -8(%rbp)	; tmp85, code_ptr
; src/create.c:25:     code_ptr->members = members;
	movq	-8(%rbp), %rax	; code_ptr, tmp86
	movq	-24(%rbp), %rdx	; members, tmp87
	movq	%rdx, (%rax)	; tmp87, code_ptr_4->members
; src/create.c:26:     code_ptr->global_scope = global_scope;
	movq	-8(%rbp), %rax	; code_ptr, tmp88
	movq	-32(%rbp), %rdx	; global_scope, tmp89
	movq	%rdx, 8(%rax)	; tmp89, code_ptr_4->global_scope
; src/create.c:27:     return code;
	movq	-16(%rbp), %rax	; code, _9
; src/create.c:28: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE7:
	.size	create_code, .-create_code
	.section	.rodata
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
.LFB8:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; source, source
; src/create.c:31:     if (name == 0) {
	cmpq	$0, -24(%rbp)	;, name
	jne	.L12	;,
; src/create.c:32:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.2_1
	movq	%rax, %rcx	; stderr.2_1,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:33:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L13	;
.L12:
; src/create.c:35:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, import
; src/create.c:36:     Import* import_ptr = import;
	movq	-16(%rbp), %rax	; import, tmp87
	movq	%rax, -8(%rbp)	; tmp87, import_ptr
; src/create.c:37:     import_ptr->name = name;
	movq	-8(%rbp), %rax	; import_ptr, tmp88
	movq	-24(%rbp), %rdx	; name, tmp89
	movq	%rdx, (%rax)	; tmp89, import_ptr_8->name
; src/create.c:38:     import_ptr->source = source;
	movq	-8(%rbp), %rax	; import_ptr, tmp90
	movq	-32(%rbp), %rdx	; source, tmp91
	movq	%rdx, 8(%rax)	; tmp91, import_ptr_8->source
; src/create.c:39:     return import;
	movq	-16(%rbp), %rax	; import, _2
.L13:
; src/create.c:40: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	create_import, .-create_import
	.section	.rodata
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function
	.type	create_function, @function
create_function:
.LFB9:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; return_type, return_type
	movq	%rdx, -40(%rbp)	; parameters, parameters
	movq	%rcx, -48(%rbp)	; body, body
	movq	%r8, -56(%rbp)	; function_scope, function_scope
; src/create.c:43:     if (name == 0 || return_type == 0) {
	cmpq	$0, -24(%rbp)	;, name
	je	.L15	;,
; src/create.c:43:     if (name == 0 || return_type == 0) {
	cmpq	$0, -32(%rbp)	;, return_type
	jne	.L16	;,
.L15:
; src/create.c:44:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.3_1
	movq	%rax, %rcx	; stderr.3_1,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:45:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L17	;
.L16:
; src/create.c:47:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, function
; src/create.c:48:     Function* function_ptr = function;
	movq	-16(%rbp), %rax	; function, tmp87
	movq	%rax, -8(%rbp)	; tmp87, function_ptr
; src/create.c:49:     function_ptr->name = name;
	movq	-8(%rbp), %rax	; function_ptr, tmp88
	movq	-24(%rbp), %rdx	; name, tmp89
	movq	%rdx, (%rax)	; tmp89, function_ptr_9->name
; src/create.c:50:     function_ptr->return_type = return_type;
	movq	-8(%rbp), %rax	; function_ptr, tmp90
	movq	-32(%rbp), %rdx	; return_type, tmp91
	movq	%rdx, 8(%rax)	; tmp91, function_ptr_9->return_type
; src/create.c:51:     function_ptr->parameters = parameters;
	movq	-8(%rbp), %rax	; function_ptr, tmp92
	movq	-40(%rbp), %rdx	; parameters, tmp93
	movq	%rdx, 16(%rax)	; tmp93, function_ptr_9->parameters
; src/create.c:52:     function_ptr->body = body;
	movq	-8(%rbp), %rax	; function_ptr, tmp94
	movq	-48(%rbp), %rdx	; body, tmp95
	movq	%rdx, 24(%rax)	; tmp95, function_ptr_9->body
; src/create.c:53:     function_ptr->function_scope = function_scope;
	movq	-8(%rbp), %rax	; function_ptr, tmp96
	movq	-56(%rbp), %rdx	; function_scope, tmp97
	movq	%rdx, 32(%rax)	; tmp97, function_ptr_9->function_scope
; src/create.c:54:     return function;
	movq	-16(%rbp), %rax	; function, _2
.L17:
; src/create.c:55: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	create_function, .-create_function
	.section	.rodata
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method
	.type	create_method, @function
create_method:
.LFB10:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; return_type, return_type
	movq	%rdx, -40(%rbp)	; parameters, parameters
	movq	%rcx, -48(%rbp)	; body, body
	movq	%r8, -56(%rbp)	; method_scope, method_scope
; src/create.c:58:     if (name == 0 || return_type == 0) {
	cmpq	$0, -24(%rbp)	;, name
	je	.L19	;,
; src/create.c:58:     if (name == 0 || return_type == 0) {
	cmpq	$0, -32(%rbp)	;, return_type
	jne	.L20	;,
.L19:
; src/create.c:59:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.4_1
	movq	%rax, %rcx	; stderr.4_1,
	movl	$51, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:60:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L21	;
.L20:
; src/create.c:62:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, method
; src/create.c:63:     Method* method_ptr = method;
	movq	-16(%rbp), %rax	; method, tmp87
	movq	%rax, -8(%rbp)	; tmp87, method_ptr
; src/create.c:64:     method_ptr->name = name;
	movq	-8(%rbp), %rax	; method_ptr, tmp88
	movq	-24(%rbp), %rdx	; name, tmp89
	movq	%rdx, (%rax)	; tmp89, method_ptr_9->name
; src/create.c:65:     method_ptr->return_type = return_type;
	movq	-8(%rbp), %rax	; method_ptr, tmp90
	movq	-32(%rbp), %rdx	; return_type, tmp91
	movq	%rdx, 8(%rax)	; tmp91, method_ptr_9->return_type
; src/create.c:66:     method_ptr->parameters = parameters;
	movq	-8(%rbp), %rax	; method_ptr, tmp92
	movq	-40(%rbp), %rdx	; parameters, tmp93
	movq	%rdx, 16(%rax)	; tmp93, method_ptr_9->parameters
; src/create.c:67:     method_ptr->body = body;
	movq	-8(%rbp), %rax	; method_ptr, tmp94
	movq	-48(%rbp), %rdx	; body, tmp95
	movq	%rdx, 24(%rax)	; tmp95, method_ptr_9->body
; src/create.c:68:     method_ptr->method_scope = method_scope;
	movq	-8(%rbp), %rax	; method_ptr, tmp96
	movq	-56(%rbp), %rdx	; method_scope, tmp97
	movq	%rdx, 32(%rax)	; tmp97, method_ptr_9->method_scope
; src/create.c:69:     return method;
	movq	-16(%rbp), %rax	; method, _2
.L21:
; src/create.c:70: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	create_method, .-create_method
	.section	.rodata
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
.LFB11:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; method_content, method_content
	movq	%rdx, -40(%rbp)	; variable_content, variable_content
; src/create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, class_member
; src/create.c:74:     ClassMember* class_member_ptr = class_member;
	movq	-16(%rbp), %rax	; class_member, tmp87
	movq	%rax, -8(%rbp)	; tmp87, class_member_ptr
; src/create.c:75:     class_member_ptr->type = type;
	movq	-8(%rbp), %rax	; class_member_ptr, tmp88
	movl	-20(%rbp), %edx	; type, tmp89
	movl	%edx, 8(%rax)	; tmp89, class_member_ptr_10->type
; src/create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L23	;,
; src/create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	cmpq	$0, -32(%rbp)	;, method_content
	je	.L23	;,
; src/create.c:77:         class_member_ptr->content.method = method_content;
	movq	-8(%rbp), %rax	; class_member_ptr, tmp90
	movq	-32(%rbp), %rdx	; method_content, tmp91
	movq	%rdx, (%rax)	; tmp91, class_member_ptr_10->content.method
	jmp	.L24	;
.L23:
; src/create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L25	;,
; src/create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpq	$0, -40(%rbp)	;, variable_content
	je	.L25	;,
; src/create.c:79:         class_member_ptr->content.variable = variable_content;
	movq	-8(%rbp), %rax	; class_member_ptr, tmp92
	movq	-40(%rbp), %rdx	; variable_content, tmp93
	movq	%rdx, (%rax)	; tmp93, class_member_ptr_10->content.variable
	jmp	.L24	;
.L25:
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	cmpq	$0, -32(%rbp)	;, method_content
	jne	.L26	;,
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	cmpq	$0, -40(%rbp)	;, variable_content
	jne	.L26	;,
; src/create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.5_1
	movq	%rax, %rcx	; stderr.5_1,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rax	;, tmp94
	movq	%rax, %rdi	; tmp94,
	call	fwrite@PLT	;
	jmp	.L27	;
.L26:
; src/create.c:84:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.6_2
	movl	-20(%rbp), %edx	; type, tmp95
	leaq	.LC6(%rip), %rcx	;, tmp96
	movq	%rcx, %rsi	; tmp96,
	movq	%rax, %rdi	; stderr.6_2,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
.L27:
; src/create.c:85:         return 0;
	movl	$0, %eax	;, _3
	jmp	.L28	;
.L24:
; src/create.c:87:     return class_member;
	movq	-16(%rbp), %rax	; class_member, _3
.L28:
; src/create.c:88: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE11:
	.size	create_class_member, .-create_class_member
	.section	.rodata
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class
	.type	create_class, @function
create_class:
.LFB12:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; members, members
	movq	%rdx, -40(%rbp)	; class_scope, class_scope
; src/create.c:91:     if (name == 0) {
	cmpq	$0, -24(%rbp)	;, name
	jne	.L30	;,
; src/create.c:92:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.7_1
	movq	%rax, %rcx	; stderr.7_1,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:93:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L31	;
.L30:
; src/create.c:95:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$24, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, class
; src/create.c:96:     Class* class_ptr = class;
	movq	-16(%rbp), %rax	; class, tmp87
	movq	%rax, -8(%rbp)	; tmp87, class_ptr
; src/create.c:97:     class_ptr->name = name;
	movq	-8(%rbp), %rax	; class_ptr, tmp88
	movq	-24(%rbp), %rdx	; name, tmp89
	movq	%rdx, (%rax)	; tmp89, class_ptr_8->name
; src/create.c:98:     class_ptr->members = members;
	movq	-8(%rbp), %rax	; class_ptr, tmp90
	movq	-32(%rbp), %rdx	; members, tmp91
	movq	%rdx, 8(%rax)	; tmp91, class_ptr_8->members
; src/create.c:99:     class_ptr->class_scope = class_scope;
	movq	-8(%rbp), %rax	; class_ptr, tmp92
	movq	-40(%rbp), %rdx	; class_scope, tmp93
	movq	%rdx, 16(%rax)	; tmp93, class_ptr_8->class_scope
; src/create.c:100:     return class;
	movq	-16(%rbp), %rax	; class, _2
.L31:
; src/create.c:101: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE12:
	.size	create_class, .-create_class
	.section	.rodata
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
.LFB13:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; name, name
	movq	%rdx, -40(%rbp)	; value, value
; src/create.c:104:     if (type == 0 || name == 0) {
	cmpq	$0, -24(%rbp)	;, type
	je	.L33	;,
; src/create.c:104:     if (type == 0 || name == 0) {
	cmpq	$0, -32(%rbp)	;, name
	jne	.L34	;,
.L33:
; src/create.c:105:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.8_1
	movq	%rax, %rcx	; stderr.8_1,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:106:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L35	;
.L34:
; src/create.c:108:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, variable
; src/create.c:109:     Variable* variable_ptr = variable;
	movq	-16(%rbp), %rax	; variable, tmp87
	movq	%rax, -8(%rbp)	; tmp87, variable_ptr
; src/create.c:110:     variable_ptr->type = type;
	movq	-8(%rbp), %rax	; variable_ptr, tmp88
	movq	-24(%rbp), %rdx	; type, tmp89
	movq	%rdx, (%rax)	; tmp89, variable_ptr_9->type
; src/create.c:111:     variable_ptr->name = name;
	movq	-8(%rbp), %rax	; variable_ptr, tmp90
	movq	-32(%rbp), %rdx	; name, tmp91
	movq	%rdx, 8(%rax)	; tmp91, variable_ptr_9->name
; src/create.c:112:     variable_ptr->value = value;
	movq	-8(%rbp), %rax	; variable_ptr, tmp92
	movq	-40(%rbp), %rdx	; value, tmp93
	movq	%rdx, 16(%rax)	; tmp93, variable_ptr_9->value
; src/create.c:113:     return variable;
	movq	-16(%rbp), %rax	; variable, _2
.L35:
; src/create.c:114: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE13:
	.size	create_variable, .-create_variable
	.section	.rodata
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
.LFB14:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; if_stmt, if_stmt
	movq	%rdx, -40(%rbp)	; while_stmt, while_stmt
	movq	%rcx, -48(%rbp)	; for_stmt, for_stmt
	movq	%r8, -56(%rbp)	; expr, expr
	movq	%r9, -64(%rbp)	; var_stmt, var_stmt
; src/create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, statement
; src/create.c:118:     Statement* statement_ptr = statement;
	movq	-16(%rbp), %rax	; statement, tmp87
	movq	%rax, -8(%rbp)	; tmp87, statement_ptr
; src/create.c:119:     statement_ptr->type = type;
	movq	-8(%rbp), %rax	; statement_ptr, tmp88
	movl	-20(%rbp), %edx	; type, tmp89
	movl	%edx, 8(%rax)	; tmp89, statement_ptr_10->type
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L37	;,
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	cmpq	$0, -56(%rbp)	;, expr
	je	.L37	;,
; src/create.c:121:         statement_ptr->stmt.expr = expr;
	movq	-8(%rbp), %rax	; statement_ptr, tmp90
	movq	-56(%rbp), %rdx	; expr, tmp91
	movq	%rdx, (%rax)	; tmp91, statement_ptr_10->stmt.expr
	jmp	.L38	;
.L37:
; src/create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L39	;,
; src/create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpq	$0, -64(%rbp)	;, var_stmt
	je	.L39	;,
; src/create.c:123:         statement_ptr->stmt.var = var_stmt;
	movq	-8(%rbp), %rax	; statement_ptr, tmp92
	movq	-64(%rbp), %rdx	; var_stmt, tmp93
	movq	%rdx, (%rax)	; tmp93, statement_ptr_10->stmt.var
	jmp	.L38	;
.L39:
; src/create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpl	$2, -20(%rbp)	;, type
	jne	.L40	;,
; src/create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpq	$0, -32(%rbp)	;, if_stmt
	je	.L40	;,
; src/create.c:125:         statement_ptr->stmt.if_stmt = if_stmt;
	movq	-8(%rbp), %rax	; statement_ptr, tmp94
	movq	-32(%rbp), %rdx	; if_stmt, tmp95
	movq	%rdx, (%rax)	; tmp95, statement_ptr_10->stmt.if_stmt
	jmp	.L38	;
.L40:
; src/create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpl	$3, -20(%rbp)	;, type
	jne	.L41	;,
; src/create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpq	$0, -40(%rbp)	;, while_stmt
	je	.L41	;,
; src/create.c:127:         statement_ptr->stmt.while_stmt = while_stmt;
	movq	-8(%rbp), %rax	; statement_ptr, tmp96
	movq	-40(%rbp), %rdx	; while_stmt, tmp97
	movq	%rdx, (%rax)	; tmp97, statement_ptr_10->stmt.while_stmt
	jmp	.L38	;
.L41:
; src/create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpl	$4, -20(%rbp)	;, type
	jne	.L42	;,
; src/create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpq	$0, -48(%rbp)	;, for_stmt
	je	.L42	;,
; src/create.c:129:         statement_ptr->stmt.for_stmt = for_stmt;
	movq	-8(%rbp), %rax	; statement_ptr, tmp98
	movq	-48(%rbp), %rdx	; for_stmt, tmp99
	movq	%rdx, (%rax)	; tmp99, statement_ptr_10->stmt.for_stmt
	jmp	.L38	;
.L42:
; src/create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpl	$5, -20(%rbp)	;, type
	jne	.L43	;,
; src/create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpq	$0, -56(%rbp)	;, expr
	je	.L43	;,
; src/create.c:131:         statement_ptr->stmt.return_expr = expr;
	movq	-8(%rbp), %rax	; statement_ptr, tmp100
	movq	-56(%rbp), %rdx	; expr, tmp101
	movq	%rdx, (%rax)	; tmp101, statement_ptr_10->stmt.return_expr
	jmp	.L38	;
.L43:
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$6, -20(%rbp)	;, type
	je	.L44	;,
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$7, -20(%rbp)	;, type
	jne	.L45	;,
.L44:
; src/create.c:133:         statement_ptr->stmt.expr = 0;
	movq	-8(%rbp), %rax	; statement_ptr, tmp102
	movq	$0, (%rax)	;, statement_ptr_10->stmt.expr
	jmp	.L38	;
.L45:
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, -32(%rbp)	;, if_stmt
	jne	.L46	;,
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, -40(%rbp)	;, while_stmt
	jne	.L46	;,
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, -48(%rbp)	;, for_stmt
	jne	.L46	;,
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, -56(%rbp)	;, expr
	jne	.L46	;,
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	cmpq	$0, -64(%rbp)	;, var_stmt
	jne	.L46	;,
; src/create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.9_1
	movq	%rax, %rcx	; stderr.9_1,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rax	;, tmp103
	movq	%rax, %rdi	; tmp103,
	call	fwrite@PLT	;
	jmp	.L47	;
.L46:
; src/create.c:138:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.10_2
	movl	-20(%rbp), %edx	; type, tmp104
	leaq	.LC10(%rip), %rcx	;, tmp105
	movq	%rcx, %rsi	; tmp105,
	movq	%rax, %rdi	; stderr.10_2,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
.L47:
; src/create.c:139:         return 0;
	movl	$0, %eax	;, _3
	jmp	.L48	;
.L38:
; src/create.c:141:     return statement;
	movq	-16(%rbp), %rax	; statement, _3
.L48:
; src/create.c:142: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE14:
	.size	create_statement, .-create_statement
	.section	.rodata
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
.LFB15:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; condition, condition
	movq	%rsi, -32(%rbp)	; body, body
	movq	%rdx, -40(%rbp)	; else_if, else_if
	movq	%rcx, -48(%rbp)	; else_body, else_body
; src/create.c:145:     if (condition == 0) {
	cmpq	$0, -24(%rbp)	;, condition
	jne	.L50	;,
; src/create.c:146:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.11_1
	movq	%rax, %rcx	; stderr.11_1,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:147:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L51	;
.L50:
; src/create.c:149:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, if_
; src/create.c:150:     If* if_ptr = if_;
	movq	-16(%rbp), %rax	; if_, tmp87
	movq	%rax, -8(%rbp)	; tmp87, if_ptr
; src/create.c:151:     if_ptr->condition = condition;
	movq	-8(%rbp), %rax	; if_ptr, tmp88
	movq	-24(%rbp), %rdx	; condition, tmp89
	movq	%rdx, (%rax)	; tmp89, if_ptr_8->condition
; src/create.c:152:     if_ptr->body = body;
	movq	-8(%rbp), %rax	; if_ptr, tmp90
	movq	-32(%rbp), %rdx	; body, tmp91
	movq	%rdx, 8(%rax)	; tmp91, if_ptr_8->body
; src/create.c:153:     if_ptr->else_if = else_if;
	movq	-8(%rbp), %rax	; if_ptr, tmp92
	movq	-40(%rbp), %rdx	; else_if, tmp93
	movq	%rdx, 16(%rax)	; tmp93, if_ptr_8->else_if
; src/create.c:154:     if_ptr->else_body = else_body;
	movq	-8(%rbp), %rax	; if_ptr, tmp94
	movq	-48(%rbp), %rdx	; else_body, tmp95
	movq	%rdx, 24(%rax)	; tmp95, if_ptr_8->else_body
; src/create.c:155:     return if_;
	movq	-16(%rbp), %rax	; if_, _2
.L51:
; src/create.c:156: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE15:
	.size	create_if, .-create_if
	.section	.rodata
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
.LFB16:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; condition, condition
	movq	%rsi, -32(%rbp)	; body, body
; src/create.c:159:     if (condition == 0) {
	cmpq	$0, -24(%rbp)	;, condition
	jne	.L53	;,
; src/create.c:160:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.12_1
	movq	%rax, %rcx	; stderr.12_1,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	fwrite@PLT	;
; src/create.c:161:         return 0;
	movl	$0, %eax	;, _2
	jmp	.L54	;
.L53:
; src/create.c:163:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, else_if
; src/create.c:164:     ElseIf* else_if_ptr = else_if;
	movq	-16(%rbp), %rax	; else_if, tmp87
	movq	%rax, -8(%rbp)	; tmp87, else_if_ptr
; src/create.c:165:     else_if_ptr->condition = condition;
	movq	-8(%rbp), %rax	; else_if_ptr, tmp88
	movq	-24(%rbp), %rdx	; condition, tmp89
	movq	%rdx, (%rax)	; tmp89, else_if_ptr_8->condition
; src/create.c:166:     else_if_ptr->body = body;
	movq	-8(%rbp), %rax	; else_if_ptr, tmp90
	movq	-32(%rbp), %rdx	; body, tmp91
	movq	%rdx, 8(%rax)	; tmp91, else_if_ptr_8->body
; src/create.c:167:     return else_if;
	movq	-16(%rbp), %rax	; else_if, _2
.L54:
; src/create.c:168: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE16:
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
.LFB17:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; initializer, initializer
	movq	%rsi, -32(%rbp)	; condition, condition
	movq	%rdx, -40(%rbp)	; increment, increment
	movq	%rcx, -48(%rbp)	; body, body
; src/create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp84, for_
; src/create.c:172:     For* for_ptr = for_;
	movq	-16(%rbp), %rax	; for_, tmp85
	movq	%rax, -8(%rbp)	; tmp85, for_ptr
; src/create.c:173:     for_ptr->initializer = initializer;
	movq	-8(%rbp), %rax	; for_ptr, tmp86
	movq	-24(%rbp), %rdx	; initializer, tmp87
	movq	%rdx, (%rax)	; tmp87, for_ptr_4->initializer
; src/create.c:174:     for_ptr->condition = condition;
	movq	-8(%rbp), %rax	; for_ptr, tmp88
	movq	-32(%rbp), %rdx	; condition, tmp89
	movq	%rdx, 8(%rax)	; tmp89, for_ptr_4->condition
; src/create.c:175:     for_ptr->increment = increment;
	movq	-8(%rbp), %rax	; for_ptr, tmp90
	movq	-40(%rbp), %rdx	; increment, tmp91
	movq	%rdx, 16(%rax)	; tmp91, for_ptr_4->increment
; src/create.c:176:     for_ptr->body = body;
	movq	-8(%rbp), %rax	; for_ptr, tmp92
	movq	-48(%rbp), %rdx	; body, tmp93
	movq	%rdx, 24(%rax)	; tmp93, for_ptr_4->body
; src/create.c:177:     return for_;
	movq	-16(%rbp), %rax	; for_, _13
; src/create.c:178: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE17:
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
.LFB18:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; condition, condition
	movq	%rsi, -32(%rbp)	; body, body
; src/create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp84, while_
; src/create.c:182:     While* while_ptr = while_;
	movq	-16(%rbp), %rax	; while_, tmp85
	movq	%rax, -8(%rbp)	; tmp85, while_ptr
; src/create.c:183:     while_ptr->condition = condition;
	movq	-8(%rbp), %rax	; while_ptr, tmp86
	movq	-24(%rbp), %rdx	; condition, tmp87
	movq	%rdx, (%rax)	; tmp87, while_ptr_4->condition
; src/create.c:184:     while_ptr->body = body;
	movq	-8(%rbp), %rax	; while_ptr, tmp88
	movq	-32(%rbp), %rdx	; body, tmp89
	movq	%rdx, 8(%rax)	; tmp89, while_ptr_4->body
; src/create.c:185:     return while_;
	movq	-16(%rbp), %rax	; while_, _9
; src/create.c:186: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE18:
	.size	create_while, .-create_while
	.section	.rodata
.LC13:
	.string	"true"
.LC14:
	.string	"false"
	.align 8
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n"
	.align 8
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.globl	create_expression
	.type	create_expression, @function
create_expression:
.LFB19:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; operator, operator
	movq	%rsi, -32(%rbp)	; expr_left, expr_left
	movq	%rdx, -40(%rbp)	; prim_left, prim_left
	movq	%rcx, -48(%rbp)	; right, right
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpl	$19, -20(%rbp)	;, operator
	sete	%dl	;, _1
	cmpq	$0, -48(%rbp)	;, right
	sete	%al	;, _2
	xorl	%edx, %eax	; _1, _3
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	testb	%al, %al	; _3
	jne	.L60	;,
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpq	$0, -32(%rbp)	;, expr_left
	jne	.L61	;,
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpq	$0, -40(%rbp)	;, prim_left
	jne	.L61	;,
.L60:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpq	$0, -48(%rbp)	;, right
	jne	.L62	;,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rsi	;, iftmp.13_6
	jmp	.L63	;
.L62:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rsi	;, iftmp.13_6
.L63:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpq	$0, -40(%rbp)	;, prim_left
	jne	.L64	;,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rcx	;, iftmp.14_7
	jmp	.L65	;
.L64:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rcx	;, iftmp.14_7
.L65:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpq	$0, -32(%rbp)	;, expr_left
	jne	.L66	;,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rdx	;, iftmp.15_8
	jmp	.L67	;
.L66:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rdx	;, iftmp.15_8
.L67:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpl	$19, -20(%rbp)	;, operator
	jne	.L68	;,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rax	;, iftmp.16_9
	jmp	.L69	;
.L68:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rax	;, iftmp.16_9
.L69:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	stderr(%rip), %rdi	; stderr, stderr.17_4
	movq	%rsi, %r9	; iftmp.13_6,
	movq	%rcx, %r8	; iftmp.14_7,
	movq	%rdx, %rcx	; iftmp.15_8,
	movq	%rax, %rdx	; iftmp.16_9,
	leaq	.LC15(%rip), %rax	;, tmp93
	movq	%rax, %rsi	; tmp93,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
; src/create.c:195:         return 0;
	movl	$0, %eax	;, _10
	jmp	.L70	;
.L61:
; src/create.c:197:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp94, expression
; src/create.c:198:     Expression* expression_ptr = expression;
	movq	-16(%rbp), %rax	; expression, tmp95
	movq	%rax, -8(%rbp)	; tmp95, expression_ptr
; src/create.c:199:     expression_ptr->operator = operator;
	movq	-8(%rbp), %rax	; expression_ptr, tmp96
	movl	-20(%rbp), %edx	; operator, tmp97
	movl	%edx, 24(%rax)	; tmp97, expression_ptr_20->operator
; src/create.c:200:     if (expr_left != 0)
	cmpq	$0, -32(%rbp)	;, expr_left
	je	.L71	;,
; src/create.c:201:         expression_ptr->expr_left = expr_left;
	movq	-8(%rbp), %rax	; expression_ptr, tmp98
	movq	-32(%rbp), %rdx	; expr_left, tmp99
	movq	%rdx, (%rax)	; tmp99, expression_ptr_20->expr_left
	jmp	.L72	;
.L71:
; src/create.c:202:     else if (prim_left != 0)
	cmpq	$0, -40(%rbp)	;, prim_left
	je	.L73	;,
; src/create.c:203:         expression_ptr->prim_left = prim_left;
	movq	-8(%rbp), %rax	; expression_ptr, tmp100
	movq	-40(%rbp), %rdx	; prim_left, tmp101
	movq	%rdx, 8(%rax)	; tmp101, expression_ptr_20->prim_left
	jmp	.L72	;
.L73:
; src/create.c:205:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.18_5
	movq	%rax, %rcx	; stderr.18_5,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	fwrite@PLT	;
; src/create.c:206:         return 0;
	movl	$0, %eax	;, _10
	jmp	.L70	;
.L72:
; src/create.c:208:     expression_ptr->right = right;
	movq	-8(%rbp), %rax	; expression_ptr, tmp103
	movq	-48(%rbp), %rdx	; right, tmp104
	movq	%rdx, 16(%rax)	; tmp104, expression_ptr_20->right
; src/create.c:209:     return expression;
	movq	-16(%rbp), %rax	; expression, _10
.L70:
; src/create.c:210: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE19:
	.size	create_expression, .-create_expression
	.section	.rodata
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
.LFB20:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; str_value, str_value
	movq	%rdx, -40(%rbp)	; expr_value, expr_value
	movq	%rcx, -48(%rbp)	; prim_value, prim_value
	movq	%r8, -56(%rbp)	; variable_value, variable_value
; src/create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp86, primary
; src/create.c:214:     Primary* primary_ptr = primary;
	movq	-16(%rbp), %rax	; primary, tmp87
	movq	%rax, -8(%rbp)	; tmp87, primary_ptr
; src/create.c:215:     primary_ptr->type = type;
	movq	-8(%rbp), %rax	; primary_ptr, tmp88
	movl	-20(%rbp), %edx	; type, tmp89
	movl	%edx, 8(%rax)	; tmp89, primary_ptr_10->type
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$0, -20(%rbp)	;, type
	je	.L75	;,
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$1, -20(%rbp)	;, type
	je	.L75	;,
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$2, -20(%rbp)	;, type
	je	.L75	;,
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$3, -20(%rbp)	;, type
	je	.L75	;,
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$4, -20(%rbp)	;, type
	jne	.L76	;,
.L75:
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpq	$0, -32(%rbp)	;, str_value
	je	.L76	;,
; src/create.c:217:         primary_ptr->value.literal_value = str_value;
	movq	-8(%rbp), %rax	; primary_ptr, tmp90
	movq	-32(%rbp), %rdx	; str_value, tmp91
	movq	%rdx, (%rax)	; tmp91, primary_ptr_10->value.literal_value
	jmp	.L77	;
.L76:
; src/create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpl	$5, -20(%rbp)	;, type
	jne	.L78	;,
; src/create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpq	$0, -40(%rbp)	;, expr_value
	je	.L78	;,
; src/create.c:219:         primary_ptr->value.expr = expr_value;
	movq	-8(%rbp), %rax	; primary_ptr, tmp92
	movq	-40(%rbp), %rdx	; expr_value, tmp93
	movq	%rdx, (%rax)	; tmp93, primary_ptr_10->value.expr
	jmp	.L77	;
.L78:
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$6, -20(%rbp)	;, type
	je	.L79	;,
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$7, -20(%rbp)	;, type
	jne	.L80	;,
.L79:
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpq	$0, -48(%rbp)	;, prim_value
	je	.L80	;,
; src/create.c:221:         primary_ptr->value.operand = prim_value;
	movq	-8(%rbp), %rax	; primary_ptr, tmp94
	movq	-48(%rbp), %rdx	; prim_value, tmp95
	movq	%rdx, (%rax)	; tmp95, primary_ptr_10->value.operand
	jmp	.L77	;
.L80:
; src/create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpl	$8, -20(%rbp)	;, type
	jne	.L81	;,
; src/create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpq	$0, -56(%rbp)	;, variable_value
	je	.L81	;,
; src/create.c:223:         primary_ptr->value.var = variable_value;
	movq	-8(%rbp), %rax	; primary_ptr, tmp96
	movq	-56(%rbp), %rdx	; variable_value, tmp97
	movq	%rdx, (%rax)	; tmp97, primary_ptr_10->value.var
	jmp	.L77	;
.L81:
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, -32(%rbp)	;, str_value
	jne	.L82	;,
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, -40(%rbp)	;, expr_value
	jne	.L82	;,
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, -48(%rbp)	;, prim_value
	jne	.L82	;,
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	cmpq	$0, -56(%rbp)	;, variable_value
	jne	.L82	;,
; src/create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.19_1
	movq	%rax, %rcx	; stderr.19_1,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp98
	movq	%rax, %rdi	; tmp98,
	call	fwrite@PLT	;
	jmp	.L83	;
.L82:
; src/create.c:228:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.20_2
	movl	-20(%rbp), %edx	; type, tmp99
	leaq	.LC18(%rip), %rcx	;, tmp100
	movq	%rcx, %rsi	; tmp100,
	movq	%rax, %rdi	; stderr.20_2,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
.L83:
; src/create.c:229:         return 0;
	movl	$0, %eax	;, _3
	jmp	.L84	;
.L77:
; src/create.c:231:     return primary;
	movq	-16(%rbp), %rax	; primary, _3
.L84:
; src/create.c:232: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE20:
	.size	create_primary, .-create_primary
	.section	.rodata
	.align 8
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n"
	.align 8
.LC20:
	.string	"Error creating variable access: content is NULL\n"
	.align 8
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
.LFB21:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	;,
	.cfi_def_cfa_register 6
	subq	$64, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; base, base
	movq	%rdx, -40(%rbp)	; name_content, name_content
	movq	%rcx, -48(%rbp)	; expr_content, expr_content
	movq	%r8, -56(%rbp)	; args_content, args_content
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	cmpq	$0, -32(%rbp)	;, base
	sete	%dl	;, _1
	cmpl	$0, -20(%rbp)	;, type
	sete	%al	;, _2
	xorl	%edx, %eax	; _1, _3
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	testb	%al, %al	; _3
	je	.L86	;,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpl	$0, -20(%rbp)	;, type
	jne	.L87	;,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rdx	;, iftmp.21_7
	jmp	.L88	;
.L87:
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rdx	;, iftmp.21_7
.L88:
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpq	$0, -32(%rbp)	;, base
	jne	.L89	;,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, iftmp.22_8
	jmp	.L90	;
.L89:
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rax	;, iftmp.22_8
.L90:
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	stderr(%rip), %rdi	; stderr, stderr.23_4
	movq	%rdx, %rcx	; iftmp.21_7,
	movq	%rax, %rdx	; iftmp.22_8,
	leaq	.LC19(%rip), %rax	;, tmp92
	movq	%rax, %rsi	; tmp92,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
; src/create.c:237:         return 0;
	movl	$0, %eax	;, _9
	jmp	.L91	;
.L86:
; src/create.c:239:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	alloc_memory@PLT	;
	movq	%rax, -16(%rbp)	; tmp93, variable_access
; src/create.c:240:     VariableAccess* variable_access_ptr = variable_access;
	movq	-16(%rbp), %rax	; variable_access, tmp94
	movq	%rax, -8(%rbp)	; tmp94, variable_access_ptr
; src/create.c:241:     variable_access_ptr->type = type;
	movq	-8(%rbp), %rax	; variable_access_ptr, tmp95
	movl	-20(%rbp), %edx	; type, tmp96
	movl	%edx, 16(%rax)	; tmp96, variable_access_ptr_18->type
; src/create.c:242:     variable_access_ptr->base = base;
	movq	-8(%rbp), %rax	; variable_access_ptr, tmp97
	movq	-32(%rbp), %rdx	; base, tmp98
	movq	%rdx, (%rax)	; tmp98, variable_access_ptr_18->base
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L92	;,
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	cmpq	$0, -40(%rbp)	;, name_content
	je	.L92	;,
; src/create.c:244:         variable_access_ptr->content.name = name_content;
	movq	-8(%rbp), %rax	; variable_access_ptr, tmp99
	movq	-40(%rbp), %rdx	; name_content, tmp100
	movq	%rdx, 8(%rax)	; tmp100, variable_access_ptr_18->content.name
	jmp	.L93	;
.L92:
; src/create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L94	;,
; src/create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpq	$0, -56(%rbp)	;, args_content
	je	.L94	;,
; src/create.c:246:         variable_access_ptr->content.args = args_content;
	movq	-8(%rbp), %rax	; variable_access_ptr, tmp101
	movq	-56(%rbp), %rdx	; args_content, tmp102
	movq	%rdx, 8(%rax)	; tmp102, variable_access_ptr_18->content.args
	jmp	.L93	;
.L94:
; src/create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpl	$3, -20(%rbp)	;, type
	jne	.L95	;,
; src/create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpq	$0, -48(%rbp)	;, expr_content
	je	.L95	;,
; src/create.c:248:         variable_access_ptr->content.index = expr_content;
	movq	-8(%rbp), %rax	; variable_access_ptr, tmp103
	movq	-48(%rbp), %rdx	; expr_content, tmp104
	movq	%rdx, 8(%rax)	; tmp104, variable_access_ptr_18->content.index
	jmp	.L93	;
.L95:
; src/create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpl	$2, -20(%rbp)	;, type
	jne	.L96	;,
; src/create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpq	$0, -40(%rbp)	;, name_content
	je	.L96	;,
; src/create.c:250:         variable_access_ptr->content.attr_name = name_content;
	movq	-8(%rbp), %rax	; variable_access_ptr, tmp105
	movq	-40(%rbp), %rdx	; name_content, tmp106
	movq	%rdx, 8(%rax)	; tmp106, variable_access_ptr_18->content.attr_name
	jmp	.L93	;
.L96:
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	cmpq	$0, -40(%rbp)	;, name_content
	jne	.L97	;,
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	cmpq	$0, -48(%rbp)	;, expr_content
	jne	.L97	;,
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	cmpq	$0, -56(%rbp)	;, args_content
	jne	.L97	;,
; src/create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.24_5
	movq	%rax, %rcx	; stderr.24_5,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	fwrite@PLT	;
	jmp	.L98	;
.L97:
; src/create.c:255:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.25_6
	movl	-20(%rbp), %edx	; type, tmp108
	leaq	.LC21(%rip), %rcx	;, tmp109
	movq	%rcx, %rsi	; tmp109,
	movq	%rax, %rdi	; stderr.25_6,
	movl	$0, %eax	;,
	call	fprintf@PLT	;
.L98:
; src/create.c:256:         return 0;
	movl	$0, %eax	;, _9
	jmp	.L91	;
.L93:
; src/create.c:258:     return variable_access;
	movq	-16(%rbp), %rax	; variable_access, _9
.L91:
; src/create.c:259: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE21:
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

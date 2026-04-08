	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; import_content, import_content
	movq	%rdx, -40(%rbp)	; function_content, function_content
	movq	%rcx, -48(%rbp)	; class_content, class_content
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, code_member
; src/create.c:5:     code_member->type = type;
	movq	-8(%rbp), %rax	; code_member, tmp87
	movl	-20(%rbp), %edx	; type, tmp88
	movl	%edx, 8(%rax)	; tmp88, code_member_6->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L2	;,
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	cmpq	$0, -32(%rbp)	;, import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	-8(%rbp), %rax	; code_member, tmp89
	movq	-32(%rbp), %rdx	; import_content, tmp90
	movq	%rdx, (%rax)	; tmp90, code_member_6->content.import
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
	movq	%rdx, (%rax)	; tmp92, code_member_6->content.function
	jmp	.L3	;
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, -20(%rbp)	;, type
	jne	.L5	;,
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpq	$0, -48(%rbp)	;, class_content
	je	.L5	;,
; src/create.c:11:         code_member->content.class = class_content;
	movq	-8(%rbp), %rax	; code_member, tmp93
	movq	-48(%rbp), %rdx	; class_content, tmp94
	movq	%rdx, (%rax)	; tmp94, code_member_6->content.class
	jmp	.L3	;
.L5:
; src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	cmpq	$0, -32(%rbp)	;, import_content
	jne	.L6	;,
; src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	cmpq	$0, -40(%rbp)	;, function_content
	jne	.L6	;,
; src/create.c:12:     else if (import_content == NULL && function_content == NULL && class_content == NULL)
	cmpq	$0, -48(%rbp)	;, class_content
	jne	.L6	;,
; src/create.c:13:         fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.0_1
	movq	%rax, %rcx	; stderr.0_1,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L3	;
.L6:
; src/create.c:15:         fprintf(stderr, "Error creating code member: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.1_2
	movl	-20(%rbp), %edx	; type, tmp96
	leaq	.LC1(%rip), %rcx	;, tmp97
	movq	%rcx, %rsi	; tmp97,
	movq	%rax, %rdi	; stderr.1_2,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L3:
; src/create.c:16:     return code_member;
	movq	-8(%rbp), %rax	; code_member, _17
; src/create.c:17: }
	leave	
	ret	
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; members, members
	movq	%rsi, -32(%rbp)	; global_scope, global_scope
; src/create.c:20:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, code
; src/create.c:21:     code->members = members;
	movq	-8(%rbp), %rax	; code, tmp85
	movq	-24(%rbp), %rdx	; members, tmp86
	movq	%rdx, (%rax)	; tmp86, code_3->members
; src/create.c:22:     code->global_scope = global_scope;
	movq	-8(%rbp), %rax	; code, tmp87
	movq	-32(%rbp), %rdx	; global_scope, tmp88
	movq	%rdx, 8(%rax)	; tmp88, code_3->global_scope
; src/create.c:23:     return code;
	movq	-8(%rbp), %rax	; code, _8
; src/create.c:24: }
	leave	
	ret	
	.size	create_code, .-create_code
	.section	.rodata
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; source, source
; src/create.c:27:     if (name == NULL) {
	cmpq	$0, -24(%rbp)	;, name
	jne	.L11	;,
; src/create.c:28:         fprintf(stderr, "Error creating import: name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.2_1
	movq	%rax, %rcx	; stderr.2_1,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:29:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L12	;
.L11:
; src/create.c:31:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, import
; src/create.c:32:     import->name = name;
	movq	-8(%rbp), %rax	; import, tmp87
	movq	-24(%rbp), %rdx	; name, tmp88
	movq	%rdx, (%rax)	; tmp88, import_7->name
; src/create.c:33:     import->source = source;
	movq	-8(%rbp), %rax	; import, tmp89
	movq	-32(%rbp), %rdx	; source, tmp90
	movq	%rdx, 8(%rax)	; tmp90, import_7->source
; src/create.c:34:     return import;
	movq	-8(%rbp), %rax	; import, _2
.L12:
; src/create.c:35: }
	leave	
	ret	
	.size	create_import, .-create_import
	.section	.rodata
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function_use_ptr
	.type	create_function_use_ptr, @function
create_function_use_ptr:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -8(%rbp)	; function, function
	movq	%rsi, -16(%rbp)	; name, name
	movq	%rdx, -24(%rbp)	; return_type, return_type
	movq	%rcx, -32(%rbp)	; parameters, parameters
	movq	%r8, -40(%rbp)	; body, body
	movq	%r9, -48(%rbp)	; function_scope, function_scope
; src/create.c:38:     if (name == NULL || return_type == NULL) {
	cmpq	$0, -16(%rbp)	;, name
	je	.L14	;,
; src/create.c:38:     if (name == NULL || return_type == NULL) {
	cmpq	$0, -24(%rbp)	;, return_type
	jne	.L15	;,
.L14:
; src/create.c:39:         fprintf(stderr, "Error creating function: name or return_type is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.3_1
	movq	%rax, %rcx	; stderr.3_1,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:40:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L16	;
.L15:
; src/create.c:42:     function->name = name;
	movq	-8(%rbp), %rax	; function, tmp86
	movq	-16(%rbp), %rdx	; name, tmp87
	movq	%rdx, (%rax)	; tmp87, function_7(D)->name
; src/create.c:43:     function->return_type = return_type;
	movq	-8(%rbp), %rax	; function, tmp88
	movq	-24(%rbp), %rdx	; return_type, tmp89
	movq	%rdx, 8(%rax)	; tmp89, function_7(D)->return_type
; src/create.c:44:     function->parameters = parameters;
	movq	-8(%rbp), %rax	; function, tmp90
	movq	-32(%rbp), %rdx	; parameters, tmp91
	movq	%rdx, 16(%rax)	; tmp91, function_7(D)->parameters
; src/create.c:45:     function->body = body;
	movq	-8(%rbp), %rax	; function, tmp92
	movq	-40(%rbp), %rdx	; body, tmp93
	movq	%rdx, 24(%rax)	; tmp93, function_7(D)->body
; src/create.c:46:     function->function_scope = function_scope;
	movq	-8(%rbp), %rax	; function, tmp94
	movq	-48(%rbp), %rdx	; function_scope, tmp95
	movq	%rdx, 32(%rax)	; tmp95, function_7(D)->function_scope
; src/create.c:47:     return function;
	movq	-8(%rbp), %rax	; function, _2
.L16:
; src/create.c:48: }
	leave	
	ret	
	.size	create_function_use_ptr, .-create_function_use_ptr
	.section	.rodata
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method_use_ptr
	.type	create_method_use_ptr, @function
create_method_use_ptr:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -8(%rbp)	; method, method
	movq	%rsi, -16(%rbp)	; name, name
	movq	%rdx, -24(%rbp)	; return_type, return_type
	movq	%rcx, -32(%rbp)	; parameters, parameters
	movq	%r8, -40(%rbp)	; body, body
	movq	%r9, -48(%rbp)	; method_scope, method_scope
; src/create.c:51:     if (name == NULL || return_type == NULL) {
	cmpq	$0, -16(%rbp)	;, name
	je	.L18	;,
; src/create.c:51:     if (name == NULL || return_type == NULL) {
	cmpq	$0, -24(%rbp)	;, return_type
	jne	.L19	;,
.L18:
; src/create.c:52:         fprintf(stderr, "Error creating method: name or return_type is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.4_1
	movq	%rax, %rcx	; stderr.4_1,
	movl	$51, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:53:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L20	;
.L19:
; src/create.c:55:     method->name = name;
	movq	-8(%rbp), %rax	; method, tmp86
	movq	-16(%rbp), %rdx	; name, tmp87
	movq	%rdx, (%rax)	; tmp87, method_7(D)->name
; src/create.c:56:     method->return_type = return_type;
	movq	-8(%rbp), %rax	; method, tmp88
	movq	-24(%rbp), %rdx	; return_type, tmp89
	movq	%rdx, 8(%rax)	; tmp89, method_7(D)->return_type
; src/create.c:57:     method->parameters = parameters;
	movq	-8(%rbp), %rax	; method, tmp90
	movq	-32(%rbp), %rdx	; parameters, tmp91
	movq	%rdx, 16(%rax)	; tmp91, method_7(D)->parameters
; src/create.c:58:     method->body = body;
	movq	-8(%rbp), %rax	; method, tmp92
	movq	-40(%rbp), %rdx	; body, tmp93
	movq	%rdx, 24(%rax)	; tmp93, method_7(D)->body
; src/create.c:59:     method->method_scope = method_scope;
	movq	-8(%rbp), %rax	; method, tmp94
	movq	-48(%rbp), %rdx	; method_scope, tmp95
	movq	%rdx, 32(%rax)	; tmp95, method_7(D)->method_scope
; src/create.c:60:     return method;
	movq	-8(%rbp), %rax	; method, _2
.L20:
; src/create.c:61: }
	leave	
	ret	
	.size	create_method_use_ptr, .-create_method_use_ptr
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; method_content, method_content
	movq	%rdx, -40(%rbp)	; variable_content, variable_content
; src/create.c:64:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, class_member
; src/create.c:65:     class_member->type = type;
	movq	-8(%rbp), %rax	; class_member, tmp87
	movl	-20(%rbp), %edx	; type, tmp88
	movl	%edx, 8(%rax)	; tmp88, class_member_9->type
; src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L22	;,
; src/create.c:66:     if (type == CLASS_METHOD && method_content != NULL)
	cmpq	$0, -32(%rbp)	;, method_content
	je	.L22	;,
; src/create.c:67:         class_member->content.method = method_content;
	movq	-8(%rbp), %rax	; class_member, tmp89
	movq	-32(%rbp), %rdx	; method_content, tmp90
	movq	%rdx, (%rax)	; tmp90, class_member_9->content.method
	jmp	.L23	;
.L22:
; src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L24	;,
; src/create.c:68:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpq	$0, -40(%rbp)	;, variable_content
	je	.L24	;,
; src/create.c:69:         class_member->content.variable = variable_content;
	movq	-8(%rbp), %rax	; class_member, tmp91
	movq	-40(%rbp), %rdx	; variable_content, tmp92
	movq	%rdx, (%rax)	; tmp92, class_member_9->content.variable
	jmp	.L23	;
.L24:
; src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	cmpq	$0, -32(%rbp)	;, method_content
	jne	.L25	;,
; src/create.c:71:         if (method_content == NULL && variable_content == NULL)
	cmpq	$0, -40(%rbp)	;, variable_content
	jne	.L25	;,
; src/create.c:72:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.5_1
	movq	%rax, %rcx	; stderr.5_1,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L26	;
.L25:
; src/create.c:74:             fprintf(stderr, "Error creating class member: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.6_2
	movl	-20(%rbp), %edx	; type, tmp94
	leaq	.LC6(%rip), %rcx	;, tmp95
	movq	%rcx, %rsi	; tmp95,
	movq	%rax, %rdi	; stderr.6_2,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L26:
; src/create.c:75:         return NULL;
	movl	$0, %eax	;, _3
	jmp	.L27	;
.L23:
; src/create.c:77:     return class_member;
	movq	-8(%rbp), %rax	; class_member, _3
.L27:
; src/create.c:78: }
	leave	
	ret	
	.size	create_class_member, .-create_class_member
	.section	.rodata
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class_use_ptr
	.type	create_class_use_ptr, @function
create_class_use_ptr:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -8(%rbp)	; class, class
	movq	%rsi, -16(%rbp)	; name, name
	movq	%rdx, -24(%rbp)	; members, members
	movq	%rcx, -32(%rbp)	; class_scope, class_scope
	movq	%r8, -40(%rbp)	; size, size
; src/create.c:81:     if (name == NULL) {
	cmpq	$0, -16(%rbp)	;, name
	jne	.L29	;,
; src/create.c:82:         fprintf(stderr, "Error creating class: name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.7_1
	movq	%rax, %rcx	; stderr.7_1,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:83:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L30	;
.L29:
; src/create.c:85:     class->name = name;
	movq	-8(%rbp), %rax	; class, tmp86
	movq	-16(%rbp), %rdx	; name, tmp87
	movq	%rdx, (%rax)	; tmp87, class_6(D)->name
; src/create.c:86:     class->members = members;
	movq	-8(%rbp), %rax	; class, tmp88
	movq	-24(%rbp), %rdx	; members, tmp89
	movq	%rdx, 8(%rax)	; tmp89, class_6(D)->members
; src/create.c:87:     class->class_scope = class_scope;
	movq	-8(%rbp), %rax	; class, tmp90
	movq	-32(%rbp), %rdx	; class_scope, tmp91
	movq	%rdx, 16(%rax)	; tmp91, class_6(D)->class_scope
; src/create.c:88:     class->size = size;
	movq	-8(%rbp), %rax	; class, tmp92
	movq	-40(%rbp), %rdx	; size, tmp93
	movq	%rdx, 24(%rax)	; tmp93, class_6(D)->size
; src/create.c:89:     return class;
	movq	-8(%rbp), %rax	; class, _2
.L30:
; src/create.c:90: }
	leave	
	ret	
	.size	create_class_use_ptr, .-create_class_use_ptr
	.section	.rodata
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; name, name
	movq	%rdx, -40(%rbp)	; value, value
; src/create.c:93:     if (type == NULL || name == NULL) {
	cmpq	$0, -24(%rbp)	;, type
	je	.L32	;,
; src/create.c:93:     if (type == NULL || name == NULL) {
	cmpq	$0, -32(%rbp)	;, name
	jne	.L33	;,
.L32:
; src/create.c:94:         fprintf(stderr, "Error creating variable: type or name is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.8_1
	movq	%rax, %rcx	; stderr.8_1,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:95:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L34	;
.L33:
; src/create.c:97:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, variable
; src/create.c:98:     variable->type = type;
	movq	-8(%rbp), %rax	; variable, tmp87
	movq	-24(%rbp), %rdx	; type, tmp88
	movq	%rdx, (%rax)	; tmp88, variable_8->type
; src/create.c:99:     variable->name = name;
	movq	-8(%rbp), %rax	; variable, tmp89
	movq	-32(%rbp), %rdx	; name, tmp90
	movq	%rdx, 8(%rax)	; tmp90, variable_8->name
; src/create.c:100:     variable->value = value;
	movq	-8(%rbp), %rax	; variable, tmp91
	movq	-40(%rbp), %rdx	; value, tmp92
	movq	%rdx, 16(%rax)	; tmp92, variable_8->value
; src/create.c:101:     return variable;
	movq	-8(%rbp), %rax	; variable, _2
.L34:
; src/create.c:102: }
	leave	
	ret	
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; if_stmt, if_stmt
	movq	%rdx, -40(%rbp)	; while_stmt, while_stmt
	movq	%rcx, -48(%rbp)	; for_stmt, for_stmt
	movq	%r8, -56(%rbp)	; expr, expr
	movq	%r9, -64(%rbp)	; var_stmt, var_stmt
; src/create.c:105:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, statement
; src/create.c:106:     statement->type = type;
	movq	-8(%rbp), %rax	; statement, tmp87
	movl	-20(%rbp), %edx	; type, tmp88
	movl	%edx, 8(%rax)	; tmp88, statement_9->type
; src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L36	;,
; src/create.c:107:     if (type == EXPRESSION_STATEMENT && expr != NULL)
	cmpq	$0, -56(%rbp)	;, expr
	je	.L36	;,
; src/create.c:108:         statement->stmt.expr = expr;
	movq	-8(%rbp), %rax	; statement, tmp89
	movq	-56(%rbp), %rdx	; expr, tmp90
	movq	%rdx, (%rax)	; tmp90, statement_9->stmt.expr
	jmp	.L37	;
.L36:
; src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L38	;,
; src/create.c:109:     else if (type == VARIABLE_STATEMENT && var_stmt != NULL)
	cmpq	$0, -64(%rbp)	;, var_stmt
	je	.L38	;,
; src/create.c:110:         statement->stmt.var = var_stmt;
	movq	-8(%rbp), %rax	; statement, tmp91
	movq	-64(%rbp), %rdx	; var_stmt, tmp92
	movq	%rdx, (%rax)	; tmp92, statement_9->stmt.var
	jmp	.L37	;
.L38:
; src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpl	$2, -20(%rbp)	;, type
	jne	.L39	;,
; src/create.c:111:     else if (type == IF_STATEMENT && if_stmt != NULL)
	cmpq	$0, -32(%rbp)	;, if_stmt
	je	.L39	;,
; src/create.c:112:         statement->stmt.if_stmt = if_stmt;
	movq	-8(%rbp), %rax	; statement, tmp93
	movq	-32(%rbp), %rdx	; if_stmt, tmp94
	movq	%rdx, (%rax)	; tmp94, statement_9->stmt.if_stmt
	jmp	.L37	;
.L39:
; src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpl	$3, -20(%rbp)	;, type
	jne	.L40	;,
; src/create.c:113:     else if (type == WHILE_STATEMENT && while_stmt != NULL)
	cmpq	$0, -40(%rbp)	;, while_stmt
	je	.L40	;,
; src/create.c:114:         statement->stmt.while_stmt = while_stmt;
	movq	-8(%rbp), %rax	; statement, tmp95
	movq	-40(%rbp), %rdx	; while_stmt, tmp96
	movq	%rdx, (%rax)	; tmp96, statement_9->stmt.while_stmt
	jmp	.L37	;
.L40:
; src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpl	$4, -20(%rbp)	;, type
	jne	.L41	;,
; src/create.c:115:     else if (type == FOR_STATEMENT && for_stmt != NULL)
	cmpq	$0, -48(%rbp)	;, for_stmt
	je	.L41	;,
; src/create.c:116:         statement->stmt.for_stmt = for_stmt;
	movq	-8(%rbp), %rax	; statement, tmp97
	movq	-48(%rbp), %rdx	; for_stmt, tmp98
	movq	%rdx, (%rax)	; tmp98, statement_9->stmt.for_stmt
	jmp	.L37	;
.L41:
; src/create.c:117:     else if (type == RETURN_STATEMENT)
	cmpl	$5, -20(%rbp)	;, type
	jne	.L42	;,
; src/create.c:118:         statement->stmt.return_expr = expr;
	movq	-8(%rbp), %rax	; statement, tmp99
	movq	-56(%rbp), %rdx	; expr, tmp100
	movq	%rdx, (%rax)	; tmp100, statement_9->stmt.return_expr
	jmp	.L37	;
.L42:
; src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$6, -20(%rbp)	;, type
	je	.L43	;,
; src/create.c:119:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$7, -20(%rbp)	;, type
	jne	.L44	;,
.L43:
; src/create.c:120:         statement->stmt.expr = NULL;
	movq	-8(%rbp), %rax	; statement, tmp101
	movq	$0, (%rax)	;, statement_9->stmt.expr
	jmp	.L37	;
.L44:
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, -32(%rbp)	;, if_stmt
	jne	.L45	;,
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, -40(%rbp)	;, while_stmt
	jne	.L45	;,
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, -48(%rbp)	;, for_stmt
	jne	.L45	;,
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, -56(%rbp)	;, expr
	jne	.L45	;,
; src/create.c:122:         if (if_stmt == NULL && while_stmt == NULL && for_stmt == NULL && expr == NULL && var_stmt == NULL)
	cmpq	$0, -64(%rbp)	;, var_stmt
	jne	.L45	;,
; src/create.c:123:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.9_1
	movq	%rax, %rcx	; stderr.9_1,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L46	;
.L45:
; src/create.c:125:             fprintf(stderr, "Error creating statement: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.10_2
	movl	-20(%rbp), %edx	; type, tmp103
	leaq	.LC10(%rip), %rcx	;, tmp104
	movq	%rcx, %rsi	; tmp104,
	movq	%rax, %rdi	; stderr.10_2,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L46:
; src/create.c:126:         return NULL;
	movl	$0, %eax	;, _3
	jmp	.L47	;
.L37:
; src/create.c:128:     return statement;
	movq	-8(%rbp), %rax	; statement, _3
.L47:
; src/create.c:129: }
	leave	
	ret	
	.size	create_statement, .-create_statement
	.section	.rodata
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; condition, condition
	movq	%rsi, -32(%rbp)	; body, body
	movq	%rdx, -40(%rbp)	; else_if, else_if
	movq	%rcx, -48(%rbp)	; else_body, else_body
; src/create.c:132:     if (condition == NULL) {
	cmpq	$0, -24(%rbp)	;, condition
	jne	.L49	;,
; src/create.c:133:         fprintf(stderr, "Error creating if statement: condition is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.11_1
	movq	%rax, %rcx	; stderr.11_1,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:134:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L50	;
.L49:
; src/create.c:136:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, if_
; src/create.c:137:     if_->condition = condition;
	movq	-8(%rbp), %rax	; if_, tmp87
	movq	-24(%rbp), %rdx	; condition, tmp88
	movq	%rdx, (%rax)	; tmp88, if__7->condition
; src/create.c:138:     if_->body = body;
	movq	-8(%rbp), %rax	; if_, tmp89
	movq	-32(%rbp), %rdx	; body, tmp90
	movq	%rdx, 8(%rax)	; tmp90, if__7->body
; src/create.c:139:     if_->else_if = else_if;
	movq	-8(%rbp), %rax	; if_, tmp91
	movq	-40(%rbp), %rdx	; else_if, tmp92
	movq	%rdx, 16(%rax)	; tmp92, if__7->else_if
; src/create.c:140:     if_->else_body = else_body;
	movq	-8(%rbp), %rax	; if_, tmp93
	movq	-48(%rbp), %rdx	; else_body, tmp94
	movq	%rdx, 24(%rax)	; tmp94, if__7->else_body
; src/create.c:141:     return if_;
	movq	-8(%rbp), %rax	; if_, _2
.L50:
; src/create.c:142: }
	leave	
	ret	
	.size	create_if, .-create_if
	.section	.rodata
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; condition, condition
	movq	%rsi, -32(%rbp)	; body, body
; src/create.c:145:     if (condition == NULL) {
	cmpq	$0, -24(%rbp)	;, condition
	jne	.L52	;,
; src/create.c:146:         fprintf(stderr, "Error creating else-if statement: condition is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.12_1
	movq	%rax, %rcx	; stderr.12_1,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp85
	movq	%rax, %rdi	; tmp85,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:147:         return NULL;
	movl	$0, %eax	;, _2
	jmp	.L53	;
.L52:
; src/create.c:149:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, else_if
; src/create.c:150:     else_if->condition = condition;
	movq	-8(%rbp), %rax	; else_if, tmp87
	movq	-24(%rbp), %rdx	; condition, tmp88
	movq	%rdx, (%rax)	; tmp88, else_if_7->condition
; src/create.c:151:     else_if->body = body;
	movq	-8(%rbp), %rax	; else_if, tmp89
	movq	-32(%rbp), %rdx	; body, tmp90
	movq	%rdx, 8(%rax)	; tmp90, else_if_7->body
; src/create.c:152:     return else_if;
	movq	-8(%rbp), %rax	; else_if, _2
.L53:
; src/create.c:153: }
	leave	
	ret	
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; initializer, initializer
	movq	%rsi, -32(%rbp)	; condition, condition
	movq	%rdx, -40(%rbp)	; increment, increment
	movq	%rcx, -48(%rbp)	; body, body
; src/create.c:156:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, for_
; src/create.c:157:     for_->initializer = initializer;
	movq	-8(%rbp), %rax	; for_, tmp85
	movq	-24(%rbp), %rdx	; initializer, tmp86
	movq	%rdx, (%rax)	; tmp86, for__3->initializer
; src/create.c:158:     for_->condition = condition;
	movq	-8(%rbp), %rax	; for_, tmp87
	movq	-32(%rbp), %rdx	; condition, tmp88
	movq	%rdx, 8(%rax)	; tmp88, for__3->condition
; src/create.c:159:     for_->increment = increment;
	movq	-8(%rbp), %rax	; for_, tmp89
	movq	-40(%rbp), %rdx	; increment, tmp90
	movq	%rdx, 16(%rax)	; tmp90, for__3->increment
; src/create.c:160:     for_->body = body;
	movq	-8(%rbp), %rax	; for_, tmp91
	movq	-48(%rbp), %rdx	; body, tmp92
	movq	%rdx, 24(%rax)	; tmp92, for__3->body
; src/create.c:161:     return for_;
	movq	-8(%rbp), %rax	; for_, _12
; src/create.c:162: }
	leave	
	ret	
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -24(%rbp)	; condition, condition
	movq	%rsi, -32(%rbp)	; body, body
; src/create.c:165:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp84, while_
; src/create.c:166:     while_->condition = condition;
	movq	-8(%rbp), %rax	; while_, tmp85
	movq	-24(%rbp), %rdx	; condition, tmp86
	movq	%rdx, (%rax)	; tmp86, while__3->condition
; src/create.c:167:     while_->body = body;
	movq	-8(%rbp), %rax	; while_, tmp87
	movq	-32(%rbp), %rdx	; body, tmp88
	movq	%rdx, 8(%rax)	; tmp88, while__3->body
; src/create.c:168:     return while_;
	movq	-8(%rbp), %rax	; while_, _8
; src/create.c:169: }
	leave	
	ret	
	.size	create_while, .-create_while
	.section	.rodata
.LC13:
	.string	"true"
.LC14:
	.string	"false"
	.align 8
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n"
	.align 8
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movl	%edi, -20(%rbp)	; operator, operator
	movq	%rsi, -32(%rbp)	; expr_left, expr_left
	movq	%rdx, -40(%rbp)	; prim_left, prim_left
	movq	%rcx, -48(%rbp)	; right, right
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpl	$19, -20(%rbp)	;, operator
	sete	%dl	;, _1
	cmpq	$0, -48(%rbp)	;, right
	sete	%al	;, _2
	xorl	%edx, %eax	; _1, _3
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	testb	%al, %al	; _3
	jne	.L59	;,
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpq	$0, -32(%rbp)	;, expr_left
	jne	.L60	;,
; src/create.c:172:     if ((operator == OP_NONE) != (right == NULL) || (expr_left == NULL && prim_left == NULL)) {
	cmpq	$0, -40(%rbp)	;, prim_left
	jne	.L60	;,
.L59:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpq	$0, -48(%rbp)	;, right
	jne	.L61	;,
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rsi	;, iftmp.13_6
	jmp	.L62	;
.L61:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rsi	;, iftmp.13_6
.L62:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpq	$0, -40(%rbp)	;, prim_left
	jne	.L63	;,
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rcx	;, iftmp.14_7
	jmp	.L64	;
.L63:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rcx	;, iftmp.14_7
.L64:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpq	$0, -32(%rbp)	;, expr_left
	jne	.L65	;,
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rdx	;, iftmp.15_8
	jmp	.L66	;
.L65:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rdx	;, iftmp.15_8
.L66:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	cmpl	$19, -20(%rbp)	;, operator
	jne	.L67	;,
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC13(%rip), %rax	;, iftmp.16_9
	jmp	.L68	;
.L67:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	leaq	.LC14(%rip), %rax	;, iftmp.16_9
.L68:
; src/create.c:173:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == NULL: %s, prim_left == NULL: %s, right == NULL: %s\n",
	movq	stderr(%rip), %rdi	; stderr, stderr.17_4
	movq	%rsi, %r9	; iftmp.13_6,
	movq	%rcx, %r8	; iftmp.14_7,
	movq	%rdx, %rcx	; iftmp.15_8,
	movq	%rax, %rdx	; iftmp.16_9,
	leaq	.LC15(%rip), %rax	;, tmp93
	movq	%rax, %rsi	; tmp93,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/create.c:178:         return NULL;
	movl	$0, %eax	;, _10
	jmp	.L69	;
.L60:
; src/create.c:180:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp94, expression
; src/create.c:181:     expression->operator = operator;
	movq	-8(%rbp), %rax	; expression, tmp95
	movl	-20(%rbp), %edx	; operator, tmp96
	movl	%edx, 24(%rax)	; tmp96, expression_19->operator
; src/create.c:182:     if (expr_left != NULL)
	cmpq	$0, -32(%rbp)	;, expr_left
	je	.L70	;,
; src/create.c:183:         expression->expr_left = expr_left;
	movq	-8(%rbp), %rax	; expression, tmp97
	movq	-32(%rbp), %rdx	; expr_left, tmp98
	movq	%rdx, (%rax)	; tmp98, expression_19->expr_left
	jmp	.L71	;
.L70:
; src/create.c:184:     else if (prim_left != NULL)
	cmpq	$0, -40(%rbp)	;, prim_left
	je	.L72	;,
; src/create.c:185:         expression->prim_left = prim_left;
	movq	-8(%rbp), %rax	; expression, tmp99
	movq	-40(%rbp), %rdx	; prim_left, tmp100
	movq	%rdx, 8(%rax)	; tmp100, expression_19->prim_left
	jmp	.L71	;
.L72:
; src/create.c:187:         fprintf(stderr, "Error creating expression: both expr_left and prim_left are NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.18_5
	movq	%rax, %rcx	; stderr.18_5,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:188:         return NULL;
	movl	$0, %eax	;, _10
	jmp	.L69	;
.L71:
; src/create.c:190:     expression->right = right;
	movq	-8(%rbp), %rax	; expression, tmp102
	movq	-48(%rbp), %rdx	; right, tmp103
	movq	%rdx, 16(%rax)	; tmp103, expression_19->right
; src/create.c:191:     return expression;
	movq	-8(%rbp), %rax	; expression, _10
.L69:
; src/create.c:192: }
	leave	
	ret	
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; str_value, str_value
	movq	%rdx, -40(%rbp)	; expr_value, expr_value
	movq	%rcx, -48(%rbp)	; prim_value, prim_value
	movq	%r8, -56(%rbp)	; variable_value, variable_value
; src/create.c:195:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp86, primary
; src/create.c:196:     primary->type = type;
	movq	-8(%rbp), %rax	; primary, tmp87
	movl	-20(%rbp), %edx	; type, tmp88
	movl	%edx, 8(%rax)	; tmp88, primary_9->type
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$0, -20(%rbp)	;, type
	je	.L74	;,
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$1, -20(%rbp)	;, type
	je	.L74	;,
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$2, -20(%rbp)	;, type
	je	.L74	;,
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$3, -20(%rbp)	;, type
	je	.L74	;,
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpl	$4, -20(%rbp)	;, type
	jne	.L75	;,
.L74:
; src/create.c:197:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != NULL)
	cmpq	$0, -32(%rbp)	;, str_value
	je	.L75	;,
; src/create.c:198:         primary->value.literal_value = str_value;
	movq	-8(%rbp), %rax	; primary, tmp89
	movq	-32(%rbp), %rdx	; str_value, tmp90
	movq	%rdx, (%rax)	; tmp90, primary_9->value.literal_value
	jmp	.L76	;
.L75:
; src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpl	$5, -20(%rbp)	;, type
	jne	.L77	;,
; src/create.c:199:     else if (type == PRIM_EXPRESSION && expr_value != NULL)
	cmpq	$0, -40(%rbp)	;, expr_value
	je	.L77	;,
; src/create.c:200:         primary->value.expr = expr_value;
	movq	-8(%rbp), %rax	; primary, tmp91
	movq	-40(%rbp), %rdx	; expr_value, tmp92
	movq	%rdx, (%rax)	; tmp92, primary_9->value.expr
	jmp	.L76	;
.L77:
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$6, -20(%rbp)	;, type
	je	.L78	;,
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpl	$7, -20(%rbp)	;, type
	jne	.L79	;,
.L78:
; src/create.c:201:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != NULL)
	cmpq	$0, -48(%rbp)	;, prim_value
	je	.L79	;,
; src/create.c:202:         primary->value.operand = prim_value;
	movq	-8(%rbp), %rax	; primary, tmp93
	movq	-48(%rbp), %rdx	; prim_value, tmp94
	movq	%rdx, (%rax)	; tmp94, primary_9->value.operand
	jmp	.L76	;
.L79:
; src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpl	$8, -20(%rbp)	;, type
	jne	.L80	;,
; src/create.c:203:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != NULL)
	cmpq	$0, -56(%rbp)	;, variable_value
	je	.L80	;,
; src/create.c:204:         primary->value.var = variable_value;
	movq	-8(%rbp), %rax	; primary, tmp95
	movq	-56(%rbp), %rdx	; variable_value, tmp96
	movq	%rdx, (%rax)	; tmp96, primary_9->value.var
	jmp	.L76	;
.L80:
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, -32(%rbp)	;, str_value
	jne	.L81	;,
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, -40(%rbp)	;, expr_value
	jne	.L81	;,
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, -48(%rbp)	;, prim_value
	jne	.L81	;,
; src/create.c:206:         if (str_value == NULL && expr_value == NULL && prim_value == NULL && variable_value == NULL)
	cmpq	$0, -56(%rbp)	;, variable_value
	jne	.L81	;,
; src/create.c:207:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.19_1
	movq	%rax, %rcx	; stderr.19_1,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L82	;
.L81:
; src/create.c:209:             fprintf(stderr, "Error creating primary: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.20_2
	movl	-20(%rbp), %edx	; type, tmp98
	leaq	.LC18(%rip), %rcx	;, tmp99
	movq	%rcx, %rsi	; tmp99,
	movq	%rax, %rdi	; stderr.20_2,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L82:
; src/create.c:210:         return NULL;
	movl	$0, %eax	;, _3
	jmp	.L83	;
.L76:
; src/create.c:212:     return primary;
	movq	-8(%rbp), %rax	; primary, _3
.L83:
; src/create.c:213: }
	leave	
	ret	
	.size	create_primary, .-create_primary
	.section	.rodata
	.align 8
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n"
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
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movl	%edi, -20(%rbp)	; type, type
	movq	%rsi, -32(%rbp)	; base, base
	movq	%rdx, -40(%rbp)	; name_content, name_content
	movq	%rcx, -48(%rbp)	; expr_content, expr_content
	movq	%r8, -56(%rbp)	; args_content, args_content
; src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	cmpq	$0, -32(%rbp)	;, base
	sete	%dl	;, _1
	cmpl	$0, -20(%rbp)	;, type
	sete	%al	;, _2
	xorl	%edx, %eax	; _1, _3
; src/create.c:216:     if ((base == NULL) != (type == VAR_NAME)) {
	testb	%al, %al	; _3
	je	.L85	;,
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpl	$0, -20(%rbp)	;, type
	jne	.L86	;,
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rdx	;, iftmp.21_7
	jmp	.L87	;
.L86:
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rdx	;, iftmp.21_7
.L87:
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmpq	$0, -32(%rbp)	;, base
	jne	.L88	;,
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, iftmp.22_8
	jmp	.L89	;
.L88:
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC14(%rip), %rax	;, iftmp.22_8
.L89:
; src/create.c:217:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == NULL: %s, type == VAR_NAME: %s\n", base == NULL ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	stderr(%rip), %rdi	; stderr, stderr.23_4
	movq	%rdx, %rcx	; iftmp.21_7,
	movq	%rax, %rdx	; iftmp.22_8,
	leaq	.LC19(%rip), %rax	;, tmp92
	movq	%rax, %rsi	; tmp92,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/create.c:218:         return NULL;
	movl	$0, %eax	;, _9
	jmp	.L90	;
.L85:
; src/create.c:220:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp93, variable_access
; src/create.c:221:     variable_access->type = type;
	movq	-8(%rbp), %rax	; variable_access, tmp94
	movl	-20(%rbp), %edx	; type, tmp95
	movl	%edx, 16(%rax)	; tmp95, variable_access_17->type
; src/create.c:222:     variable_access->base = base;
	movq	-8(%rbp), %rax	; variable_access, tmp96
	movq	-32(%rbp), %rdx	; base, tmp97
	movq	%rdx, (%rax)	; tmp97, variable_access_17->base
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	cmpl	$0, -20(%rbp)	;, type
	jne	.L91	;,
; src/create.c:223:     if (type == VAR_NAME && name_content != NULL)
	cmpq	$0, -40(%rbp)	;, name_content
	je	.L91	;,
; src/create.c:224:         variable_access->content.name = name_content;
	movq	-8(%rbp), %rax	; variable_access, tmp98
	movq	-40(%rbp), %rdx	; name_content, tmp99
	movq	%rdx, 8(%rax)	; tmp99, variable_access_17->content.name
	jmp	.L92	;
.L91:
; src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpl	$1, -20(%rbp)	;, type
	jne	.L93	;,
; src/create.c:225:     else if (type == VAR_FUNC_CALL && args_content != NULL)
	cmpq	$0, -56(%rbp)	;, args_content
	je	.L93	;,
; src/create.c:226:         variable_access->content.args = args_content;
	movq	-8(%rbp), %rax	; variable_access, tmp100
	movq	-56(%rbp), %rdx	; args_content, tmp101
	movq	%rdx, 8(%rax)	; tmp101, variable_access_17->content.args
	jmp	.L92	;
.L93:
; src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpl	$3, -20(%rbp)	;, type
	jne	.L94	;,
; src/create.c:227:     else if (type == VAR_GET_SEQ && expr_content != NULL)
	cmpq	$0, -48(%rbp)	;, expr_content
	je	.L94	;,
; src/create.c:228:         variable_access->content.index = expr_content;
	movq	-8(%rbp), %rax	; variable_access, tmp102
	movq	-48(%rbp), %rdx	; expr_content, tmp103
	movq	%rdx, 8(%rax)	; tmp103, variable_access_17->content.index
	jmp	.L92	;
.L94:
; src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpl	$2, -20(%rbp)	;, type
	jne	.L95	;,
; src/create.c:229:     else if (type == VAR_GET_ATTR && name_content != NULL)
	cmpq	$0, -40(%rbp)	;, name_content
	je	.L95	;,
; src/create.c:230:         variable_access->content.attr_name = name_content;
	movq	-8(%rbp), %rax	; variable_access, tmp104
	movq	-40(%rbp), %rdx	; name_content, tmp105
	movq	%rdx, 8(%rax)	; tmp105, variable_access_17->content.attr_name
	jmp	.L92	;
.L95:
; src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	cmpq	$0, -40(%rbp)	;, name_content
	jne	.L96	;,
; src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	cmpq	$0, -48(%rbp)	;, expr_content
	jne	.L96	;,
; src/create.c:232:         if (name_content == NULL && expr_content == NULL && args_content == NULL)
	cmpq	$0, -56(%rbp)	;, args_content
	jne	.L96	;,
; src/create.c:233:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rax	; stderr, stderr.24_5
	movq	%rax, %rcx	; stderr.24_5,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L97	;
.L96:
; src/create.c:235:             fprintf(stderr, "Error creating variable access: unknown type %u\n", type);
	movq	stderr(%rip), %rax	; stderr, stderr.25_6
	movl	-20(%rbp), %edx	; type, tmp107
	leaq	.LC21(%rip), %rcx	;, tmp108
	movq	%rcx, %rsi	; tmp108,
	movq	%rax, %rdi	; stderr.25_6,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L97:
; src/create.c:236:         return NULL;
	movl	$0, %eax	;, _9
	jmp	.L90	;
.L92:
; src/create.c:238:     return variable_access;
	movq	-8(%rbp), %rax	; variable_access, _9
.L90:
; src/create.c:239: }
	leave	
	ret	
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

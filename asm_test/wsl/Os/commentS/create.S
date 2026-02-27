	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Error creating code member: content is NULL\n"
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
.LFB50:
	.cfi_startproc
	endbr64	
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r13	; tmp121, function_content
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12	; tmp120, import_content
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp	; tmp122, class_content
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edi, %ebx	; tmp119, type
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
; src/create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	pushq	%r8	;
	.cfi_def_cfa_offset 48
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	alloc_memory@PLT	;
; src/create.c:5:     code_member->type = type;
	movl	%ebx, 8(%rax)	; type, code_member_21->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L2	;,
	testq	%r12, %r12	; import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	%r12, (%rax)	; import_content, code_member_21->content.import
	jmp	.L1	;
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L4	;,
	testq	%r13, %r13	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r13, (%rax)	; function_content, code_member_21->content.function
	jmp	.L1	;
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L6	;,
	testq	%rbp, %rbp	; class_content
	je	.L6	;,
; src/create.c:11:         code_member->content.class_ = class_content;
	movq	%rbp, (%rax)	; class_content, code_member_21->content.class_
	jmp	.L1	;
.L6:
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	orq	%r13, %rbp	; function_content, tmp114
; src/create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_16
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	orq	%rbp, %r12	; tmp114, tmp124
	jne	.L7	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_16,
	leaq	.LC0(%rip), %rdi	;, tmp116
	call	fputs@PLT	;
	jmp	.L8	;
.L7:
	movl	%ebx, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
.L8:
; src/create.c:17:         return 0;
	xorl	%eax, %eax	; <retval>
.L1:
; src/create.c:20: }
	popq	%rdx	;
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE50:
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
.LFB51:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp	; tmp86, members
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
; src/create.c:22: Code* create_code(list(CodeMember*) members, Scope* global_scope) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx	; tmp87, global_scope
	pushq	%rax	;
	.cfi_def_cfa_offset 32
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	call	alloc_memory@PLT	;
; src/create.c:25:     code_ptr->members = members;
	movq	%rbp, (%rax)	; members, code_3->members
; src/create.c:26:     code_ptr->global_scope = global_scope;
	movq	%rbx, 8(%rax)	; global_scope, code_3->global_scope
; src/create.c:28: }
	popq	%rdx	;
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE51:
	.size	create_code, .-create_code
	.section	.rodata.str1.1
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.globl	create_import
	.type	create_import, @function
create_import:
.LFB52:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rcx	;
	.cfi_def_cfa_offset 32
; src/create.c:31:     if (name == 0) {
	testq	%rdi, %rdi	; name
	jne	.L32	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	fputs@PLT	;
; src/create.c:33:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L31	;
.L32:
	movq	%rdi, %rbx	; tmp89, name
; src/create.c:35:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	movq	%rsi, %rbp	; tmp90, source
	call	alloc_memory@PLT	;
; src/create.c:37:     import_ptr->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:38:     import_ptr->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L31:
; src/create.c:40: }
	popq	%rdx	;
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE52:
	.size	create_import, .-create_import
	.section	.rodata.str1.1
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.globl	create_function
	.type	create_function, @function
create_function:
.LFB53:
	.cfi_startproc
	endbr64	
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/create.c:43:     if (name == 0 || return_type == 0) {
	testq	%rdi, %rdi	; name
	je	.L39	;,
	movq	%rsi, %rbx	; tmp100, return_type
	testq	%rsi, %rsi	; return_type
	jne	.L36	;,
.L39:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC3(%rip), %rdi	;, tmp97
	call	fputs@PLT	;
; src/create.c:45:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L35	;
.L36:
	movq	%rdi, %rbp	; tmp99, name
; src/create.c:47:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, function_scope
	call	alloc_memory@PLT	;
; src/create.c:49:     function_ptr->name = name;
	movq	%rbp, (%rax)	; name, function_11->name
; src/create.c:50:     function_ptr->return_type = return_type;
	movq	%rbx, 8(%rax)	; return_type, function_11->return_type
; src/create.c:51:     function_ptr->parameters = parameters;
	movq	%r14, 16(%rax)	; parameters, function_11->parameters
; src/create.c:52:     function_ptr->body = body;
	movq	%r13, 24(%rax)	; body, function_11->body
; src/create.c:53:     function_ptr->function_scope = function_scope;
	movq	%r12, 32(%rax)	; function_scope, function_11->function_scope
.L35:
; src/create.c:55: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE53:
	.size	create_function, .-create_function
	.section	.rodata.str1.1
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.globl	create_method
	.type	create_method, @function
create_method:
.LFB54:
	.cfi_startproc
	endbr64	
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/create.c:58:     if (name == 0 || return_type == 0) {
	testq	%rdi, %rdi	; name
	je	.L45	;,
	movq	%rsi, %rbx	; tmp100, return_type
	testq	%rsi, %rsi	; return_type
	jne	.L42	;,
.L45:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC4(%rip), %rdi	;, tmp97
	call	fputs@PLT	;
; src/create.c:60:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L41	;
.L42:
	movq	%rdi, %rbp	; tmp99, name
; src/create.c:62:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, method_scope
	call	alloc_memory@PLT	;
; src/create.c:64:     method_ptr->name = name;
	movq	%rbp, (%rax)	; name, method_11->name
; src/create.c:65:     method_ptr->return_type = return_type;
	movq	%rbx, 8(%rax)	; return_type, method_11->return_type
; src/create.c:66:     method_ptr->parameters = parameters;
	movq	%r14, 16(%rax)	; parameters, method_11->parameters
; src/create.c:67:     method_ptr->body = body;
	movq	%r13, 24(%rax)	; body, method_11->body
; src/create.c:68:     method_ptr->method_scope = method_scope;
	movq	%r12, 32(%rax)	; method_scope, method_11->method_scope
.L41:
; src/create.c:70: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE54:
	.size	create_method, .-create_method
	.section	.rodata.str1.1
.LC5:
	.string	"Error creating class member: content is NULL\n"
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
.LFB55:
	.cfi_startproc
	endbr64	
	pushq	%r12	;
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdx, %r12	; tmp110, variable_content
	pushq	%rbp	;
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp	; tmp109, method_content
	pushq	%rbx	;
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
; src/create.c:72: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	movl	%edi, %ebx	; tmp108, type
; src/create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
; src/create.c:75:     class_member_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, class_member_18->type
; src/create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L48	;,
	testq	%rbp, %rbp	; method_content
	je	.L48	;,
; src/create.c:77:         class_member_ptr->content.method = method_content;
	movq	%rbp, (%rax)	; method_content, class_member_18->content.method
	jmp	.L47	;
.L48:
; src/create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L50	;,
	testq	%r12, %r12	; variable_content
	je	.L50	;,
; src/create.c:79:         class_member_ptr->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_18->content.variable
	jmp	.L47	;
.L50:
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	orq	%r12, %rbp	; variable_content, tmp112
; src/create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_9
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	jne	.L52	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_9,
	leaq	.LC5(%rip), %rdi	;, tmp105
	call	fputs@PLT	;
	jmp	.L53	;
.L52:
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp106
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
.L53:
; src/create.c:85:         return 0;
	xorl	%eax, %eax	; <retval>
.L47:
; src/create.c:88: }
	popq	%rbx	;
	.cfi_def_cfa_offset 24
	popq	%rbp	;
	.cfi_def_cfa_offset 16
	popq	%r12	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE55:
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.1
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class
	.type	create_class, @function
create_class:
.LFB56:
	.cfi_startproc
	endbr64	
	pushq	%r12	;
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	;
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	;
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
; src/create.c:91:     if (name == 0) {
	testq	%rdi, %rdi	; name
	jne	.L68	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC7(%rip), %rdi	;, tmp88
	call	fputs@PLT	;
; src/create.c:93:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L67	;
.L68:
	movq	%rdi, %rbx	; tmp90, name
; src/create.c:95:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$24, %edi	;,
	movq	%rsi, %r12	; tmp91, members
	movq	%rdx, %rbp	; tmp92, class_scope
	call	alloc_memory@PLT	;
; src/create.c:97:     class_ptr->name = name;
	movq	%rbx, (%rax)	; name, class_7->name
; src/create.c:98:     class_ptr->members = members;
	movq	%r12, 8(%rax)	; members, class_7->members
; src/create.c:99:     class_ptr->class_scope = class_scope;
	movq	%rbp, 16(%rax)	; class_scope, class_7->class_scope
.L67:
; src/create.c:101: }
	popq	%rbx	;
	.cfi_def_cfa_offset 24
	popq	%rbp	;
	.cfi_def_cfa_offset 16
	popq	%r12	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE56:
	.size	create_class, .-create_class
	.section	.rodata.str1.1
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
.LFB57:
	.cfi_startproc
	endbr64	
	pushq	%r12	;
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	;
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	;
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
; src/create.c:104:     if (type == 0 || name == 0) {
	testq	%rdi, %rdi	; type
	je	.L75	;,
	movq	%rsi, %rbx	; tmp98, name
	testq	%rsi, %rsi	; name
	jne	.L72	;,
.L75:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	fputs@PLT	;
; src/create.c:106:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L71	;
.L72:
	movq	%rdi, %rbp	; tmp97, type
; src/create.c:108:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	movq	%rdx, %r12	; tmp99, value
	call	alloc_memory@PLT	;
; src/create.c:110:     variable_ptr->type = type;
	movq	%rbp, (%rax)	; type, variable_11->type
; src/create.c:111:     variable_ptr->name = name;
	movq	%rbx, 8(%rax)	; name, variable_11->name
; src/create.c:112:     variable_ptr->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
.L71:
; src/create.c:114: }
	popq	%rbx	;
	.cfi_def_cfa_offset 24
	popq	%rbp	;
	.cfi_def_cfa_offset 16
	popq	%r12	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE57:
	.size	create_variable, .-create_variable
	.section	.rodata.str1.1
.LC9:
	.string	"Error creating statement: content is NULL\n"
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.globl	create_statement
	.type	create_statement, @function
create_statement:
.LFB58:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15	; tmp148, while_stmt
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %r14	; tmp150, expr
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rcx, %r13	; tmp149, for_stmt
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	; tmp147, if_stmt
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%r9, %rbp	; tmp151, var_stmt
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx	; tmp146, type
; src/create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
; src/create.c:116: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	pushq	%r10	;
	.cfi_def_cfa_offset 64
; src/create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	alloc_memory@PLT	;
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testq	%r14, %r14	; expr
; src/create.c:119:     statement_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, statement_33->type
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	setne	%dl	;, tmp117
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testl	%ebx, %ebx	; type
	jne	.L78	;,
	testb	%dl, %dl	; tmp117
	jne	.L126	;,
.L78:
; src/create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpl	$1, %ebx	;, type
	jne	.L80	;,
	testq	%rbp, %rbp	; var_stmt
	je	.L80	;,
; src/create.c:123:         statement_ptr->stmt.var = var_stmt;
	movq	%rbp, (%rax)	; var_stmt, statement_33->stmt.var
	jmp	.L77	;
.L80:
; src/create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpl	$2, %ebx	;, type
	jne	.L82	;,
	testq	%r12, %r12	; if_stmt
	je	.L82	;,
; src/create.c:125:         statement_ptr->stmt.if_stmt = if_stmt;
	movq	%r12, (%rax)	; if_stmt, statement_33->stmt.if_stmt
	jmp	.L77	;
.L82:
; src/create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpl	$3, %ebx	;, type
	jne	.L83	;,
	testq	%r15, %r15	; while_stmt
	je	.L83	;,
; src/create.c:127:         statement_ptr->stmt.while_stmt = while_stmt;
	movq	%r15, (%rax)	; while_stmt, statement_33->stmt.while_stmt
	jmp	.L77	;
.L83:
; src/create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpl	$4, %ebx	;, type
	jne	.L84	;,
	testq	%r13, %r13	; for_stmt
	je	.L84	;,
; src/create.c:129:         statement_ptr->stmt.for_stmt = for_stmt;
	movq	%r13, (%rax)	; for_stmt, statement_33->stmt.for_stmt
	jmp	.L77	;
.L84:
; src/create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpl	$5, %ebx	;, type
	jne	.L85	;,
	testb	%dl, %dl	; tmp117
	je	.L85	;,
.L126:
; src/create.c:131:         statement_ptr->stmt.return_expr = expr;
	movq	%r14, (%rax)	; expr,* <retval>
	jmp	.L77	;
.L85:
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	;, tmp138
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp138
	ja	.L86	;,
; src/create.c:133:         statement_ptr->stmt.expr = 0;
	xorl	%ecx, %ecx	;
	movq	%rcx, (%rax)	;, statement_33->stmt.expr
	jmp	.L77	;
.L86:
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	orq	%r15, %r13	; while_stmt, tmp139
; src/create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_63
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	orq	%r13, %r12	; tmp139, tmp140
	orq	%r12, %rbp	; tmp140, tmp141
	orq	%r14, %rbp	; expr, tmp153
	jne	.L87	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_63,
	leaq	.LC9(%rip), %rdi	;, tmp143
	call	fputs@PLT	;
	jmp	.L88	;
.L87:
	movl	%ebx, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp144
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
.L88:
; src/create.c:139:         return 0;
	xorl	%eax, %eax	; <retval>
.L77:
; src/create.c:142: }
	popq	%rdx	;
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE58:
	.size	create_statement, .-create_statement
	.section	.rodata.str1.1
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
.LFB59:
	.cfi_startproc
	endbr64	
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	pushq	%r8	;
	.cfi_def_cfa_offset 48
; src/create.c:145:     if (condition == 0) {
	testq	%rdi, %rdi	; condition
	jne	.L128	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	fputs@PLT	;
; src/create.c:147:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L127	;
.L128:
	movq	%rdi, %rbx	; tmp91, condition
; src/create.c:149:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	movq	%rsi, %r13	; tmp92, body
	movq	%rdx, %r12	; tmp93, else_if
	movq	%rcx, %rbp	; tmp94, else_body
	call	alloc_memory@PLT	;
; src/create.c:151:     if_ptr->condition = condition;
	movq	%rbx, (%rax)	; condition, if__7->condition
; src/create.c:152:     if_ptr->body = body;
	movq	%r13, 8(%rax)	; body, if__7->body
; src/create.c:153:     if_ptr->else_if = else_if;
	movq	%r12, 16(%rax)	; else_if, if__7->else_if
; src/create.c:154:     if_ptr->else_body = else_body;
	movq	%rbp, 24(%rax)	; else_body, if__7->else_body
.L127:
; src/create.c:156: }
	popq	%rdx	;
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE59:
	.size	create_if, .-create_if
	.section	.rodata.str1.1
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
.LFB60:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	pushq	%rcx	;
	.cfi_def_cfa_offset 32
; src/create.c:159:     if (condition == 0) {
	testq	%rdi, %rdi	; condition
	jne	.L132	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	fputs@PLT	;
; src/create.c:161:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L131	;
.L132:
	movq	%rdi, %rbx	; tmp89, condition
; src/create.c:163:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	movq	%rsi, %rbp	; tmp90, body
	call	alloc_memory@PLT	;
; src/create.c:165:     else_if_ptr->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:166:     else_if_ptr->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L131:
; src/create.c:168: }
	popq	%rdx	;
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE60:
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
.LFB61:
	.cfi_startproc
	endbr64	
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdi, %r13	; tmp88, initializer
; src/create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
; src/create.c:170: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12	; tmp89, condition
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdx, %rbp	; tmp90, increment
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rcx, %rbx	; tmp91, body
	pushq	%rax	;
	.cfi_def_cfa_offset 48
; src/create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	call	alloc_memory@PLT	;
; src/create.c:173:     for_ptr->initializer = initializer;
	movq	%r13, (%rax)	; initializer, for__3->initializer
; src/create.c:174:     for_ptr->condition = condition;
	movq	%r12, 8(%rax)	; condition, for__3->condition
; src/create.c:175:     for_ptr->increment = increment;
	movq	%rbp, 16(%rax)	; increment, for__3->increment
; src/create.c:176:     for_ptr->body = body;
	movq	%rbx, 24(%rax)	; body, for__3->body
; src/create.c:178: }
	popq	%rdx	;
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE61:
	.size	create_for, .-create_for
	.globl	create_while
	.type	create_while, @function
create_while:
.LFB62:
	.cfi_startproc
	endbr64	
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp	; tmp86, condition
; src/create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
; src/create.c:180: While* create_while(Expression* condition, list(Statement*) body) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbx	; tmp87, body
	pushq	%rax	;
	.cfi_def_cfa_offset 32
; src/create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	call	alloc_memory@PLT	;
; src/create.c:183:     while_ptr->condition = condition;
	movq	%rbp, (%rax)	; condition, while__3->condition
; src/create.c:184:     while_ptr->body = body;
	movq	%rbx, 8(%rax)	; body, while__3->body
; src/create.c:186: }
	popq	%rdx	;
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE62:
	.size	create_while, .-create_while
	.section	.rodata.str1.1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n"
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.globl	create_expression
	.type	create_expression, @function
create_expression:
.LFB63:
	.cfi_startproc
	endbr64	
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpl	$19, %edi	;, operator
; src/create.c:188: Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movl	%edi, %r13d	; tmp133, operator
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdx, %r12	; tmp135, prim_left
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:188: Expression* create_expression(OperatorType operator, Expression* expr_left, Primary* prim_left, Expression* right) {
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rcx, %rbp	; tmp136, right
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbx	; tmp134, expr_left
	pushq	%r9	;
	.cfi_def_cfa_offset 48
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L140	;,
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	movq	%r12, %rax	; prim_left, tmp138
	orq	%rsi, %rax	; expr_left, tmp138
	jne	.L157	;,
	jmp	.L159	;
.L140:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %r9	;, tmp114
	leaq	.LC13(%rip), %rdx	;, tmp113
	testq	%rcx, %rcx	; right
	movq	%r9, %rax	; tmp114, iftmp.13_9
	cmove	%rdx, %rax	; tmp113,, iftmp.13_9
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%r12, %r12	; prim_left
	cmove	%rdx, %r9	; tmp114,, tmp113, iftmp.14_4
.L144:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rbx, %rbx	; expr_left
	leaq	.LC14(%rip), %r8	;, tmp119
	leaq	.LC13(%rip), %rdx	;, tmp120
	cmove	%rdx, %r8	; tmp119,, tmp120, iftmp.15_11
	jmp	.L145	;
.L159:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rax	;, iftmp.13_9
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.14_4
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rcx, %rcx	; right
	jne	.L144	;,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rax	;, iftmp.13_9
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rax, %r9	; iftmp.13_9, iftmp.14_4
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rax, %r8	; iftmp.13_9, iftmp.15_11
.L145:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpl	$19, %r13d	;, operator
	leaq	.LC13(%rip), %rdx	;, tmp126
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rsi	;
	.cfi_def_cfa_offset 56
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rcx	;, tmp125
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	pushq	%rax	; iftmp.13_9
	.cfi_def_cfa_offset 64
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmove	%rdx, %rcx	; tmp125,, tmp126, iftmp.16_12
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	stderr(%rip), %rdi	; stderr,
	leaq	.LC15(%rip), %rdx	;, tmp104
	call	__fprintf_chk@PLT	;
; src/create.c:195:         return 0;
	popq	%rdi	;
	.cfi_def_cfa_offset 56
	popq	%r8	;
	.cfi_def_cfa_offset 48
	jmp	.L147	;
.L157:
; src/create.c:197:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	alloc_memory@PLT	;
; src/create.c:199:     expression_ptr->operator = operator;
	movl	%r13d, 24(%rax)	; operator, expression_22->operator
; src/create.c:200:     if (expr_left != 0)
	testq	%rbx, %rbx	; expr_left
	je	.L148	;,
; src/create.c:201:         expression_ptr->expr_left = expr_left;
	movq	%rbx, (%rax)	; expr_left, expression_22->expr_left
	jmp	.L149	;
.L148:
; src/create.c:202:     else if (prim_left != 0)
	testq	%r12, %r12	; prim_left
	je	.L150	;,
; src/create.c:203:         expression_ptr->prim_left = prim_left;
	movq	%r12, 8(%rax)	; prim_left, expression_22->prim_left
	jmp	.L149	;
.L150:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	fputs@PLT	;
.L147:
; src/create.c:195:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L139	;
.L149:
; src/create.c:208:     expression_ptr->right = right;
	movq	%rbp, 16(%rax)	; right, expression_22->right
.L139:
; src/create.c:210: }
	popq	%rdx	;
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE63:
	.size	create_expression, .-create_expression
	.section	.rodata.str1.1
.LC17:
	.string	"Error creating primary: value is NULL\n"
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.globl	create_primary
	.type	create_primary, @function
create_primary:
.LFB64:
	.cfi_startproc
	endbr64	
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rcx, %r14	; tmp135, prim_value
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13	; tmp133, str_value
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%r8, %r12	; tmp136, variable_value
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdx, %rbp	; tmp134, expr_value
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/create.c:212: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movl	%edi, %ebx	; tmp132, type
; src/create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	alloc_memory@PLT	;
; src/create.c:215:     primary_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, primary_25->type
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$4, %ebx	;, type
	ja	.L161	;,
	testq	%r13, %r13	; str_value
	je	.L161	;,
; src/create.c:217:         primary_ptr->value.literal_value = str_value;
	movq	%r13, (%rax)	; str_value, primary_25->value.literal_value
	jmp	.L160	;
.L161:
; src/create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpl	$5, %ebx	;, type
	jne	.L163	;,
	testq	%rbp, %rbp	; expr_value
	je	.L163	;,
; src/create.c:219:         primary_ptr->value.expr = expr_value;
	movq	%rbp, (%rax)	; expr_value, primary_25->value.expr
	jmp	.L160	;
.L163:
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	leal	-6(%rbx), %edx	;, tmp117
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$1, %edx	;, tmp117
	ja	.L165	;,
	testq	%r14, %r14	; prim_value
	je	.L165	;,
; src/create.c:221:         primary_ptr->value.operand = prim_value;
	movq	%r14, (%rax)	; prim_value, primary_25->value.operand
	jmp	.L160	;
.L165:
; src/create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpl	$8, %ebx	;, type
	jne	.L166	;,
	testq	%r12, %r12	; variable_value
	je	.L166	;,
; src/create.c:223:         primary_ptr->value.var = variable_value;
	movq	%r12, (%rax)	; variable_value, primary_25->value.var
	jmp	.L160	;
.L166:
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	orq	%r14, %r12	; prim_value, tmp126
; src/create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_49
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	orq	%r12, %rbp	; tmp126, tmp127
	orq	%r13, %rbp	; str_value, tmp138
	jne	.L167	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_49,
	leaq	.LC17(%rip), %rdi	;, tmp129
	call	fputs@PLT	;
	jmp	.L168	;
.L167:
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp130
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
.L168:
; src/create.c:229:         return 0;
	xorl	%eax, %eax	; <retval>
.L160:
; src/create.c:232: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE64:
	.size	create_primary, .-create_primary
	.section	.rodata.str1.1
.LC19:
	.string	"Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n"
.LC20:
	.string	"Error creating variable access: content is NULL\n"
.LC21:
	.string	"Error creating variable access: unknown type %u\n"
	.text
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
.LFB65:
	.cfi_startproc
	endbr64	
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
; src/create.c:234: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	sete	%al	;, tmp109
	testq	%rsi, %rsi	; base
; src/create.c:234: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14	; tmp143, base
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	sete	%r15b	;, tmp111
; src/create.c:234: VariableAccess* create_variable_access(VariableAccessType type, VariableAccess* base, Name* name_content, Expression* expr_content, list(Expression*) args_content) {
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebx	; tmp142, type
	pushq	%r9	;
	.cfi_def_cfa_offset 64
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	cmpb	%al, %r15b	; tmp109, tmp111
	je	.L195	;,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, tmp135
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %rcx	;, tmp134
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %r8	; tmp135, iftmp.21_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp113
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmovne	%rcx, %r8	; tmp134,, iftmp.21_20
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmove	%rax, %rcx	; tmp134,, tmp135, iftmp.22_21
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/create.c:237:         return 0;
	jmp	.L198	;
.L195:
	movq	%rdx, %r12	; tmp144, name_content
; src/create.c:239:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	movq	%rcx, %rbp	; tmp145, expr_content
	movq	%r8, %r13	; tmp146, args_content
	call	alloc_memory@PLT	;
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	testq	%r12, %r12	; name_content
; src/create.c:241:     variable_access_ptr->type = type;
	movl	%ebx, 16(%rax)	; type, variable_access_30->type
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	setne	%dl	;, tmp114
; src/create.c:242:     variable_access_ptr->base = base;
	movq	%r14, (%rax)	; base, variable_access_30->base
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	testb	%r15b, %r15b	; tmp111
	je	.L199	;,
	testb	%dl, %dl	; tmp114
	jne	.L233	;,
.L199:
; src/create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpl	$1, %ebx	;, type
	jne	.L201	;,
	testq	%r13, %r13	; args_content
	je	.L201	;,
; src/create.c:246:         variable_access_ptr->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_30->content.args
	jmp	.L194	;
.L201:
; src/create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpl	$3, %ebx	;, type
	jne	.L203	;,
	testq	%rbp, %rbp	; expr_content
	je	.L203	;,
; src/create.c:248:         variable_access_ptr->content.index = expr_content;
	movq	%rbp, 8(%rax)	; expr_content, variable_access_30->content.index
	jmp	.L194	;
.L203:
; src/create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpl	$2, %ebx	;, type
	jne	.L204	;,
	testb	%dl, %dl	; tmp114
	je	.L204	;,
.L233:
; src/create.c:250:         variable_access_ptr->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content,
	jmp	.L194	;
.L204:
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	orq	%r13, %rbp	; args_content, tmp125
; src/create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_23
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	orq	%r12, %rbp	; name_content, tmp148
	jne	.L205	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rsi	; pretmp_23,
	leaq	.LC20(%rip), %rdi	;, tmp127
	call	fputs@PLT	;
	jmp	.L198	;
.L205:
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp128
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
.L198:
; src/create.c:237:         return 0;
	xorl	%eax, %eax	; <retval>
.L194:
; src/create.c:259: }
	popq	%rdx	;
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE65:
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

	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Error creating code member: content is NULL\n"
	.align 8
.LC1:
	.string	"Error creating code member: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_code_member
	.type	create_code_member, @function
create_code_member:
	pushq	%r13	;
	movq	%rcx, %r13	; tmp122, class_content
	pushq	%r12	;
	movq	%rdx, %r12	; tmp121, function_content
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp120, import_content
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp119, type
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
; src/create.c:3: CodeMember* create_code_member(CodeMemberType type, Import* import_content, Function* function_content, Class* class_content) {
	subq	$8, %rsp	;,
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:5:     code_member->type = type;
	movl	%ebx, 8(%rax)	; type, code_member_21->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L2	;,
	testq	%rbp, %rbp	; import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	%rbp, (%rax)	; import_content, code_member_21->content.import
.L1:
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L4	;,
	testq	%r12, %r12	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r12, (%rax)	; function_content, code_member_21->content.function
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L6	;,
	testq	%r13, %r13	; class_content
	je	.L6	;,
; src/create.c:11:         code_member->content.class_ = class_content;
	movq	%r13, (%rax)	; class_content, code_member_21->content.class_
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	movq	%r13, %rcx	; class_content, class_content
; src/create.c:14:             fprintf(stderr, "Error creating code member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_16
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	orq	%r12, %rcx	; function_content, class_content
	orq	%rcx, %rbp	; tmp114, tmp124
	je	.L29	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp117
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:17:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L1	;
.L29:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_16,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp116
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:17:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L1	;
	.size	create_code_member, .-create_code_member
	.p2align 4
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, members
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
; src/create.c:22: Code* create_code(list(CodeMember*) members, Scope* global_scope) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, global_scope
	subq	$8, %rsp	;,
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:25:     code_ptr->members = members;
	movq	%rbp, (%rax)	; members, code_3->members
; src/create.c:26:     code_ptr->global_scope = global_scope;
	movq	%rbx, 8(%rax)	; global_scope, code_3->global_scope
; src/create.c:28: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_code, .-create_code
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Error creating import: name is NULL\n"
	.text
	.p2align 4
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:31:     if (name == 0) {
	testq	%rdi, %rdi	; name
	je	.L36	;,
	movq	%rdi, %rbx	; tmp89, name
	movq	%rsi, %rbp	; tmp90, source
; src/create.c:35:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:37:     import_ptr->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:38:     import_ptr->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L32:
; src/create.c:40: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L36:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:33:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L32	;
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_function
	.type	create_function, @function
create_function:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:43:     if (name == 0 || return_type == 0) {
	testq	%rdi, %rdi	; name
	je	.L41	;,
	movq	%rsi, %rbp	; tmp100, return_type
	testq	%rsi, %rsi	; return_type
	je	.L41	;,
	movq	%rdi, %rbx	; tmp99, name
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, function_scope
; src/create.c:47:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:49:     function_ptr->name = name;
	movq	%rbx, (%rax)	; name, function_11->name
; src/create.c:50:     function_ptr->return_type = return_type;
	movq	%rbp, 8(%rax)	; return_type, function_11->return_type
; src/create.c:51:     function_ptr->parameters = parameters;
	movq	%r14, 16(%rax)	; parameters, function_11->parameters
; src/create.c:52:     function_ptr->body = body;
	movq	%r13, 24(%rax)	; body, function_11->body
; src/create.c:53:     function_ptr->function_scope = function_scope;
	movq	%r12, 32(%rax)	; function_scope, function_11->function_scope
; src/create.c:55: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L41:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:55: }
	popq	%rbx	;
; src/create.c:45:         return 0;
	xorl	%eax, %eax	; <retval>
; src/create.c:55: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	create_function, .-create_function
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
	.p2align 4
	.globl	create_method
	.type	create_method, @function
create_method:
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:58:     if (name == 0 || return_type == 0) {
	testq	%rdi, %rdi	; name
	je	.L47	;,
	movq	%rsi, %rbp	; tmp100, return_type
	testq	%rsi, %rsi	; return_type
	je	.L47	;,
	movq	%rdi, %rbx	; tmp99, name
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, method_scope
; src/create.c:62:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:64:     method_ptr->name = name;
	movq	%rbx, (%rax)	; name, method_11->name
; src/create.c:65:     method_ptr->return_type = return_type;
	movq	%rbp, 8(%rax)	; return_type, method_11->return_type
; src/create.c:66:     method_ptr->parameters = parameters;
	movq	%r14, 16(%rax)	; parameters, method_11->parameters
; src/create.c:67:     method_ptr->body = body;
	movq	%r13, 24(%rax)	; body, method_11->body
; src/create.c:68:     method_ptr->method_scope = method_scope;
	movq	%r12, 32(%rax)	; method_scope, method_11->method_scope
; src/create.c:70: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L47:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$51, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:70: }
	popq	%rbx	;
; src/create.c:60:         return 0;
	xorl	%eax, %eax	; <retval>
; src/create.c:70: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	create_method, .-create_method
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Error creating class member: content is NULL\n"
	.align 8
.LC6:
	.string	"Error creating class member: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_class_member
	.type	create_class_member, @function
create_class_member:
	pushq	%r12	;
	movq	%rdx, %r12	; tmp110, variable_content
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp109, method_content
	pushq	%rbx	;
; src/create.c:72: ClassMember* create_class_member(ClassMemberType type, Method* method_content, Variable* variable_content) {
	movl	%edi, %ebx	; tmp108, type
; src/create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:75:     class_member_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, class_member_18->type
; src/create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L50	;,
	testq	%rbp, %rbp	; method_content
	je	.L50	;,
; src/create.c:77:         class_member_ptr->content.method = method_content;
	movq	%rbp, (%rax)	; method_content, class_member_18->content.method
.L49:
; src/create.c:88: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L50:
; src/create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L52	;,
	testq	%r12, %r12	; variable_content
	je	.L52	;,
; src/create.c:79:         class_member_ptr->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_18->content.variable
; src/create.c:88: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L52:
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	orq	%r12, %rbp	; variable_content, tmp112
; src/create.c:82:             fprintf(stderr, "Error creating class member: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_9
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	jne	.L54	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_9,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp105
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:85:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L49	;
	.p2align 4,,10
	.p2align 3
.L54:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp106
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:85:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L49	;
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.p2align 4
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:91:     if (name == 0) {
	testq	%rdi, %rdi	; name
	je	.L73	;,
	movq	%rdi, %rbx	; tmp90, name
	movq	%rsi, %r12	; tmp91, members
	movq	%rdx, %rbp	; tmp92, class_scope
; src/create.c:95:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:97:     class_ptr->name = name;
	movq	%rbx, (%rax)	; name, class_7->name
; src/create.c:98:     class_ptr->members = members;
	movq	%r12, 8(%rax)	; members, class_7->members
; src/create.c:99:     class_ptr->class_scope = class_scope;
	movq	%rbp, 16(%rax)	; class_scope, class_7->class_scope
.L69:
; src/create.c:101: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L73:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp88
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:93:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L69	;
	.size	create_class, .-create_class
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.p2align 4
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:104:     if (type == 0 || name == 0) {
	testq	%rdi, %rdi	; type
	je	.L78	;,
	movq	%rsi, %rbp	; tmp98, name
	testq	%rsi, %rsi	; name
	je	.L78	;,
	movq	%rdi, %rbx	; tmp97, type
	movq	%rdx, %r12	; tmp99, value
; src/create.c:108:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:110:     variable_ptr->type = type;
	movq	%rbx, (%rax)	; type, variable_11->type
; src/create.c:111:     variable_ptr->name = name;
	movq	%rbp, 8(%rax)	; name, variable_11->name
; src/create.c:112:     variable_ptr->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
; src/create.c:114: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.p2align 4,,10
	.p2align 3
.L78:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:114: }
	popq	%rbx	;
; src/create.c:106:         return 0;
	xorl	%eax, %eax	; <retval>
; src/create.c:114: }
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Error creating statement: content is NULL\n"
	.align 8
.LC10:
	.string	"Error creating statement: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_statement
	.type	create_statement, @function
create_statement:
	pushq	%r15	;
	movq	%r8, %r15	; tmp150, expr
	pushq	%r14	;
	movl	%edi, %r14d	; tmp146, type
; src/create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
; src/create.c:116: Statement* create_statement(StatementType type, If* if_stmt, While* while_stmt, For* for_stmt, Expression* expr, Variable* var_stmt) {
	pushq	%r13	;
	movq	%rcx, %r13	; tmp149, for_stmt
	pushq	%r12	;
	movq	%rdx, %r12	; tmp148, while_stmt
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp147, if_stmt
	pushq	%rbx	;
	movq	%r9, %rbx	; tmp151, var_stmt
	subq	$8, %rsp	;,
; src/create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testq	%r15, %r15	; expr
; src/create.c:119:     statement_ptr->type = type;
	movl	%r14d, 8(%rax)	; type, statement_33->type
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	setne	%dl	;, tmp117
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testl	%r14d, %r14d	; type
	jne	.L81	;,
	testb	%dl, %dl	; tmp117
	je	.L81	;,
.L129:
; src/create.c:131:         statement_ptr->stmt.return_expr = expr;
	movq	%r15, (%rax)	; expr,* <retval>
.L80:
; src/create.c:142: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L81:
; src/create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpl	$1, %r14d	;, type
	jne	.L83	;,
	testq	%rbx, %rbx	; var_stmt
	je	.L83	;,
; src/create.c:123:         statement_ptr->stmt.var = var_stmt;
	movq	%rbx, (%rax)	; var_stmt, statement_33->stmt.var
; src/create.c:142: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L83:
; src/create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpl	$2, %r14d	;, type
	jne	.L85	;,
	testq	%rbp, %rbp	; if_stmt
	je	.L85	;,
; src/create.c:125:         statement_ptr->stmt.if_stmt = if_stmt;
	movq	%rbp, (%rax)	; if_stmt, statement_33->stmt.if_stmt
; src/create.c:142: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L85:
; src/create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpl	$3, %r14d	;, type
	jne	.L86	;,
	testq	%r12, %r12	; while_stmt
	je	.L86	;,
; src/create.c:127:         statement_ptr->stmt.while_stmt = while_stmt;
	movq	%r12, (%rax)	; while_stmt, statement_33->stmt.while_stmt
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L86:
; src/create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpl	$4, %r14d	;, type
	jne	.L87	;,
	testq	%r13, %r13	; for_stmt
	je	.L87	;,
; src/create.c:129:         statement_ptr->stmt.for_stmt = for_stmt;
	movq	%r13, (%rax)	; for_stmt, statement_33->stmt.for_stmt
	jmp	.L80	;
	.p2align 4,,10
	.p2align 3
.L87:
; src/create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpl	$5, %r14d	;, type
	jne	.L88	;,
	testb	%dl, %dl	; tmp117
	jne	.L129	;,
.L88:
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%r14), %edx	;, tmp138
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp138
	ja	.L89	;,
; src/create.c:133:         statement_ptr->stmt.expr = 0;
	movq	$0, (%rax)	;, statement_33->stmt.expr
	jmp	.L80	;
.L89:
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	orq	%r12, %r13	; while_stmt, tmp139
; src/create.c:136:             fprintf(stderr, "Error creating statement: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_63
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	orq	%r13, %rbp	; tmp139, tmp140
	orq	%rbp, %rbx	; tmp140, tmp141
	orq	%r15, %rbx	; expr, tmp153
	je	.L130	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%r14d, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp144
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:139:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L80	;
.L130:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_63,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp143
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:139:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L80	;
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:145:     if (condition == 0) {
	testq	%rdi, %rdi	; condition
	je	.L135	;,
	movq	%rdi, %rbx	; tmp91, condition
	movq	%rsi, %r13	; tmp92, body
	movq	%rdx, %r12	; tmp93, else_if
	movq	%rcx, %rbp	; tmp94, else_body
; src/create.c:149:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:151:     if_ptr->condition = condition;
	movq	%rbx, (%rax)	; condition, if__7->condition
; src/create.c:152:     if_ptr->body = body;
	movq	%r13, 8(%rax)	; body, if__7->body
; src/create.c:153:     if_ptr->else_if = else_if;
	movq	%r12, 16(%rax)	; else_if, if__7->else_if
; src/create.c:154:     if_ptr->else_body = else_body;
	movq	%rbp, 24(%rax)	; else_body, if__7->else_body
.L131:
; src/create.c:156: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L135:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:147:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L131	;
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.p2align 4
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
; src/create.c:159:     if (condition == 0) {
	testq	%rdi, %rdi	; condition
	je	.L140	;,
	movq	%rdi, %rbx	; tmp89, condition
	movq	%rsi, %rbp	; tmp90, body
; src/create.c:163:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:165:     else_if_ptr->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:166:     else_if_ptr->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L136:
; src/create.c:168: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.p2align 4,,10
	.p2align 3
.L140:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:161:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L136	;
	.size	create_else_if, .-create_else_if
	.p2align 4
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13	;
	movq	%rdi, %r13	; tmp88, initializer
; src/create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
; src/create.c:170: For* create_for(Variable* initializer, Expression* condition, Expression* increment, list(Statement*) body) {
	pushq	%r12	;
	movq	%rsi, %r12	; tmp89, condition
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp90, increment
	pushq	%rbx	;
	movq	%rcx, %rbx	; tmp91, body
	subq	$8, %rsp	;,
; src/create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:173:     for_ptr->initializer = initializer;
	movq	%r13, (%rax)	; initializer, for__3->initializer
; src/create.c:174:     for_ptr->condition = condition;
	movq	%r12, 8(%rax)	; condition, for__3->condition
; src/create.c:175:     for_ptr->increment = increment;
	movq	%rbp, 16(%rax)	; increment, for__3->increment
; src/create.c:176:     for_ptr->body = body;
	movq	%rbx, 24(%rax)	; body, for__3->body
; src/create.c:178: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.size	create_for, .-create_for
	.p2align 4
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp	;
	movq	%rdi, %rbp	; tmp86, condition
; src/create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
; src/create.c:180: While* create_while(Expression* condition, list(Statement*) body) {
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp87, body
	subq	$8, %rsp	;,
; src/create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:183:     while_ptr->condition = condition;
	movq	%rbp, (%rax)	; condition, while__3->condition
; src/create.c:184:     while_ptr->body = body;
	movq	%rbx, 8(%rax)	; body, while__3->body
; src/create.c:186: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	create_while, .-create_while
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC13:
	.string	"true"
.LC14:
	.string	"false"
	.section	.rodata.str1.8
	.align 8
.LC15:
	.string	"Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n"
	.align 8
.LC16:
	.string	"Error creating expression: both expr_left and prim_left are NULL\n"
	.text
	.p2align 4
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13	;
	movq	%rdx, %r13	; tmp118, prim_left
	pushq	%r12	;
	movq	%rsi, %r12	; tmp117, expr_left
	pushq	%rbp	;
	movq	%rcx, %rbp	; tmp119, right
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp116, operator
	subq	$8, %rsp	;,
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpl	$19, %edi	;, operator
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L146	;,
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	movq	%r13, %rax	; prim_left, tmp121
	orq	%rsi, %rax	; expr_left, tmp121
	je	.L163	;,
; src/create.c:197:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:199:     expression_ptr->operator = operator;
	movl	%ebx, 24(%rax)	; operator, expression_22->operator
; src/create.c:200:     if (expr_left != 0)
	testq	%r12, %r12	; expr_left
	je	.L153	;,
; src/create.c:201:         expression_ptr->expr_left = expr_left;
	movq	%r12, (%rax)	; expr_left, expression_22->expr_left
.L154:
; src/create.c:208:     expression_ptr->right = right;
	movq	%rbp, 16(%rax)	; right, expression_22->right
.L145:
; src/create.c:210: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
	.p2align 4,,10
	.p2align 3
.L163:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.14_10
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rdx	;, iftmp.13_9
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%r9, %r8	; iftmp.14_10, iftmp.15_11
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rcx, %rcx	; right
	je	.L164	;,
.L148:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpl	$19, %ebx	;, operator
	leaq	.LC13(%rip), %rax	;, tmp113
	leaq	.LC14(%rip), %rcx	;, tmp112
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmove	%rax, %rcx	; tmp112,, tmp113, iftmp.16_12
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	pushq	%rdx	; iftmp.13_9
	leaq	.LC15(%rip), %rdx	;, tmp104
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:195:         return 0;
	popq	%rax	;
	xorl	%eax, %eax	; <retval>
	popq	%rdx	;
	jmp	.L145	;
	.p2align 4,,10
	.p2align 3
.L146:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rax	;, tmp109
	leaq	.LC14(%rip), %r8	;, tmp108
	testq	%rcx, %rcx	; right
	movq	%rax, %rdx	; tmp109, iftmp.13_9
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rax, %r9	; tmp109, iftmp.14_10
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmovne	%r8, %rdx	; tmp108,, iftmp.13_9
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%r13, %r13	; prim_left
	cmovne	%r8, %r9	; tmp108,, iftmp.14_10
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rsi, %rsi	; expr_left
	cmove	%rax, %r8	; tmp108,, tmp109, iftmp.15_11
	jmp	.L148	;
	.p2align 4,,10
	.p2align 3
.L164:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%r9, %rdx	; iftmp.14_10, iftmp.13_9
	jmp	.L148	;
	.p2align 4,,10
	.p2align 3
.L153:
; src/create.c:202:     else if (prim_left != 0)
	testq	%r13, %r13	; prim_left
	je	.L155	;,
; src/create.c:203:         expression_ptr->prim_left = prim_left;
	movq	%r13, 8(%rax)	; prim_left, expression_22->prim_left
	jmp	.L154	;
.L155:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:195:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L145	;
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
	.align 8
.LC17:
	.string	"Error creating primary: value is NULL\n"
	.align 8
.LC18:
	.string	"Error creating primary: unknown type %u\n"
	.text
	.p2align 4
	.globl	create_primary
	.type	create_primary, @function
create_primary:
	pushq	%r14	;
	movq	%rsi, %r14	; tmp126, str_value
	pushq	%r13	;
	movq	%rcx, %r13	; tmp128, prim_value
	pushq	%r12	;
	movq	%r8, %r12	; tmp129, variable_value
	pushq	%rbp	;
	movq	%rdx, %rbp	; tmp127, expr_value
	pushq	%rbx	;
; src/create.c:212: Primary* create_primary(PrimaryType type, string str_value, Expression* expr_value, Primary* prim_value, VariableAccess* variable_value) {
	movl	%edi, %ebx	; tmp125, type
; src/create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:215:     primary_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, primary_25->type
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$4, %ebx	;, type
	ja	.L166	;,
	testq	%r14, %r14	; str_value
	je	.L166	;,
; src/create.c:217:         primary_ptr->value.literal_value = str_value;
	movq	%r14, (%rax)	; str_value, primary_25->value.literal_value
.L165:
; src/create.c:232: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L166:
; src/create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpl	$5, %ebx	;, type
	jne	.L168	;,
	testq	%rbp, %rbp	; expr_value
	je	.L168	;,
; src/create.c:219:         primary_ptr->value.expr = expr_value;
	movq	%rbp, (%rax)	; expr_value, primary_25->value.expr
; src/create.c:232: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L168:
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	leal	-6(%rbx), %edx	;, tmp114
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$1, %edx	;, tmp114
	jbe	.L196	;,
; src/create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpl	$8, %ebx	;, type
	jne	.L171	;,
	testq	%r12, %r12	; variable_value
	je	.L171	;,
; src/create.c:223:         primary_ptr->value.var = variable_value;
	movq	%r12, (%rax)	; variable_value, primary_25->value.var
; src/create.c:232: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.p2align 4,,10
	.p2align 3
.L196:
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	testq	%r13, %r13	; prim_value
	je	.L171	;,
; src/create.c:221:         primary_ptr->value.operand = prim_value;
	movq	%r13, (%rax)	; prim_value, primary_25->value.operand
	jmp	.L165	;
	.p2align 4,,10
	.p2align 3
.L171:
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	orq	%r13, %r12	; prim_value, tmp119
; src/create.c:226:             fprintf(stderr, "Error creating primary: value is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_46
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	orq	%r12, %rbp	; tmp119, tmp120
	orq	%r14, %rbp	; str_value, tmp131
	jne	.L172	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_46,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp122
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:229:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L165	;
	.p2align 4,,10
	.p2align 3
.L172:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp123
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:229:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L165	;
	.size	create_primary, .-create_primary
	.section	.rodata.str1.8
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
	.p2align 4
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp135, base
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp134, type
	subq	$8, %rsp	;,
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
	sete	%al	;, tmp109
	testq	%rsi, %rsi	; base
	sete	%r15b	;, tmp111
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	cmpb	%al, %r15b	; tmp109, tmp111
	jne	.L237	;,
	movq	%rdx, %r12	; tmp136, name_content
	movq	%rcx, %r14	; tmp137, expr_content
	movq	%r8, %r13	; tmp138, args_content
; src/create.c:239:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	testq	%r12, %r12	; name_content
; src/create.c:241:     variable_access_ptr->type = type;
	movl	%ebx, 16(%rax)	; type, variable_access_30->type
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	setne	%dl	;, tmp114
; src/create.c:242:     variable_access_ptr->base = base;
	movq	%rbp, (%rax)	; base, variable_access_30->base
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	testb	%r15b, %r15b	; tmp111
	je	.L202	;,
	testb	%dl, %dl	; tmp114
	je	.L202	;,
.L236:
; src/create.c:250:         variable_access_ptr->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content,
.L197:
; src/create.c:259: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L202:
; src/create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpl	$1, %ebx	;, type
	jne	.L204	;,
	testq	%r13, %r13	; args_content
	je	.L204	;,
; src/create.c:246:         variable_access_ptr->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_30->content.args
; src/create.c:259: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.p2align 4,,10
	.p2align 3
.L237:
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	leaq	.LC13(%rip), %rax	;, tmp131
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %rcx	;, tmp130
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	movq	%rax, %r8	; tmp131, iftmp.21_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp113
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmovne	%rcx, %r8	; tmp130,, iftmp.21_20
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	cmove	%rax, %rcx	; tmp130,, tmp131, iftmp.22_21
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:237:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L197	;
	.p2align 4,,10
	.p2align 3
.L204:
; src/create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpl	$3, %ebx	;, type
	jne	.L206	;,
	testq	%r14, %r14	; expr_content
	je	.L206	;,
; src/create.c:248:         variable_access_ptr->content.index = expr_content;
	movq	%r14, 8(%rax)	; expr_content, variable_access_30->content.index
	jmp	.L197	;
	.p2align 4,,10
	.p2align 3
.L206:
; src/create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpl	$2, %ebx	;, type
	jne	.L207	;,
	testb	%dl, %dl	; tmp114
	jne	.L236	;,
.L207:
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	movq	%r14, %rcx	; expr_content, expr_content
; src/create.c:253:             fprintf(stderr, "Error creating variable access: content is NULL\n");
	movq	stderr(%rip), %rdi	; stderr, pretmp_23
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	orq	%r13, %rcx	; args_content, expr_content
	orq	%r12, %rcx	; name_content, tmp140
	je	.L238	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp128
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:237:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L197	;
.L238:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	%rdi, %rcx	; pretmp_23,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp127
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:237:         return 0;
	xorl	%eax, %eax	; <retval>
	jmp	.L197	;
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

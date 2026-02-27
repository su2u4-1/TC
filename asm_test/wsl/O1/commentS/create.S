	.file	"create.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
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
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp122, type
	movq	%rsi, %rbp	; tmp123, import_content
	movq	%rdx, %r12	; tmp124, function_content
	movq	%rcx, %r13	; tmp125, class_content
; src/create.c:4:     CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:5:     code_member->type = type;
	movl	%ebx, 8(%rax)	; type, code_member_20->type
; src/create.c:6:     if (type == CODE_IMPORT && import_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L2	;,
	testq	%rbp, %rbp	; import_content
	je	.L2	;,
; src/create.c:7:         code_member->content.import = import_content;
	movq	%rbp, (%rax)	; import_content, code_member_20->content.import
.L1:
; src/create.c:20: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L2:
; src/create.c:8:     else if (type == CODE_FUNCTION && function_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L4	;,
	testq	%r12, %r12	; function_content
	je	.L4	;,
; src/create.c:9:         code_member->content.function = function_content;
	movq	%r12, (%rax)	; function_content, code_member_20->content.function
	jmp	.L1	;
.L4:
; src/create.c:10:     else if (type == CODE_CLASS && class_content != NULL)
	cmpl	$2, %ebx	;, type
	jne	.L5	;,
	testq	%r13, %r13	; class_content
	je	.L5	;,
; src/create.c:11:         code_member->content.class_ = class_content;
	movq	%r13, (%rax)	; class_content, code_member_20->content.class_
	jmp	.L1	;
.L5:
; src/create.c:13:         if (import_content == 0 && function_content == 0 && class_content == 0)
	movq	%r13, %rcx	; class_content, class_content
	orq	%r12, %rcx	; function_content, class_content
	orq	%rbp, %rcx	; import_content, tmp127
	je	.L8	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC1(%rip), %rdx	;, tmp120
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:17:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L1	;
.L8:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$44, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp118
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:17:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L1	;
	.size	create_code_member, .-create_code_member
	.globl	create_code
	.type	create_code, @function
create_code:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, members
	movq	%rsi, %rbx	; tmp87, global_scope
; src/create.c:23:     Code* code = (Code*)alloc_memory(sizeof(Code));
	movl	$16, %edi	;,
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
	.globl	create_import
	.type	create_import, @function
create_import:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp89, name
; src/create.c:31:     if (name == 0) {
	testq	%rdi, %rdi	; name
	je	.L15	;,
	movq	%rsi, %rbp	; tmp90, source
; src/create.c:35:     Import* import = (Import*)alloc_memory(sizeof(Import));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:37:     import_ptr->name = name;
	movq	%rbx, (%rax)	; name, import_7->name
; src/create.c:38:     import_ptr->source = source;
	movq	%rbp, 8(%rax)	; source, import_7->source
.L11:
; src/create.c:40: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L15:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$36, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:33:         return 0;
	movq	%rbx, %rax	; name, <retval>
	jmp	.L11	;
	.size	create_import, .-create_import
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Error creating function: name or return_type is NULL\n"
	.text
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
	je	.L20	;,
	movq	%rdi, %rbx	; tmp99, name
	movq	%rsi, %rbp	; tmp100, return_type
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, function_scope
	testq	%rsi, %rsi	; return_type
	je	.L20	;,
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
.L16:
; src/create.c:55: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L20:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$53, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC3(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:45:         return 0;
	movl	$0, %eax	;, <retval>
	jmp	.L16	;
	.size	create_function, .-create_function
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Error creating method: name or return_type is NULL\n"
	.text
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
	je	.L26	;,
	movq	%rdi, %rbx	; tmp99, name
	movq	%rsi, %rbp	; tmp100, return_type
	movq	%rdx, %r14	; tmp101, parameters
	movq	%rcx, %r13	; tmp102, body
	movq	%r8, %r12	; tmp103, method_scope
	testq	%rsi, %rsi	; return_type
	je	.L26	;,
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
.L22:
; src/create.c:70: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L26:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$51, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp97
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:60:         return 0;
	movl	$0, %eax	;, <retval>
	jmp	.L22	;
	.size	create_method, .-create_method
	.section	.rodata.str1.8
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
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp111, type
	movq	%rsi, %rbp	; tmp112, method_content
	movq	%rdx, %r12	; tmp113, variable_content
; src/create.c:73:     ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:75:     class_member_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, class_member_17->type
; src/create.c:76:     if (type == CLASS_METHOD && method_content != NULL)
	testl	%ebx, %ebx	; type
	jne	.L29	;,
	testq	%rbp, %rbp	; method_content
	je	.L29	;,
; src/create.c:77:         class_member_ptr->content.method = method_content;
	movq	%rbp, (%rax)	; method_content, class_member_17->content.method
.L28:
; src/create.c:88: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L29:
; src/create.c:78:     else if (type == CLASS_VARIABLE && variable_content != NULL)
	cmpl	$1, %ebx	;, type
	jne	.L31	;,
	testq	%r12, %r12	; variable_content
	je	.L31	;,
; src/create.c:79:         class_member_ptr->content.variable = variable_content;
	movq	%r12, (%rax)	; variable_content, class_member_17->content.variable
	jmp	.L28	;
.L31:
; src/create.c:81:         if (method_content == 0 && variable_content == 0)
	orq	%rbp, %r12	; method_content, variable_content
	jne	.L32	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$45, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp107
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:85:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L28	;
.L32:
	movl	%ebx, %ecx	; type,
	leaq	.LC6(%rip), %rdx	;, tmp109
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:85:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L28	;
	.size	create_class_member, .-create_class_member
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Error creating class: name is NULL\n"
	.text
	.globl	create_class
	.type	create_class, @function
create_class:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp90, name
; src/create.c:91:     if (name == 0) {
	testq	%rdi, %rdi	; name
	je	.L38	;,
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
.L34:
; src/create.c:101: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L38:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$35, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rdi	;, tmp88
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:93:         return 0;
	movq	%rbx, %rax	; name, <retval>
	jmp	.L34	;
	.size	create_class, .-create_class
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Error creating variable: type or name is NULL\n"
	.text
	.globl	create_variable
	.type	create_variable, @function
create_variable:
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
; src/create.c:104:     if (type == 0 || name == 0) {
	testq	%rdi, %rdi	; type
	je	.L43	;,
	movq	%rdi, %rbx	; tmp97, type
	movq	%rsi, %rbp	; tmp98, name
	movq	%rdx, %r12	; tmp99, value
	testq	%rsi, %rsi	; name
	je	.L43	;,
; src/create.c:108:     Variable* variable = (Variable*)alloc_memory(sizeof(Variable));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:110:     variable_ptr->type = type;
	movq	%rbx, (%rax)	; type, variable_11->type
; src/create.c:111:     variable_ptr->name = name;
	movq	%rbp, 8(%rax)	; name, variable_11->name
; src/create.c:112:     variable_ptr->value = value;
	movq	%r12, 16(%rax)	; value, variable_11->value
.L39:
; src/create.c:114: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	ret	
.L43:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$46, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rdi	;, tmp95
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:106:         return 0;
	movl	$0, %eax	;, <retval>
	jmp	.L39	;
	.size	create_variable, .-create_variable
	.section	.rodata.str1.8
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
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp149, type
	movq	%rsi, %r13	; tmp150, if_stmt
	movq	%rdx, %r14	; tmp151, while_stmt
	movq	%rcx, %r15	; tmp152, for_stmt
	movq	%r8, %rbp	; tmp153, expr
	movq	%r9, %r12	; tmp154, var_stmt
; src/create.c:117:     Statement* statement = (Statement*)alloc_memory(sizeof(Statement));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:119:     statement_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, statement_32->type
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testq	%rbp, %rbp	; expr
	setne	%dl	;, _2
; src/create.c:120:     if (type == EXPRESSION_STATEMENT && expr != 0)
	testl	%ebx, %ebx	; type
	jne	.L46	;,
	testb	%dl, %dl	; _2
	je	.L46	;,
; src/create.c:121:         statement_ptr->stmt.expr = expr;
	movq	%rbp, (%rax)	; expr, statement_32->stmt.expr
.L45:
; src/create.c:142: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L46:
; src/create.c:122:     else if (type == VARIABLE_STATEMENT && var_stmt != 0)
	cmpl	$1, %ebx	;, type
	jne	.L48	;,
	testq	%r12, %r12	; var_stmt
	je	.L48	;,
; src/create.c:123:         statement_ptr->stmt.var = var_stmt;
	movq	%r12, (%rax)	; var_stmt, statement_32->stmt.var
	jmp	.L45	;
.L48:
; src/create.c:124:     else if (type == IF_STATEMENT && if_stmt != 0)
	cmpl	$2, %ebx	;, type
	jne	.L49	;,
	testq	%r13, %r13	; if_stmt
	je	.L49	;,
; src/create.c:125:         statement_ptr->stmt.if_stmt = if_stmt;
	movq	%r13, (%rax)	; if_stmt, statement_32->stmt.if_stmt
	jmp	.L45	;
.L49:
; src/create.c:126:     else if (type == WHILE_STATEMENT && while_stmt != 0)
	cmpl	$3, %ebx	;, type
	jne	.L50	;,
	testq	%r14, %r14	; while_stmt
	je	.L50	;,
; src/create.c:127:         statement_ptr->stmt.while_stmt = while_stmt;
	movq	%r14, (%rax)	; while_stmt, statement_32->stmt.while_stmt
	jmp	.L45	;
.L50:
; src/create.c:128:     else if (type == FOR_STATEMENT && for_stmt != 0)
	cmpl	$4, %ebx	;, type
	jne	.L51	;,
	testq	%r15, %r15	; for_stmt
	je	.L51	;,
; src/create.c:129:         statement_ptr->stmt.for_stmt = for_stmt;
	movq	%r15, (%rax)	; for_stmt, statement_32->stmt.for_stmt
	jmp	.L45	;
.L51:
; src/create.c:130:     else if (type == RETURN_STATEMENT && expr != 0)
	cmpl	$5, %ebx	;, type
	jne	.L52	;,
	testb	%dl, %dl	; _2
	je	.L52	;,
; src/create.c:131:         statement_ptr->stmt.return_expr = expr;
	movq	%rbp, (%rax)	; expr, statement_32->stmt.return_expr
	jmp	.L45	;
.L52:
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	leal	-6(%rbx), %edx	;, tmp139
; src/create.c:132:     else if (type == BREAK_STATEMENT || type == CONTINUE_STATEMENT)
	cmpl	$1, %edx	;, tmp139
	ja	.L53	;,
; src/create.c:133:         statement_ptr->stmt.expr = 0;
	movq	$0, (%rax)	;, statement_32->stmt.expr
	jmp	.L45	;
.L53:
; src/create.c:135:         if (if_stmt == 0 && while_stmt == 0 && for_stmt == 0 && expr == 0 && var_stmt == 0)
	orq	%r14, %r15	; while_stmt, tmp140
	orq	%r15, %r13	; tmp140, tmp141
	orq	%r13, %r12	; tmp141, tmp142
	orq	%rbp, %r12	; expr, tmp156
	je	.L56	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC10(%rip), %rdx	;, tmp147
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:139:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L45	;
.L56:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$42, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC9(%rip), %rdi	;, tmp145
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:139:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L45	;
	.size	create_statement, .-create_statement
	.section	.rodata.str1.8
	.align 8
.LC11:
	.string	"Error creating if statement: condition is NULL\n"
	.text
	.globl	create_if
	.type	create_if, @function
create_if:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp91, condition
; src/create.c:145:     if (condition == 0) {
	testq	%rdi, %rdi	; condition
	je	.L61	;,
	movq	%rsi, %r12	; tmp92, body
	movq	%rdx, %rbp	; tmp93, else_if
	movq	%rcx, %r13	; tmp94, else_body
; src/create.c:149:     If* if_ = (If*)alloc_memory(sizeof(If));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:151:     if_ptr->condition = condition;
	movq	%rbx, (%rax)	; condition, if__7->condition
; src/create.c:152:     if_ptr->body = body;
	movq	%r12, 8(%rax)	; body, if__7->body
; src/create.c:153:     if_ptr->else_if = else_if;
	movq	%rbp, 16(%rax)	; else_if, if__7->else_if
; src/create.c:154:     if_ptr->else_body = else_body;
	movq	%r13, 24(%rax)	; else_body, if__7->else_body
.L57:
; src/create.c:156: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L61:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$47, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rdi	;, tmp89
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:147:         return 0;
	movq	%rbx, %rax	; condition, <retval>
	jmp	.L57	;
	.size	create_if, .-create_if
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Error creating else-if statement: condition is NULL\n"
	.text
	.globl	create_else_if
	.type	create_else_if, @function
create_else_if:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbx	; tmp89, condition
; src/create.c:159:     if (condition == 0) {
	testq	%rdi, %rdi	; condition
	je	.L66	;,
	movq	%rsi, %rbp	; tmp90, body
; src/create.c:163:     ElseIf* else_if = (ElseIf*)alloc_memory(sizeof(ElseIf));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:165:     else_if_ptr->condition = condition;
	movq	%rbx, (%rax)	; condition, else_if_7->condition
; src/create.c:166:     else_if_ptr->body = body;
	movq	%rbp, 8(%rax)	; body, else_if_7->body
.L62:
; src/create.c:168: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	ret	
.L66:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$52, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rdi	;, tmp87
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:161:         return 0;
	movq	%rbx, %rax	; condition, <retval>
	jmp	.L62	;
	.size	create_else_if, .-create_else_if
	.globl	create_for
	.type	create_for, @function
create_for:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %r13	; tmp88, initializer
	movq	%rsi, %r12	; tmp89, condition
	movq	%rdx, %rbp	; tmp90, increment
	movq	%rcx, %rbx	; tmp91, body
; src/create.c:171:     For* for_ = (For*)alloc_memory(sizeof(For));
	movl	$32, %edi	;,
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
	.globl	create_while
	.type	create_while, @function
create_while:
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movq	%rdi, %rbp	; tmp86, condition
	movq	%rsi, %rbx	; tmp87, body
; src/create.c:181:     While* while_ = (While*)alloc_memory(sizeof(While));
	movl	$16, %edi	;,
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
	.globl	create_expression
	.type	create_expression, @function
create_expression:
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp120, operator
	movq	%rsi, %rbp	; tmp121, expr_left
	movq	%rdx, %r13	; tmp122, prim_left
	movq	%rcx, %r12	; tmp123, right
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpl	$19, %edi	;, operator
	sete	%dl	;, tmp99
	testq	%rcx, %rcx	; right
	sete	%al	;, tmp101
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	cmpb	%al, %dl	; tmp101, tmp99
	jne	.L72	;,
; src/create.c:189:     if ((operator == OP_NONE) != (right == 0) || (expr_left == 0 && prim_left == 0)) {
	movq	%r13, %rax	; prim_left, tmp125
	orq	%rsi, %rax	; expr_left, tmp125
	je	.L90	;,
; src/create.c:197:     Expression* expression = (Expression*)alloc_memory(sizeof(Expression));
	movl	$32, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:199:     expression_ptr->operator = operator;
	movl	%ebx, 24(%rax)	; operator, expression_21->operator
; src/create.c:200:     if (expr_left != 0)
	testq	%rbp, %rbp	; expr_left
	je	.L80	;,
; src/create.c:201:         expression_ptr->expr_left = expr_left;
	movq	%rbp, (%rax)	; expr_left, expression_21->expr_left
.L81:
; src/create.c:208:     expression_ptr->right = right;
	movq	%r12, 16(%rax)	; right, expression_21->right
; src/create.c:209:     return expression;
	jmp	.L71	;
.L72:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rcx, %rcx	; right
	leaq	.LC13(%rip), %rax	;, tmp108
	leaq	.LC14(%rip), %rdx	;, tmp109
	cmovne	%rdx, %rax	; tmp108,, tmp109, iftmp.13_4
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%r13, %r13	; prim_left
	movq	%rdx, %r9	;, tmp118
	leaq	.LC13(%rip), %rdx	;, tmp119
	cmove	%rdx, %r9	; tmp118,, tmp119, iftmp.14_3
.L76:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rbp, %rbp	; expr_left
	leaq	.LC14(%rip), %r8	;, tmp110
	leaq	.LC13(%rip), %rdx	;, tmp111
	cmove	%rdx, %r8	; tmp110,, tmp111, iftmp.15_10
.L77:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	cmpl	$19, %ebx	;, operator
	leaq	.LC14(%rip), %rcx	;, tmp112
	leaq	.LC13(%rip), %rdx	;, tmp113
	cmove	%rdx, %rcx	; tmp112,, tmp113, iftmp.16_11
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	subq	$8, %rsp	;,
	pushq	%rax	; iftmp.13_4
	leaq	.LC15(%rip), %rdx	;, tmp104
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:195:         return 0;
	addq	$16, %rsp	;,
	movl	$0, %eax	;, <retval>
.L71:
; src/create.c:210: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L80:
; src/create.c:202:     else if (prim_left != 0)
	testq	%r13, %r13	; prim_left
	je	.L82	;,
; src/create.c:203:         expression_ptr->prim_left = prim_left;
	movq	%r13, 8(%rax)	; prim_left, expression_21->prim_left
	jmp	.L81	;
.L82:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$65, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rdi	;, tmp106
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:206:         return 0;
	movq	%r13, %rax	; prim_left, <retval>
	jmp	.L71	;
.L90:
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC14(%rip), %rax	;, iftmp.13_4
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %r9	;, iftmp.14_3
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	testq	%rcx, %rcx	; right
	jne	.L76	;,
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	leaq	.LC13(%rip), %rax	;, iftmp.13_4
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rax, %r9	; iftmp.13_4, iftmp.14_3
; src/create.c:190:         fprintf(stderr, "Error creating expression: operator and operands mismatch, operator == OP_NONE: %s, expr_left == 0: %s, prim_left == 0: %s, right == 0: %s\n",
	movq	%rax, %r8	; iftmp.13_4, iftmp.15_10
	jmp	.L77	;
	.size	create_expression, .-create_expression
	.section	.rodata.str1.8
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
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movl	%edi, %ebx	; tmp135, type
	movq	%rsi, %rbp	; tmp136, str_value
	movq	%rdx, %r12	; tmp137, expr_value
	movq	%rcx, %r14	; tmp138, prim_value
	movq	%r8, %r13	; tmp139, variable_value
; src/create.c:213:     Primary* primary = (Primary*)alloc_memory(sizeof(Primary));
	movl	$16, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:215:     primary_ptr->type = type;
	movl	%ebx, 8(%rax)	; type, primary_24->type
; src/create.c:216:     if ((type == PRIM_INTEGER || type == PRIM_FLOAT || type == PRIM_STRING || type == PRIM_TRUE || type == PRIM_FALSE) && str_value != 0)
	cmpl	$4, %ebx	;, type
	ja	.L92	;,
	testq	%rbp, %rbp	; str_value
	je	.L92	;,
; src/create.c:217:         primary_ptr->value.literal_value = str_value;
	movq	%rbp, (%rax)	; str_value, primary_24->value.literal_value
.L91:
; src/create.c:232: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
.L92:
; src/create.c:218:     else if (type == PRIM_EXPRESSION && expr_value != 0)
	cmpl	$5, %ebx	;, type
	jne	.L94	;,
	testq	%r12, %r12	; expr_value
	je	.L94	;,
; src/create.c:219:         primary_ptr->value.expr = expr_value;
	movq	%r12, (%rax)	; expr_value, primary_24->value.expr
	jmp	.L91	;
.L94:
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	leal	-6(%rbx), %edx	;, tmp118
; src/create.c:220:     else if ((type == PRIM_NOT_OPERAND || type == PRIM_NEG_OPERAND) && prim_value != 0)
	cmpl	$1, %edx	;, tmp118
	ja	.L95	;,
	testq	%r14, %r14	; prim_value
	jne	.L99	;,
.L95:
; src/create.c:222:     else if (type == PRIM_VARIABLE_ACCESS && variable_value != 0)
	cmpl	$8, %ebx	;, type
	jne	.L96	;,
	testq	%r13, %r13	; variable_value
	je	.L96	;,
; src/create.c:223:         primary_ptr->value.var = variable_value;
	movq	%r13, (%rax)	; variable_value, primary_24->value.var
	jmp	.L91	;
.L99:
; src/create.c:221:         primary_ptr->value.operand = prim_value;
	movq	%r14, (%rax)	; prim_value, primary_24->value.operand
	jmp	.L91	;
.L96:
; src/create.c:225:         if (str_value == 0 && expr_value == 0 && prim_value == 0 && variable_value == 0)
	orq	%r14, %r13	; prim_value, tmp127
	orq	%r13, %r12	; tmp127, tmp128
	orq	%rbp, %r12	; str_value, tmp141
	jne	.L97	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$38, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rdi	;, tmp131
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:229:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L91	;
.L97:
	movl	%ebx, %ecx	; type,
	leaq	.LC18(%rip), %rdx	;, tmp133
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:229:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L91	;
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
	.globl	create_variable_access
	.type	create_variable_access, @function
create_variable_access:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$8, %rsp	;,
	movl	%edi, %ebx	; tmp137, type
	movq	%rsi, %rbp	; tmp138, base
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	testl	%edi, %edi	; type
	sete	%r15b	;, _2
	testq	%rsi, %rsi	; base
	sete	%al	;, tmp112
; src/create.c:235:     if ((base == 0) != (type == VAR_NAME)) {
	cmpb	%r15b, %al	; _2, tmp112
	jne	.L113	;,
	movq	%rdx, %r12	; tmp139, name_content
	movq	%rcx, %r14	; tmp140, expr_content
	movq	%r8, %r13	; tmp141, args_content
; src/create.c:239:     VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess));
	movl	$24, %edi	;,
	call	*alloc_memory@GOTPCREL(%rip)	;
; src/create.c:241:     variable_access_ptr->type = type;
	movl	%ebx, 16(%rax)	; type, variable_access_28->type
; src/create.c:242:     variable_access_ptr->base = base;
	movq	%rbp, (%rax)	; base, variable_access_28->base
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	testq	%r12, %r12	; name_content
	setne	%dl	;, _4
; src/create.c:243:     if (type == VAR_NAME && name_content != 0)
	testb	%r15b, %r15b	; _2
	je	.L105	;,
	testb	%dl, %dl	; _4
	je	.L105	;,
; src/create.c:244:         variable_access_ptr->content.name = name_content;
	movq	%r12, 8(%rax)	; name_content, variable_access_28->content.name
	jmp	.L100	;
.L113:
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testl	%edi, %edi	; type
	leaq	.LC14(%rip), %r8	;, tmp133
	leaq	.LC13(%rip), %rax	;, tmp134
	cmove	%rax, %r8	; tmp133,, tmp134, iftmp.21_19
; src/create.c:236:         fprintf(stderr, "Error creating variable access: base and type mismatch, base == 0: %s, type == VAR_NAME: %s\n", base == 0 ? "true" : "false", type == VAR_NAME ? "true" : "false");
	testq	%rsi, %rsi	; base
	leaq	.LC14(%rip), %rcx	;, tmp135
	cmove	%rax, %rcx	; tmp135,, tmp136, iftmp.22_20
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC19(%rip), %rdx	;, tmp114
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:237:         return 0;
	movl	$0, %eax	;, <retval>
.L100:
; src/create.c:259: }
	addq	$8, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L105:
; src/create.c:245:     else if (type == VAR_FUNC_CALL && args_content != 0)
	cmpl	$1, %ebx	;, type
	jne	.L106	;,
	testq	%r13, %r13	; args_content
	je	.L106	;,
; src/create.c:246:         variable_access_ptr->content.args = args_content;
	movq	%r13, 8(%rax)	; args_content, variable_access_28->content.args
	jmp	.L100	;
.L106:
; src/create.c:247:     else if (type == VAR_GET_SEQ && expr_content != 0)
	cmpl	$3, %ebx	;, type
	jne	.L107	;,
	testq	%r14, %r14	; expr_content
	je	.L107	;,
; src/create.c:248:         variable_access_ptr->content.index = expr_content;
	movq	%r14, 8(%rax)	; expr_content, variable_access_28->content.index
	jmp	.L100	;
.L107:
; src/create.c:249:     else if (type == VAR_GET_ATTR && name_content != 0)
	cmpl	$2, %ebx	;, type
	jne	.L108	;,
	testb	%dl, %dl	; _4
	je	.L108	;,
; src/create.c:250:         variable_access_ptr->content.attr_name = name_content;
	movq	%r12, 8(%rax)	; name_content, variable_access_28->content.attr_name
	jmp	.L100	;
.L108:
; src/create.c:252:         if (name_content == 0 && expr_content == 0 && args_content == 0)
	orq	%r13, %r14	; args_content, tmp126
	orq	%r12, %r14	; name_content, tmp143
	je	.L114	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	%ebx, %ecx	; type,
	leaq	.LC21(%rip), %rdx	;, tmp131
	movl	$2, %esi	;,
	movq	stderr(%rip), %rdi	; stderr,
	movl	$0, %eax	;,
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/create.c:256:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L100	;
.L114:
	movq	stderr(%rip), %rcx	; stderr,
	movl	$48, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rdi	;, tmp129
	call	*fwrite@GOTPCREL(%rip)	;
; src/create.c:256:         return 0;
	movl	$0, %eax	;, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	jmp	.L100	;
	.size	create_variable_access, .-create_variable_access
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

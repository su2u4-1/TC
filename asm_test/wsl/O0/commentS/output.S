	.file	"output.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata
.LC0:
	.string	"import\n"
.LC1:
	.string	"function\n"
.LC2:
	.string	"class\n"
.LC3:
	.string	"unknown_CodeMemberType: %u\n"
	.text
	.type	output_code_member, @function
output_code_member:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; code_member, code_member
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:24:     switch (code_member->type) {
	movq	-8(%rbp), %rax	; code_member, tmp90
	movl	8(%rax), %eax	; code_member_11(D)->type, _1
; src/output.c:24:     switch (code_member->type) {
	cmpl	$2, %eax	;, _1
	je	.L2	;,
	cmpl	$2, %eax	;, _1
	ja	.L3	;,
	testl	%eax, %eax	; _1
	je	.L4	;,
	cmpl	$1, %eax	;, _1
	je	.L5	;,
	jmp	.L3	;
.L4:
; src/output.c:26:             ast_output(0, false, "import\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp91
	movq	-24(%rbp), %rsi	; indent, tmp92
	movq	-16(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rcx	; tmp91,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp93,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:26:             ast_output(0, false, "import\n");
	movq	-16(%rbp), %rax	; outfile, tmp94
	movq	%rax, %rcx	; tmp94,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp96
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; code_member, tmp97
	movq	(%rax), %rax	; code_member_11(D)->content.import, _3
	movq	-32(%rbp), %rdx	; indent_has_next, tmp98
	movq	-16(%rbp), %rsi	; outfile, tmp99
	movq	%rdx, %rcx	; tmp98,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_import	;
; src/output.c:28:             break;
	jmp	.L6	;
.L5:
; src/output.c:30:             ast_output(0, false, "function\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp100
	movq	-24(%rbp), %rsi	; indent, tmp101
	movq	-16(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:30:             ast_output(0, false, "function\n");
	movq	-16(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp105
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; code_member, tmp106
	movq	(%rax), %rax	; code_member_11(D)->content.function, _5
	movq	-32(%rbp), %rdx	; indent_has_next, tmp107
	movq	-16(%rbp), %rsi	; outfile, tmp108
	movq	%rdx, %rcx	; tmp107,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_function	;
; src/output.c:32:             break;
	jmp	.L6	;
.L2:
; src/output.c:34:             ast_output(0, false, "class\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp109
	movq	-24(%rbp), %rsi	; indent, tmp110
	movq	-16(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:34:             ast_output(0, false, "class\n");
	movq	-16(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp114
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; code_member, tmp115
	movq	(%rax), %rax	; code_member_11(D)->content.class, _7
	movq	-32(%rbp), %rdx	; indent_has_next, tmp116
	movq	-16(%rbp), %rsi	; outfile, tmp117
	movq	%rdx, %rcx	; tmp116,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_class	;
; src/output.c:36:             break;
	jmp	.L6	;
.L3:
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp118
	movq	-24(%rbp), %rsi	; indent, tmp119
	movq	-16(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp118,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	-8(%rbp), %rax	; code_member, tmp121
	movl	8(%rax), %edx	; code_member_11(D)->type, _8
	movq	-16(%rbp), %rax	; outfile, tmp122
	leaq	.LC3(%rip), %rcx	;, tmp123
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp122,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:39:             break;
	nop	
.L6:
; src/output.c:42: }
	nop	
	leave	
	ret	
	.size	output_code_member, .-output_code_member
	.globl	output_code
	.type	output_code, @function
output_code:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; code, code
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
; src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	-24(%rbp), %rax	; code, tmp84
	movq	(%rax), %rax	; code_5(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, members
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L8	;
.L9:
; src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp86
	leaq	1(%rax), %rdi	;, _2
	movq	-48(%rbp), %rdx	; indent_has_next, tmp87
	movq	-32(%rbp), %rsi	; outfile, tmp88
	movq	-16(%rbp), %rax	; member, tmp89
	movq	%rdx, %rcx	; tmp87,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; tmp89,
	call	output_code_member	;
.L8:
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	; members, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp91, member
; src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	;, member
	jne	.L9	;,
; src/output.c:50: }
	nop	
	nop	
	leave	
	ret	
	.size	output_code, .-output_code
	.section	.rodata
.LC4:
	.string	"name\n"
.LC5:
	.string	"NULL"
.LC6:
	.string	"source: \"%s\"\n"
	.text
	.type	output_import, @function
output_import:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; import, import
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:53:     ast_output(0, false, "name\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp86
	movq	-24(%rbp), %rsi	; indent, tmp87
	movq	-16(%rbp), %rax	; outfile, tmp88
	movq	%rdx, %rcx	; tmp86,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp88,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:53:     ast_output(0, false, "name\n");
	movq	-16(%rbp), %rax	; outfile, tmp89
	movq	%rax, %rcx	; tmp89,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp91
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; import, tmp92
	movq	(%rax), %rax	; import_11(D)->name, _2
	movq	-32(%rbp), %rdx	; indent_has_next, tmp93
	movq	-16(%rbp), %rsi	; outfile, tmp94
	movq	%rdx, %rcx	; tmp93,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp95
	movq	-24(%rbp), %rsi	; indent, tmp96
	movq	-16(%rbp), %rax	; outfile, tmp97
	movq	%rdx, %rcx	; tmp95,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp97,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	-8(%rbp), %rax	; import, tmp98
	movq	8(%rax), %rax	; import_11(D)->source, _3
	testq	%rax, %rax	; _3
	je	.L11	;,
	movq	-8(%rbp), %rax	; import, tmp99
	movq	8(%rax), %rax	; import_11(D)->source, iftmp.0_4
	jmp	.L12	;
.L11:
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC5(%rip), %rax	;, iftmp.0_4
.L12:
; src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	-16(%rbp), %rcx	; outfile, tmp100
	movq	%rax, %rdx	; iftmp.0_4,
	leaq	.LC6(%rip), %rax	;, tmp101
	movq	%rax, %rsi	; tmp101,
	movq	%rcx, %rdi	; tmp100,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:57: }
	nop	
	leave	
	ret	
	.size	output_import, .-output_import
	.section	.rodata
.LC7:
	.string	"return_type\n"
.LC8:
	.string	"parameters\n"
.LC9:
	.string	"parameters[%d]\n"
.LC10:
	.string	"body\n"
	.text
	.type	output_function, @function
output_function:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; function, function
	movq	%rsi, -64(%rbp)	; outfile, outfile
	movq	%rdx, -72(%rbp)	; indent, indent
	movq	%rcx, -80(%rbp)	; indent_has_next, indent_has_next
; src/output.c:60:     ast_output(0, false, "name\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp91
	movq	-72(%rbp), %rsi	; indent, tmp92
	movq	-64(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rcx	; tmp91,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp93,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:60:     ast_output(0, false, "name\n");
	movq	-64(%rbp), %rax	; outfile, tmp94
	movq	%rax, %rcx	; tmp94,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp96
	leaq	1(%rax), %rdi	;, _1
	movq	-56(%rbp), %rax	; function, tmp97
	movq	(%rax), %rax	; function_19(D)->name, _2
	movq	-80(%rbp), %rdx	; indent_has_next, tmp98
	movq	-64(%rbp), %rsi	; outfile, tmp99
	movq	%rdx, %rcx	; tmp98,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp100
	movq	-72(%rbp), %rsi	; indent, tmp101
	movq	-64(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	-64(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp105
	leaq	1(%rax), %rdi	;, _3
	movq	-56(%rbp), %rax	; function, tmp106
	movq	8(%rax), %rax	; function_19(D)->return_type, _4
	movq	-80(%rbp), %rdx	; indent_has_next, tmp107
	movq	-64(%rbp), %rsi	; outfile, tmp108
	movq	%rdx, %rcx	; tmp107,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp109
	movq	-72(%rbp), %rsi	; indent, tmp110
	movq	-64(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	-64(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	-56(%rbp), %rax	; function, tmp114
	movq	16(%rax), %rax	; function_19(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp115, parameters
; src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	-56(%rbp), %rax	; function, tmp116
	movq	24(%rax), %rax	; function_19(D)->body, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp117, body
; src/output.c:68:     int index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L14	;
.L15:
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	-72(%rbp), %rax	; indent, tmp118
	leaq	1(%rax), %rsi	;, _7
	movq	-80(%rbp), %rdx	; indent_has_next, tmp119
	movq	-64(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp119,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp121
	movq	-64(%rbp), %rax	; outfile, tmp122
	leaq	.LC9(%rip), %rcx	;, tmp123
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp122,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp124
	leaq	2(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; indent_has_next, tmp125
	movq	-64(%rbp), %rsi	; outfile, tmp126
	movq	-32(%rbp), %rax	; parameter, tmp127
	movq	%rdx, %rcx	; tmp125,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp127,
	call	output_variable	;
.L14:
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	; parameters, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp129, parameter
; src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	;, parameter
	jne	.L15	;,
; src/output.c:73:     ast_output(0, true, "body\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp130
	movq	-72(%rbp), %rsi	; indent, tmp131
	movq	-64(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:73:     ast_output(0, true, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L16	;
.L17:
; src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdi	;, _9
	movq	-80(%rbp), %rdx	; indent_has_next, tmp136
	movq	-64(%rbp), %rsi	; outfile, tmp137
	movq	-40(%rbp), %rax	; statement, tmp138
	movq	%rdx, %rcx	; tmp136,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; tmp138,
	call	output_statement	;
.L16:
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	; body, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp140, statement
; src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	;, statement
	jne	.L17	;,
; src/output.c:78: }
	nop	
	nop	
	leave	
	ret	
	.size	output_function, .-output_function
	.type	output_method, @function
output_method:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; method, method
	movq	%rsi, -64(%rbp)	; outfile, outfile
	movq	%rdx, -72(%rbp)	; indent, indent
	movq	%rcx, -80(%rbp)	; indent_has_next, indent_has_next
; src/output.c:81:     ast_output(0, false, "name\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp91
	movq	-72(%rbp), %rsi	; indent, tmp92
	movq	-64(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rcx	; tmp91,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp93,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:81:     ast_output(0, false, "name\n");
	movq	-64(%rbp), %rax	; outfile, tmp94
	movq	%rax, %rcx	; tmp94,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp96
	leaq	1(%rax), %rdi	;, _1
	movq	-56(%rbp), %rax	; method, tmp97
	movq	(%rax), %rax	; method_19(D)->name, _2
	movq	-80(%rbp), %rdx	; indent_has_next, tmp98
	movq	-64(%rbp), %rsi	; outfile, tmp99
	movq	%rdx, %rcx	; tmp98,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp100
	movq	-72(%rbp), %rsi	; indent, tmp101
	movq	-64(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	-64(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp105
	leaq	1(%rax), %rdi	;, _3
	movq	-56(%rbp), %rax	; method, tmp106
	movq	8(%rax), %rax	; method_19(D)->return_type, _4
	movq	-80(%rbp), %rdx	; indent_has_next, tmp107
	movq	-64(%rbp), %rsi	; outfile, tmp108
	movq	%rdx, %rcx	; tmp107,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp109
	movq	-72(%rbp), %rsi	; indent, tmp110
	movq	-64(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	-64(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	-56(%rbp), %rax	; method, tmp114
	movq	16(%rax), %rax	; method_19(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp115, parameters
; src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	-56(%rbp), %rax	; method, tmp116
	movq	24(%rax), %rax	; method_19(D)->body, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp117, body
; src/output.c:89:     int index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L19	;
.L20:
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	-72(%rbp), %rax	; indent, tmp118
	leaq	1(%rax), %rsi	;, _7
	movq	-80(%rbp), %rdx	; indent_has_next, tmp119
	movq	-64(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp119,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp121
	movq	-64(%rbp), %rax	; outfile, tmp122
	leaq	.LC9(%rip), %rcx	;, tmp123
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp122,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp124
	leaq	2(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; indent_has_next, tmp125
	movq	-64(%rbp), %rsi	; outfile, tmp126
	movq	-32(%rbp), %rax	; parameter, tmp127
	movq	%rdx, %rcx	; tmp125,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp127,
	call	output_variable	;
.L19:
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	; parameters, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp129, parameter
; src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	;, parameter
	jne	.L20	;,
; src/output.c:94:     ast_output(0, true, "body\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp130
	movq	-72(%rbp), %rsi	; indent, tmp131
	movq	-64(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:94:     ast_output(0, true, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L21	;
.L22:
; src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdi	;, _9
	movq	-80(%rbp), %rdx	; indent_has_next, tmp136
	movq	-64(%rbp), %rsi	; outfile, tmp137
	movq	-40(%rbp), %rax	; statement, tmp138
	movq	%rdx, %rcx	; tmp136,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; tmp138,
	call	output_statement	;
.L21:
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	; body, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp140, statement
; src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	;, statement
	jne	.L22	;,
; src/output.c:99: }
	nop	
	nop	
	leave	
	ret	
	.size	output_method, .-output_method
	.section	.rodata
.LC11:
	.string	"method\n"
.LC12:
	.string	"variable\n"
.LC13:
	.string	"unknown_ClassMemberType: %u\n"
	.text
	.type	output_class_member, @function
output_class_member:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; class_member, class_member
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:102:     switch (class_member->type) {
	movq	-8(%rbp), %rax	; class_member, tmp88
	movl	8(%rax), %eax	; class_member_9(D)->type, _1
; src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	; _1
	je	.L24	;,
	cmpl	$1, %eax	;, _1
	je	.L25	;,
	jmp	.L28	;
.L24:
; src/output.c:104:             ast_output(0, false, "method\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp89
	movq	-24(%rbp), %rsi	; indent, tmp90
	movq	-16(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rcx	; tmp89,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp91,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:104:             ast_output(0, false, "method\n");
	movq	-16(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp94
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; class_member, tmp95
	movq	(%rax), %rax	; class_member_9(D)->content.method, _3
	movq	-32(%rbp), %rdx	; indent_has_next, tmp96
	movq	-16(%rbp), %rsi	; outfile, tmp97
	movq	%rdx, %rcx	; tmp96,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_method	;
; src/output.c:106:             break;
	jmp	.L27	;
.L25:
; src/output.c:108:             ast_output(0, false, "variable\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp98
	movq	-24(%rbp), %rsi	; indent, tmp99
	movq	-16(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rcx	; tmp98,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:108:             ast_output(0, false, "variable\n");
	movq	-16(%rbp), %rax	; outfile, tmp101
	movq	%rax, %rcx	; tmp101,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; class_member, tmp104
	movq	(%rax), %rax	; class_member_9(D)->content.variable, _5
	movq	-32(%rbp), %rdx	; indent_has_next, tmp105
	movq	-16(%rbp), %rsi	; outfile, tmp106
	movq	%rdx, %rcx	; tmp105,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_variable	;
; src/output.c:110:             break;
	jmp	.L27	;
.L28:
; src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp107
	movq	-24(%rbp), %rsi	; indent, tmp108
	movq	-16(%rbp), %rax	; outfile, tmp109
	movq	%rdx, %rcx	; tmp107,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp109,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	-8(%rbp), %rax	; class_member, tmp110
	movl	8(%rax), %edx	; class_member_9(D)->type, _6
	movq	-16(%rbp), %rax	; outfile, tmp111
	leaq	.LC13(%rip), %rcx	;, tmp112
	movq	%rcx, %rsi	; tmp112,
	movq	%rax, %rdi	; tmp111,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:113:             break;
	nop	
.L27:
; src/output.c:116: }
	nop	
	leave	
	ret	
	.size	output_class_member, .-output_class_member
	.section	.rodata
.LC14:
	.string	"members\n"
	.text
	.type	output_class, @function
output_class:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; class, class
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
; src/output.c:119:     ast_output(0, false, "name\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp86
	movq	-40(%rbp), %rsi	; indent, tmp87
	movq	-32(%rbp), %rax	; outfile, tmp88
	movq	%rdx, %rcx	; tmp86,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp88,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:119:     ast_output(0, false, "name\n");
	movq	-32(%rbp), %rax	; outfile, tmp89
	movq	%rax, %rcx	; tmp89,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp91
	leaq	1(%rax), %rdi	;, _1
	movq	-24(%rbp), %rax	; class, tmp92
	movq	(%rax), %rax	; class_12(D)->name, _2
	movq	-48(%rbp), %rdx	; indent_has_next, tmp93
	movq	-32(%rbp), %rsi	; outfile, tmp94
	movq	%rdx, %rcx	; tmp93,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:121:     ast_output(0, true, "members\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp95
	movq	-40(%rbp), %rsi	; indent, tmp96
	movq	-32(%rbp), %rax	; outfile, tmp97
	movq	%rdx, %rcx	; tmp95,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp97,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:121:     ast_output(0, true, "members\n");
	movq	-32(%rbp), %rax	; outfile, tmp98
	movq	%rax, %rcx	; tmp98,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rax	;, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	-24(%rbp), %rax	; class, tmp100
	movq	8(%rax), %rax	; class_12(D)->members, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp101, members
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L30	;
.L31:
; src/output.c:125:         output_class_member(member, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-48(%rbp), %rdx	; indent_has_next, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	-16(%rbp), %rax	; member, tmp105
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp105,
	call	output_class_member	;
.L30:
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	; members, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp107, member
; src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	;, member
	jne	.L31	;,
; src/output.c:127: }
	nop	
	nop	
	leave	
	ret	
	.size	output_class, .-output_class
	.section	.rodata
.LC15:
	.string	"type\n"
.LC16:
	.string	"value\n"
.LC17:
	.string	"value: \"NULL\"\n"
	.text
	.type	output_variable, @function
output_variable:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; variable, variable
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:130:     ast_output(0, false, "type\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp89
	movq	-24(%rbp), %rsi	; indent, tmp90
	movq	-16(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rcx	; tmp89,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp91,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:130:     ast_output(0, false, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp94
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; variable, tmp95
	movq	(%rax), %rax	; variable_15(D)->type, _2
	movq	-32(%rbp), %rdx	; indent_has_next, tmp96
	movq	-16(%rbp), %rsi	; outfile, tmp97
	movq	%rdx, %rcx	; tmp96,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:132:     ast_output(0, false, "name\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp98
	movq	-24(%rbp), %rsi	; indent, tmp99
	movq	-16(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rcx	; tmp98,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:132:     ast_output(0, false, "name\n");
	movq	-16(%rbp), %rax	; outfile, tmp101
	movq	%rax, %rcx	; tmp101,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:133:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _3
	movq	-8(%rbp), %rax	; variable, tmp104
	movq	8(%rax), %rax	; variable_15(D)->name, _4
	movq	-32(%rbp), %rdx	; indent_has_next, tmp105
	movq	-16(%rbp), %rsi	; outfile, tmp106
	movq	%rdx, %rcx	; tmp105,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:134:     if (variable->value != NULL) {
	movq	-8(%rbp), %rax	; variable, tmp107
	movq	16(%rax), %rax	; variable_15(D)->value, _5
; src/output.c:134:     if (variable->value != NULL) {
	testq	%rax, %rax	; _5
	je	.L33	;,
; src/output.c:135:         ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp108
	movq	-24(%rbp), %rsi	; indent, tmp109
	movq	-16(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:135:         ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp111
	movq	%rax, %rcx	; tmp111,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp113
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; variable, tmp114
	movq	16(%rax), %rax	; variable_15(D)->value, _7
	movq	-32(%rbp), %rdx	; indent_has_next, tmp115
	movq	-16(%rbp), %rsi	; outfile, tmp116
	movq	%rdx, %rcx	; tmp115,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_expression	;
; src/output.c:140: }
	jmp	.L35	;
.L33:
; src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp117
	movq	-24(%rbp), %rsi	; indent, tmp118
	movq	-16(%rbp), %rax	; outfile, tmp119
	movq	%rdx, %rcx	; tmp117,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp119,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
.L35:
; src/output.c:140: }
	nop	
	leave	
	ret	
	.size	output_variable, .-output_variable
	.section	.rodata
.LC18:
	.string	"if_statement\n"
.LC19:
	.string	"for_statement\n"
.LC20:
	.string	"while_statement\n"
	.align 8
.LC21:
	.string	"variable_declaration_statement\n"
.LC22:
	.string	"return_statement: \"NULL\"\n"
.LC23:
	.string	"return_statement\n"
.LC24:
	.string	"break_statement: \"NULL\"\n"
.LC25:
	.string	"continue_statement: \"NULL\"\n"
.LC26:
	.string	"expression_statement: \"NULL\"\n"
.LC27:
	.string	"expression_statement\n"
.LC28:
	.string	"unknown_StatementType: %u\n"
	.text
	.type	output_statement, @function
output_statement:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; statement, statement
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:143:     switch (statement->type) {
	movq	-8(%rbp), %rax	; statement, tmp98
	movl	8(%rax), %eax	; statement_19(D)->type, _1
; src/output.c:143:     switch (statement->type) {
	cmpl	$7, %eax	;, _1
	ja	.L37	;,
	movl	%eax, %eax	; _1, tmp99
	leaq	0(,%rax,4), %rdx	;, tmp100
	leaq	.L39(%rip), %rax	;, tmp101
	movl	(%rdx,%rax), %eax	;, tmp102
	cltq
	leaq	.L39(%rip), %rdx	;, tmp105
	addq	%rdx, %rax	; tmp105, tmp104
	jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
	.align 4
.L39:
	.long	.L46-.L39
	.long	.L45-.L39
	.long	.L44-.L39
	.long	.L43-.L39
	.long	.L42-.L39
	.long	.L41-.L39
	.long	.L40-.L39
	.long	.L38-.L39
	.text
.L44:
; src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp106
	movq	-24(%rbp), %rsi	; indent, tmp107
	movq	-16(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rax	;, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp111
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; statement, tmp112
	movq	(%rax), %rax	; statement_19(D)->stmt.if_stmt, _3
	movq	-32(%rbp), %rdx	; indent_has_next, tmp113
	movq	-16(%rbp), %rsi	; outfile, tmp114
	movq	%rdx, %rcx	; tmp113,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_if	;
; src/output.c:147:             break;
	jmp	.L36	;
.L42:
; src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp115
	movq	-24(%rbp), %rsi	; indent, tmp116
	movq	-16(%rbp), %rax	; outfile, tmp117
	movq	%rdx, %rcx	; tmp115,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp117,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp118
	movq	%rax, %rcx	; tmp118,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rax	;, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp120
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; statement, tmp121
	movq	(%rax), %rax	; statement_19(D)->stmt.for_stmt, _5
	movq	-32(%rbp), %rdx	; indent_has_next, tmp122
	movq	-16(%rbp), %rsi	; outfile, tmp123
	movq	%rdx, %rcx	; tmp122,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_for	;
; src/output.c:151:             break;
	jmp	.L36	;
.L43:
; src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp124
	movq	-24(%rbp), %rsi	; indent, tmp125
	movq	-16(%rbp), %rax	; outfile, tmp126
	movq	%rdx, %rcx	; tmp124,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp126,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rax, %rcx	; tmp127,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp129
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; statement, tmp130
	movq	(%rax), %rax	; statement_19(D)->stmt.while_stmt, _7
	movq	-32(%rbp), %rdx	; indent_has_next, tmp131
	movq	-16(%rbp), %rsi	; outfile, tmp132
	movq	%rdx, %rcx	; tmp131,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_while	;
; src/output.c:155:             break;
	jmp	.L36	;
.L45:
; src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp133
	movq	-24(%rbp), %rsi	; indent, tmp134
	movq	-16(%rbp), %rax	; outfile, tmp135
	movq	%rdx, %rcx	; tmp133,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp135,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp136
	movq	%rax, %rcx	; tmp136,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp137
	movq	%rax, %rdi	; tmp137,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp138
	leaq	1(%rax), %rdi	;, _8
	movq	-8(%rbp), %rax	; statement, tmp139
	movq	(%rax), %rax	; statement_19(D)->stmt.var, _9
	movq	-32(%rbp), %rdx	; indent_has_next, tmp140
	movq	-16(%rbp), %rsi	; outfile, tmp141
	movq	%rdx, %rcx	; tmp140,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; _9,
	call	output_variable	;
; src/output.c:159:             break;
	jmp	.L36	;
.L41:
; src/output.c:161:             if (statement->stmt.expr == NULL) {
	movq	-8(%rbp), %rax	; statement, tmp142
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _10
; src/output.c:161:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	; _10
	jne	.L48	;,
; src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp143
	movq	-24(%rbp), %rsi	; indent, tmp144
	movq	-16(%rbp), %rax	; outfile, tmp145
	movq	%rdx, %rcx	; tmp143,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp145,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp146
	movq	%rax, %rcx	; tmp146,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:164:                 return;
	jmp	.L36	;
.L48:
; src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp148
	movq	-24(%rbp), %rsi	; indent, tmp149
	movq	-16(%rbp), %rax	; outfile, tmp150
	movq	%rdx, %rcx	; tmp148,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp150,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:167:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp153
	leaq	1(%rax), %rdi	;, _11
	movq	-8(%rbp), %rax	; statement, tmp154
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _12
	movq	-32(%rbp), %rdx	; indent_has_next, tmp155
	movq	-16(%rbp), %rsi	; outfile, tmp156
	movq	%rdx, %rcx	; tmp155,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_expression	;
; src/output.c:168:             break;
	jmp	.L36	;
.L40:
; src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp157
	movq	-24(%rbp), %rsi	; indent, tmp158
	movq	-16(%rbp), %rax	; outfile, tmp159
	movq	%rdx, %rcx	; tmp157,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp159,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp160
	movq	%rax, %rcx	; tmp160,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:171:             break;
	jmp	.L36	;
.L38:
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp162
	movq	-24(%rbp), %rsi	; indent, tmp163
	movq	-16(%rbp), %rax	; outfile, tmp164
	movq	%rdx, %rcx	; tmp162,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp164,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp165
	movq	%rax, %rcx	; tmp165,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:174:             break;
	jmp	.L36	;
.L46:
; src/output.c:176:             if (statement->stmt.expr == NULL) {
	movq	-8(%rbp), %rax	; statement, tmp167
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _13
; src/output.c:176:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	; _13
	jne	.L49	;,
; src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp168
	movq	-24(%rbp), %rsi	; indent, tmp169
	movq	-16(%rbp), %rax	; outfile, tmp170
	movq	%rdx, %rcx	; tmp168,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp170,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp171
	movq	%rax, %rcx	; tmp171,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rax	;, tmp172
	movq	%rax, %rdi	; tmp172,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:179:                 return;
	jmp	.L36	;
.L49:
; src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp173
	movq	-24(%rbp), %rsi	; indent, tmp174
	movq	-16(%rbp), %rax	; outfile, tmp175
	movq	%rdx, %rcx	; tmp173,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp175,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp176
	movq	%rax, %rcx	; tmp176,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp178
	leaq	1(%rax), %rdi	;, _14
	movq	-8(%rbp), %rax	; statement, tmp179
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _15
	movq	-32(%rbp), %rdx	; indent_has_next, tmp180
	movq	-16(%rbp), %rsi	; outfile, tmp181
	movq	%rdx, %rcx	; tmp180,
	movq	%rdi, %rdx	; _14,
	movq	%rax, %rdi	; _15,
	call	output_expression	;
; src/output.c:183:             break;
	jmp	.L36	;
.L37:
; src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp182
	movq	-24(%rbp), %rsi	; indent, tmp183
	movq	-16(%rbp), %rax	; outfile, tmp184
	movq	%rdx, %rcx	; tmp182,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp184,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	-8(%rbp), %rax	; statement, tmp185
	movl	8(%rax), %edx	; statement_19(D)->type, _16
	movq	-16(%rbp), %rax	; outfile, tmp186
	leaq	.LC28(%rip), %rcx	;, tmp187
	movq	%rcx, %rsi	; tmp187,
	movq	%rax, %rdi	; tmp186,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:186:             break;
	nop	
.L36:
; src/output.c:189: }
	leave	
	ret	
	.size	output_statement, .-output_statement
	.section	.rodata
.LC29:
	.string	"condition\n"
.LC30:
	.string	"else_if\n"
.LC31:
	.string	"else_body\n"
	.text
	.type	output_if, @function
output_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$80, %rsp	;,
	movq	%rdi, -56(%rbp)	; if_, if_
	movq	%rsi, -64(%rbp)	; outfile, outfile
	movq	%rdx, -72(%rbp)	; indent, indent
	movq	%rcx, -80(%rbp)	; indent_has_next, indent_has_next
; src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	-56(%rbp), %rax	; if_, tmp90
	movq	8(%rax), %rax	; if__13(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp91, body
; src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	-56(%rbp), %rax	; if_, tmp92
	movq	16(%rax), %rax	; if__13(D)->else_if, _2
	movq	%rax, %rdi	; _2,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp93, else_if_list
; src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	-56(%rbp), %rax	; if_, tmp94
	movq	24(%rax), %rax	; if__13(D)->else_body, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp95, else_body
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp96
	movq	-72(%rbp), %rsi	; indent, tmp97
	movq	-64(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rcx	; tmp96,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:195:     ast_output(0, false, "condition\n");
	movq	-64(%rbp), %rax	; outfile, tmp99
	movq	%rax, %rcx	; tmp99,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp101
	leaq	1(%rax), %rdi	;, _4
	movq	-56(%rbp), %rax	; if_, tmp102
	movq	(%rax), %rax	; if__13(D)->condition, _5
	movq	-80(%rbp), %rdx	; indent_has_next, tmp103
	movq	-64(%rbp), %rsi	; outfile, tmp104
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_expression	;
; src/output.c:197:     ast_output(0, false, "body\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp105
	movq	-72(%rbp), %rsi	; indent, tmp106
	movq	-64(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:197:     ast_output(0, false, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L51	;
.L52:
; src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp110
	leaq	1(%rax), %rdi	;, _6
	movq	-80(%rbp), %rdx	; indent_has_next, tmp111
	movq	-64(%rbp), %rsi	; outfile, tmp112
	movq	-32(%rbp), %rax	; statement, tmp113
	movq	%rdx, %rcx	; tmp111,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; tmp113,
	call	output_statement	;
.L51:
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp115, statement
; src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -32(%rbp)	;, statement
	jne	.L52	;,
; src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp116
	movq	-72(%rbp), %rsi	; indent, tmp117
	movq	-64(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rcx	; tmp116,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp118,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	-64(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC30(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	jmp	.L53	;
.L54:
; src/output.c:204:         output_else_if(else_if, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp121
	leaq	1(%rax), %rdi	;, _7
	movq	-80(%rbp), %rdx	; indent_has_next, tmp122
	movq	-64(%rbp), %rsi	; outfile, tmp123
	movq	-40(%rbp), %rax	; else_if, tmp124
	movq	%rdx, %rcx	; tmp122,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; tmp124,
	call	output_else_if	;
.L53:
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	-16(%rbp), %rax	; else_if_list, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp126, else_if
; src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	cmpq	$0, -40(%rbp)	;, else_if
	jne	.L54	;,
; src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	-80(%rbp), %rdx	; indent_has_next, tmp127
	movq	-72(%rbp), %rsi	; indent, tmp128
	movq	-64(%rbp), %rax	; outfile, tmp129
	movq	%rdx, %rcx	; tmp127,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp129,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	-64(%rbp), %rax	; outfile, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rax	;, tmp131
	movq	%rax, %rdi	; tmp131,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	jmp	.L55	;
.L56:
; src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-72(%rbp), %rax	; indent, tmp132
	leaq	1(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; indent_has_next, tmp133
	movq	-64(%rbp), %rsi	; outfile, tmp134
	movq	-32(%rbp), %rax	; statement, tmp135
	movq	%rdx, %rcx	; tmp133,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp135,
	call	output_statement	;
.L55:
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	-24(%rbp), %rax	; else_body, tmp136
	movq	%rax, %rdi	; tmp136,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp137, statement
; src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	cmpq	$0, -32(%rbp)	;, statement
	jne	.L56	;,
; src/output.c:209: }
	nop	
	nop	
	leave	
	ret	
	.size	output_if, .-output_if
	.type	output_else_if, @function
output_else_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; else_if, else_if
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
; src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	-24(%rbp), %rax	; else_if, tmp86
	movq	8(%rax), %rax	; else_if_7(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, body
; src/output.c:213:     ast_output(0, false, "condition\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp88
	movq	-40(%rbp), %rsi	; indent, tmp89
	movq	-32(%rbp), %rax	; outfile, tmp90
	movq	%rdx, %rcx	; tmp88,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp90,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:213:     ast_output(0, false, "condition\n");
	movq	-32(%rbp), %rax	; outfile, tmp91
	movq	%rax, %rcx	; tmp91,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp93
	leaq	1(%rax), %rdi	;, _2
	movq	-24(%rbp), %rax	; else_if, tmp94
	movq	(%rax), %rax	; else_if_7(D)->condition, _3
	movq	-48(%rbp), %rdx	; indent_has_next, tmp95
	movq	-32(%rbp), %rsi	; outfile, tmp96
	movq	%rdx, %rcx	; tmp95,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_expression	;
; src/output.c:215:     ast_output(0, true, "body\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp97
	movq	-40(%rbp), %rsi	; indent, tmp98
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rcx	; tmp97,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp99,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:215:     ast_output(0, true, "body\n");
	movq	-32(%rbp), %rax	; outfile, tmp100
	movq	%rax, %rcx	; tmp100,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L58	;
.L59:
; src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-48(%rbp), %rdx	; indent_has_next, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	-16(%rbp), %rax	; statement, tmp105
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp105,
	call	output_statement	;
.L58:
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp107, statement
; src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L59	;,
; src/output.c:220: }
	nop	
	nop	
	leave	
	ret	
	.size	output_else_if, .-output_else_if
	.section	.rodata
.LC32:
	.string	"initializer\n"
.LC33:
	.string	"initializer: \"NULL\"\n"
.LC34:
	.string	"condition: \"NULL\"\n"
.LC35:
	.string	"increment\n"
.LC36:
	.string	"increment: \"NULL\"\n"
	.text
	.type	output_for, @function
output_for:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; for_, for_
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
; src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	-24(%rbp), %rax	; for_, tmp93
	movq	24(%rax), %rax	; for__17(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp94, body
; src/output.c:224:     if (for_->initializer != NULL) {
	movq	-24(%rbp), %rax	; for_, tmp95
	movq	(%rax), %rax	; for__17(D)->initializer, _2
; src/output.c:224:     if (for_->initializer != NULL) {
	testq	%rax, %rax	; _2
	je	.L61	;,
; src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp96
	movq	-40(%rbp), %rsi	; indent, tmp97
	movq	-32(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rcx	; tmp96,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rax, %rcx	; tmp99,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp101
	leaq	1(%rax), %rdi	;, _3
	movq	-24(%rbp), %rax	; for_, tmp102
	movq	(%rax), %rax	; for__17(D)->initializer, _4
	movq	-48(%rbp), %rdx	; indent_has_next, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_variable	;
	jmp	.L62	;
.L61:
; src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp105
	movq	-40(%rbp), %rsi	; indent, tmp106
	movq	-32(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC33(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
.L62:
; src/output.c:229:     if (for_->condition != NULL) {
	movq	-24(%rbp), %rax	; for_, tmp110
	movq	8(%rax), %rax	; for__17(D)->condition, _5
; src/output.c:229:     if (for_->condition != NULL) {
	testq	%rax, %rax	; _5
	je	.L63	;,
; src/output.c:230:         ast_output(0, false, "condition\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp111
	movq	-40(%rbp), %rsi	; indent, tmp112
	movq	-32(%rbp), %rax	; outfile, tmp113
	movq	%rdx, %rcx	; tmp111,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp113,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:230:         ast_output(0, false, "condition\n");
	movq	-32(%rbp), %rax	; outfile, tmp114
	movq	%rax, %rcx	; tmp114,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp116
	leaq	1(%rax), %rdi	;, _6
	movq	-24(%rbp), %rax	; for_, tmp117
	movq	8(%rax), %rax	; for__17(D)->condition, _7
	movq	-48(%rbp), %rdx	; indent_has_next, tmp118
	movq	-32(%rbp), %rsi	; outfile, tmp119
	movq	%rdx, %rcx	; tmp118,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_expression	;
	jmp	.L64	;
.L63:
; src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp120
	movq	-40(%rbp), %rsi	; indent, tmp121
	movq	-32(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rcx	; tmp120,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp122,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
.L64:
; src/output.c:234:     if (for_->increment != NULL) {
	movq	-24(%rbp), %rax	; for_, tmp125
	movq	16(%rax), %rax	; for__17(D)->increment, _8
; src/output.c:234:     if (for_->increment != NULL) {
	testq	%rax, %rax	; _8
	je	.L65	;,
; src/output.c:235:         ast_output(0, false, "increment\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp126
	movq	-40(%rbp), %rsi	; indent, tmp127
	movq	-32(%rbp), %rax	; outfile, tmp128
	movq	%rdx, %rcx	; tmp126,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp128,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:235:         ast_output(0, false, "increment\n");
	movq	-32(%rbp), %rax	; outfile, tmp129
	movq	%rax, %rcx	; tmp129,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rax	;, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp131
	leaq	1(%rax), %rdi	;, _9
	movq	-24(%rbp), %rax	; for_, tmp132
	movq	16(%rax), %rax	; for__17(D)->increment, _10
	movq	-48(%rbp), %rdx	; indent_has_next, tmp133
	movq	-32(%rbp), %rsi	; outfile, tmp134
	movq	%rdx, %rcx	; tmp133,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_expression	;
	jmp	.L66	;
.L65:
; src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp135
	movq	-40(%rbp), %rsi	; indent, tmp136
	movq	-32(%rbp), %rax	; outfile, tmp137
	movq	%rdx, %rcx	; tmp135,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp137,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp138
	movq	%rax, %rcx	; tmp138,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*fwrite@GOTPCREL(%rip)	;
.L66:
; src/output.c:239:     ast_output(0, true, "body\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp140
	movq	-40(%rbp), %rsi	; indent, tmp141
	movq	-32(%rbp), %rax	; outfile, tmp142
	movq	%rdx, %rcx	; tmp140,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp142,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:239:     ast_output(0, true, "body\n");
	movq	-32(%rbp), %rax	; outfile, tmp143
	movq	%rax, %rcx	; tmp143,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp144
	movq	%rax, %rdi	; tmp144,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L67	;
.L68:
; src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp145
	leaq	1(%rax), %rdi	;, _11
	movq	-48(%rbp), %rdx	; indent_has_next, tmp146
	movq	-32(%rbp), %rsi	; outfile, tmp147
	movq	-16(%rbp), %rax	; statement, tmp148
	movq	%rdx, %rcx	; tmp146,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; tmp148,
	call	output_statement	;
.L67:
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp149
	movq	%rax, %rdi	; tmp149,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp150, statement
; src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L68	;,
; src/output.c:244: }
	nop	
	nop	
	leave	
	ret	
	.size	output_for, .-output_for
	.type	output_while, @function
output_while:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; while_, while_
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
; src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	-24(%rbp), %rax	; while_, tmp86
	movq	8(%rax), %rax	; while__7(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, body
; src/output.c:248:     ast_output(0, false, "condition\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp88
	movq	-40(%rbp), %rsi	; indent, tmp89
	movq	-32(%rbp), %rax	; outfile, tmp90
	movq	%rdx, %rcx	; tmp88,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp90,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:248:     ast_output(0, false, "condition\n");
	movq	-32(%rbp), %rax	; outfile, tmp91
	movq	%rax, %rcx	; tmp91,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp93
	leaq	1(%rax), %rdi	;, _2
	movq	-24(%rbp), %rax	; while_, tmp94
	movq	(%rax), %rax	; while__7(D)->condition, _3
	movq	-48(%rbp), %rdx	; indent_has_next, tmp95
	movq	-32(%rbp), %rsi	; outfile, tmp96
	movq	%rdx, %rcx	; tmp95,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_expression	;
; src/output.c:250:     ast_output(0, true, "body\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp97
	movq	-40(%rbp), %rsi	; indent, tmp98
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rcx	; tmp97,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp99,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:250:     ast_output(0, true, "body\n");
	movq	-32(%rbp), %rax	; outfile, tmp100
	movq	%rax, %rcx	; tmp100,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L70	;
.L71:
; src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-48(%rbp), %rdx	; indent_has_next, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	-16(%rbp), %rax	; statement, tmp105
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp105,
	call	output_statement	;
.L70:
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp107, statement
; src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L71	;,
; src/output.c:255: }
	nop	
	nop	
	leave	
	ret	
	.size	output_while, .-output_while
	.section	.rodata
.LC37:
	.string	"primary\n"
.LC38:
	.string	"UNKNOWN_OPERATOR"
.LC39:
	.string	"operator: \"%s\"\n"
.LC40:
	.string	"left\n"
.LC41:
	.string	"right\n"
	.text
	.type	output_expression, @function
output_expression:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; expression, expression
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; indent_has_next, indent_has_next
; src/output.c:258:     if (expression->operator == OP_NONE) {
	movq	-24(%rbp), %rax	; expression, tmp91
	movl	24(%rax), %eax	; expression_12(D)->operator, _1
; src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	;, _1
	jne	.L73	;,
; src/output.c:259:         ast_output(0, true, "primary\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp92
	movq	-40(%rbp), %rsi	; indent, tmp93
	movq	-32(%rbp), %rax	; outfile, tmp94
	movq	%rdx, %rcx	; tmp92,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp94,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:259:         ast_output(0, true, "primary\n");
	movq	-32(%rbp), %rax	; outfile, tmp95
	movq	%rax, %rcx	; tmp95,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC37(%rip), %rax	;, tmp96
	movq	%rax, %rdi	; tmp96,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp97
	leaq	1(%rax), %rdi	;, _2
	movq	-24(%rbp), %rax	; expression, tmp98
	movq	8(%rax), %rax	; expression_12(D)->prim_left, _3
	movq	-48(%rbp), %rdx	; indent_has_next, tmp99
	movq	-32(%rbp), %rsi	; outfile, tmp100
	movq	%rdx, %rcx	; tmp99,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_primary	;
; src/output.c:270: }
	jmp	.L77	;
.L73:
; src/output.c:262:         string op_str = operator_to_string(expression->operator);
	movq	-24(%rbp), %rax	; expression, tmp101
	movl	24(%rax), %eax	; expression_12(D)->operator, _4
	movl	%eax, %edi	; _4,
	call	*operator_to_string@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp102, op_str
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp103
	movq	-40(%rbp), %rsi	; indent, tmp104
	movq	-32(%rbp), %rax	; outfile, tmp105
	movq	%rdx, %rcx	; tmp103,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp105,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmpq	$0, -8(%rbp)	;, op_str
	je	.L75	;,
	movq	-8(%rbp), %rax	; op_str, iftmp.1_9
	jmp	.L76	;
.L75:
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC38(%rip), %rax	;, iftmp.1_9
.L76:
; src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	-32(%rbp), %rcx	; outfile, tmp106
	movq	%rax, %rdx	; iftmp.1_9,
	leaq	.LC39(%rip), %rax	;, tmp107
	movq	%rax, %rsi	; tmp107,
	movq	%rcx, %rdi	; tmp106,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:264:         ast_output(0, false, "left\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp108
	movq	-40(%rbp), %rsi	; indent, tmp109
	movq	-32(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:264:         ast_output(0, false, "left\n");
	movq	-32(%rbp), %rax	; outfile, tmp111
	movq	%rax, %rcx	; tmp111,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp113
	leaq	1(%rax), %rdi	;, _5
	movq	-24(%rbp), %rax	; expression, tmp114
	movq	(%rax), %rax	; expression_12(D)->expr_left, _6
	movq	-48(%rbp), %rdx	; indent_has_next, tmp115
	movq	-32(%rbp), %rsi	; outfile, tmp116
	movq	%rdx, %rcx	; tmp115,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_expression	;
; src/output.c:266:         ast_output(0, true, "right\n");
	movq	-48(%rbp), %rdx	; indent_has_next, tmp117
	movq	-40(%rbp), %rsi	; indent, tmp118
	movq	-32(%rbp), %rax	; outfile, tmp119
	movq	%rdx, %rcx	; tmp117,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp119,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:266:         ast_output(0, true, "right\n");
	movq	-32(%rbp), %rax	; outfile, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	-40(%rbp), %rax	; indent, tmp122
	leaq	1(%rax), %rdi	;, _7
	movq	-24(%rbp), %rax	; expression, tmp123
	movq	16(%rax), %rax	; expression_12(D)->right, _8
	movq	-48(%rbp), %rdx	; indent_has_next, tmp124
	movq	-32(%rbp), %rsi	; outfile, tmp125
	movq	%rdx, %rcx	; tmp124,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; _8,
	call	output_expression	;
.L77:
; src/output.c:270: }
	nop	
	leave	
	ret	
	.size	output_expression, .-output_expression
	.section	.rodata
.LC42:
	.string	"type: \"integer\"\n"
.LC43:
	.string	"value: %s\n"
.LC44:
	.string	"type: \"float\"\n"
.LC45:
	.string	"type: \"string\"\n"
.LC46:
	.string	"value: \"%s\"\n"
.LC47:
	.string	"type: \"boolean\"\n"
.LC48:
	.string	"value: \"true\"\n"
.LC49:
	.string	"value: \"false\"\n"
.LC50:
	.string	"type: \"expression\"\n"
.LC51:
	.string	"type: \"!\"\n"
.LC52:
	.string	"type: \"-\"\n"
.LC53:
	.string	"type: \"variable\"\n"
.LC54:
	.string	"unknown_PrimaryType: %u\n"
	.text
	.type	output_primary, @function
output_primary:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; primary, primary
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:273:     switch (primary->type) {
	movq	-8(%rbp), %rax	; primary, tmp95
	movl	8(%rax), %eax	; primary_16(D)->type, _1
; src/output.c:273:     switch (primary->type) {
	cmpl	$8, %eax	;, _1
	ja	.L79	;,
	movl	%eax, %eax	; _1, tmp96
	leaq	0(,%rax,4), %rdx	;, tmp97
	leaq	.L81(%rip), %rax	;, tmp98
	movl	(%rdx,%rax), %eax	;, tmp99
	cltq
	leaq	.L81(%rip), %rdx	;, tmp102
	addq	%rdx, %rax	; tmp102, tmp101
	jmp	*%rax	; tmp101
	.section	.rodata
	.align 4
	.align 4
.L81:
	.long	.L89-.L81
	.long	.L88-.L81
	.long	.L87-.L81
	.long	.L86-.L81
	.long	.L85-.L81
	.long	.L84-.L81
	.long	.L83-.L81
	.long	.L82-.L81
	.long	.L80-.L81
	.text
.L89:
; src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp103
	movq	-24(%rbp), %rsi	; indent, tmp104
	movq	-16(%rbp), %rax	; outfile, tmp105
	movq	%rdx, %rcx	; tmp103,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp105,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp106
	movq	%rax, %rcx	; tmp106,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp108
	movq	-24(%rbp), %rsi	; indent, tmp109
	movq	-16(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-8(%rbp), %rax	; primary, tmp111
	movq	(%rax), %rdx	; primary_16(D)->value.literal_value, _2
	movq	-16(%rbp), %rax	; outfile, tmp112
	leaq	.LC43(%rip), %rcx	;, tmp113
	movq	%rcx, %rsi	; tmp113,
	movq	%rax, %rdi	; tmp112,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:277:             break;
	jmp	.L90	;
.L88:
; src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp114
	movq	-24(%rbp), %rsi	; indent, tmp115
	movq	-16(%rbp), %rax	; outfile, tmp116
	movq	%rdx, %rcx	; tmp114,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp116,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp117
	movq	%rax, %rcx	; tmp117,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC44(%rip), %rax	;, tmp118
	movq	%rax, %rdi	; tmp118,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp119
	movq	-24(%rbp), %rsi	; indent, tmp120
	movq	-16(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rcx	; tmp119,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp121,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-8(%rbp), %rax	; primary, tmp122
	movq	(%rax), %rdx	; primary_16(D)->value.literal_value, _3
	movq	-16(%rbp), %rax	; outfile, tmp123
	leaq	.LC43(%rip), %rcx	;, tmp124
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:281:             break;
	jmp	.L90	;
.L87:
; src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp125
	movq	-24(%rbp), %rsi	; indent, tmp126
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rdx, %rcx	; tmp125,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp127,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp128
	movq	%rax, %rcx	; tmp128,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC45(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp130
	movq	-24(%rbp), %rsi	; indent, tmp131
	movq	-16(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	-8(%rbp), %rax	; primary, tmp133
	movq	(%rax), %rdx	; primary_16(D)->value.literal_value, _4
	movq	-16(%rbp), %rax	; outfile, tmp134
	leaq	.LC46(%rip), %rcx	;, tmp135
	movq	%rcx, %rsi	; tmp135,
	movq	%rax, %rdi	; tmp134,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:285:             break;
	jmp	.L90	;
.L86:
; src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp136
	movq	-24(%rbp), %rsi	; indent, tmp137
	movq	-16(%rbp), %rax	; outfile, tmp138
	movq	%rdx, %rcx	; tmp136,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp138,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp139
	movq	%rax, %rcx	; tmp139,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rax	;, tmp140
	movq	%rax, %rdi	; tmp140,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp141
	movq	-24(%rbp), %rsi	; indent, tmp142
	movq	-16(%rbp), %rax	; outfile, tmp143
	movq	%rdx, %rcx	; tmp141,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp143,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp144
	movq	%rax, %rcx	; tmp144,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rax	;, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:289:             break;
	jmp	.L90	;
.L85:
; src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp146
	movq	-24(%rbp), %rsi	; indent, tmp147
	movq	-16(%rbp), %rax	; outfile, tmp148
	movq	%rdx, %rcx	; tmp146,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp148,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp149
	movq	%rax, %rcx	; tmp149,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rax	;, tmp150
	movq	%rax, %rdi	; tmp150,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp151
	movq	-24(%rbp), %rsi	; indent, tmp152
	movq	-16(%rbp), %rax	; outfile, tmp153
	movq	%rdx, %rcx	; tmp151,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp153,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp154
	movq	%rax, %rcx	; tmp154,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rax	;, tmp155
	movq	%rax, %rdi	; tmp155,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:293:             break;
	jmp	.L90	;
.L84:
; src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp156
	movq	-24(%rbp), %rsi	; indent, tmp157
	movq	-16(%rbp), %rax	; outfile, tmp158
	movq	%rdx, %rcx	; tmp156,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp158,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp159
	movq	%rax, %rcx	; tmp159,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rax	;, tmp160
	movq	%rax, %rdi	; tmp160,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:296:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp161
	movq	-24(%rbp), %rsi	; indent, tmp162
	movq	-16(%rbp), %rax	; outfile, tmp163
	movq	%rdx, %rcx	; tmp161,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp163,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:296:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp164
	movq	%rax, %rcx	; tmp164,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp166
	leaq	1(%rax), %rdi	;, _5
	movq	-8(%rbp), %rax	; primary, tmp167
	movq	(%rax), %rax	; primary_16(D)->value.expr, _6
	movq	-32(%rbp), %rdx	; indent_has_next, tmp168
	movq	-16(%rbp), %rsi	; outfile, tmp169
	movq	%rdx, %rcx	; tmp168,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_expression	;
; src/output.c:298:             break;
	jmp	.L90	;
.L83:
; src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp170
	movq	-24(%rbp), %rsi	; indent, tmp171
	movq	-16(%rbp), %rax	; outfile, tmp172
	movq	%rdx, %rcx	; tmp170,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp172,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp173
	movq	%rax, %rcx	; tmp173,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rax	;, tmp174
	movq	%rax, %rdi	; tmp174,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:301:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp175
	movq	-24(%rbp), %rsi	; indent, tmp176
	movq	-16(%rbp), %rax	; outfile, tmp177
	movq	%rdx, %rcx	; tmp175,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp177,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:301:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp178
	movq	%rax, %rcx	; tmp178,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:302:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp180
	leaq	1(%rax), %rdi	;, _7
	movq	-8(%rbp), %rax	; primary, tmp181
	movq	(%rax), %rax	; primary_16(D)->value.operand, _8
	movq	-32(%rbp), %rdx	; indent_has_next, tmp182
	movq	-16(%rbp), %rsi	; outfile, tmp183
	movq	%rdx, %rcx	; tmp182,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; _8,
	call	output_primary	;
; src/output.c:303:             break;
	jmp	.L90	;
.L82:
; src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp184
	movq	-24(%rbp), %rsi	; indent, tmp185
	movq	-16(%rbp), %rax	; outfile, tmp186
	movq	%rdx, %rcx	; tmp184,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp186,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp187
	movq	%rax, %rcx	; tmp187,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:306:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp189
	movq	-24(%rbp), %rsi	; indent, tmp190
	movq	-16(%rbp), %rax	; outfile, tmp191
	movq	%rdx, %rcx	; tmp189,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp191,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:306:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp192
	movq	%rax, %rcx	; tmp192,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp193
	movq	%rax, %rdi	; tmp193,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp194
	leaq	1(%rax), %rdi	;, _9
	movq	-8(%rbp), %rax	; primary, tmp195
	movq	(%rax), %rax	; primary_16(D)->value.operand, _10
	movq	-32(%rbp), %rdx	; indent_has_next, tmp196
	movq	-16(%rbp), %rsi	; outfile, tmp197
	movq	%rdx, %rcx	; tmp196,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_primary	;
; src/output.c:308:             break;
	jmp	.L90	;
.L80:
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp198
	movq	-24(%rbp), %rsi	; indent, tmp199
	movq	-16(%rbp), %rax	; outfile, tmp200
	movq	%rdx, %rcx	; tmp198,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp200,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp201
	movq	%rax, %rcx	; tmp201,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rax	;, tmp202
	movq	%rax, %rdi	; tmp202,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:311:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp203
	movq	-24(%rbp), %rsi	; indent, tmp204
	movq	-16(%rbp), %rax	; outfile, tmp205
	movq	%rdx, %rcx	; tmp203,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp205,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:311:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp206
	movq	%rax, %rcx	; tmp206,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp207
	movq	%rax, %rdi	; tmp207,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp208
	leaq	1(%rax), %rdi	;, _11
	movq	-8(%rbp), %rax	; primary, tmp209
	movq	(%rax), %rax	; primary_16(D)->value.var, _12
	movq	-32(%rbp), %rdx	; indent_has_next, tmp210
	movq	-16(%rbp), %rsi	; outfile, tmp211
	movq	%rdx, %rcx	; tmp210,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_variable_access	;
; src/output.c:313:             break;
	jmp	.L90	;
.L79:
; src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp212
	movq	-24(%rbp), %rsi	; indent, tmp213
	movq	-16(%rbp), %rax	; outfile, tmp214
	movq	%rdx, %rcx	; tmp212,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp214,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	-8(%rbp), %rax	; primary, tmp215
	movl	8(%rax), %edx	; primary_16(D)->type, _13
	movq	-16(%rbp), %rax	; outfile, tmp216
	leaq	.LC54(%rip), %rcx	;, tmp217
	movq	%rcx, %rsi	; tmp217,
	movq	%rax, %rdi	; tmp216,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:316:             break;
	nop	
.L90:
; src/output.c:319: }
	nop	
	leave	
	ret	
	.size	output_primary, .-output_primary
	.section	.rodata
.LC55:
	.string	"type: \"name\"\n"
.LC56:
	.string	"type: \"function_call\"\n"
.LC57:
	.string	"arguments\n"
.LC58:
	.string	"arguments[%d]\n"
.LC59:
	.string	"type: \"get sequence_element\"\n"
.LC60:
	.string	"sequence\n"
.LC61:
	.string	"index\n"
.LC62:
	.string	"type: \"get_attribute\"\n"
.LC63:
	.string	"object\n"
.LC64:
	.string	"attribute_name\n"
	.align 8
.LC65:
	.string	"unknown_VariableAccessType: %u\n"
	.text
	.type	output_variable_access, @function
output_variable_access:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; variable_access, variable_access
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
	movq	%rcx, -64(%rbp)	; indent_has_next, indent_has_next
; src/output.c:324:     switch (variable_access->type) {
	movq	-40(%rbp), %rax	; variable_access, tmp99
	movl	16(%rax), %eax	; variable_access_22(D)->type, _1
; src/output.c:324:     switch (variable_access->type) {
	cmpl	$3, %eax	;, _1
	je	.L92	;,
	cmpl	$3, %eax	;, _1
	ja	.L93	;,
	cmpl	$2, %eax	;, _1
	je	.L94	;,
	cmpl	$2, %eax	;, _1
	ja	.L93	;,
	testl	%eax, %eax	; _1
	je	.L95	;,
	cmpl	$1, %eax	;, _1
	je	.L96	;,
	jmp	.L93	;
.L95:
; src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp100
	movq	-56(%rbp), %rsi	; indent, tmp101
	movq	-48(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:327:             ast_output(0, true, "name\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp105
	movq	-56(%rbp), %rsi	; indent, tmp106
	movq	-48(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:327:             ast_output(0, true, "name\n");
	movq	-48(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp110
	leaq	1(%rax), %rdi	;, _2
	movq	-40(%rbp), %rax	; variable_access, tmp111
	movq	8(%rax), %rax	; variable_access_22(D)->content.name, _3
	movq	-64(%rbp), %rdx	; indent_has_next, tmp112
	movq	-48(%rbp), %rsi	; outfile, tmp113
	movq	%rdx, %rcx	; tmp112,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_name	;
; src/output.c:329:             break;
	jmp	.L97	;
.L96:
; src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	-40(%rbp), %rax	; variable_access, tmp114
	movq	8(%rax), %rax	; variable_access_22(D)->content.args, _4
	movq	%rax, %rdi	; _4,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp115, args
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp116
	movq	-56(%rbp), %rsi	; indent, tmp117
	movq	-48(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rcx	; tmp116,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp118,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:333:             ast_output(0, false, "function\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp121
	movq	-56(%rbp), %rsi	; indent, tmp122
	movq	-48(%rbp), %rax	; outfile, tmp123
	movq	%rdx, %rcx	; tmp121,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp123,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:333:             ast_output(0, false, "function\n");
	movq	-48(%rbp), %rax	; outfile, tmp124
	movq	%rax, %rcx	; tmp124,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp126
	leaq	1(%rax), %rdi	;, _5
	movq	-40(%rbp), %rax	; variable_access, tmp127
	movq	(%rax), %rax	; variable_access_22(D)->base, _6
	movq	-64(%rbp), %rdx	; indent_has_next, tmp128
	movq	-48(%rbp), %rsi	; outfile, tmp129
	movq	%rdx, %rcx	; tmp128,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_variable_access	;
; src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp130
	movq	-56(%rbp), %rsi	; indent, tmp131
	movq	-48(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	-48(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:337:             index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L98	;
.L99:
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	-56(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rsi	;, _7
	movq	-64(%rbp), %rdx	; indent_has_next, tmp136
	movq	-48(%rbp), %rax	; outfile, tmp137
	movq	%rdx, %rcx	; tmp136,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp137,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp138
	movq	-48(%rbp), %rax	; outfile, tmp139
	leaq	.LC58(%rip), %rcx	;, tmp140
	movq	%rcx, %rsi	; tmp140,
	movq	%rax, %rdi	; tmp139,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp141
	leaq	2(%rax), %rdi	;, _8
	movq	-64(%rbp), %rdx	; indent_has_next, tmp142
	movq	-48(%rbp), %rsi	; outfile, tmp143
	movq	-24(%rbp), %rax	; arg, tmp144
	movq	%rdx, %rcx	; tmp142,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp144,
	call	output_expression	;
.L98:
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	-16(%rbp), %rax	; args, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp146, arg
; src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -24(%rbp)	;, arg
	jne	.L99	;,
; src/output.c:342:             break;
	jmp	.L97	;
.L92:
; src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp147
	movq	-56(%rbp), %rsi	; indent, tmp148
	movq	-48(%rbp), %rax	; outfile, tmp149
	movq	%rdx, %rcx	; tmp147,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp149,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp150
	movq	%rax, %rcx	; tmp150,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rax	;, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp152
	movq	-56(%rbp), %rsi	; indent, tmp153
	movq	-48(%rbp), %rax	; outfile, tmp154
	movq	%rdx, %rcx	; tmp152,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp154,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	-48(%rbp), %rax	; outfile, tmp155
	movq	%rax, %rcx	; tmp155,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rax	;, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp157
	leaq	1(%rax), %rdi	;, _9
	movq	-40(%rbp), %rax	; variable_access, tmp158
	movq	(%rax), %rax	; variable_access_22(D)->base, _10
	movq	-64(%rbp), %rdx	; indent_has_next, tmp159
	movq	-48(%rbp), %rsi	; outfile, tmp160
	movq	%rdx, %rcx	; tmp159,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_variable_access	;
; src/output.c:347:             ast_output(0, true, "index\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp161
	movq	-56(%rbp), %rsi	; indent, tmp162
	movq	-48(%rbp), %rax	; outfile, tmp163
	movq	%rdx, %rcx	; tmp161,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp163,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:347:             ast_output(0, true, "index\n");
	movq	-48(%rbp), %rax	; outfile, tmp164
	movq	%rax, %rcx	; tmp164,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp166
	leaq	1(%rax), %rdi	;, _11
	movq	-40(%rbp), %rax	; variable_access, tmp167
	movq	8(%rax), %rax	; variable_access_22(D)->content.index, _12
	movq	-64(%rbp), %rdx	; indent_has_next, tmp168
	movq	-48(%rbp), %rsi	; outfile, tmp169
	movq	%rdx, %rcx	; tmp168,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_expression	;
; src/output.c:349:             break;
	jmp	.L97	;
.L94:
; src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp170
	movq	-56(%rbp), %rsi	; indent, tmp171
	movq	-48(%rbp), %rax	; outfile, tmp172
	movq	%rdx, %rcx	; tmp170,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp172,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp173
	movq	%rax, %rcx	; tmp173,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rax	;, tmp174
	movq	%rax, %rdi	; tmp174,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:352:             ast_output(0, false, "object\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp175
	movq	-56(%rbp), %rsi	; indent, tmp176
	movq	-48(%rbp), %rax	; outfile, tmp177
	movq	%rdx, %rcx	; tmp175,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp177,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:352:             ast_output(0, false, "object\n");
	movq	-48(%rbp), %rax	; outfile, tmp178
	movq	%rax, %rcx	; tmp178,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp180
	leaq	1(%rax), %rdi	;, _13
	movq	-40(%rbp), %rax	; variable_access, tmp181
	movq	(%rax), %rax	; variable_access_22(D)->base, _14
	movq	-64(%rbp), %rdx	; indent_has_next, tmp182
	movq	-48(%rbp), %rsi	; outfile, tmp183
	movq	%rdx, %rcx	; tmp182,
	movq	%rdi, %rdx	; _13,
	movq	%rax, %rdi	; _14,
	call	output_variable_access	;
; src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	-64(%rbp), %rdx	; indent_has_next, tmp184
	movq	-56(%rbp), %rsi	; indent, tmp185
	movq	-48(%rbp), %rax	; outfile, tmp186
	movq	%rdx, %rcx	; tmp184,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp186,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	-48(%rbp), %rax	; outfile, tmp187
	movq	%rax, %rcx	; tmp187,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC64(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	-56(%rbp), %rax	; indent, tmp189
	leaq	1(%rax), %rdi	;, _15
	movq	-40(%rbp), %rax	; variable_access, tmp190
	movq	8(%rax), %rax	; variable_access_22(D)->content.attr_name, _16
	movq	-64(%rbp), %rdx	; indent_has_next, tmp191
	movq	-48(%rbp), %rsi	; outfile, tmp192
	movq	%rdx, %rcx	; tmp191,
	movq	%rdi, %rdx	; _15,
	movq	%rax, %rdi	; _16,
	call	output_name	;
; src/output.c:356:             break;
	jmp	.L97	;
.L93:
; src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	-64(%rbp), %rdx	; indent_has_next, tmp193
	movq	-56(%rbp), %rsi	; indent, tmp194
	movq	-48(%rbp), %rax	; outfile, tmp195
	movq	%rdx, %rcx	; tmp193,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp195,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	-40(%rbp), %rax	; variable_access, tmp196
	movl	16(%rax), %edx	; variable_access_22(D)->type, _17
	movq	-48(%rbp), %rax	; outfile, tmp197
	leaq	.LC65(%rip), %rcx	;, tmp198
	movq	%rcx, %rsi	; tmp198,
	movq	%rax, %rdi	; tmp197,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:359:             break;
	nop	
.L97:
; src/output.c:362: }
	nop	
	leave	
	ret	
	.size	output_variable_access, .-output_variable_access
	.section	.rodata
.LC66:
	.string	"Name: \"NULL\"\n"
.LC67:
	.string	"name: \"%s\"\n"
.LC68:
	.string	"id: %zu\n"
.LC69:
	.string	"kind: \"type\"\n"
.LC70:
	.string	"kind: \"variable\"\n"
.LC71:
	.string	"kind: \"function\"\n"
.LC72:
	.string	"kind: \"method\"\n"
.LC73:
	.string	"kind: \"class\"\n"
.LC74:
	.string	"kind: \"attribute\"\n"
.LC75:
	.string	"kind: \"parameter\"\n"
.LC76:
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; name, name
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
	movq	%rcx, -32(%rbp)	; indent_has_next, indent_has_next
; src/output.c:365:     if (name == NULL) {
	cmpq	$0, -8(%rbp)	;, name
	jne	.L101	;,
; src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp95
	movq	-24(%rbp), %rsi	; indent, tmp96
	movq	-16(%rbp), %rax	; outfile, tmp97
	movq	%rdx, %rcx	; tmp95,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp97,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp98
	movq	%rax, %rcx	; tmp98,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rax	;, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:368:         return;
	jmp	.L100	;
.L101:
; src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp100
	movq	-24(%rbp), %rsi	; indent, tmp101
	movq	-16(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	-8(%rbp), %rax	; name, tmp103
	movq	8(%rax), %rdx	; name_15(D)->name, _1
	movq	-16(%rbp), %rax	; outfile, tmp104
	leaq	.LC67(%rip), %rcx	;, tmp105
	movq	%rcx, %rsi	; tmp105,
	movq	%rax, %rdi	; tmp104,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	-32(%rbp), %rdx	; indent_has_next, tmp106
	movq	-24(%rbp), %rsi	; indent, tmp107
	movq	-16(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	-8(%rbp), %rax	; name, tmp109
	movq	16(%rax), %rdx	; name_15(D)->id, _2
	movq	-16(%rbp), %rax	; outfile, tmp110
	leaq	.LC68(%rip), %rcx	;, tmp111
	movq	%rcx, %rsi	; tmp111,
	movq	%rax, %rdi	; tmp110,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:372:     switch (name->kind) {
	movq	-8(%rbp), %rax	; name, tmp112
	movl	32(%rax), %eax	; name_15(D)->kind, _3
; src/output.c:372:     switch (name->kind) {
	cmpl	$6, %eax	;, _3
	ja	.L103	;,
	movl	%eax, %eax	; _3, tmp113
	leaq	0(,%rax,4), %rdx	;, tmp114
	leaq	.L105(%rip), %rax	;, tmp115
	movl	(%rdx,%rax), %eax	;, tmp116
	cltq
	leaq	.L105(%rip), %rdx	;, tmp119
	addq	%rdx, %rax	; tmp119, tmp118
	jmp	*%rax	; tmp118
	.section	.rodata
	.align 4
	.align 4
.L105:
	.long	.L111-.L105
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L104:
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp120
	movq	-24(%rbp), %rsi	; indent, tmp121
	movq	-16(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rcx	; tmp120,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp122,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC69(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:375:             break;
	jmp	.L100	;
.L108:
; src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp125
	movq	-24(%rbp), %rsi	; indent, tmp126
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rdx, %rcx	; tmp125,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp127,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp128
	movq	%rax, %rcx	; tmp128,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC70(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:378:             ast_output(0, true, "type\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp130
	movq	-24(%rbp), %rsi	; indent, tmp131
	movq	-16(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:378:             ast_output(0, true, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:379:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; name, tmp136
	movq	(%rax), %rax	; name_15(D)->type, _5
	movq	-32(%rbp), %rdx	; indent_has_next, tmp137
	movq	-16(%rbp), %rsi	; outfile, tmp138
	movq	%rdx, %rcx	; tmp137,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_name	;
; src/output.c:380:             break;
	jmp	.L100	;
.L110:
; src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp139
	movq	-24(%rbp), %rsi	; indent, tmp140
	movq	-16(%rbp), %rax	; outfile, tmp141
	movq	%rdx, %rcx	; tmp139,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp141,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp142
	movq	%rax, %rcx	; tmp142,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rax	;, tmp143
	movq	%rax, %rdi	; tmp143,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp144
	movq	-24(%rbp), %rsi	; indent, tmp145
	movq	-16(%rbp), %rax	; outfile, tmp146
	movq	%rdx, %rcx	; tmp144,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp146,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	-16(%rbp), %rax	; outfile, tmp147
	movq	%rax, %rcx	; tmp147,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp148
	movq	%rax, %rdi	; tmp148,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:384:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp149
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; name, tmp150
	movq	(%rax), %rax	; name_15(D)->type, _7
	movq	-32(%rbp), %rdx	; indent_has_next, tmp151
	movq	-16(%rbp), %rsi	; outfile, tmp152
	movq	%rdx, %rcx	; tmp151,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_name	;
; src/output.c:385:             break;
	jmp	.L100	;
.L109:
; src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp153
	movq	-24(%rbp), %rsi	; indent, tmp154
	movq	-16(%rbp), %rax	; outfile, tmp155
	movq	%rdx, %rcx	; tmp153,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp155,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp156
	movq	%rax, %rcx	; tmp156,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rax	;, tmp157
	movq	%rax, %rdi	; tmp157,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp158
	movq	-24(%rbp), %rsi	; indent, tmp159
	movq	-16(%rbp), %rax	; outfile, tmp160
	movq	%rdx, %rcx	; tmp158,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp160,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	-16(%rbp), %rax	; outfile, tmp161
	movq	%rax, %rcx	; tmp161,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:389:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp163
	leaq	1(%rax), %rdi	;, _8
	movq	-8(%rbp), %rax	; name, tmp164
	movq	(%rax), %rax	; name_15(D)->type, _9
	movq	-32(%rbp), %rdx	; indent_has_next, tmp165
	movq	-16(%rbp), %rsi	; outfile, tmp166
	movq	%rdx, %rcx	; tmp165,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; _9,
	call	output_name	;
; src/output.c:390:             break;
	jmp	.L100	;
.L111:
; src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp167
	movq	-24(%rbp), %rsi	; indent, tmp168
	movq	-16(%rbp), %rax	; outfile, tmp169
	movq	%rdx, %rcx	; tmp167,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp169,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp170
	movq	%rax, %rcx	; tmp170,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC73(%rip), %rax	;, tmp171
	movq	%rax, %rdi	; tmp171,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:393:             break;
	jmp	.L100	;
.L106:
; src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp172
	movq	-24(%rbp), %rsi	; indent, tmp173
	movq	-16(%rbp), %rax	; outfile, tmp174
	movq	%rdx, %rcx	; tmp172,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp174,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp175
	movq	%rax, %rcx	; tmp175,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC74(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:396:             ast_output(0, true, "type\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp177
	movq	-24(%rbp), %rsi	; indent, tmp178
	movq	-16(%rbp), %rax	; outfile, tmp179
	movq	%rdx, %rcx	; tmp177,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp179,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:396:             ast_output(0, true, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp180
	movq	%rax, %rcx	; tmp180,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp181
	movq	%rax, %rdi	; tmp181,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp182
	leaq	1(%rax), %rdi	;, _10
	movq	-8(%rbp), %rax	; name, tmp183
	movq	(%rax), %rax	; name_15(D)->type, _11
	movq	-32(%rbp), %rdx	; indent_has_next, tmp184
	movq	-16(%rbp), %rsi	; outfile, tmp185
	movq	%rdx, %rcx	; tmp184,
	movq	%rdi, %rdx	; _10,
	movq	%rax, %rdi	; _11,
	call	output_name	;
; src/output.c:398:             break;
	jmp	.L100	;
.L107:
; src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp186
	movq	-24(%rbp), %rsi	; indent, tmp187
	movq	-16(%rbp), %rax	; outfile, tmp188
	movq	%rdx, %rcx	; tmp186,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp188,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp189
	movq	%rax, %rcx	; tmp189,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC75(%rip), %rax	;, tmp190
	movq	%rax, %rdi	; tmp190,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:401:             ast_output(0, true, "type\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp191
	movq	-24(%rbp), %rsi	; indent, tmp192
	movq	-16(%rbp), %rax	; outfile, tmp193
	movq	%rdx, %rcx	; tmp191,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp193,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:401:             ast_output(0, true, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp194
	movq	%rax, %rcx	; tmp194,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp195
	movq	%rax, %rdi	; tmp195,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:402:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	-24(%rbp), %rax	; indent, tmp196
	leaq	1(%rax), %rdi	;, _12
	movq	-8(%rbp), %rax	; name, tmp197
	movq	(%rax), %rax	; name_15(D)->type, _13
	movq	-32(%rbp), %rdx	; indent_has_next, tmp198
	movq	-16(%rbp), %rsi	; outfile, tmp199
	movq	%rdx, %rcx	; tmp198,
	movq	%rdi, %rdx	; _12,
	movq	%rax, %rdi	; _13,
	call	output_name	;
; src/output.c:403:             break;
	jmp	.L100	;
.L103:
; src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	-32(%rbp), %rdx	; indent_has_next, tmp200
	movq	-24(%rbp), %rsi	; indent, tmp201
	movq	-16(%rbp), %rax	; outfile, tmp202
	movq	%rdx, %rcx	; tmp200,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp202,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp203
	movq	%rax, %rcx	; tmp203,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC76(%rip), %rax	;, tmp204
	movq	%rax, %rdi	; tmp204,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:406:             break;
	nop	
.L100:
; src/output.c:409: }
	leave	
	ret	
	.size	output_name, .-output_name
	.section	.rodata
.LC77:
	.string	"TAC: \"NULL\"\n"
.LC78:
	.string	"TAC {\n"
.LC79:
	.string	"designs: []\n"
.LC80:
	.string	"designs: [\n"
.LC81:
	.string	"]\n"
.LC82:
	.string	"entry_point: \"NULL\"\n"
.LC83:
	.string	"entry_point: %s\n"
.LC84:
	.string	"global: []\n"
.LC85:
	.string	"global: [\n"
.LC86:
	.string	"subroutines: []\n"
.LC87:
	.string	"subroutines: [\n"
.LC88:
	.string	"}\n"
	.text
	.globl	output_TAC
	.type	output_TAC, @function
output_TAC:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; tac, tac
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
; src/output.c:422:     if (tac == NULL) {
	cmpq	$0, -40(%rbp)	;, tac
	jne	.L113	;,
; src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	-56(%rbp), %rdx	; indent, tmp108
	movq	-48(%rbp), %rax	; outfile, tmp109
	movq	%rdx, %rsi	; tmp108,
	movq	%rax, %rdi	; tmp109,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp110
	movq	%rax, %rcx	; tmp110,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC77(%rip), %rax	;, tmp111
	movq	%rax, %rdi	; tmp111,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:425:         return;
	jmp	.L112	;
.L113:
; src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	-56(%rbp), %rdx	; indent, tmp112
	movq	-48(%rbp), %rax	; outfile, tmp113
	movq	%rdx, %rsi	; tmp112,
	movq	%rax, %rdi	; tmp113,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	-48(%rbp), %rax	; outfile, tmp114
	movq	%rax, %rcx	; tmp114,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC78(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	-40(%rbp), %rax	; tac, tmp116
	movq	(%rax), %rax	; tac_35(D)->attribute_tables, _1
	movq	%rax, %rdi	; _1,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	; _2
	je	.L115	;,
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	-56(%rbp), %rax	; indent, tmp117
	leaq	1(%rax), %rdx	;, _3
	movq	-48(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rsi	; _3,
	movq	%rax, %rdi	; tmp118,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	-48(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC79(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L116	;
.L115:
; src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	-56(%rbp), %rax	; indent, tmp121
	leaq	1(%rax), %rdx	;, _4
	movq	-48(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rsi	; _4,
	movq	%rax, %rdi	; tmp122,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	-48(%rbp), %rax	; outfile, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC80(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	jmp	.L117	;
.L118:
; src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	movq	-56(%rbp), %rax	; indent, tmp125
	leaq	2(%rax), %rdx	;, _5
	movq	-48(%rbp), %rcx	; outfile, tmp126
	movq	-8(%rbp), %rax	; attribute_table, tmp127
	movq	%rcx, %rsi	; tmp126,
	movq	%rax, %rdi	; tmp127,
	call	output_attribute_table	;
.L117:
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	-40(%rbp), %rax	; tac, tmp128
	movq	(%rax), %rax	; tac_35(D)->attribute_tables, _6
	movq	%rax, %rdi	; _6,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp129, attribute_table
; src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	cmpq	$0, -8(%rbp)	;, attribute_table
	jne	.L118	;,
; src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	-56(%rbp), %rax	; indent, tmp130
	leaq	1(%rax), %rdx	;, _7
	movq	-48(%rbp), %rax	; outfile, tmp131
	movq	%rdx, %rsi	; _7,
	movq	%rax, %rdi	; tmp131,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	-48(%rbp), %rax	; outfile, tmp132
	movq	%rax, %rcx	; tmp132,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rax	;, tmp133
	movq	%rax, %rdi	; tmp133,
	call	*fwrite@GOTPCREL(%rip)	;
.L116:
; src/output.c:437:     if (tac->entry_point == NULL)
	movq	-40(%rbp), %rax	; tac, tmp134
	movq	8(%rax), %rax	; tac_35(D)->entry_point, _8
; src/output.c:437:     if (tac->entry_point == NULL)
	testq	%rax, %rax	; _8
	jne	.L119	;,
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	-56(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdx	;, _9
	movq	-48(%rbp), %rax	; outfile, tmp136
	movq	%rdx, %rsi	; _9,
	movq	%rax, %rdi	; tmp136,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp137
	movq	%rax, %rcx	; tmp137,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC82(%rip), %rax	;, tmp138
	movq	%rax, %rdi	; tmp138,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L120	;
.L119:
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	-56(%rbp), %rax	; indent, tmp139
	leaq	1(%rax), %rdx	;, _10
	movq	-48(%rbp), %rax	; outfile, tmp140
	movq	%rdx, %rsi	; _10,
	movq	%rax, %rdi	; tmp140,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	-40(%rbp), %rax	; tac, tmp141
	movq	8(%rax), %rax	; tac_35(D)->entry_point, _11
	movq	8(%rax), %rdx	; _11->name, _12
	movq	-48(%rbp), %rax	; outfile, tmp142
	leaq	.LC83(%rip), %rcx	;, tmp143
	movq	%rcx, %rsi	; tmp143,
	movq	%rax, %rdi	; tmp142,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L120:
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	-40(%rbp), %rax	; tac, tmp144
	movq	16(%rax), %rax	; tac_35(D)->global_vars, _13
	movq	%rax, %rdi	; _13,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	; _14
	je	.L121	;,
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	-56(%rbp), %rax	; indent, tmp145
	leaq	1(%rax), %rdx	;, _15
	movq	-48(%rbp), %rax	; outfile, tmp146
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; tmp146,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	-48(%rbp), %rax	; outfile, tmp147
	movq	%rax, %rcx	; tmp147,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC84(%rip), %rax	;, tmp148
	movq	%rax, %rdi	; tmp148,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L122	;
.L121:
; src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	-56(%rbp), %rax	; indent, tmp149
	leaq	1(%rax), %rdx	;, _16
	movq	-48(%rbp), %rax	; outfile, tmp150
	movq	%rdx, %rsi	; _16,
	movq	%rax, %rdi	; tmp150,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	-48(%rbp), %rax	; outfile, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC85(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	jmp	.L123	;
.L124:
; src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	-56(%rbp), %rax	; indent, tmp153
	leaq	2(%rax), %rdx	;, _17
	movq	-48(%rbp), %rcx	; outfile, tmp154
	movq	-16(%rbp), %rax	; var, tmp155
	movq	%rcx, %rsi	; tmp154,
	movq	%rax, %rdi	; tmp155,
	call	output_var	;
.L123:
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	-40(%rbp), %rax	; tac, tmp156
	movq	16(%rax), %rax	; tac_35(D)->global_vars, _18
	movq	%rax, %rdi	; _18,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp157, var
; src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	cmpq	$0, -16(%rbp)	;, var
	jne	.L124	;,
; src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	-56(%rbp), %rax	; indent, tmp158
	leaq	1(%rax), %rdx	;, _19
	movq	-48(%rbp), %rax	; outfile, tmp159
	movq	%rdx, %rsi	; _19,
	movq	%rax, %rdi	; tmp159,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	-48(%rbp), %rax	; outfile, tmp160
	movq	%rax, %rcx	; tmp160,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fwrite@GOTPCREL(%rip)	;
.L122:
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	-40(%rbp), %rax	; tac, tmp162
	movq	24(%rax), %rax	; tac_35(D)->subroutines, _20
	movq	%rax, %rdi	; _20,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	; _21
	je	.L125	;,
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	-56(%rbp), %rax	; indent, tmp163
	leaq	1(%rax), %rdx	;, _22
	movq	-48(%rbp), %rax	; outfile, tmp164
	movq	%rdx, %rsi	; _22,
	movq	%rax, %rdi	; tmp164,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	-48(%rbp), %rax	; outfile, tmp165
	movq	%rax, %rcx	; tmp165,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC86(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L126	;
.L125:
; src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	-56(%rbp), %rax	; indent, tmp167
	leaq	1(%rax), %rdx	;, _23
	movq	-48(%rbp), %rax	; outfile, tmp168
	movq	%rdx, %rsi	; _23,
	movq	%rax, %rdi	; tmp168,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	-48(%rbp), %rax	; outfile, tmp169
	movq	%rax, %rcx	; tmp169,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC87(%rip), %rax	;, tmp170
	movq	%rax, %rdi	; tmp170,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	jmp	.L127	;
.L128:
; src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	movq	-56(%rbp), %rax	; indent, tmp171
	leaq	2(%rax), %rdx	;, _24
	movq	-48(%rbp), %rcx	; outfile, tmp172
	movq	-24(%rbp), %rax	; subroutine, tmp173
	movq	%rcx, %rsi	; tmp172,
	movq	%rax, %rdi	; tmp173,
	call	output_subroutine	;
.L127:
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	-40(%rbp), %rax	; tac, tmp174
	movq	24(%rax), %rax	; tac_35(D)->subroutines, _25
	movq	%rax, %rdi	; _25,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp175, subroutine
; src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	cmpq	$0, -24(%rbp)	;, subroutine
	jne	.L128	;,
; src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	-56(%rbp), %rax	; indent, tmp176
	leaq	1(%rax), %rdx	;, _26
	movq	-48(%rbp), %rax	; outfile, tmp177
	movq	%rdx, %rsi	; _26,
	movq	%rax, %rdi	; tmp177,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	-48(%rbp), %rax	; outfile, tmp178
	movq	%rax, %rcx	; tmp178,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
.L126:
; src/output.c:459:     tac_output(indent, "}\n");
	movq	-56(%rbp), %rdx	; indent, tmp180
	movq	-48(%rbp), %rax	; outfile, tmp181
	movq	%rdx, %rsi	; tmp180,
	movq	%rax, %rdi	; tmp181,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:459:     tac_output(indent, "}\n");
	movq	-48(%rbp), %rax	; outfile, tmp182
	movq	%rax, %rcx	; tmp182,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rax	;, tmp183
	movq	%rax, %rdi	; tmp183,
	call	*fwrite@GOTPCREL(%rip)	;
.L112:
; src/output.c:461: }
	leave	
	ret	
	.size	output_TAC, .-output_TAC
	.section	.rodata
.LC89:
	.string	"Subroutine: \"NULL\"\n"
.LC90:
	.string	"NULL {\n"
.LC91:
	.string	"%s {\n"
.LC92:
	.string	"return_type: \"NULL\"\n"
.LC93:
	.string	"return_type: %s\n"
.LC94:
	.string	"parameters: []\n"
.LC95:
	.string	"parameters: [\n"
.LC96:
	.string	"local: []\n"
.LC97:
	.string	"local: [\n"
.LC98:
	.string	"instructions: []\n"
.LC99:
	.string	"instructions: [\n"
	.text
	.type	output_subroutine, @function
output_subroutine:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; subroutine, subroutine
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
; src/output.c:464:     if (subroutine == NULL) {
	cmpq	$0, -40(%rbp)	;, subroutine
	jne	.L130	;,
; src/output.c:465:         tac_output(indent, "Subroutine: \"NULL\"\n");
	movq	-56(%rbp), %rdx	; indent, tmp111
	movq	-48(%rbp), %rax	; outfile, tmp112
	movq	%rdx, %rsi	; tmp111,
	movq	%rax, %rdi	; tmp112,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:465:         tac_output(indent, "Subroutine: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp113
	movq	%rax, %rcx	; tmp113,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC89(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:467:         return;
	jmp	.L129	;
.L130:
; src/output.c:469:     if (subroutine->name == NULL)
	movq	-40(%rbp), %rax	; subroutine, tmp115
	movq	(%rax), %rax	; subroutine_39(D)->name, _1
; src/output.c:469:     if (subroutine->name == NULL)
	testq	%rax, %rax	; _1
	jne	.L132	;,
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	-56(%rbp), %rdx	; indent, tmp116
	movq	-48(%rbp), %rax	; outfile, tmp117
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; tmp117,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	-48(%rbp), %rax	; outfile, tmp118
	movq	%rax, %rcx	; tmp118,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC90(%rip), %rax	;, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L133	;
.L132:
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	-56(%rbp), %rdx	; indent, tmp120
	movq	-48(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rsi	; tmp120,
	movq	%rax, %rdi	; tmp121,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	-40(%rbp), %rax	; subroutine, tmp122
	movq	(%rax), %rax	; subroutine_39(D)->name, _2
	movq	8(%rax), %rdx	; _2->name, _3
	movq	-48(%rbp), %rax	; outfile, tmp123
	leaq	.LC91(%rip), %rcx	;, tmp124
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L133:
; src/output.c:473:     if (subroutine->return_type == NULL)
	movq	-40(%rbp), %rax	; subroutine, tmp125
	movq	8(%rax), %rax	; subroutine_39(D)->return_type, _4
; src/output.c:473:     if (subroutine->return_type == NULL)
	testq	%rax, %rax	; _4
	jne	.L134	;,
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	-56(%rbp), %rax	; indent, tmp126
	leaq	1(%rax), %rdx	;, _5
	movq	-48(%rbp), %rax	; outfile, tmp127
	movq	%rdx, %rsi	; _5,
	movq	%rax, %rdi	; tmp127,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp128
	movq	%rax, %rcx	; tmp128,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC92(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L135	;
.L134:
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	-56(%rbp), %rax	; indent, tmp130
	leaq	1(%rax), %rdx	;, _6
	movq	-48(%rbp), %rax	; outfile, tmp131
	movq	%rdx, %rsi	; _6,
	movq	%rax, %rdi	; tmp131,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	-40(%rbp), %rax	; subroutine, tmp132
	movq	8(%rax), %rax	; subroutine_39(D)->return_type, _7
	movq	8(%rax), %rdx	; _7->name, _8
	movq	-48(%rbp), %rax	; outfile, tmp133
	leaq	.LC93(%rip), %rcx	;, tmp134
	movq	%rcx, %rsi	; tmp134,
	movq	%rax, %rdi	; tmp133,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L135:
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	-40(%rbp), %rax	; subroutine, tmp135
	movq	16(%rax), %rax	; subroutine_39(D)->parameters, _9
	movq	%rax, %rdi	; _9,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	; _10
	je	.L136	;,
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	-56(%rbp), %rax	; indent, tmp136
	leaq	1(%rax), %rdx	;, _11
	movq	-48(%rbp), %rax	; outfile, tmp137
	movq	%rdx, %rsi	; _11,
	movq	%rax, %rdi	; tmp137,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	-48(%rbp), %rax	; outfile, tmp138
	movq	%rax, %rcx	; tmp138,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC94(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L137	;
.L136:
; src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	-56(%rbp), %rax	; indent, tmp140
	leaq	1(%rax), %rdx	;, _12
	movq	-48(%rbp), %rax	; outfile, tmp141
	movq	%rdx, %rsi	; _12,
	movq	%rax, %rdi	; tmp141,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	-48(%rbp), %rax	; outfile, tmp142
	movq	%rax, %rcx	; tmp142,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC95(%rip), %rax	;, tmp143
	movq	%rax, %rdi	; tmp143,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	jmp	.L138	;
.L139:
; src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	-56(%rbp), %rax	; indent, tmp144
	leaq	2(%rax), %rdx	;, _13
	movq	-48(%rbp), %rcx	; outfile, tmp145
	movq	-8(%rbp), %rax	; parameter, tmp146
	movq	%rcx, %rsi	; tmp145,
	movq	%rax, %rdi	; tmp146,
	call	output_var	;
.L138:
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	-40(%rbp), %rax	; subroutine, tmp147
	movq	16(%rax), %rax	; subroutine_39(D)->parameters, _14
	movq	%rax, %rdi	; _14,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp148, parameter
; src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	cmpq	$0, -8(%rbp)	;, parameter
	jne	.L139	;,
; src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	-56(%rbp), %rax	; indent, tmp149
	leaq	1(%rax), %rdx	;, _15
	movq	-48(%rbp), %rax	; outfile, tmp150
	movq	%rdx, %rsi	; _15,
	movq	%rax, %rdi	; tmp150,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	-48(%rbp), %rax	; outfile, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*fwrite@GOTPCREL(%rip)	;
.L137:
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	-40(%rbp), %rax	; subroutine, tmp153
	movq	24(%rax), %rax	; subroutine_39(D)->local_vars, _16
	movq	%rax, %rdi	; _16,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	; _17
	je	.L140	;,
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	-56(%rbp), %rax	; indent, tmp154
	leaq	1(%rax), %rdx	;, _18
	movq	-48(%rbp), %rax	; outfile, tmp155
	movq	%rdx, %rsi	; _18,
	movq	%rax, %rdi	; tmp155,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	-48(%rbp), %rax	; outfile, tmp156
	movq	%rax, %rcx	; tmp156,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC96(%rip), %rax	;, tmp157
	movq	%rax, %rdi	; tmp157,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L141	;
.L140:
; src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	-56(%rbp), %rax	; indent, tmp158
	leaq	1(%rax), %rdx	;, _19
	movq	-48(%rbp), %rax	; outfile, tmp159
	movq	%rdx, %rsi	; _19,
	movq	%rax, %rdi	; tmp159,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	-48(%rbp), %rax	; outfile, tmp160
	movq	%rax, %rcx	; tmp160,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC97(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	jmp	.L142	;
.L143:
; src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	-56(%rbp), %rax	; indent, tmp162
	leaq	2(%rax), %rdx	;, _20
	movq	-48(%rbp), %rcx	; outfile, tmp163
	movq	-16(%rbp), %rax	; var, tmp164
	movq	%rcx, %rsi	; tmp163,
	movq	%rax, %rdi	; tmp164,
	call	output_var	;
.L142:
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	-40(%rbp), %rax	; subroutine, tmp165
	movq	24(%rax), %rax	; subroutine_39(D)->local_vars, _21
	movq	%rax, %rdi	; _21,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp166, var
; src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	cmpq	$0, -16(%rbp)	;, var
	jne	.L143	;,
; src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	-56(%rbp), %rax	; indent, tmp167
	leaq	1(%rax), %rdx	;, _22
	movq	-48(%rbp), %rax	; outfile, tmp168
	movq	%rdx, %rsi	; _22,
	movq	%rax, %rdi	; tmp168,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	-48(%rbp), %rax	; outfile, tmp169
	movq	%rax, %rcx	; tmp169,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rax	;, tmp170
	movq	%rax, %rdi	; tmp170,
	call	*fwrite@GOTPCREL(%rip)	;
.L141:
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	-40(%rbp), %rax	; subroutine, tmp171
	movq	32(%rax), %rax	; subroutine_39(D)->blocks, _23
	movq	%rax, %rdi	; _23,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	; _24
	je	.L144	;,
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	-56(%rbp), %rax	; indent, tmp172
	leaq	1(%rax), %rdx	;, _25
	movq	-48(%rbp), %rax	; outfile, tmp173
	movq	%rdx, %rsi	; _25,
	movq	%rax, %rdi	; tmp173,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	-48(%rbp), %rax	; outfile, tmp174
	movq	%rax, %rcx	; tmp174,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC98(%rip), %rax	;, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L145	;
.L144:
; src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	-56(%rbp), %rax	; indent, tmp176
	leaq	1(%rax), %rdx	;, _26
	movq	-48(%rbp), %rax	; outfile, tmp177
	movq	%rdx, %rsi	; _26,
	movq	%rax, %rdi	; tmp177,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	-48(%rbp), %rax	; outfile, tmp178
	movq	%rax, %rcx	; tmp178,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC99(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	jmp	.L146	;
.L147:
; src/output.c:501:             output_block(block, outfile, indent + 2);
	movq	-56(%rbp), %rax	; indent, tmp180
	leaq	2(%rax), %rdx	;, _27
	movq	-48(%rbp), %rcx	; outfile, tmp181
	movq	-24(%rbp), %rax	; block, tmp182
	movq	%rcx, %rsi	; tmp181,
	movq	%rax, %rdi	; tmp182,
	call	output_block	;
.L146:
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	-40(%rbp), %rax	; subroutine, tmp183
	movq	32(%rax), %rax	; subroutine_39(D)->blocks, _28
	movq	%rax, %rdi	; _28,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp184, block
; src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	cmpq	$0, -24(%rbp)	;, block
	jne	.L147	;,
; src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	-56(%rbp), %rax	; indent, tmp185
	leaq	1(%rax), %rdx	;, _29
	movq	-48(%rbp), %rax	; outfile, tmp186
	movq	%rdx, %rsi	; _29,
	movq	%rax, %rdi	; tmp186,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	-48(%rbp), %rax	; outfile, tmp187
	movq	%rax, %rcx	; tmp187,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC81(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	*fwrite@GOTPCREL(%rip)	;
.L145:
; src/output.c:504:     tac_output(indent, "}\n");
	movq	-56(%rbp), %rdx	; indent, tmp189
	movq	-48(%rbp), %rax	; outfile, tmp190
	movq	%rdx, %rsi	; tmp189,
	movq	%rax, %rdi	; tmp190,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:504:     tac_output(indent, "}\n");
	movq	-48(%rbp), %rax	; outfile, tmp191
	movq	%rax, %rcx	; tmp191,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rax	;, tmp192
	movq	%rax, %rdi	; tmp192,
	call	*fwrite@GOTPCREL(%rip)	;
.L129:
; src/output.c:506: }
	leave	
	ret	
	.size	output_subroutine, .-output_subroutine
	.section	.rodata
.LC100:
	.string	"Var: \"NULL\"\n"
.LC101:
	.string	"NULL\t%s\n"
.LC102:
	.string	"%s\t%s\n"
	.text
	.type	output_var, @function
output_var:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; var, var
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
; src/output.c:509:     if (var == NULL) {
	cmpq	$0, -8(%rbp)	;, var
	jne	.L149	;,
; src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	-24(%rbp), %rdx	; indent, tmp87
	movq	-16(%rbp), %rax	; outfile, tmp88
	movq	%rdx, %rsi	; tmp87,
	movq	%rax, %rdi	; tmp88,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp89
	movq	%rax, %rcx	; tmp89,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC100(%rip), %rax	;, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:512:         return;
	jmp	.L148	;
.L149:
; src/output.c:514:     if (var->type == NULL)
	movq	-8(%rbp), %rax	; var, tmp91
	movq	16(%rax), %rax	; var_7(D)->type, _1
; src/output.c:514:     if (var->type == NULL)
	testq	%rax, %rax	; _1
	jne	.L151	;,
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	-24(%rbp), %rdx	; indent, tmp92
	movq	-16(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rsi	; tmp92,
	movq	%rax, %rdi	; tmp93,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	-8(%rbp), %rax	; var, tmp94
	movq	8(%rax), %rdx	; var_7(D)->name, _2
	movq	-16(%rbp), %rax	; outfile, tmp95
	leaq	.LC101(%rip), %rcx	;, tmp96
	movq	%rcx, %rsi	; tmp96,
	movq	%rax, %rdi	; tmp95,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
	jmp	.L148	;
.L151:
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	-24(%rbp), %rdx	; indent, tmp97
	movq	-16(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rsi	; tmp97,
	movq	%rax, %rdi	; tmp98,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	-8(%rbp), %rax	; var, tmp99
	movq	8(%rax), %rcx	; var_7(D)->name, _3
	movq	-8(%rbp), %rax	; var, tmp100
	movq	16(%rax), %rax	; var_7(D)->type, _4
	movq	8(%rax), %rdx	; _4->name, _5
	movq	-16(%rbp), %rax	; outfile, tmp101
	leaq	.LC102(%rip), %rsi	;, tmp102
	movq	%rax, %rdi	; tmp101,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L148:
; src/output.c:519: }
	leave	
	ret	
	.size	output_var, .-output_var
	.section	.rodata
.LC103:
	.string	"Block: \"NULL\"\n"
.LC104:
	.string	"NULL "
.LC105:
	.string	"%s "
.LC106:
	.string	"{}\n"
.LC107:
	.string	"{\n"
	.text
	.type	output_block, @function
output_block:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; block, block
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
; src/output.c:522:     if (block == NULL) {
	cmpq	$0, -24(%rbp)	;, block
	jne	.L153	;,
; src/output.c:523:         tac_output(indent, "Block: \"NULL\"\n");
	movq	-40(%rbp), %rdx	; indent, tmp89
	movq	-32(%rbp), %rax	; outfile, tmp90
	movq	%rdx, %rsi	; tmp89,
	movq	%rax, %rdi	; tmp90,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:523:         tac_output(indent, "Block: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp91
	movq	%rax, %rcx	; tmp91,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC103(%rip), %rax	;, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:525:         return;
	jmp	.L152	;
.L153:
; src/output.c:527:     if (block->label == NULL)
	movq	-24(%rbp), %rax	; block, tmp93
	movq	(%rax), %rax	; block_11(D)->label, _1
; src/output.c:527:     if (block->label == NULL)
	testq	%rax, %rax	; _1
	jne	.L155	;,
; src/output.c:528:         tac_output(indent, "NULL ");
	movq	-40(%rbp), %rdx	; indent, tmp94
	movq	-32(%rbp), %rax	; outfile, tmp95
	movq	%rdx, %rsi	; tmp94,
	movq	%rax, %rdi	; tmp95,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:528:         tac_output(indent, "NULL ");
	movq	-32(%rbp), %rax	; outfile, tmp96
	movq	%rax, %rcx	; tmp96,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rax	;, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L156	;
.L155:
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	-40(%rbp), %rdx	; indent, tmp98
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rsi	; tmp98,
	movq	%rax, %rdi	; tmp99,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	-24(%rbp), %rax	; block, tmp100
	movq	(%rax), %rax	; block_11(D)->label, _2
	movq	8(%rax), %rdx	; _2->name, _3
	movq	-32(%rbp), %rax	; outfile, tmp101
	leaq	.LC105(%rip), %rcx	;, tmp102
	movq	%rcx, %rsi	; tmp102,
	movq	%rax, %rdi	; tmp101,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L156:
; src/output.c:531:     if (list_is_empty(block->instructions))
	movq	-24(%rbp), %rax	; block, tmp103
	movq	8(%rax), %rax	; block_11(D)->instructions, _4
	movq	%rax, %rdi	; _4,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:531:     if (list_is_empty(block->instructions))
	testb	%al, %al	; _5
	je	.L157	;,
; src/output.c:532:         tac_output(0, "{}\n");
	movq	-32(%rbp), %rax	; outfile, tmp104
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp104,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:532:         tac_output(0, "{}\n");
	movq	-32(%rbp), %rax	; outfile, tmp105
	movq	%rax, %rcx	; tmp105,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC106(%rip), %rax	;, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L152	;
.L157:
; src/output.c:534:         tac_output(0, "{\n");
	movq	-32(%rbp), %rax	; outfile, tmp107
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:534:         tac_output(0, "{\n");
	movq	-32(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC107(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	jmp	.L158	;
.L159:
; src/output.c:537:             output_instruction(instruction, outfile, indent + 1);
	movq	-40(%rbp), %rax	; indent, tmp110
	leaq	1(%rax), %rdx	;, _6
	movq	-32(%rbp), %rcx	; outfile, tmp111
	movq	-8(%rbp), %rax	; instruction, tmp112
	movq	%rcx, %rsi	; tmp111,
	movq	%rax, %rdi	; tmp112,
	call	output_instruction	;
.L158:
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	-24(%rbp), %rax	; block, tmp113
	movq	8(%rax), %rax	; block_11(D)->instructions, _7
	movq	%rax, %rdi	; _7,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp114, instruction
; src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	cmpq	$0, -8(%rbp)	;, instruction
	jne	.L159	;,
; src/output.c:538:         tac_output(indent, "}\n");
	movq	-40(%rbp), %rdx	; indent, tmp115
	movq	-32(%rbp), %rax	; outfile, tmp116
	movq	%rdx, %rsi	; tmp115,
	movq	%rax, %rdi	; tmp116,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:538:         tac_output(indent, "}\n");
	movq	-32(%rbp), %rax	; outfile, tmp117
	movq	%rax, %rcx	; tmp117,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rax	;, tmp118
	movq	%rax, %rdi	; tmp118,
	call	*fwrite@GOTPCREL(%rip)	;
.L152:
; src/output.c:541: }
	leave	
	ret	
	.size	output_block, .-output_block
	.section	.rodata
.LC108:
	.string	"\"NULL\""
.LC109:
	.string	"%lld"
.LC110:
	.string	"%f"
.LC111:
	.string	"true"
.LC112:
	.string	"false"
.LC113:
	.string	"void"
.LC114:
	.string	"NONE"
.LC115:
	.string	"unknown_ArgType: %u"
	.text
	.type	output_arg, @function
output_arg:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$16, %rsp	;,
	movq	%rdi, -8(%rbp)	; arg, arg
	movq	%rsi, -16(%rbp)	; outfile, outfile
; src/output.c:544:     if (arg == NULL) {
	cmpq	$0, -8(%rbp)	;, arg
	jne	.L161	;,
; src/output.c:545:         tac_output(0, "\"NULL\"");
	movq	-16(%rbp), %rax	; outfile, tmp95
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp95,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:545:         tac_output(0, "\"NULL\"");
	movq	-16(%rbp), %rax	; outfile, tmp96
	movq	%rax, %rcx	; tmp96,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC108(%rip), %rax	;, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:547:         return;
	jmp	.L160	;
.L161:
; src/output.c:549:     switch (arg->kind) {
	movq	-8(%rbp), %rax	; arg, tmp98
	movl	16(%rax), %eax	; arg_15(D)->kind, _1
; src/output.c:549:     switch (arg->kind) {
	cmpl	$8, %eax	;, _1
	ja	.L163	;,
	movl	%eax, %eax	; _1, tmp99
	leaq	0(,%rax,4), %rdx	;, tmp100
	leaq	.L165(%rip), %rax	;, tmp101
	movl	(%rdx,%rax), %eax	;, tmp102
	cltq
	leaq	.L165(%rip), %rdx	;, tmp105
	addq	%rdx, %rax	; tmp105, tmp104
	jmp	*%rax	; tmp104
	.section	.rodata
	.align 4
	.align 4
.L165:
	.long	.L173-.L165
	.long	.L172-.L165
	.long	.L171-.L165
	.long	.L170-.L165
	.long	.L169-.L165
	.long	.L168-.L165
	.long	.L167-.L165
	.long	.L166-.L165
	.long	.L164-.L165
	.text
.L173:
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	-16(%rbp), %rax	; outfile, tmp106
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp106,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	-8(%rbp), %rax	; arg, tmp107
	movq	(%rax), %rax	; arg_15(D)->value.variable, _2
	movq	8(%rax), %rax	; _2->name, _3
	movq	-16(%rbp), %rdx	; outfile, tmp108
	movq	%rdx, %rsi	; tmp108,
	movq	%rax, %rdi	; _3,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	jmp	.L160	;
.L172:
; src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	-16(%rbp), %rax	; outfile, tmp109
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp109,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	-8(%rbp), %rax	; arg, tmp110
	movq	(%rax), %rdx	; arg_15(D)->value.int_value, _4
	movq	-16(%rbp), %rax	; outfile, tmp111
	leaq	.LC109(%rip), %rcx	;, tmp112
	movq	%rcx, %rsi	; tmp112,
	movq	%rax, %rdi	; tmp111,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	jmp	.L160	;
.L171:
; src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	-16(%rbp), %rax	; outfile, tmp113
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp113,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	-8(%rbp), %rax	; arg, tmp114
	movq	(%rax), %rdx	; arg_15(D)->value.float_value, _5
	movq	-16(%rbp), %rax	; outfile, tmp115
	movq	%rdx, %xmm0	; _5,
	leaq	.LC110(%rip), %rdx	;, tmp116
	movq	%rdx, %rsi	; tmp116,
	movq	%rax, %rdi	; tmp115,
	movl	$1, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	jmp	.L160	;
.L170:
; src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movq	-16(%rbp), %rax	; outfile, tmp117
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp117,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movq	-8(%rbp), %rax	; arg, tmp118
	movq	(%rax), %rax	; arg_15(D)->value.string_value, _6
	movq	-16(%rbp), %rdx	; outfile, tmp119
	movq	%rdx, %rsi	; tmp119,
	movq	%rax, %rdi	; _6,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	jmp	.L160	;
.L169:
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	-16(%rbp), %rax	; outfile, tmp120
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	-8(%rbp), %rax	; arg, tmp121
	movzbl	(%rax), %eax	; arg_15(D)->value.bool_value, _7
	testb	%al, %al	; _7
	je	.L174	;,
	leaq	.LC111(%rip), %rax	;, iftmp.2_13
	jmp	.L175	;
.L174:
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	leaq	.LC112(%rip), %rax	;, iftmp.2_13
.L175:
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	-16(%rbp), %rdx	; outfile, tmp122
	movq	%rdx, %rsi	; tmp122,
	movq	%rax, %rdi	; iftmp.2_13,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	jmp	.L160	;
.L168:
; src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movq	-16(%rbp), %rax	; outfile, tmp123
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp123,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movq	-16(%rbp), %rax	; outfile, tmp124
	movq	%rax, %rcx	; tmp124,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC113(%rip), %rax	;, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	jmp	.L160	;
.L167:
; src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	-16(%rbp), %rax	; outfile, tmp126
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp126,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	-8(%rbp), %rax	; arg, tmp127
	movq	(%rax), %rax	; arg_15(D)->value.label, _8
	movq	8(%rax), %rax	; _8->name, _9
	movq	-16(%rbp), %rdx	; outfile, tmp128
	movq	%rdx, %rsi	; tmp128,
	movq	%rax, %rdi	; _9,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	jmp	.L160	;
.L166:
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	-16(%rbp), %rax	; outfile, tmp129
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp129,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	-8(%rbp), %rax	; arg, tmp130
	movq	(%rax), %rax	; arg_15(D)->value.subroutine, _10
	movq	8(%rax), %rax	; _10->name, _11
	movq	-16(%rbp), %rdx	; outfile, tmp131
	movq	%rdx, %rsi	; tmp131,
	movq	%rax, %rdi	; _11,
	call	*fputs@GOTPCREL(%rip)	;
; src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	jmp	.L160	;
.L164:
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	-16(%rbp), %rax	; outfile, tmp132
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	-16(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC114(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	jmp	.L160	;
.L163:
; src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	-16(%rbp), %rax	; outfile, tmp135
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp135,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	-8(%rbp), %rax	; arg, tmp136
	movl	16(%rax), %edx	; arg_15(D)->kind, _12
	movq	-16(%rbp), %rax	; outfile, tmp137
	leaq	.LC115(%rip), %rcx	;, tmp138
	movq	%rcx, %rsi	; tmp138,
	movq	%rax, %rdi	; tmp137,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	nop	
.L160:
; src/output.c:562: }
	leave	
	ret	
	.size	output_arg, .-output_arg
	.section	.rodata
.LC116:
	.string	"Instruction: \"NULL\"\n"
.LC117:
	.string	"add\t"
.LC118:
	.string	"sub\t"
.LC119:
	.string	"mul\t"
.LC120:
	.string	"div\t"
.LC121:
	.string	"mod\t"
.LC122:
	.string	"eq \t"
.LC123:
	.string	"ne \t"
.LC124:
	.string	"lt \t"
.LC125:
	.string	"gt \t"
.LC126:
	.string	"le \t"
.LC127:
	.string	"ge \t"
.LC128:
	.string	"and\t"
.LC129:
	.string	"or \t"
.LC130:
	.string	"not\t"
.LC131:
	.string	"assign\t"
.LC132:
	.string	"get_attr\t"
.LC133:
	.string	"get_elem\t"
.LC134:
	.string	"param\t"
.LC135:
	.string	"alloc\t"
.LC136:
	.string	"jmp_c\t"
.LC137:
	.string	"jmp\t"
.LC138:
	.string	"ret\t"
.LC139:
	.string	"call\t"
.LC140:
	.string	"load\t"
.LC141:
	.string	"store\t"
.LC142:
	.string	"INST_NONE\n"
.LC143:
	.string	"unknown_InstructionType: %u\n"
	.text
	.type	output_instruction, @function
output_instruction:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; instruction, instruction
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
; src/output.c:565:     if (instruction == NULL) {
	cmpq	$0, -8(%rbp)	;, instruction
	jne	.L177	;,
; src/output.c:566:         tac_output(indent, "Instruction: \"NULL\"\n");
	movq	-24(%rbp), %rdx	; indent, tmp97
	movq	-16(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rsi	; tmp97,
	movq	%rax, %rdi	; tmp98,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:566:         tac_output(indent, "Instruction: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp99
	movq	%rax, %rcx	; tmp99,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC116(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:568:         return;
	jmp	.L176	;
.L177:
; src/output.c:570:     switch (instruction->type) {
	movq	-8(%rbp), %rax	; instruction, tmp101
	movl	24(%rax), %eax	; instruction_11(D)->type, _1
; src/output.c:570:     switch (instruction->type) {
	cmpl	$25, %eax	;, _1
	ja	.L179	;,
	movl	%eax, %eax	; _1, tmp102
	leaq	0(,%rax,4), %rdx	;, tmp103
	leaq	.L181(%rip), %rax	;, tmp104
	movl	(%rdx,%rax), %eax	;, tmp105
	cltq
	leaq	.L181(%rip), %rdx	;, tmp108
	addq	%rdx, %rax	; tmp108, tmp107
	jmp	*%rax	; tmp107
	.section	.rodata
	.align 4
	.align 4
.L181:
	.long	.L206-.L181
	.long	.L205-.L181
	.long	.L204-.L181
	.long	.L203-.L181
	.long	.L202-.L181
	.long	.L201-.L181
	.long	.L200-.L181
	.long	.L199-.L181
	.long	.L198-.L181
	.long	.L197-.L181
	.long	.L196-.L181
	.long	.L195-.L181
	.long	.L194-.L181
	.long	.L193-.L181
	.long	.L192-.L181
	.long	.L191-.L181
	.long	.L190-.L181
	.long	.L189-.L181
	.long	.L188-.L181
	.long	.L187-.L181
	.long	.L186-.L181
	.long	.L185-.L181
	.long	.L184-.L181
	.long	.L183-.L181
	.long	.L182-.L181
	.long	.L180-.L181
	.text
.L206:
; src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp109
	movq	-16(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rsi	; tmp109,
	movq	%rax, %rdi	; tmp110,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp111
	movq	%rax, %rcx	; tmp111,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC117(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	jmp	.L207	;
.L205:
; src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp113
	movq	-16(%rbp), %rax	; outfile, tmp114
	movq	%rdx, %rsi	; tmp113,
	movq	%rax, %rdi	; tmp114,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp115
	movq	%rax, %rcx	; tmp115,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC118(%rip), %rax	;, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	jmp	.L207	;
.L204:
; src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp117
	movq	-16(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rsi	; tmp117,
	movq	%rax, %rdi	; tmp118,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC119(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	jmp	.L207	;
.L203:
; src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp121
	movq	-16(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rsi	; tmp121,
	movq	%rax, %rdi	; tmp122,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC120(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	jmp	.L207	;
.L202:
; src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp125
	movq	-16(%rbp), %rax	; outfile, tmp126
	movq	%rdx, %rsi	; tmp125,
	movq	%rax, %rdi	; tmp126,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rax, %rcx	; tmp127,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC121(%rip), %rax	;, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	jmp	.L207	;
.L201:
; src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp129
	movq	-16(%rbp), %rax	; outfile, tmp130
	movq	%rdx, %rsi	; tmp129,
	movq	%rax, %rdi	; tmp130,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp131
	movq	%rax, %rcx	; tmp131,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC122(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	jmp	.L207	;
.L200:
; src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp133
	movq	-16(%rbp), %rax	; outfile, tmp134
	movq	%rdx, %rsi	; tmp133,
	movq	%rax, %rdi	; tmp134,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp135
	movq	%rax, %rcx	; tmp135,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC123(%rip), %rax	;, tmp136
	movq	%rax, %rdi	; tmp136,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	jmp	.L207	;
.L199:
; src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp137
	movq	-16(%rbp), %rax	; outfile, tmp138
	movq	%rdx, %rsi	; tmp137,
	movq	%rax, %rdi	; tmp138,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp139
	movq	%rax, %rcx	; tmp139,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC124(%rip), %rax	;, tmp140
	movq	%rax, %rdi	; tmp140,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	jmp	.L207	;
.L198:
; src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp141
	movq	-16(%rbp), %rax	; outfile, tmp142
	movq	%rdx, %rsi	; tmp141,
	movq	%rax, %rdi	; tmp142,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp143
	movq	%rax, %rcx	; tmp143,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC125(%rip), %rax	;, tmp144
	movq	%rax, %rdi	; tmp144,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	jmp	.L207	;
.L197:
; src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp145
	movq	-16(%rbp), %rax	; outfile, tmp146
	movq	%rdx, %rsi	; tmp145,
	movq	%rax, %rdi	; tmp146,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp147
	movq	%rax, %rcx	; tmp147,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC126(%rip), %rax	;, tmp148
	movq	%rax, %rdi	; tmp148,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	jmp	.L207	;
.L196:
; src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp149
	movq	-16(%rbp), %rax	; outfile, tmp150
	movq	%rdx, %rsi	; tmp149,
	movq	%rax, %rdi	; tmp150,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC127(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	jmp	.L207	;
.L195:
; src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp153
	movq	-16(%rbp), %rax	; outfile, tmp154
	movq	%rdx, %rsi	; tmp153,
	movq	%rax, %rdi	; tmp154,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp155
	movq	%rax, %rcx	; tmp155,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC128(%rip), %rax	;, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	jmp	.L207	;
.L194:
; src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp157
	movq	-16(%rbp), %rax	; outfile, tmp158
	movq	%rdx, %rsi	; tmp157,
	movq	%rax, %rdi	; tmp158,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp159
	movq	%rax, %rcx	; tmp159,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC129(%rip), %rax	;, tmp160
	movq	%rax, %rdi	; tmp160,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	jmp	.L207	;
.L193:
; src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp161
	movq	-16(%rbp), %rax	; outfile, tmp162
	movq	%rdx, %rsi	; tmp161,
	movq	%rax, %rdi	; tmp162,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp163
	movq	%rax, %rcx	; tmp163,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC130(%rip), %rax	;, tmp164
	movq	%rax, %rdi	; tmp164,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	jmp	.L207	;
.L192:
; src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp165
	movq	-16(%rbp), %rax	; outfile, tmp166
	movq	%rdx, %rsi	; tmp165,
	movq	%rax, %rdi	; tmp166,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp167
	movq	%rax, %rcx	; tmp167,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC131(%rip), %rax	;, tmp168
	movq	%rax, %rdi	; tmp168,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	jmp	.L207	;
.L191:
; src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp169
	movq	-16(%rbp), %rax	; outfile, tmp170
	movq	%rdx, %rsi	; tmp169,
	movq	%rax, %rdi	; tmp170,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp171
	movq	%rax, %rcx	; tmp171,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC132(%rip), %rax	;, tmp172
	movq	%rax, %rdi	; tmp172,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	jmp	.L207	;
.L190:
; src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp173
	movq	-16(%rbp), %rax	; outfile, tmp174
	movq	%rdx, %rsi	; tmp173,
	movq	%rax, %rdi	; tmp174,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp175
	movq	%rax, %rcx	; tmp175,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC133(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	jmp	.L207	;
.L189:
; src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp177
	movq	-16(%rbp), %rax	; outfile, tmp178
	movq	%rdx, %rsi	; tmp177,
	movq	%rax, %rdi	; tmp178,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp179
	movq	%rax, %rcx	; tmp179,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC134(%rip), %rax	;, tmp180
	movq	%rax, %rdi	; tmp180,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	jmp	.L207	;
.L188:
; src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp181
	movq	-16(%rbp), %rax	; outfile, tmp182
	movq	%rdx, %rsi	; tmp181,
	movq	%rax, %rdi	; tmp182,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp183
	movq	%rax, %rcx	; tmp183,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC135(%rip), %rax	;, tmp184
	movq	%rax, %rdi	; tmp184,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	jmp	.L207	;
.L187:
; src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp185
	movq	-16(%rbp), %rax	; outfile, tmp186
	movq	%rdx, %rsi	; tmp185,
	movq	%rax, %rdi	; tmp186,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp187
	movq	%rax, %rcx	; tmp187,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC136(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	jmp	.L207	;
.L186:
; src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp189
	movq	-16(%rbp), %rax	; outfile, tmp190
	movq	%rdx, %rsi	; tmp189,
	movq	%rax, %rdi	; tmp190,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp191
	movq	%rax, %rcx	; tmp191,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC137(%rip), %rax	;, tmp192
	movq	%rax, %rdi	; tmp192,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	jmp	.L207	;
.L185:
; src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp193
	movq	-16(%rbp), %rax	; outfile, tmp194
	movq	%rdx, %rsi	; tmp193,
	movq	%rax, %rdi	; tmp194,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp195
	movq	%rax, %rcx	; tmp195,
	movl	$4, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC138(%rip), %rax	;, tmp196
	movq	%rax, %rdi	; tmp196,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	jmp	.L207	;
.L184:
; src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp197
	movq	-16(%rbp), %rax	; outfile, tmp198
	movq	%rdx, %rsi	; tmp197,
	movq	%rax, %rdi	; tmp198,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp199
	movq	%rax, %rcx	; tmp199,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC139(%rip), %rax	;, tmp200
	movq	%rax, %rdi	; tmp200,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	jmp	.L207	;
.L183:
; src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp201
	movq	-16(%rbp), %rax	; outfile, tmp202
	movq	%rdx, %rsi	; tmp201,
	movq	%rax, %rdi	; tmp202,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp203
	movq	%rax, %rcx	; tmp203,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC140(%rip), %rax	;, tmp204
	movq	%rax, %rdi	; tmp204,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	jmp	.L207	;
.L182:
; src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	-24(%rbp), %rdx	; indent, tmp205
	movq	-16(%rbp), %rax	; outfile, tmp206
	movq	%rdx, %rsi	; tmp205,
	movq	%rax, %rdi	; tmp206,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	-16(%rbp), %rax	; outfile, tmp207
	movq	%rax, %rcx	; tmp207,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC141(%rip), %rax	;, tmp208
	movq	%rax, %rdi	; tmp208,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	jmp	.L207	;
.L180:
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	-24(%rbp), %rdx	; indent, tmp209
	movq	-16(%rbp), %rax	; outfile, tmp210
	movq	%rdx, %rsi	; tmp209,
	movq	%rax, %rdi	; tmp210,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	-16(%rbp), %rax	; outfile, tmp211
	movq	%rax, %rcx	; tmp211,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC142(%rip), %rax	;, tmp212
	movq	%rax, %rdi	; tmp212,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	jmp	.L176	;
.L179:
; src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	-24(%rbp), %rdx	; indent, tmp213
	movq	-16(%rbp), %rax	; outfile, tmp214
	movq	%rdx, %rsi	; tmp213,
	movq	%rax, %rdi	; tmp214,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	-8(%rbp), %rax	; instruction, tmp215
	movl	24(%rax), %edx	; instruction_11(D)->type, _2
	movq	-16(%rbp), %rax	; outfile, tmp216
	leaq	.LC143(%rip), %rcx	;, tmp217
	movq	%rcx, %rsi	; tmp217,
	movq	%rax, %rdi	; tmp216,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:600:             return;
	jmp	.L176	;
.L207:
; src/output.c:602:     output_arg(instruction->arg1, outfile);
	movq	-8(%rbp), %rax	; instruction, tmp218
	movq	(%rax), %rax	; instruction_11(D)->arg1, _3
	movq	-16(%rbp), %rdx	; outfile, tmp219
	movq	%rdx, %rsi	; tmp219,
	movq	%rax, %rdi	; _3,
	call	output_arg	;
; src/output.c:603:     switch (instruction->type) {
	movq	-8(%rbp), %rax	; instruction, tmp220
	movl	24(%rax), %eax	; instruction_11(D)->type, _4
	cmpl	$24, %eax	;, _4
	seta	%dl	;, _83
; src/output.c:603:     switch (instruction->type) {
	testb	%dl, %dl	; _83
	jne	.L213	;,
	movl	$1, %edx	;, tmp221
	movl	%eax, %ecx	; _4, tmp238
	salq	%cl, %rdx	; tmp238, tmp221
	movq	%rdx, %rax	; tmp221, _84
	movq	%rax, %rdx	; _84, _85
	andl	$4825087, %edx	;, _85
	testq	%rdx, %rdx	; _85
	setne	%dl	;, _86
	testb	%dl, %dl	; _86
	jne	.L209	;,
	movq	%rax, %rdx	; _84, _87
	andl	$25583616, %edx	;, _87
	testq	%rdx, %rdx	; _87
	setne	%dl	;, _88
	testb	%dl, %dl	; _88
	jne	.L210	;,
	andl	$3145728, %eax	;, _89
	testq	%rax, %rax	; _89
	setne	%al	;, _90
	testb	%al, %al	; _90
	jne	.L214	;,
; src/output.c:641:             return;
	jmp	.L213	;
.L209:
; src/output.c:621:             tac_output(0, " ");
	movq	-16(%rbp), %rax	; outfile, tmp222
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp222,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:621:             tac_output(0, " ");
	movq	-16(%rbp), %rax	; outfile, tmp223
	movq	%rax, %rsi	; tmp223,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:622:             output_arg(instruction->arg2, outfile);
	movq	-8(%rbp), %rax	; instruction, tmp224
	movq	8(%rax), %rax	; instruction_11(D)->arg2, _5
	movq	-16(%rbp), %rdx	; outfile, tmp225
	movq	%rdx, %rsi	; tmp225,
	movq	%rax, %rdi	; _5,
	call	output_arg	;
; src/output.c:623:             tac_output(0, " ");
	movq	-16(%rbp), %rax	; outfile, tmp226
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp226,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:623:             tac_output(0, " ");
	movq	-16(%rbp), %rax	; outfile, tmp227
	movq	%rax, %rsi	; tmp227,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:624:             output_arg(instruction->arg3, outfile);
	movq	-8(%rbp), %rax	; instruction, tmp228
	movq	16(%rax), %rax	; instruction_11(D)->arg3, _6
	movq	-16(%rbp), %rdx	; outfile, tmp229
	movq	%rdx, %rsi	; tmp229,
	movq	%rax, %rdi	; _6,
	call	output_arg	;
; src/output.c:625:             break;
	jmp	.L212	;
.L210:
; src/output.c:632:             tac_output(0, " ");
	movq	-16(%rbp), %rax	; outfile, tmp230
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp230,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:632:             tac_output(0, " ");
	movq	-16(%rbp), %rax	; outfile, tmp231
	movq	%rax, %rsi	; tmp231,
	movl	$32, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
; src/output.c:633:             output_arg(instruction->arg2, outfile);
	movq	-8(%rbp), %rax	; instruction, tmp232
	movq	8(%rax), %rax	; instruction_11(D)->arg2, _7
	movq	-16(%rbp), %rdx	; outfile, tmp233
	movq	%rdx, %rsi	; tmp233,
	movq	%rax, %rdi	; _7,
	call	output_arg	;
; src/output.c:634:             break;
	jmp	.L212	;
.L214:
; src/output.c:637:             break;
	nop	
.L212:
; src/output.c:643:     tac_output(0, "\n");
	movq	-16(%rbp), %rax	; outfile, tmp234
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp234,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:643:     tac_output(0, "\n");
	movq	-16(%rbp), %rax	; outfile, tmp235
	movq	%rax, %rsi	; tmp235,
	movl	$10, %edi	;,
	call	*fputc@GOTPCREL(%rip)	;
	jmp	.L176	;
.L213:
; src/output.c:641:             return;
	nop	
.L176:
; src/output.c:645: }
	leave	
	ret	
	.size	output_instruction, .-output_instruction
	.section	.rodata
.LC144:
	.string	"AttributeTable: \"NULL\"\n"
.LC145:
	.string	"%zu "
	.text
	.type	output_attribute_table, @function
output_attribute_table:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; attribute_table, attribute_table
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
; src/output.c:648:     if (attribute_table == NULL) {
	cmpq	$0, -24(%rbp)	;, attribute_table
	jne	.L216	;,
; src/output.c:649:         tac_output(indent, "AttributeTable: \"NULL\"\n");
	movq	-40(%rbp), %rdx	; indent, tmp90
	movq	-32(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rsi	; tmp90,
	movq	%rax, %rdi	; tmp91,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:649:         tac_output(indent, "AttributeTable: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$23, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC144(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:651:         return;
	jmp	.L215	;
.L216:
; src/output.c:653:     if (attribute_table->name == NULL)
	movq	-24(%rbp), %rax	; attribute_table, tmp94
	movq	8(%rax), %rax	; attribute_table_12(D)->name, _1
; src/output.c:653:     if (attribute_table->name == NULL)
	testq	%rax, %rax	; _1
	jne	.L218	;,
; src/output.c:654:         tac_output(indent, "NULL ");
	movq	-40(%rbp), %rdx	; indent, tmp95
	movq	-32(%rbp), %rax	; outfile, tmp96
	movq	%rdx, %rsi	; tmp95,
	movq	%rax, %rdi	; tmp96,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:654:         tac_output(indent, "NULL ");
	movq	-32(%rbp), %rax	; outfile, tmp97
	movq	%rax, %rcx	; tmp97,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rax	;, tmp98
	movq	%rax, %rdi	; tmp98,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L219	;
.L218:
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	-40(%rbp), %rdx	; indent, tmp99
	movq	-32(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rsi	; tmp99,
	movq	%rax, %rdi	; tmp100,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	-24(%rbp), %rax	; attribute_table, tmp101
	movq	8(%rax), %rax	; attribute_table_12(D)->name, _2
	movq	8(%rax), %rdx	; _2->name, _3
	movq	-32(%rbp), %rax	; outfile, tmp102
	leaq	.LC105(%rip), %rcx	;, tmp103
	movq	%rcx, %rsi	; tmp103,
	movq	%rax, %rdi	; tmp102,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L219:
; src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movq	-32(%rbp), %rax	; outfile, tmp104
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp104,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movq	-24(%rbp), %rax	; attribute_table, tmp105
	movq	16(%rax), %rdx	; attribute_table_12(D)->size, _4
	movq	-32(%rbp), %rax	; outfile, tmp106
	leaq	.LC145(%rip), %rcx	;, tmp107
	movq	%rcx, %rsi	; tmp107,
	movq	%rax, %rdi	; tmp106,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	movq	-24(%rbp), %rax	; attribute_table, tmp108
	movq	(%rax), %rax	; attribute_table_12(D)->attributes, _5
	movq	%rax, %rdi	; _5,
	call	*list_is_empty@GOTPCREL(%rip)	;
; src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	; _6
	je	.L220	;,
; src/output.c:659:         tac_output(0, "{}\n");
	movq	-32(%rbp), %rax	; outfile, tmp109
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp109,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:659:         tac_output(0, "{}\n");
	movq	-32(%rbp), %rax	; outfile, tmp110
	movq	%rax, %rcx	; tmp110,
	movl	$3, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC106(%rip), %rax	;, tmp111
	movq	%rax, %rdi	; tmp111,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L215	;
.L220:
; src/output.c:661:         tac_output(0, "{\n");
	movq	-32(%rbp), %rax	; outfile, tmp112
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp112,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:661:         tac_output(0, "{\n");
	movq	-32(%rbp), %rax	; outfile, tmp113
	movq	%rax, %rcx	; tmp113,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC107(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	jmp	.L221	;
.L222:
; src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	movq	-40(%rbp), %rax	; indent, tmp115
	leaq	1(%rax), %rdx	;, _7
	movq	-32(%rbp), %rcx	; outfile, tmp116
	movq	-8(%rbp), %rax	; attribute, tmp117
	movq	%rcx, %rsi	; tmp116,
	movq	%rax, %rdi	; tmp117,
	call	output_attribute	;
.L221:
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	-24(%rbp), %rax	; attribute_table, tmp118
	movq	(%rax), %rax	; attribute_table_12(D)->attributes, _8
	movq	%rax, %rdi	; _8,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp119, attribute
; src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	cmpq	$0, -8(%rbp)	;, attribute
	jne	.L222	;,
; src/output.c:665:         tac_output(indent, "}\n");
	movq	-40(%rbp), %rdx	; indent, tmp120
	movq	-32(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rsi	; tmp120,
	movq	%rax, %rdi	; tmp121,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:665:         tac_output(indent, "}\n");
	movq	-32(%rbp), %rax	; outfile, tmp122
	movq	%rax, %rcx	; tmp122,
	movl	$2, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC88(%rip), %rax	;, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*fwrite@GOTPCREL(%rip)	;
.L215:
; src/output.c:668: }
	leave	
	ret	
	.size	output_attribute_table, .-output_attribute_table
	.section	.rodata
.LC146:
	.string	"Attribute: \"NULL\"\n"
.LC147:
	.string	"NULL\t"
.LC148:
	.string	"%s\t"
.LC149:
	.string	"%zu\n"
	.text
	.type	output_attribute, @function
output_attribute:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$32, %rsp	;,
	movq	%rdi, -8(%rbp)	; attribute, attribute
	movq	%rsi, -16(%rbp)	; outfile, outfile
	movq	%rdx, -24(%rbp)	; indent, indent
; src/output.c:671:     if (attribute == NULL) {
	cmpq	$0, -8(%rbp)	;, attribute
	jne	.L224	;,
; src/output.c:672:         tac_output(indent, "Attribute: \"NULL\"\n");
	movq	-24(%rbp), %rdx	; indent, tmp89
	movq	-16(%rbp), %rax	; outfile, tmp90
	movq	%rdx, %rsi	; tmp89,
	movq	%rax, %rdi	; tmp90,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:672:         tac_output(indent, "Attribute: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp91
	movq	%rax, %rcx	; tmp91,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC146(%rip), %rax	;, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:674:         return;
	jmp	.L223	;
.L224:
; src/output.c:676:     if (attribute->type == NULL)
	movq	-8(%rbp), %rax	; attribute, tmp93
	movq	8(%rax), %rax	; attribute_11(D)->type, _1
; src/output.c:676:     if (attribute->type == NULL)
	testq	%rax, %rax	; _1
	jne	.L226	;,
; src/output.c:677:         tac_output(indent, "NULL\t");
	movq	-24(%rbp), %rdx	; indent, tmp94
	movq	-16(%rbp), %rax	; outfile, tmp95
	movq	%rdx, %rsi	; tmp94,
	movq	%rax, %rdi	; tmp95,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:677:         tac_output(indent, "NULL\t");
	movq	-16(%rbp), %rax	; outfile, tmp96
	movq	%rax, %rcx	; tmp96,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC147(%rip), %rax	;, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L227	;
.L226:
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	-24(%rbp), %rdx	; indent, tmp98
	movq	-16(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rsi	; tmp98,
	movq	%rax, %rdi	; tmp99,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	-8(%rbp), %rax	; attribute, tmp100
	movq	8(%rax), %rax	; attribute_11(D)->type, _2
	movq	8(%rax), %rdx	; _2->name, _3
	movq	-16(%rbp), %rax	; outfile, tmp101
	leaq	.LC148(%rip), %rcx	;, tmp102
	movq	%rcx, %rsi	; tmp102,
	movq	%rax, %rdi	; tmp101,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L227:
; src/output.c:680:     if (attribute->var == NULL)
	movq	-8(%rbp), %rax	; attribute, tmp103
	movq	(%rax), %rax	; attribute_11(D)->var, _4
; src/output.c:680:     if (attribute->var == NULL)
	testq	%rax, %rax	; _4
	jne	.L228	;,
; src/output.c:681:         tac_output(0, "NULL ");
	movq	-16(%rbp), %rax	; outfile, tmp104
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp104,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:681:         tac_output(0, "NULL ");
	movq	-16(%rbp), %rax	; outfile, tmp105
	movq	%rax, %rcx	; tmp105,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC104(%rip), %rax	;, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*fwrite@GOTPCREL(%rip)	;
	jmp	.L229	;
.L228:
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	-16(%rbp), %rax	; outfile, tmp107
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	-8(%rbp), %rax	; attribute, tmp108
	movq	(%rax), %rax	; attribute_11(D)->var, _5
	movq	8(%rax), %rdx	; _5->name, _6
	movq	-16(%rbp), %rax	; outfile, tmp109
	leaq	.LC105(%rip), %rcx	;, tmp110
	movq	%rcx, %rsi	; tmp110,
	movq	%rax, %rdi	; tmp109,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L229:
; src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movq	-16(%rbp), %rax	; outfile, tmp111
	movl	$0, %esi	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention_tac@GOTPCREL(%rip)	;
; src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movq	-8(%rbp), %rax	; attribute, tmp112
	movq	16(%rax), %rdx	; attribute_11(D)->offset, _7
	movq	-16(%rbp), %rax	; outfile, tmp113
	leaq	.LC149(%rip), %rcx	;, tmp114
	movq	%rcx, %rsi	; tmp114,
	movq	%rax, %rdi	; tmp113,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
.L223:
; src/output.c:686: }
	leave	
	ret	
	.size	output_attribute, .-output_attribute
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

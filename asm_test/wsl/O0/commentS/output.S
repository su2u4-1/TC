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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:22:     switch (code_member->type) {
	movq	-8(%rbp), %rax	; code_member, tmp90
	movl	8(%rax), %eax	; code_member_11(D)->type, _1
; src/output.c:22:     switch (code_member->type) {
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
; src/output.c:24:             ast_output(0, false, "import\n");
	movq	-32(%rbp), %rdx	; parser, tmp91
	movq	-24(%rbp), %rsi	; indent, tmp92
	movq	-16(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rcx	; tmp91,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp93,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:24:             ast_output(0, false, "import\n");
	movq	-16(%rbp), %rax	; outfile, tmp94
	movq	%rax, %rcx	; tmp94,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:25:             output_import(code_member->content.import, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp96
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; code_member, tmp97
	movq	(%rax), %rax	; code_member_11(D)->content.import, _3
	movq	-32(%rbp), %rdx	; parser, tmp98
	movq	-16(%rbp), %rsi	; outfile, tmp99
	movq	%rdx, %rcx	; tmp98,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_import	;
; src/output.c:26:             break;
	jmp	.L6	;
.L5:
; src/output.c:28:             ast_output(0, false, "function\n");
	movq	-32(%rbp), %rdx	; parser, tmp100
	movq	-24(%rbp), %rsi	; indent, tmp101
	movq	-16(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:28:             ast_output(0, false, "function\n");
	movq	-16(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:29:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp105
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; code_member, tmp106
	movq	(%rax), %rax	; code_member_11(D)->content.function, _5
	movq	-32(%rbp), %rdx	; parser, tmp107
	movq	-16(%rbp), %rsi	; outfile, tmp108
	movq	%rdx, %rcx	; tmp107,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_function	;
; src/output.c:30:             break;
	jmp	.L6	;
.L2:
; src/output.c:32:             ast_output(0, false, "class\n");
	movq	-32(%rbp), %rdx	; parser, tmp109
	movq	-24(%rbp), %rsi	; indent, tmp110
	movq	-16(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:32:             ast_output(0, false, "class\n");
	movq	-16(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:33:             output_class(code_member->content.class, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp114
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; code_member, tmp115
	movq	(%rax), %rax	; code_member_11(D)->content.class, _7
	movq	-32(%rbp), %rdx	; parser, tmp116
	movq	-16(%rbp), %rsi	; outfile, tmp117
	movq	%rdx, %rcx	; tmp116,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_class	;
; src/output.c:34:             break;
	jmp	.L6	;
.L3:
; src/output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	-32(%rbp), %rdx	; parser, tmp118
	movq	-24(%rbp), %rsi	; indent, tmp119
	movq	-16(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp118,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:36:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	-8(%rbp), %rax	; code_member, tmp121
	movl	8(%rax), %edx	; code_member_11(D)->type, _8
	movq	-16(%rbp), %rax	; outfile, tmp122
	leaq	.LC3(%rip), %rcx	;, tmp123
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp122,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:37:             break;
	nop	
.L6:
; src/output.c:40: }
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:43:     list(CodeMember*) members = list_copy(code->members);
	movq	-24(%rbp), %rax	; code, tmp84
	movq	(%rax), %rax	; code_5(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, members
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L8	;
.L9:
; src/output.c:46:         output_code_member(member, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp86
	leaq	1(%rax), %rdi	;, _2
	movq	-48(%rbp), %rdx	; parser, tmp87
	movq	-32(%rbp), %rsi	; outfile, tmp88
	movq	-16(%rbp), %rax	; member, tmp89
	movq	%rdx, %rcx	; tmp87,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; tmp89,
	call	output_code_member	;
.L8:
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	; members, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp91, member
; src/output.c:45:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	;, member
	jne	.L9	;,
; src/output.c:48: }
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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:51:     ast_output(0, false, "name\n");
	movq	-32(%rbp), %rdx	; parser, tmp86
	movq	-24(%rbp), %rsi	; indent, tmp87
	movq	-16(%rbp), %rax	; outfile, tmp88
	movq	%rdx, %rcx	; tmp86,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp88,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:51:     ast_output(0, false, "name\n");
	movq	-16(%rbp), %rax	; outfile, tmp89
	movq	%rax, %rcx	; tmp89,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:52:     output_name(import->name, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp91
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; import, tmp92
	movq	(%rax), %rax	; import_11(D)->name, _2
	movq	-32(%rbp), %rdx	; parser, tmp93
	movq	-16(%rbp), %rsi	; outfile, tmp94
	movq	%rdx, %rcx	; tmp93,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	-32(%rbp), %rdx	; parser, tmp95
	movq	-24(%rbp), %rsi	; indent, tmp96
	movq	-16(%rbp), %rax	; outfile, tmp97
	movq	%rdx, %rcx	; tmp95,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp97,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	-8(%rbp), %rax	; import, tmp98
	movq	8(%rax), %rax	; import_11(D)->source, _3
	testq	%rax, %rax	; _3
	je	.L11	;,
	movq	-8(%rbp), %rax	; import, tmp99
	movq	8(%rax), %rax	; import_11(D)->source, iftmp.0_4
	jmp	.L12	;
.L11:
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC5(%rip), %rax	;, iftmp.0_4
.L12:
; src/output.c:53:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	-16(%rbp), %rcx	; outfile, tmp100
	movq	%rax, %rdx	; iftmp.0_4,
	leaq	.LC6(%rip), %rax	;, tmp101
	movq	%rax, %rsi	; tmp101,
	movq	%rcx, %rdi	; tmp100,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:55: }
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
	movq	%rcx, -80(%rbp)	; parser, parser
; src/output.c:58:     ast_output(0, false, "name\n");
	movq	-80(%rbp), %rdx	; parser, tmp91
	movq	-72(%rbp), %rsi	; indent, tmp92
	movq	-64(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rcx	; tmp91,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp93,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:58:     ast_output(0, false, "name\n");
	movq	-64(%rbp), %rax	; outfile, tmp94
	movq	%rax, %rcx	; tmp94,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:59:     output_name(function->name, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp96
	leaq	1(%rax), %rdi	;, _1
	movq	-56(%rbp), %rax	; function, tmp97
	movq	(%rax), %rax	; function_19(D)->name, _2
	movq	-80(%rbp), %rdx	; parser, tmp98
	movq	-64(%rbp), %rsi	; outfile, tmp99
	movq	%rdx, %rcx	; tmp98,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:60:     ast_output(0, false, "return_type\n");
	movq	-80(%rbp), %rdx	; parser, tmp100
	movq	-72(%rbp), %rsi	; indent, tmp101
	movq	-64(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:60:     ast_output(0, false, "return_type\n");
	movq	-64(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:61:     output_name(function->return_type, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp105
	leaq	1(%rax), %rdi	;, _3
	movq	-56(%rbp), %rax	; function, tmp106
	movq	8(%rax), %rax	; function_19(D)->return_type, _4
	movq	-80(%rbp), %rdx	; parser, tmp107
	movq	-64(%rbp), %rsi	; outfile, tmp108
	movq	%rdx, %rcx	; tmp107,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:62:     ast_output(0, false, "parameters\n");
	movq	-80(%rbp), %rdx	; parser, tmp109
	movq	-72(%rbp), %rsi	; indent, tmp110
	movq	-64(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:62:     ast_output(0, false, "parameters\n");
	movq	-64(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:63:     list(Variable*) parameters = list_copy(function->parameters);
	movq	-56(%rbp), %rax	; function, tmp114
	movq	16(%rax), %rax	; function_19(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp115, parameters
; src/output.c:64:     list(Statement*) body = list_copy(function->body);
	movq	-56(%rbp), %rax	; function, tmp116
	movq	24(%rax), %rax	; function_19(D)->body, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp117, body
; src/output.c:66:     int index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L14	;
.L15:
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	-72(%rbp), %rax	; indent, tmp118
	leaq	1(%rax), %rsi	;, _7
	movq	-80(%rbp), %rdx	; parser, tmp119
	movq	-64(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp119,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:68:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp121
	movq	-64(%rbp), %rax	; outfile, tmp122
	leaq	.LC9(%rip), %rcx	;, tmp123
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp122,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:69:         output_variable(parameter, outfile, indent + 2, parser);
	movq	-72(%rbp), %rax	; indent, tmp124
	leaq	2(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; parser, tmp125
	movq	-64(%rbp), %rsi	; outfile, tmp126
	movq	-32(%rbp), %rax	; parameter, tmp127
	movq	%rdx, %rcx	; tmp125,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp127,
	call	output_variable	;
.L14:
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	; parameters, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp129, parameter
; src/output.c:67:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	;, parameter
	jne	.L15	;,
; src/output.c:71:     ast_output(0, true, "body\n");
	movq	-80(%rbp), %rdx	; parser, tmp130
	movq	-72(%rbp), %rsi	; indent, tmp131
	movq	-64(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:71:     ast_output(0, true, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L16	;
.L17:
; src/output.c:74:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdi	;, _9
	movq	-80(%rbp), %rdx	; parser, tmp136
	movq	-64(%rbp), %rsi	; outfile, tmp137
	movq	-40(%rbp), %rax	; statement, tmp138
	movq	%rdx, %rcx	; tmp136,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; tmp138,
	call	output_statement	;
.L16:
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	; body, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp140, statement
; src/output.c:73:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	;, statement
	jne	.L17	;,
; src/output.c:76: }
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
	movq	%rcx, -80(%rbp)	; parser, parser
; src/output.c:79:     ast_output(0, false, "name\n");
	movq	-80(%rbp), %rdx	; parser, tmp91
	movq	-72(%rbp), %rsi	; indent, tmp92
	movq	-64(%rbp), %rax	; outfile, tmp93
	movq	%rdx, %rcx	; tmp91,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp93,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:79:     ast_output(0, false, "name\n");
	movq	-64(%rbp), %rax	; outfile, tmp94
	movq	%rax, %rcx	; tmp94,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp95
	movq	%rax, %rdi	; tmp95,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:80:     output_name(method->name, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp96
	leaq	1(%rax), %rdi	;, _1
	movq	-56(%rbp), %rax	; method, tmp97
	movq	(%rax), %rax	; method_19(D)->name, _2
	movq	-80(%rbp), %rdx	; parser, tmp98
	movq	-64(%rbp), %rsi	; outfile, tmp99
	movq	%rdx, %rcx	; tmp98,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:81:     ast_output(0, false, "return_type\n");
	movq	-80(%rbp), %rdx	; parser, tmp100
	movq	-72(%rbp), %rsi	; indent, tmp101
	movq	-64(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:81:     ast_output(0, false, "return_type\n");
	movq	-64(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:82:     output_name(method->return_type, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp105
	leaq	1(%rax), %rdi	;, _3
	movq	-56(%rbp), %rax	; method, tmp106
	movq	8(%rax), %rax	; method_19(D)->return_type, _4
	movq	-80(%rbp), %rdx	; parser, tmp107
	movq	-64(%rbp), %rsi	; outfile, tmp108
	movq	%rdx, %rcx	; tmp107,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:83:     ast_output(0, false, "parameters\n");
	movq	-80(%rbp), %rdx	; parser, tmp109
	movq	-72(%rbp), %rsi	; indent, tmp110
	movq	-64(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:83:     ast_output(0, false, "parameters\n");
	movq	-64(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:84:     list(Variable*) parameters = list_copy(method->parameters);
	movq	-56(%rbp), %rax	; method, tmp114
	movq	16(%rax), %rax	; method_19(D)->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp115, parameters
; src/output.c:85:     list(Statement*) body = list_copy(method->body);
	movq	-56(%rbp), %rax	; method, tmp116
	movq	24(%rax), %rax	; method_19(D)->body, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp117, body
; src/output.c:87:     int index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L19	;
.L20:
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	-72(%rbp), %rax	; indent, tmp118
	leaq	1(%rax), %rsi	;, _7
	movq	-80(%rbp), %rdx	; parser, tmp119
	movq	-64(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp119,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:89:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp121
	movq	-64(%rbp), %rax	; outfile, tmp122
	leaq	.LC9(%rip), %rcx	;, tmp123
	movq	%rcx, %rsi	; tmp123,
	movq	%rax, %rdi	; tmp122,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:90:         output_variable(parameter, outfile, indent + 2, parser);
	movq	-72(%rbp), %rax	; indent, tmp124
	leaq	2(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; parser, tmp125
	movq	-64(%rbp), %rsi	; outfile, tmp126
	movq	-32(%rbp), %rax	; parameter, tmp127
	movq	%rdx, %rcx	; tmp125,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp127,
	call	output_variable	;
.L19:
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	; parameters, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp129, parameter
; src/output.c:88:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	;, parameter
	jne	.L20	;,
; src/output.c:92:     ast_output(0, true, "body\n");
	movq	-80(%rbp), %rdx	; parser, tmp130
	movq	-72(%rbp), %rsi	; indent, tmp131
	movq	-64(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:92:     ast_output(0, true, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L21	;
.L22:
; src/output.c:95:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdi	;, _9
	movq	-80(%rbp), %rdx	; parser, tmp136
	movq	-64(%rbp), %rsi	; outfile, tmp137
	movq	-40(%rbp), %rax	; statement, tmp138
	movq	%rdx, %rcx	; tmp136,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; tmp138,
	call	output_statement	;
.L21:
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	; body, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp140, statement
; src/output.c:94:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	;, statement
	jne	.L22	;,
; src/output.c:97: }
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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:100:     switch (class_member->type) {
	movq	-8(%rbp), %rax	; class_member, tmp88
	movl	8(%rax), %eax	; class_member_9(D)->type, _1
; src/output.c:100:     switch (class_member->type) {
	testl	%eax, %eax	; _1
	je	.L24	;,
	cmpl	$1, %eax	;, _1
	je	.L25	;,
	jmp	.L28	;
.L24:
; src/output.c:102:             ast_output(0, false, "method\n");
	movq	-32(%rbp), %rdx	; parser, tmp89
	movq	-24(%rbp), %rsi	; indent, tmp90
	movq	-16(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rcx	; tmp89,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp91,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:102:             ast_output(0, false, "method\n");
	movq	-16(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:103:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp94
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; class_member, tmp95
	movq	(%rax), %rax	; class_member_9(D)->content.method, _3
	movq	-32(%rbp), %rdx	; parser, tmp96
	movq	-16(%rbp), %rsi	; outfile, tmp97
	movq	%rdx, %rcx	; tmp96,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_method	;
; src/output.c:104:             break;
	jmp	.L27	;
.L25:
; src/output.c:106:             ast_output(0, false, "variable\n");
	movq	-32(%rbp), %rdx	; parser, tmp98
	movq	-24(%rbp), %rsi	; indent, tmp99
	movq	-16(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rcx	; tmp98,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:106:             ast_output(0, false, "variable\n");
	movq	-16(%rbp), %rax	; outfile, tmp101
	movq	%rax, %rcx	; tmp101,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:107:             output_variable(class_member->content.variable, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; class_member, tmp104
	movq	(%rax), %rax	; class_member_9(D)->content.variable, _5
	movq	-32(%rbp), %rdx	; parser, tmp105
	movq	-16(%rbp), %rsi	; outfile, tmp106
	movq	%rdx, %rcx	; tmp105,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_variable	;
; src/output.c:108:             break;
	jmp	.L27	;
.L28:
; src/output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	-32(%rbp), %rdx	; parser, tmp107
	movq	-24(%rbp), %rsi	; indent, tmp108
	movq	-16(%rbp), %rax	; outfile, tmp109
	movq	%rdx, %rcx	; tmp107,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp109,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:110:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	-8(%rbp), %rax	; class_member, tmp110
	movl	8(%rax), %edx	; class_member_9(D)->type, _6
	movq	-16(%rbp), %rax	; outfile, tmp111
	leaq	.LC13(%rip), %rcx	;, tmp112
	movq	%rcx, %rsi	; tmp112,
	movq	%rax, %rdi	; tmp111,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:111:             break;
	nop	
.L27:
; src/output.c:114: }
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:117:     ast_output(0, false, "name\n");
	movq	-48(%rbp), %rdx	; parser, tmp86
	movq	-40(%rbp), %rsi	; indent, tmp87
	movq	-32(%rbp), %rax	; outfile, tmp88
	movq	%rdx, %rcx	; tmp86,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp88,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:117:     ast_output(0, false, "name\n");
	movq	-32(%rbp), %rax	; outfile, tmp89
	movq	%rax, %rcx	; tmp89,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:118:     output_name(class->name, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp91
	leaq	1(%rax), %rdi	;, _1
	movq	-24(%rbp), %rax	; class, tmp92
	movq	(%rax), %rax	; class_12(D)->name, _2
	movq	-48(%rbp), %rdx	; parser, tmp93
	movq	-32(%rbp), %rsi	; outfile, tmp94
	movq	%rdx, %rcx	; tmp93,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:119:     ast_output(0, true, "members\n");
	movq	-48(%rbp), %rdx	; parser, tmp95
	movq	-40(%rbp), %rsi	; indent, tmp96
	movq	-32(%rbp), %rax	; outfile, tmp97
	movq	%rdx, %rcx	; tmp95,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp97,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:119:     ast_output(0, true, "members\n");
	movq	-32(%rbp), %rax	; outfile, tmp98
	movq	%rax, %rcx	; tmp98,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rax	;, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:120:     list(ClassMember*) members = list_copy(class->members);
	movq	-24(%rbp), %rax	; class, tmp100
	movq	8(%rax), %rax	; class_12(D)->members, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp101, members
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L30	;
.L31:
; src/output.c:123:         output_class_member(member, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-48(%rbp), %rdx	; parser, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	-16(%rbp), %rax	; member, tmp105
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp105,
	call	output_class_member	;
.L30:
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	; members, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp107, member
; src/output.c:122:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	;, member
	jne	.L31	;,
; src/output.c:125: }
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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:128:     ast_output(0, false, "type\n");
	movq	-32(%rbp), %rdx	; parser, tmp89
	movq	-24(%rbp), %rsi	; indent, tmp90
	movq	-16(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rcx	; tmp89,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp91,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:128:     ast_output(0, false, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:129:     output_name(variable->type, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp94
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; variable, tmp95
	movq	(%rax), %rax	; variable_15(D)->type, _2
	movq	-32(%rbp), %rdx	; parser, tmp96
	movq	-16(%rbp), %rsi	; outfile, tmp97
	movq	%rdx, %rcx	; tmp96,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:130:     ast_output(0, false, "name\n");
	movq	-32(%rbp), %rdx	; parser, tmp98
	movq	-24(%rbp), %rsi	; indent, tmp99
	movq	-16(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rcx	; tmp98,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:130:     ast_output(0, false, "name\n");
	movq	-16(%rbp), %rax	; outfile, tmp101
	movq	%rax, %rcx	; tmp101,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:131:     output_name(variable->name, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _3
	movq	-8(%rbp), %rax	; variable, tmp104
	movq	8(%rax), %rax	; variable_15(D)->name, _4
	movq	-32(%rbp), %rdx	; parser, tmp105
	movq	-16(%rbp), %rsi	; outfile, tmp106
	movq	%rdx, %rcx	; tmp105,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:132:     if (variable->value != NULL) {
	movq	-8(%rbp), %rax	; variable, tmp107
	movq	16(%rax), %rax	; variable_15(D)->value, _5
; src/output.c:132:     if (variable->value != NULL) {
	testq	%rax, %rax	; _5
	je	.L33	;,
; src/output.c:133:         ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; parser, tmp108
	movq	-24(%rbp), %rsi	; indent, tmp109
	movq	-16(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:133:         ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp111
	movq	%rax, %rcx	; tmp111,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:134:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp113
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; variable, tmp114
	movq	16(%rax), %rax	; variable_15(D)->value, _7
	movq	-32(%rbp), %rdx	; parser, tmp115
	movq	-16(%rbp), %rsi	; outfile, tmp116
	movq	%rdx, %rcx	; tmp115,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_expression	;
; src/output.c:138: }
	jmp	.L35	;
.L33:
; src/output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp117
	movq	-24(%rbp), %rsi	; indent, tmp118
	movq	-16(%rbp), %rax	; outfile, tmp119
	movq	%rdx, %rcx	; tmp117,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp119,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:136:         ast_output(0, true, "value: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
.L35:
; src/output.c:138: }
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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:141:     switch (statement->type) {
	movq	-8(%rbp), %rax	; statement, tmp98
	movl	8(%rax), %eax	; statement_19(D)->type, _1
; src/output.c:141:     switch (statement->type) {
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
; src/output.c:143:             ast_output(0, false, "if_statement\n");
	movq	-32(%rbp), %rdx	; parser, tmp106
	movq	-24(%rbp), %rsi	; indent, tmp107
	movq	-16(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:143:             ast_output(0, false, "if_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rax	;, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:144:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp111
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; statement, tmp112
	movq	(%rax), %rax	; statement_19(D)->stmt.if_stmt, _3
	movq	-32(%rbp), %rdx	; parser, tmp113
	movq	-16(%rbp), %rsi	; outfile, tmp114
	movq	%rdx, %rcx	; tmp113,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_if	;
; src/output.c:145:             break;
	jmp	.L36	;
.L42:
; src/output.c:147:             ast_output(0, false, "for_statement\n");
	movq	-32(%rbp), %rdx	; parser, tmp115
	movq	-24(%rbp), %rsi	; indent, tmp116
	movq	-16(%rbp), %rax	; outfile, tmp117
	movq	%rdx, %rcx	; tmp115,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp117,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:147:             ast_output(0, false, "for_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp118
	movq	%rax, %rcx	; tmp118,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rax	;, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:148:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp120
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; statement, tmp121
	movq	(%rax), %rax	; statement_19(D)->stmt.for_stmt, _5
	movq	-32(%rbp), %rdx	; parser, tmp122
	movq	-16(%rbp), %rsi	; outfile, tmp123
	movq	%rdx, %rcx	; tmp122,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_for	;
; src/output.c:149:             break;
	jmp	.L36	;
.L43:
; src/output.c:151:             ast_output(0, false, "while_statement\n");
	movq	-32(%rbp), %rdx	; parser, tmp124
	movq	-24(%rbp), %rsi	; indent, tmp125
	movq	-16(%rbp), %rax	; outfile, tmp126
	movq	%rdx, %rcx	; tmp124,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp126,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:151:             ast_output(0, false, "while_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rax, %rcx	; tmp127,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:152:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp129
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; statement, tmp130
	movq	(%rax), %rax	; statement_19(D)->stmt.while_stmt, _7
	movq	-32(%rbp), %rdx	; parser, tmp131
	movq	-16(%rbp), %rsi	; outfile, tmp132
	movq	%rdx, %rcx	; tmp131,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_while	;
; src/output.c:153:             break;
	jmp	.L36	;
.L45:
; src/output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	movq	-32(%rbp), %rdx	; parser, tmp133
	movq	-24(%rbp), %rsi	; indent, tmp134
	movq	-16(%rbp), %rax	; outfile, tmp135
	movq	%rdx, %rcx	; tmp133,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp135,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:155:             ast_output(0, false, "variable_declaration_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp136
	movq	%rax, %rcx	; tmp136,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp137
	movq	%rax, %rdi	; tmp137,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:156:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp138
	leaq	1(%rax), %rdi	;, _8
	movq	-8(%rbp), %rax	; statement, tmp139
	movq	(%rax), %rax	; statement_19(D)->stmt.var, _9
	movq	-32(%rbp), %rdx	; parser, tmp140
	movq	-16(%rbp), %rsi	; outfile, tmp141
	movq	%rdx, %rcx	; tmp140,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; _9,
	call	output_variable	;
; src/output.c:157:             break;
	jmp	.L36	;
.L41:
; src/output.c:159:             if (statement->stmt.expr == NULL) {
	movq	-8(%rbp), %rax	; statement, tmp142
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _10
; src/output.c:159:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	; _10
	jne	.L48	;,
; src/output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp143
	movq	-24(%rbp), %rsi	; indent, tmp144
	movq	-16(%rbp), %rax	; outfile, tmp145
	movq	%rdx, %rcx	; tmp143,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp145,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:160:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp146
	movq	%rax, %rcx	; tmp146,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:162:                 return;
	jmp	.L36	;
.L48:
; src/output.c:164:             ast_output(0, false, "return_statement\n");
	movq	-32(%rbp), %rdx	; parser, tmp148
	movq	-24(%rbp), %rsi	; indent, tmp149
	movq	-16(%rbp), %rax	; outfile, tmp150
	movq	%rdx, %rcx	; tmp148,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp150,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:164:             ast_output(0, false, "return_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:165:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp153
	leaq	1(%rax), %rdi	;, _11
	movq	-8(%rbp), %rax	; statement, tmp154
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _12
	movq	-32(%rbp), %rdx	; parser, tmp155
	movq	-16(%rbp), %rsi	; outfile, tmp156
	movq	%rdx, %rcx	; tmp155,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_expression	;
; src/output.c:166:             break;
	jmp	.L36	;
.L40:
; src/output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp157
	movq	-24(%rbp), %rsi	; indent, tmp158
	movq	-16(%rbp), %rax	; outfile, tmp159
	movq	%rdx, %rcx	; tmp157,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp159,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:168:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp160
	movq	%rax, %rcx	; tmp160,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:169:             break;
	jmp	.L36	;
.L38:
; src/output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp162
	movq	-24(%rbp), %rsi	; indent, tmp163
	movq	-16(%rbp), %rax	; outfile, tmp164
	movq	%rdx, %rcx	; tmp162,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp164,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:171:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp165
	movq	%rax, %rcx	; tmp165,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:172:             break;
	jmp	.L36	;
.L46:
; src/output.c:174:             if (statement->stmt.expr == NULL) {
	movq	-8(%rbp), %rax	; statement, tmp167
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _13
; src/output.c:174:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	; _13
	jne	.L49	;,
; src/output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp168
	movq	-24(%rbp), %rsi	; indent, tmp169
	movq	-16(%rbp), %rax	; outfile, tmp170
	movq	%rdx, %rcx	; tmp168,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp170,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:175:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp171
	movq	%rax, %rcx	; tmp171,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rax	;, tmp172
	movq	%rax, %rdi	; tmp172,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:177:                 return;
	jmp	.L36	;
.L49:
; src/output.c:179:             ast_output(0, false, "expression_statement\n");
	movq	-32(%rbp), %rdx	; parser, tmp173
	movq	-24(%rbp), %rsi	; indent, tmp174
	movq	-16(%rbp), %rax	; outfile, tmp175
	movq	%rdx, %rcx	; tmp173,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp175,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:179:             ast_output(0, false, "expression_statement\n");
	movq	-16(%rbp), %rax	; outfile, tmp176
	movq	%rax, %rcx	; tmp176,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rax	;, tmp177
	movq	%rax, %rdi	; tmp177,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:180:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp178
	leaq	1(%rax), %rdi	;, _14
	movq	-8(%rbp), %rax	; statement, tmp179
	movq	(%rax), %rax	; statement_19(D)->stmt.expr, _15
	movq	-32(%rbp), %rdx	; parser, tmp180
	movq	-16(%rbp), %rsi	; outfile, tmp181
	movq	%rdx, %rcx	; tmp180,
	movq	%rdi, %rdx	; _14,
	movq	%rax, %rdi	; _15,
	call	output_expression	;
; src/output.c:181:             break;
	jmp	.L36	;
.L37:
; src/output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	-32(%rbp), %rdx	; parser, tmp182
	movq	-24(%rbp), %rsi	; indent, tmp183
	movq	-16(%rbp), %rax	; outfile, tmp184
	movq	%rdx, %rcx	; tmp182,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp184,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:183:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	-8(%rbp), %rax	; statement, tmp185
	movl	8(%rax), %edx	; statement_19(D)->type, _16
	movq	-16(%rbp), %rax	; outfile, tmp186
	leaq	.LC28(%rip), %rcx	;, tmp187
	movq	%rcx, %rsi	; tmp187,
	movq	%rax, %rdi	; tmp186,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:184:             break;
	nop	
.L36:
; src/output.c:187: }
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
	movq	%rcx, -80(%rbp)	; parser, parser
; src/output.c:190:     list(Statement*) body = list_copy(if_->body);
	movq	-56(%rbp), %rax	; if_, tmp90
	movq	8(%rax), %rax	; if__13(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp91, body
; src/output.c:191:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	-56(%rbp), %rax	; if_, tmp92
	movq	16(%rax), %rax	; if__13(D)->else_if, _2
	movq	%rax, %rdi	; _2,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp93, else_if_list
; src/output.c:192:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	-56(%rbp), %rax	; if_, tmp94
	movq	24(%rax), %rax	; if__13(D)->else_body, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp95, else_body
; src/output.c:193:     ast_output(0, false, "condition\n");
	movq	-80(%rbp), %rdx	; parser, tmp96
	movq	-72(%rbp), %rsi	; indent, tmp97
	movq	-64(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rcx	; tmp96,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:193:     ast_output(0, false, "condition\n");
	movq	-64(%rbp), %rax	; outfile, tmp99
	movq	%rax, %rcx	; tmp99,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:194:     output_expression(if_->condition, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp101
	leaq	1(%rax), %rdi	;, _4
	movq	-56(%rbp), %rax	; if_, tmp102
	movq	(%rax), %rax	; if__13(D)->condition, _5
	movq	-80(%rbp), %rdx	; parser, tmp103
	movq	-64(%rbp), %rsi	; outfile, tmp104
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_expression	;
; src/output.c:195:     ast_output(0, false, "body\n");
	movq	-80(%rbp), %rdx	; parser, tmp105
	movq	-72(%rbp), %rsi	; indent, tmp106
	movq	-64(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:195:     ast_output(0, false, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L51	;
.L52:
; src/output.c:198:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp110
	leaq	1(%rax), %rdi	;, _6
	movq	-80(%rbp), %rdx	; parser, tmp111
	movq	-64(%rbp), %rsi	; outfile, tmp112
	movq	-32(%rbp), %rax	; statement, tmp113
	movq	%rdx, %rcx	; tmp111,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; tmp113,
	call	output_statement	;
.L51:
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp115, statement
; src/output.c:197:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -32(%rbp)	;, statement
	jne	.L52	;,
; src/output.c:199:     ast_output(0, false, "else_if\n");
	movq	-80(%rbp), %rdx	; parser, tmp116
	movq	-72(%rbp), %rsi	; indent, tmp117
	movq	-64(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rcx	; tmp116,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp118,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:199:     ast_output(0, false, "else_if\n");
	movq	-64(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC30(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	jmp	.L53	;
.L54:
; src/output.c:202:         output_else_if(else_if, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp121
	leaq	1(%rax), %rdi	;, _7
	movq	-80(%rbp), %rdx	; parser, tmp122
	movq	-64(%rbp), %rsi	; outfile, tmp123
	movq	-40(%rbp), %rax	; else_if, tmp124
	movq	%rdx, %rcx	; tmp122,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; tmp124,
	call	output_else_if	;
.L53:
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	-16(%rbp), %rax	; else_if_list, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp126, else_if
; src/output.c:201:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	cmpq	$0, -40(%rbp)	;, else_if
	jne	.L54	;,
; src/output.c:203:     ast_output(0, true, "else_body\n");
	movq	-80(%rbp), %rdx	; parser, tmp127
	movq	-72(%rbp), %rsi	; indent, tmp128
	movq	-64(%rbp), %rax	; outfile, tmp129
	movq	%rdx, %rcx	; tmp127,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp129,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:203:     ast_output(0, true, "else_body\n");
	movq	-64(%rbp), %rax	; outfile, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rax	;, tmp131
	movq	%rax, %rdi	; tmp131,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	jmp	.L55	;
.L56:
; src/output.c:205:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp132
	leaq	1(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; parser, tmp133
	movq	-64(%rbp), %rsi	; outfile, tmp134
	movq	-32(%rbp), %rax	; statement, tmp135
	movq	%rdx, %rcx	; tmp133,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp135,
	call	output_statement	;
.L55:
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	-24(%rbp), %rax	; else_body, tmp136
	movq	%rax, %rdi	; tmp136,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp137, statement
; src/output.c:204:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	cmpq	$0, -32(%rbp)	;, statement
	jne	.L56	;,
; src/output.c:207: }
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:210:     list(Statement*) body = list_copy(else_if->body);
	movq	-24(%rbp), %rax	; else_if, tmp86
	movq	8(%rax), %rax	; else_if_7(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, body
; src/output.c:211:     ast_output(0, false, "condition\n");
	movq	-48(%rbp), %rdx	; parser, tmp88
	movq	-40(%rbp), %rsi	; indent, tmp89
	movq	-32(%rbp), %rax	; outfile, tmp90
	movq	%rdx, %rcx	; tmp88,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp90,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:211:     ast_output(0, false, "condition\n");
	movq	-32(%rbp), %rax	; outfile, tmp91
	movq	%rax, %rcx	; tmp91,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp93
	leaq	1(%rax), %rdi	;, _2
	movq	-24(%rbp), %rax	; else_if, tmp94
	movq	(%rax), %rax	; else_if_7(D)->condition, _3
	movq	-48(%rbp), %rdx	; parser, tmp95
	movq	-32(%rbp), %rsi	; outfile, tmp96
	movq	%rdx, %rcx	; tmp95,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_expression	;
; src/output.c:213:     ast_output(0, true, "body\n");
	movq	-48(%rbp), %rdx	; parser, tmp97
	movq	-40(%rbp), %rsi	; indent, tmp98
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rcx	; tmp97,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp99,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:213:     ast_output(0, true, "body\n");
	movq	-32(%rbp), %rax	; outfile, tmp100
	movq	%rax, %rcx	; tmp100,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L58	;
.L59:
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-48(%rbp), %rdx	; parser, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	-16(%rbp), %rax	; statement, tmp105
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp105,
	call	output_statement	;
.L58:
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp107, statement
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L59	;,
; src/output.c:218: }
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:221:     list(Statement*) body = list_copy(for_->body);
	movq	-24(%rbp), %rax	; for_, tmp93
	movq	24(%rax), %rax	; for__17(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp94, body
; src/output.c:222:     if (for_->initializer != NULL) {
	movq	-24(%rbp), %rax	; for_, tmp95
	movq	(%rax), %rax	; for__17(D)->initializer, _2
; src/output.c:222:     if (for_->initializer != NULL) {
	testq	%rax, %rax	; _2
	je	.L61	;,
; src/output.c:223:         ast_output(0, false, "initializer\n");
	movq	-48(%rbp), %rdx	; parser, tmp96
	movq	-40(%rbp), %rsi	; indent, tmp97
	movq	-32(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rcx	; tmp96,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:223:         ast_output(0, false, "initializer\n");
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rax, %rcx	; tmp99,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:224:         output_variable(for_->initializer, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp101
	leaq	1(%rax), %rdi	;, _3
	movq	-24(%rbp), %rax	; for_, tmp102
	movq	(%rax), %rax	; for__17(D)->initializer, _4
	movq	-48(%rbp), %rdx	; parser, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_variable	;
	jmp	.L62	;
.L61:
; src/output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp105
	movq	-40(%rbp), %rsi	; indent, tmp106
	movq	-32(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:226:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC33(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
.L62:
; src/output.c:227:     if (for_->condition != NULL) {
	movq	-24(%rbp), %rax	; for_, tmp110
	movq	8(%rax), %rax	; for__17(D)->condition, _5
; src/output.c:227:     if (for_->condition != NULL) {
	testq	%rax, %rax	; _5
	je	.L63	;,
; src/output.c:228:         ast_output(0, false, "condition\n");
	movq	-48(%rbp), %rdx	; parser, tmp111
	movq	-40(%rbp), %rsi	; indent, tmp112
	movq	-32(%rbp), %rax	; outfile, tmp113
	movq	%rdx, %rcx	; tmp111,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp113,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:228:         ast_output(0, false, "condition\n");
	movq	-32(%rbp), %rax	; outfile, tmp114
	movq	%rax, %rcx	; tmp114,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp115
	movq	%rax, %rdi	; tmp115,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:229:         output_expression(for_->condition, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp116
	leaq	1(%rax), %rdi	;, _6
	movq	-24(%rbp), %rax	; for_, tmp117
	movq	8(%rax), %rax	; for__17(D)->condition, _7
	movq	-48(%rbp), %rdx	; parser, tmp118
	movq	-32(%rbp), %rsi	; outfile, tmp119
	movq	%rdx, %rcx	; tmp118,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_expression	;
	jmp	.L64	;
.L63:
; src/output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp120
	movq	-40(%rbp), %rsi	; indent, tmp121
	movq	-32(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rcx	; tmp120,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp122,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:231:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
.L64:
; src/output.c:232:     if (for_->increment != NULL) {
	movq	-24(%rbp), %rax	; for_, tmp125
	movq	16(%rax), %rax	; for__17(D)->increment, _8
; src/output.c:232:     if (for_->increment != NULL) {
	testq	%rax, %rax	; _8
	je	.L65	;,
; src/output.c:233:         ast_output(0, false, "increment\n");
	movq	-48(%rbp), %rdx	; parser, tmp126
	movq	-40(%rbp), %rsi	; indent, tmp127
	movq	-32(%rbp), %rax	; outfile, tmp128
	movq	%rdx, %rcx	; tmp126,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp128,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:233:         ast_output(0, false, "increment\n");
	movq	-32(%rbp), %rax	; outfile, tmp129
	movq	%rax, %rcx	; tmp129,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rax	;, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:234:         output_expression(for_->increment, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp131
	leaq	1(%rax), %rdi	;, _9
	movq	-24(%rbp), %rax	; for_, tmp132
	movq	16(%rax), %rax	; for__17(D)->increment, _10
	movq	-48(%rbp), %rdx	; parser, tmp133
	movq	-32(%rbp), %rsi	; outfile, tmp134
	movq	%rdx, %rcx	; tmp133,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_expression	;
	jmp	.L66	;
.L65:
; src/output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp135
	movq	-40(%rbp), %rsi	; indent, tmp136
	movq	-32(%rbp), %rax	; outfile, tmp137
	movq	%rdx, %rcx	; tmp135,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp137,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:236:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp138
	movq	%rax, %rcx	; tmp138,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rax	;, tmp139
	movq	%rax, %rdi	; tmp139,
	call	*fwrite@GOTPCREL(%rip)	;
.L66:
; src/output.c:237:     ast_output(0, true, "body\n");
	movq	-48(%rbp), %rdx	; parser, tmp140
	movq	-40(%rbp), %rsi	; indent, tmp141
	movq	-32(%rbp), %rax	; outfile, tmp142
	movq	%rdx, %rcx	; tmp140,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp142,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:237:     ast_output(0, true, "body\n");
	movq	-32(%rbp), %rax	; outfile, tmp143
	movq	%rax, %rcx	; tmp143,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp144
	movq	%rax, %rdi	; tmp144,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L67	;
.L68:
; src/output.c:240:         output_statement(statement, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp145
	leaq	1(%rax), %rdi	;, _11
	movq	-48(%rbp), %rdx	; parser, tmp146
	movq	-32(%rbp), %rsi	; outfile, tmp147
	movq	-16(%rbp), %rax	; statement, tmp148
	movq	%rdx, %rcx	; tmp146,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; tmp148,
	call	output_statement	;
.L67:
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp149
	movq	%rax, %rdi	; tmp149,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp150, statement
; src/output.c:239:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L68	;,
; src/output.c:242: }
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:245:     list(Statement*) body = list_copy(while_->body);
	movq	-24(%rbp), %rax	; while_, tmp86
	movq	8(%rax), %rax	; while__7(D)->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp87, body
; src/output.c:246:     ast_output(0, false, "condition\n");
	movq	-48(%rbp), %rdx	; parser, tmp88
	movq	-40(%rbp), %rsi	; indent, tmp89
	movq	-32(%rbp), %rax	; outfile, tmp90
	movq	%rdx, %rcx	; tmp88,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp90,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:246:     ast_output(0, false, "condition\n");
	movq	-32(%rbp), %rax	; outfile, tmp91
	movq	%rax, %rcx	; tmp91,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp92
	movq	%rax, %rdi	; tmp92,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:247:     output_expression(while_->condition, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp93
	leaq	1(%rax), %rdi	;, _2
	movq	-24(%rbp), %rax	; while_, tmp94
	movq	(%rax), %rax	; while__7(D)->condition, _3
	movq	-48(%rbp), %rdx	; parser, tmp95
	movq	-32(%rbp), %rsi	; outfile, tmp96
	movq	%rdx, %rcx	; tmp95,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_expression	;
; src/output.c:248:     ast_output(0, true, "body\n");
	movq	-48(%rbp), %rdx	; parser, tmp97
	movq	-40(%rbp), %rsi	; indent, tmp98
	movq	-32(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rcx	; tmp97,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp99,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:248:     ast_output(0, true, "body\n");
	movq	-32(%rbp), %rax	; outfile, tmp100
	movq	%rax, %rcx	; tmp100,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L70	;
.L71:
; src/output.c:251:         output_statement(statement, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-48(%rbp), %rdx	; parser, tmp103
	movq	-32(%rbp), %rsi	; outfile, tmp104
	movq	-16(%rbp), %rax	; statement, tmp105
	movq	%rdx, %rcx	; tmp103,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp105,
	call	output_statement	;
.L70:
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	; body, tmp106
	movq	%rax, %rdi	; tmp106,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp107, statement
; src/output.c:250:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	;, statement
	jne	.L71	;,
; src/output.c:253: }
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:256:     if (expression->operator == OP_NONE) {
	movq	-24(%rbp), %rax	; expression, tmp91
	movl	24(%rax), %eax	; expression_12(D)->operator, _1
; src/output.c:256:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	;, _1
	jne	.L73	;,
; src/output.c:257:         ast_output(0, true, "primary\n");
	movq	-48(%rbp), %rdx	; parser, tmp92
	movq	-40(%rbp), %rsi	; indent, tmp93
	movq	-32(%rbp), %rax	; outfile, tmp94
	movq	%rdx, %rcx	; tmp92,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp94,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:257:         ast_output(0, true, "primary\n");
	movq	-32(%rbp), %rax	; outfile, tmp95
	movq	%rax, %rcx	; tmp95,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC37(%rip), %rax	;, tmp96
	movq	%rax, %rdi	; tmp96,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:258:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp97
	leaq	1(%rax), %rdi	;, _2
	movq	-24(%rbp), %rax	; expression, tmp98
	movq	8(%rax), %rax	; expression_12(D)->prim_left, _3
	movq	-48(%rbp), %rdx	; parser, tmp99
	movq	-32(%rbp), %rsi	; outfile, tmp100
	movq	%rdx, %rcx	; tmp99,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_primary	;
; src/output.c:268: }
	jmp	.L77	;
.L73:
; src/output.c:260:         string op_str = operator_to_string(expression->operator);
	movq	-24(%rbp), %rax	; expression, tmp101
	movl	24(%rax), %eax	; expression_12(D)->operator, _4
	movl	%eax, %edi	; _4,
	call	*operator_to_string@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp102, op_str
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	-48(%rbp), %rdx	; parser, tmp103
	movq	-40(%rbp), %rsi	; indent, tmp104
	movq	-32(%rbp), %rax	; outfile, tmp105
	movq	%rdx, %rcx	; tmp103,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp105,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmpq	$0, -8(%rbp)	;, op_str
	je	.L75	;,
	movq	-8(%rbp), %rax	; op_str, iftmp.1_9
	jmp	.L76	;
.L75:
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC38(%rip), %rax	;, iftmp.1_9
.L76:
; src/output.c:261:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	-32(%rbp), %rcx	; outfile, tmp106
	movq	%rax, %rdx	; iftmp.1_9,
	leaq	.LC39(%rip), %rax	;, tmp107
	movq	%rax, %rsi	; tmp107,
	movq	%rcx, %rdi	; tmp106,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:262:         ast_output(0, false, "left\n");
	movq	-48(%rbp), %rdx	; parser, tmp108
	movq	-40(%rbp), %rsi	; indent, tmp109
	movq	-32(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:262:         ast_output(0, false, "left\n");
	movq	-32(%rbp), %rax	; outfile, tmp111
	movq	%rax, %rcx	; tmp111,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rax	;, tmp112
	movq	%rax, %rdi	; tmp112,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:263:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp113
	leaq	1(%rax), %rdi	;, _5
	movq	-24(%rbp), %rax	; expression, tmp114
	movq	(%rax), %rax	; expression_12(D)->expr_left, _6
	movq	-48(%rbp), %rdx	; parser, tmp115
	movq	-32(%rbp), %rsi	; outfile, tmp116
	movq	%rdx, %rcx	; tmp115,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_expression	;
; src/output.c:264:         ast_output(0, true, "right\n");
	movq	-48(%rbp), %rdx	; parser, tmp117
	movq	-40(%rbp), %rsi	; indent, tmp118
	movq	-32(%rbp), %rax	; outfile, tmp119
	movq	%rdx, %rcx	; tmp117,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp119,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:264:         ast_output(0, true, "right\n");
	movq	-32(%rbp), %rax	; outfile, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:265:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp122
	leaq	1(%rax), %rdi	;, _7
	movq	-24(%rbp), %rax	; expression, tmp123
	movq	16(%rax), %rax	; expression_12(D)->right, _8
	movq	-48(%rbp), %rdx	; parser, tmp124
	movq	-32(%rbp), %rsi	; outfile, tmp125
	movq	%rdx, %rcx	; tmp124,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; _8,
	call	output_expression	;
.L77:
; src/output.c:268: }
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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:271:     switch (primary->type) {
	movq	-8(%rbp), %rax	; primary, tmp95
	movl	8(%rax), %eax	; primary_16(D)->type, _1
; src/output.c:271:     switch (primary->type) {
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
; src/output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp103
	movq	-24(%rbp), %rsi	; indent, tmp104
	movq	-16(%rbp), %rax	; outfile, tmp105
	movq	%rdx, %rcx	; tmp103,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp105,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:273:             ast_output(0, false, "type: \"integer\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp106
	movq	%rax, %rcx	; tmp106,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rax	;, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:274:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-32(%rbp), %rdx	; parser, tmp108
	movq	-24(%rbp), %rsi	; indent, tmp109
	movq	-16(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:274:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-8(%rbp), %rax	; primary, tmp111
	movq	(%rax), %rdx	; primary_16(D)->value.literal_value, _2
	movq	-16(%rbp), %rax	; outfile, tmp112
	leaq	.LC43(%rip), %rcx	;, tmp113
	movq	%rcx, %rsi	; tmp113,
	movq	%rax, %rdi	; tmp112,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:275:             break;
	jmp	.L90	;
.L88:
; src/output.c:277:             ast_output(0, false, "type: \"float\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp114
	movq	-24(%rbp), %rsi	; indent, tmp115
	movq	-16(%rbp), %rax	; outfile, tmp116
	movq	%rdx, %rcx	; tmp114,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp116,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:277:             ast_output(0, false, "type: \"float\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp117
	movq	%rax, %rcx	; tmp117,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC44(%rip), %rax	;, tmp118
	movq	%rax, %rdi	; tmp118,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-32(%rbp), %rdx	; parser, tmp119
	movq	-24(%rbp), %rsi	; indent, tmp120
	movq	-16(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rcx	; tmp119,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp121,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:278:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	-8(%rbp), %rax	; primary, tmp122
	movq	(%rax), %rdx	; primary_16(D)->value.literal_value, _3
	movq	-16(%rbp), %rax	; outfile, tmp123
	leaq	.LC43(%rip), %rcx	;, tmp124
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:279:             break;
	jmp	.L90	;
.L87:
; src/output.c:281:             ast_output(0, false, "type: \"string\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp125
	movq	-24(%rbp), %rsi	; indent, tmp126
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rdx, %rcx	; tmp125,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp127,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:281:             ast_output(0, false, "type: \"string\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp128
	movq	%rax, %rcx	; tmp128,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC45(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	-32(%rbp), %rdx	; parser, tmp130
	movq	-24(%rbp), %rsi	; indent, tmp131
	movq	-16(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:282:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	-8(%rbp), %rax	; primary, tmp133
	movq	(%rax), %rdx	; primary_16(D)->value.literal_value, _4
	movq	-16(%rbp), %rax	; outfile, tmp134
	leaq	.LC46(%rip), %rcx	;, tmp135
	movq	%rcx, %rsi	; tmp135,
	movq	%rax, %rdi	; tmp134,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:283:             break;
	jmp	.L90	;
.L86:
; src/output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp136
	movq	-24(%rbp), %rsi	; indent, tmp137
	movq	-16(%rbp), %rax	; outfile, tmp138
	movq	%rdx, %rcx	; tmp136,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp138,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:285:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp139
	movq	%rax, %rcx	; tmp139,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rax	;, tmp140
	movq	%rax, %rdi	; tmp140,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp141
	movq	-24(%rbp), %rsi	; indent, tmp142
	movq	-16(%rbp), %rax	; outfile, tmp143
	movq	%rdx, %rcx	; tmp141,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp143,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:286:             ast_output(0, true, "value: \"true\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp144
	movq	%rax, %rcx	; tmp144,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rax	;, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:287:             break;
	jmp	.L90	;
.L85:
; src/output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp146
	movq	-24(%rbp), %rsi	; indent, tmp147
	movq	-16(%rbp), %rax	; outfile, tmp148
	movq	%rdx, %rcx	; tmp146,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp148,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:289:             ast_output(0, false, "type: \"boolean\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp149
	movq	%rax, %rcx	; tmp149,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rax	;, tmp150
	movq	%rax, %rdi	; tmp150,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp151
	movq	-24(%rbp), %rsi	; indent, tmp152
	movq	-16(%rbp), %rax	; outfile, tmp153
	movq	%rdx, %rcx	; tmp151,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp153,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:290:             ast_output(0, true, "value: \"false\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp154
	movq	%rax, %rcx	; tmp154,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rax	;, tmp155
	movq	%rax, %rdi	; tmp155,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:291:             break;
	jmp	.L90	;
.L84:
; src/output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp156
	movq	-24(%rbp), %rsi	; indent, tmp157
	movq	-16(%rbp), %rax	; outfile, tmp158
	movq	%rdx, %rcx	; tmp156,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp158,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:293:             ast_output(0, false, "type: \"expression\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp159
	movq	%rax, %rcx	; tmp159,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rax	;, tmp160
	movq	%rax, %rdi	; tmp160,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:294:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; parser, tmp161
	movq	-24(%rbp), %rsi	; indent, tmp162
	movq	-16(%rbp), %rax	; outfile, tmp163
	movq	%rdx, %rcx	; tmp161,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp163,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:294:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp164
	movq	%rax, %rcx	; tmp164,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:295:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp166
	leaq	1(%rax), %rdi	;, _5
	movq	-8(%rbp), %rax	; primary, tmp167
	movq	(%rax), %rax	; primary_16(D)->value.expr, _6
	movq	-32(%rbp), %rdx	; parser, tmp168
	movq	-16(%rbp), %rsi	; outfile, tmp169
	movq	%rdx, %rcx	; tmp168,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_expression	;
; src/output.c:296:             break;
	jmp	.L90	;
.L83:
; src/output.c:298:             ast_output(0, false, "type: \"!\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp170
	movq	-24(%rbp), %rsi	; indent, tmp171
	movq	-16(%rbp), %rax	; outfile, tmp172
	movq	%rdx, %rcx	; tmp170,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp172,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:298:             ast_output(0, false, "type: \"!\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp173
	movq	%rax, %rcx	; tmp173,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rax	;, tmp174
	movq	%rax, %rdi	; tmp174,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:299:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; parser, tmp175
	movq	-24(%rbp), %rsi	; indent, tmp176
	movq	-16(%rbp), %rax	; outfile, tmp177
	movq	%rdx, %rcx	; tmp175,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp177,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:299:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp178
	movq	%rax, %rcx	; tmp178,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:300:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp180
	leaq	1(%rax), %rdi	;, _7
	movq	-8(%rbp), %rax	; primary, tmp181
	movq	(%rax), %rax	; primary_16(D)->value.operand, _8
	movq	-32(%rbp), %rdx	; parser, tmp182
	movq	-16(%rbp), %rsi	; outfile, tmp183
	movq	%rdx, %rcx	; tmp182,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; _8,
	call	output_primary	;
; src/output.c:301:             break;
	jmp	.L90	;
.L82:
; src/output.c:303:             ast_output(0, false, "type: \"-\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp184
	movq	-24(%rbp), %rsi	; indent, tmp185
	movq	-16(%rbp), %rax	; outfile, tmp186
	movq	%rdx, %rcx	; tmp184,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp186,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:303:             ast_output(0, false, "type: \"-\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp187
	movq	%rax, %rcx	; tmp187,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:304:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; parser, tmp189
	movq	-24(%rbp), %rsi	; indent, tmp190
	movq	-16(%rbp), %rax	; outfile, tmp191
	movq	%rdx, %rcx	; tmp189,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp191,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:304:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp192
	movq	%rax, %rcx	; tmp192,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp193
	movq	%rax, %rdi	; tmp193,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:305:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp194
	leaq	1(%rax), %rdi	;, _9
	movq	-8(%rbp), %rax	; primary, tmp195
	movq	(%rax), %rax	; primary_16(D)->value.operand, _10
	movq	-32(%rbp), %rdx	; parser, tmp196
	movq	-16(%rbp), %rsi	; outfile, tmp197
	movq	%rdx, %rcx	; tmp196,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_primary	;
; src/output.c:306:             break;
	jmp	.L90	;
.L80:
; src/output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp198
	movq	-24(%rbp), %rsi	; indent, tmp199
	movq	-16(%rbp), %rax	; outfile, tmp200
	movq	%rdx, %rcx	; tmp198,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp200,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:308:             ast_output(0, false, "type: \"variable\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp201
	movq	%rax, %rcx	; tmp201,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rax	;, tmp202
	movq	%rax, %rdi	; tmp202,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:309:             ast_output(0, true, "value\n");
	movq	-32(%rbp), %rdx	; parser, tmp203
	movq	-24(%rbp), %rsi	; indent, tmp204
	movq	-16(%rbp), %rax	; outfile, tmp205
	movq	%rdx, %rcx	; tmp203,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp205,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:309:             ast_output(0, true, "value\n");
	movq	-16(%rbp), %rax	; outfile, tmp206
	movq	%rax, %rcx	; tmp206,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp207
	movq	%rax, %rdi	; tmp207,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:310:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp208
	leaq	1(%rax), %rdi	;, _11
	movq	-8(%rbp), %rax	; primary, tmp209
	movq	(%rax), %rax	; primary_16(D)->value.var, _12
	movq	-32(%rbp), %rdx	; parser, tmp210
	movq	-16(%rbp), %rsi	; outfile, tmp211
	movq	%rdx, %rcx	; tmp210,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_variable_access	;
; src/output.c:311:             break;
	jmp	.L90	;
.L79:
; src/output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	-32(%rbp), %rdx	; parser, tmp212
	movq	-24(%rbp), %rsi	; indent, tmp213
	movq	-16(%rbp), %rax	; outfile, tmp214
	movq	%rdx, %rcx	; tmp212,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp214,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:313:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	-8(%rbp), %rax	; primary, tmp215
	movl	8(%rax), %edx	; primary_16(D)->type, _13
	movq	-16(%rbp), %rax	; outfile, tmp216
	leaq	.LC54(%rip), %rcx	;, tmp217
	movq	%rcx, %rsi	; tmp217,
	movq	%rax, %rdi	; tmp216,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:314:             break;
	nop	
.L90:
; src/output.c:317: }
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
	movq	%rcx, -64(%rbp)	; parser, parser
; src/output.c:322:     switch (variable_access->type) {
	movq	-40(%rbp), %rax	; variable_access, tmp99
	movl	16(%rax), %eax	; variable_access_22(D)->type, _1
; src/output.c:322:     switch (variable_access->type) {
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
; src/output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp100
	movq	-56(%rbp), %rsi	; indent, tmp101
	movq	-48(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:324:             ast_output(0, false, "type: \"name\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp103
	movq	%rax, %rcx	; tmp103,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rax	;, tmp104
	movq	%rax, %rdi	; tmp104,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:325:             ast_output(0, true, "name\n");
	movq	-64(%rbp), %rdx	; parser, tmp105
	movq	-56(%rbp), %rsi	; indent, tmp106
	movq	-48(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:325:             ast_output(0, true, "name\n");
	movq	-48(%rbp), %rax	; outfile, tmp108
	movq	%rax, %rcx	; tmp108,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp109
	movq	%rax, %rdi	; tmp109,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:326:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp110
	leaq	1(%rax), %rdi	;, _2
	movq	-40(%rbp), %rax	; variable_access, tmp111
	movq	8(%rax), %rax	; variable_access_22(D)->content.name, _3
	movq	-64(%rbp), %rdx	; parser, tmp112
	movq	-48(%rbp), %rsi	; outfile, tmp113
	movq	%rdx, %rcx	; tmp112,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_name	;
; src/output.c:327:             break;
	jmp	.L97	;
.L96:
; src/output.c:329:             args = list_copy(variable_access->content.args);
	movq	-40(%rbp), %rax	; variable_access, tmp114
	movq	8(%rax), %rax	; variable_access_22(D)->content.args, _4
	movq	%rax, %rdi	; _4,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp115, args
; src/output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp116
	movq	-56(%rbp), %rsi	; indent, tmp117
	movq	-48(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rcx	; tmp116,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp118,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:330:             ast_output(0, false, "type: \"function_call\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:331:             ast_output(0, false, "function\n");
	movq	-64(%rbp), %rdx	; parser, tmp121
	movq	-56(%rbp), %rsi	; indent, tmp122
	movq	-48(%rbp), %rax	; outfile, tmp123
	movq	%rdx, %rcx	; tmp121,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp123,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:331:             ast_output(0, false, "function\n");
	movq	-48(%rbp), %rax	; outfile, tmp124
	movq	%rax, %rcx	; tmp124,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:332:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp126
	leaq	1(%rax), %rdi	;, _5
	movq	-40(%rbp), %rax	; variable_access, tmp127
	movq	(%rax), %rax	; variable_access_22(D)->base, _6
	movq	-64(%rbp), %rdx	; parser, tmp128
	movq	-48(%rbp), %rsi	; outfile, tmp129
	movq	%rdx, %rcx	; tmp128,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_variable_access	;
; src/output.c:333:             ast_output(0, true, "arguments\n");
	movq	-64(%rbp), %rdx	; parser, tmp130
	movq	-56(%rbp), %rsi	; indent, tmp131
	movq	-48(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:333:             ast_output(0, true, "arguments\n");
	movq	-48(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:335:             index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L98	;
.L99:
; src/output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	-56(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rsi	;, _7
	movq	-64(%rbp), %rdx	; parser, tmp136
	movq	-48(%rbp), %rax	; outfile, tmp137
	movq	%rdx, %rcx	; tmp136,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp137,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:337:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp138
	movq	-48(%rbp), %rax	; outfile, tmp139
	leaq	.LC58(%rip), %rcx	;, tmp140
	movq	%rcx, %rsi	; tmp140,
	movq	%rax, %rdi	; tmp139,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:338:                 output_expression(arg, outfile, indent + 2, parser);
	movq	-56(%rbp), %rax	; indent, tmp141
	leaq	2(%rax), %rdi	;, _8
	movq	-64(%rbp), %rdx	; parser, tmp142
	movq	-48(%rbp), %rsi	; outfile, tmp143
	movq	-24(%rbp), %rax	; arg, tmp144
	movq	%rdx, %rcx	; tmp142,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp144,
	call	output_expression	;
.L98:
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	-16(%rbp), %rax	; args, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp146, arg
; src/output.c:336:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -24(%rbp)	;, arg
	jne	.L99	;,
; src/output.c:340:             break;
	jmp	.L97	;
.L92:
; src/output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp147
	movq	-56(%rbp), %rsi	; indent, tmp148
	movq	-48(%rbp), %rax	; outfile, tmp149
	movq	%rdx, %rcx	; tmp147,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp149,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:342:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp150
	movq	%rax, %rcx	; tmp150,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rax	;, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:343:             ast_output(0, false, "sequence\n");
	movq	-64(%rbp), %rdx	; parser, tmp152
	movq	-56(%rbp), %rsi	; indent, tmp153
	movq	-48(%rbp), %rax	; outfile, tmp154
	movq	%rdx, %rcx	; tmp152,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp154,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:343:             ast_output(0, false, "sequence\n");
	movq	-48(%rbp), %rax	; outfile, tmp155
	movq	%rax, %rcx	; tmp155,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rax	;, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:344:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp157
	leaq	1(%rax), %rdi	;, _9
	movq	-40(%rbp), %rax	; variable_access, tmp158
	movq	(%rax), %rax	; variable_access_22(D)->base, _10
	movq	-64(%rbp), %rdx	; parser, tmp159
	movq	-48(%rbp), %rsi	; outfile, tmp160
	movq	%rdx, %rcx	; tmp159,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_variable_access	;
; src/output.c:345:             ast_output(0, true, "index\n");
	movq	-64(%rbp), %rdx	; parser, tmp161
	movq	-56(%rbp), %rsi	; indent, tmp162
	movq	-48(%rbp), %rax	; outfile, tmp163
	movq	%rdx, %rcx	; tmp161,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp163,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:345:             ast_output(0, true, "index\n");
	movq	-48(%rbp), %rax	; outfile, tmp164
	movq	%rax, %rcx	; tmp164,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rax	;, tmp165
	movq	%rax, %rdi	; tmp165,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:346:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp166
	leaq	1(%rax), %rdi	;, _11
	movq	-40(%rbp), %rax	; variable_access, tmp167
	movq	8(%rax), %rax	; variable_access_22(D)->content.index, _12
	movq	-64(%rbp), %rdx	; parser, tmp168
	movq	-48(%rbp), %rsi	; outfile, tmp169
	movq	%rdx, %rcx	; tmp168,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_expression	;
; src/output.c:347:             break;
	jmp	.L97	;
.L94:
; src/output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp170
	movq	-56(%rbp), %rsi	; indent, tmp171
	movq	-48(%rbp), %rax	; outfile, tmp172
	movq	%rdx, %rcx	; tmp170,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp172,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:349:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp173
	movq	%rax, %rcx	; tmp173,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rax	;, tmp174
	movq	%rax, %rdi	; tmp174,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:350:             ast_output(0, false, "object\n");
	movq	-64(%rbp), %rdx	; parser, tmp175
	movq	-56(%rbp), %rsi	; indent, tmp176
	movq	-48(%rbp), %rax	; outfile, tmp177
	movq	%rdx, %rcx	; tmp175,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp177,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:350:             ast_output(0, false, "object\n");
	movq	-48(%rbp), %rax	; outfile, tmp178
	movq	%rax, %rcx	; tmp178,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rax	;, tmp179
	movq	%rax, %rdi	; tmp179,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:351:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp180
	leaq	1(%rax), %rdi	;, _13
	movq	-40(%rbp), %rax	; variable_access, tmp181
	movq	(%rax), %rax	; variable_access_22(D)->base, _14
	movq	-64(%rbp), %rdx	; parser, tmp182
	movq	-48(%rbp), %rsi	; outfile, tmp183
	movq	%rdx, %rcx	; tmp182,
	movq	%rdi, %rdx	; _13,
	movq	%rax, %rdi	; _14,
	call	output_variable_access	;
; src/output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	-64(%rbp), %rdx	; parser, tmp184
	movq	-56(%rbp), %rsi	; indent, tmp185
	movq	-48(%rbp), %rax	; outfile, tmp186
	movq	%rdx, %rcx	; tmp184,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp186,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:352:             ast_output(0, true, "attribute_name\n");
	movq	-48(%rbp), %rax	; outfile, tmp187
	movq	%rax, %rcx	; tmp187,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC64(%rip), %rax	;, tmp188
	movq	%rax, %rdi	; tmp188,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:353:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp189
	leaq	1(%rax), %rdi	;, _15
	movq	-40(%rbp), %rax	; variable_access, tmp190
	movq	8(%rax), %rax	; variable_access_22(D)->content.attr_name, _16
	movq	-64(%rbp), %rdx	; parser, tmp191
	movq	-48(%rbp), %rsi	; outfile, tmp192
	movq	%rdx, %rcx	; tmp191,
	movq	%rdi, %rdx	; _15,
	movq	%rax, %rdi	; _16,
	call	output_name	;
; src/output.c:354:             break;
	jmp	.L97	;
.L93:
; src/output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	-64(%rbp), %rdx	; parser, tmp193
	movq	-56(%rbp), %rsi	; indent, tmp194
	movq	-48(%rbp), %rax	; outfile, tmp195
	movq	%rdx, %rcx	; tmp193,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp195,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:356:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	-40(%rbp), %rax	; variable_access, tmp196
	movl	16(%rax), %edx	; variable_access_22(D)->type, _17
	movq	-48(%rbp), %rax	; outfile, tmp197
	leaq	.LC65(%rip), %rcx	;, tmp198
	movq	%rcx, %rsi	; tmp198,
	movq	%rax, %rdi	; tmp197,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:357:             break;
	nop	
.L97:
; src/output.c:360: }
	nop	
	leave	
	ret	
	.size	output_variable_access, .-output_variable_access
	.section	.rodata
.LC66:
	.string	"Name pointer: \"NULL\"\n"
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
	movq	%rcx, -32(%rbp)	; parser, parser
; src/output.c:363:     if (name == NULL) {
	cmpq	$0, -8(%rbp)	;, name
	jne	.L101	;,
; src/output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp95
	movq	-24(%rbp), %rsi	; indent, tmp96
	movq	-16(%rbp), %rax	; outfile, tmp97
	movq	%rdx, %rcx	; tmp95,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp97,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:364:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp98
	movq	%rax, %rcx	; tmp98,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rax	;, tmp99
	movq	%rax, %rdi	; tmp99,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:366:         return;
	jmp	.L100	;
.L101:
; src/output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	-32(%rbp), %rdx	; parser, tmp100
	movq	-24(%rbp), %rsi	; indent, tmp101
	movq	-16(%rbp), %rax	; outfile, tmp102
	movq	%rdx, %rcx	; tmp100,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp102,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:368:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	-8(%rbp), %rax	; name, tmp103
	movq	8(%rax), %rdx	; name_15(D)->name, _1
	movq	-16(%rbp), %rax	; outfile, tmp104
	leaq	.LC67(%rip), %rcx	;, tmp105
	movq	%rcx, %rsi	; tmp105,
	movq	%rax, %rdi	; tmp104,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	movq	-32(%rbp), %rdx	; parser, tmp106
	movq	-24(%rbp), %rsi	; indent, tmp107
	movq	-16(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:369:     ast_output(0, false, "id: %zu\n", name->id);
	movq	-8(%rbp), %rax	; name, tmp109
	movq	16(%rax), %rdx	; name_15(D)->id, _2
	movq	-16(%rbp), %rax	; outfile, tmp110
	leaq	.LC68(%rip), %rcx	;, tmp111
	movq	%rcx, %rsi	; tmp111,
	movq	%rax, %rdi	; tmp110,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:370:     switch (name->kind) {
	movq	-8(%rbp), %rax	; name, tmp112
	movl	32(%rax), %eax	; name_15(D)->kind, _3
; src/output.c:370:     switch (name->kind) {
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
; src/output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp120
	movq	-24(%rbp), %rsi	; indent, tmp121
	movq	-16(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rcx	; tmp120,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp122,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:372:             ast_output(0, true, "kind: \"type\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp123
	movq	%rax, %rcx	; tmp123,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC69(%rip), %rax	;, tmp124
	movq	%rax, %rdi	; tmp124,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:373:             break;
	jmp	.L100	;
.L108:
; src/output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp125
	movq	-24(%rbp), %rsi	; indent, tmp126
	movq	-16(%rbp), %rax	; outfile, tmp127
	movq	%rdx, %rcx	; tmp125,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp127,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:375:             ast_output(0, false, "kind: \"variable\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp128
	movq	%rax, %rcx	; tmp128,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC70(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:376:             ast_output(0, true, "type\n");
	movq	-32(%rbp), %rdx	; parser, tmp130
	movq	-24(%rbp), %rsi	; indent, tmp131
	movq	-16(%rbp), %rax	; outfile, tmp132
	movq	%rdx, %rcx	; tmp130,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp132,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:376:             ast_output(0, true, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp133
	movq	%rax, %rcx	; tmp133,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp134
	movq	%rax, %rdi	; tmp134,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:377:             output_name(name->type, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp135
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; name, tmp136
	movq	(%rax), %rax	; name_15(D)->type, _5
	movq	-32(%rbp), %rdx	; parser, tmp137
	movq	-16(%rbp), %rsi	; outfile, tmp138
	movq	%rdx, %rcx	; tmp137,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_name	;
; src/output.c:378:             break;
	jmp	.L100	;
.L110:
; src/output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp139
	movq	-24(%rbp), %rsi	; indent, tmp140
	movq	-16(%rbp), %rax	; outfile, tmp141
	movq	%rdx, %rcx	; tmp139,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp141,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:380:             ast_output(0, false, "kind: \"function\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp142
	movq	%rax, %rcx	; tmp142,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rax	;, tmp143
	movq	%rax, %rdi	; tmp143,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:381:             ast_output(0, true, "return_type\n");
	movq	-32(%rbp), %rdx	; parser, tmp144
	movq	-24(%rbp), %rsi	; indent, tmp145
	movq	-16(%rbp), %rax	; outfile, tmp146
	movq	%rdx, %rcx	; tmp144,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp146,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:381:             ast_output(0, true, "return_type\n");
	movq	-16(%rbp), %rax	; outfile, tmp147
	movq	%rax, %rcx	; tmp147,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp148
	movq	%rax, %rdi	; tmp148,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:382:             output_name(name->type, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp149
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; name, tmp150
	movq	(%rax), %rax	; name_15(D)->type, _7
	movq	-32(%rbp), %rdx	; parser, tmp151
	movq	-16(%rbp), %rsi	; outfile, tmp152
	movq	%rdx, %rcx	; tmp151,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_name	;
; src/output.c:383:             break;
	jmp	.L100	;
.L109:
; src/output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp153
	movq	-24(%rbp), %rsi	; indent, tmp154
	movq	-16(%rbp), %rax	; outfile, tmp155
	movq	%rdx, %rcx	; tmp153,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp155,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:385:             ast_output(0, false, "kind: \"method\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp156
	movq	%rax, %rcx	; tmp156,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rax	;, tmp157
	movq	%rax, %rdi	; tmp157,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:386:             ast_output(0, true, "return_type\n");
	movq	-32(%rbp), %rdx	; parser, tmp158
	movq	-24(%rbp), %rsi	; indent, tmp159
	movq	-16(%rbp), %rax	; outfile, tmp160
	movq	%rdx, %rcx	; tmp158,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp160,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:386:             ast_output(0, true, "return_type\n");
	movq	-16(%rbp), %rax	; outfile, tmp161
	movq	%rax, %rcx	; tmp161,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:387:             output_name(name->type, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp163
	leaq	1(%rax), %rdi	;, _8
	movq	-8(%rbp), %rax	; name, tmp164
	movq	(%rax), %rax	; name_15(D)->type, _9
	movq	-32(%rbp), %rdx	; parser, tmp165
	movq	-16(%rbp), %rsi	; outfile, tmp166
	movq	%rdx, %rcx	; tmp165,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; _9,
	call	output_name	;
; src/output.c:388:             break;
	jmp	.L100	;
.L111:
; src/output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp167
	movq	-24(%rbp), %rsi	; indent, tmp168
	movq	-16(%rbp), %rax	; outfile, tmp169
	movq	%rdx, %rcx	; tmp167,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp169,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:390:             ast_output(0, true, "kind: \"class\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp170
	movq	%rax, %rcx	; tmp170,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC73(%rip), %rax	;, tmp171
	movq	%rax, %rdi	; tmp171,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:391:             break;
	jmp	.L100	;
.L106:
; src/output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp172
	movq	-24(%rbp), %rsi	; indent, tmp173
	movq	-16(%rbp), %rax	; outfile, tmp174
	movq	%rdx, %rcx	; tmp172,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp174,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:393:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp175
	movq	%rax, %rcx	; tmp175,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC74(%rip), %rax	;, tmp176
	movq	%rax, %rdi	; tmp176,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:394:             ast_output(0, true, "type\n");
	movq	-32(%rbp), %rdx	; parser, tmp177
	movq	-24(%rbp), %rsi	; indent, tmp178
	movq	-16(%rbp), %rax	; outfile, tmp179
	movq	%rdx, %rcx	; tmp177,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp179,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:394:             ast_output(0, true, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp180
	movq	%rax, %rcx	; tmp180,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp181
	movq	%rax, %rdi	; tmp181,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:395:             output_name(name->type, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp182
	leaq	1(%rax), %rdi	;, _10
	movq	-8(%rbp), %rax	; name, tmp183
	movq	(%rax), %rax	; name_15(D)->type, _11
	movq	-32(%rbp), %rdx	; parser, tmp184
	movq	-16(%rbp), %rsi	; outfile, tmp185
	movq	%rdx, %rcx	; tmp184,
	movq	%rdi, %rdx	; _10,
	movq	%rax, %rdi	; _11,
	call	output_name	;
; src/output.c:396:             break;
	jmp	.L100	;
.L107:
; src/output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp186
	movq	-24(%rbp), %rsi	; indent, tmp187
	movq	-16(%rbp), %rax	; outfile, tmp188
	movq	%rdx, %rcx	; tmp186,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp188,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:398:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp189
	movq	%rax, %rcx	; tmp189,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC75(%rip), %rax	;, tmp190
	movq	%rax, %rdi	; tmp190,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:399:             ast_output(0, true, "type\n");
	movq	-32(%rbp), %rdx	; parser, tmp191
	movq	-24(%rbp), %rsi	; indent, tmp192
	movq	-16(%rbp), %rax	; outfile, tmp193
	movq	%rdx, %rcx	; tmp191,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp193,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:399:             ast_output(0, true, "type\n");
	movq	-16(%rbp), %rax	; outfile, tmp194
	movq	%rax, %rcx	; tmp194,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp195
	movq	%rax, %rdi	; tmp195,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:400:             output_name(name->type, outfile, indent + 1, parser);
	movq	-24(%rbp), %rax	; indent, tmp196
	leaq	1(%rax), %rdi	;, _12
	movq	-8(%rbp), %rax	; name, tmp197
	movq	(%rax), %rax	; name_15(D)->type, _13
	movq	-32(%rbp), %rdx	; parser, tmp198
	movq	-16(%rbp), %rsi	; outfile, tmp199
	movq	%rdx, %rcx	; tmp198,
	movq	%rdi, %rdx	; _12,
	movq	%rax, %rdi	; _13,
	call	output_name	;
; src/output.c:401:             break;
	jmp	.L100	;
.L103:
; src/output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	-32(%rbp), %rdx	; parser, tmp200
	movq	-24(%rbp), %rsi	; indent, tmp201
	movq	-16(%rbp), %rax	; outfile, tmp202
	movq	%rdx, %rcx	; tmp200,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp202,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:403:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	-16(%rbp), %rax	; outfile, tmp203
	movq	%rax, %rcx	; tmp203,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC76(%rip), %rax	;, tmp204
	movq	%rax, %rdi	; tmp204,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:404:             break;
	nop	
.L100:
; src/output.c:407: }
	leave	
	ret	
	.size	output_name, .-output_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

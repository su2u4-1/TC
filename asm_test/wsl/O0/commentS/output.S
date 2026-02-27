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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; code_member, code_member
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:24:     CodeMember* code_member_ptr = code_member;
	movq	-24(%rbp), %rax	; code_member, tmp90
	movq	%rax, -8(%rbp)	; tmp90, code_member_ptr
; src/output.c:25:     switch (code_member_ptr->type) {
	movq	-8(%rbp), %rax	; code_member_ptr, tmp91
	movl	8(%rax), %eax	; code_member_ptr_11->type, _1
; src/output.c:25:     switch (code_member_ptr->type) {
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
; src/output.c:27:             OUT(0, false, "import\n");
	movq	-48(%rbp), %rdx	; parser, tmp92
	movq	-40(%rbp), %rsi	; indent, tmp93
	movq	-32(%rbp), %rax	; outfile, tmp94
	movq	%rdx, %rcx	; tmp92,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp94,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:27:             OUT(0, false, "import\n");
	movq	-32(%rbp), %rax	; outfile, tmp95
	movq	%rax, %rcx	; tmp95,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rax	;, tmp96
	movq	%rax, %rdi	; tmp96,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp97
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; code_member_ptr, tmp98
	movq	(%rax), %rax	; code_member_ptr_11->content.import, _3
	movq	-48(%rbp), %rdx	; parser, tmp99
	movq	-32(%rbp), %rsi	; outfile, tmp100
	movq	%rdx, %rcx	; tmp99,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_import	;
; src/output.c:29:             break;
	jmp	.L6	;
.L5:
; src/output.c:31:             OUT(0, false, "function\n");
	movq	-48(%rbp), %rdx	; parser, tmp101
	movq	-40(%rbp), %rsi	; indent, tmp102
	movq	-32(%rbp), %rax	; outfile, tmp103
	movq	%rdx, %rcx	; tmp101,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp103,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:31:             OUT(0, false, "function\n");
	movq	-32(%rbp), %rax	; outfile, tmp104
	movq	%rax, %rcx	; tmp104,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp105
	movq	%rax, %rdi	; tmp105,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp106
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; code_member_ptr, tmp107
	movq	(%rax), %rax	; code_member_ptr_11->content.function, _5
	movq	-48(%rbp), %rdx	; parser, tmp108
	movq	-32(%rbp), %rsi	; outfile, tmp109
	movq	%rdx, %rcx	; tmp108,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_function	;
; src/output.c:33:             break;
	jmp	.L6	;
.L2:
; src/output.c:35:             OUT(0, false, "class\n");
	movq	-48(%rbp), %rdx	; parser, tmp110
	movq	-40(%rbp), %rsi	; indent, tmp111
	movq	-32(%rbp), %rax	; outfile, tmp112
	movq	%rdx, %rcx	; tmp110,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp112,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:35:             OUT(0, false, "class\n");
	movq	-32(%rbp), %rax	; outfile, tmp113
	movq	%rax, %rcx	; tmp113,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC2(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp115
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; code_member_ptr, tmp116
	movq	(%rax), %rax	; code_member_ptr_11->content.class_, _7
	movq	-48(%rbp), %rdx	; parser, tmp117
	movq	-32(%rbp), %rsi	; outfile, tmp118
	movq	%rdx, %rcx	; tmp117,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_class	;
; src/output.c:37:             break;
	jmp	.L6	;
.L3:
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	-48(%rbp), %rdx	; parser, tmp119
	movq	-40(%rbp), %rsi	; indent, tmp120
	movq	-32(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rcx	; tmp119,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp121,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	-8(%rbp), %rax	; code_member_ptr, tmp122
	movl	8(%rax), %edx	; code_member_ptr_11->type, _8
	movq	-32(%rbp), %rax	; outfile, tmp123
	leaq	.LC3(%rip), %rcx	;, tmp124
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:40:             break;
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
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	-24(%rbp), %rax	; code, tmp84
	movq	(%rax), %rax	; code_5(D)->members, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -8(%rbp)	; tmp85, members
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	jmp	.L8	;
.L9:
; src/output.c:50:         output_code_member(member, outfile, indent + 1, parser);
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
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	-8(%rbp), %rax	; members, tmp90
	movq	%rax, %rdi	; tmp90,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp91, member
; src/output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	cmpq	$0, -16(%rbp)	;, member
	jne	.L9	;,
; src/output.c:51: }
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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; import, import
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:56:     Import* import_ptr = import;
	movq	-24(%rbp), %rax	; import, tmp86
	movq	%rax, -8(%rbp)	; tmp86, import_ptr
; src/output.c:57:     OUT(0, false, "name\n");
	movq	-48(%rbp), %rdx	; parser, tmp87
	movq	-40(%rbp), %rsi	; indent, tmp88
	movq	-32(%rbp), %rax	; outfile, tmp89
	movq	%rdx, %rcx	; tmp87,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp89,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:57:     OUT(0, false, "name\n");
	movq	-32(%rbp), %rax	; outfile, tmp90
	movq	%rax, %rcx	; tmp90,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp91
	movq	%rax, %rdi	; tmp91,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp92
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; import_ptr, tmp93
	movq	(%rax), %rax	; import_ptr_6->name, _2
	movq	-48(%rbp), %rdx	; parser, tmp94
	movq	-32(%rbp), %rsi	; outfile, tmp95
	movq	%rdx, %rcx	; tmp94,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	-48(%rbp), %rdx	; parser, tmp96
	movq	-40(%rbp), %rsi	; indent, tmp97
	movq	-32(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rcx	; tmp96,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	-8(%rbp), %rax	; import_ptr, tmp99
	movq	8(%rax), %rax	; import_ptr_6->source, _3
	testq	%rax, %rax	; _3
	je	.L11	;,
	movq	-8(%rbp), %rax	; import_ptr, tmp100
	movq	8(%rax), %rax	; import_ptr_6->source, iftmp.0_4
	jmp	.L12	;
.L11:
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	leaq	.LC5(%rip), %rax	;, iftmp.0_4
.L12:
; src/output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	-32(%rbp), %rcx	; outfile, tmp101
	movq	%rax, %rdx	; iftmp.0_4,
	leaq	.LC6(%rip), %rax	;, tmp102
	movq	%rax, %rsi	; tmp102,
	movq	%rcx, %rdi	; tmp101,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:60: }
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
; src/output.c:65:     Function* function_ptr = function;
	movq	-56(%rbp), %rax	; function, tmp91
	movq	%rax, -16(%rbp)	; tmp91, function_ptr
; src/output.c:66:     OUT(0, false, "name\n");
	movq	-80(%rbp), %rdx	; parser, tmp92
	movq	-72(%rbp), %rsi	; indent, tmp93
	movq	-64(%rbp), %rax	; outfile, tmp94
	movq	%rdx, %rcx	; tmp92,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp94,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:66:     OUT(0, false, "name\n");
	movq	-64(%rbp), %rax	; outfile, tmp95
	movq	%rax, %rcx	; tmp95,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp96
	movq	%rax, %rdi	; tmp96,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp97
	leaq	1(%rax), %rdi	;, _1
	movq	-16(%rbp), %rax	; function_ptr, tmp98
	movq	(%rax), %rax	; function_ptr_14->name, _2
	movq	-80(%rbp), %rdx	; parser, tmp99
	movq	-64(%rbp), %rsi	; outfile, tmp100
	movq	%rdx, %rcx	; tmp99,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:68:     OUT(0, false, "return_type\n");
	movq	-80(%rbp), %rdx	; parser, tmp101
	movq	-72(%rbp), %rsi	; indent, tmp102
	movq	-64(%rbp), %rax	; outfile, tmp103
	movq	%rdx, %rcx	; tmp101,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp103,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:68:     OUT(0, false, "return_type\n");
	movq	-64(%rbp), %rax	; outfile, tmp104
	movq	%rax, %rcx	; tmp104,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp105
	movq	%rax, %rdi	; tmp105,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:69:     output_name(function_ptr->return_type, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp106
	leaq	1(%rax), %rdi	;, _3
	movq	-16(%rbp), %rax	; function_ptr, tmp107
	movq	8(%rax), %rax	; function_ptr_14->return_type, _4
	movq	-80(%rbp), %rdx	; parser, tmp108
	movq	-64(%rbp), %rsi	; outfile, tmp109
	movq	%rdx, %rcx	; tmp108,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:70:     OUT(0, false, "parameters\n");
	movq	-80(%rbp), %rdx	; parser, tmp110
	movq	-72(%rbp), %rsi	; indent, tmp111
	movq	-64(%rbp), %rax	; outfile, tmp112
	movq	%rdx, %rcx	; tmp110,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp112,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:70:     OUT(0, false, "parameters\n");
	movq	-64(%rbp), %rax	; outfile, tmp113
	movq	%rax, %rcx	; tmp113,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	-16(%rbp), %rax	; function_ptr, tmp115
	movq	16(%rax), %rax	; function_ptr_14->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp116, parameters
; src/output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	-16(%rbp), %rax	; function_ptr, tmp117
	movq	24(%rax), %rax	; function_ptr_14->body, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp118, body
; src/output.c:74:     int index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L14	;
.L15:
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	-72(%rbp), %rax	; indent, tmp119
	leaq	1(%rax), %rsi	;, _7
	movq	-80(%rbp), %rdx	; parser, tmp120
	movq	-64(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rcx	; tmp120,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp121,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp122
	movq	-64(%rbp), %rax	; outfile, tmp123
	leaq	.LC9(%rip), %rcx	;, tmp124
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	movq	-72(%rbp), %rax	; indent, tmp125
	leaq	2(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; parser, tmp126
	movq	-64(%rbp), %rsi	; outfile, tmp127
	movq	-40(%rbp), %rax	; parameter, tmp128
	movq	%rdx, %rcx	; tmp126,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp128,
	call	output_variable	;
.L14:
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	-24(%rbp), %rax	; parameters, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp130, parameter
; src/output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	cmpq	$0, -40(%rbp)	;, parameter
	jne	.L15	;,
; src/output.c:79:     OUT(0, true, "body\n");
	movq	-80(%rbp), %rdx	; parser, tmp131
	movq	-72(%rbp), %rsi	; indent, tmp132
	movq	-64(%rbp), %rax	; outfile, tmp133
	movq	%rdx, %rcx	; tmp131,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp133,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:79:     OUT(0, true, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp134
	movq	%rax, %rcx	; tmp134,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp135
	movq	%rax, %rdi	; tmp135,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L16	;
.L17:
; src/output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp136
	leaq	1(%rax), %rdi	;, _9
	movq	-80(%rbp), %rdx	; parser, tmp137
	movq	-64(%rbp), %rsi	; outfile, tmp138
	movq	-48(%rbp), %rax	; statement, tmp139
	movq	%rdx, %rcx	; tmp137,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; tmp139,
	call	output_statement	;
.L16:
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-32(%rbp), %rax	; body, tmp140
	movq	%rax, %rdi	; tmp140,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp141, statement
; src/output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L17	;,
; src/output.c:83: }
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
; src/output.c:88:     Method* method_ptr = method;
	movq	-56(%rbp), %rax	; method, tmp91
	movq	%rax, -16(%rbp)	; tmp91, method_ptr
; src/output.c:89:     OUT(0, false, "name\n");
	movq	-80(%rbp), %rdx	; parser, tmp92
	movq	-72(%rbp), %rsi	; indent, tmp93
	movq	-64(%rbp), %rax	; outfile, tmp94
	movq	%rdx, %rcx	; tmp92,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp94,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:89:     OUT(0, false, "name\n");
	movq	-64(%rbp), %rax	; outfile, tmp95
	movq	%rax, %rcx	; tmp95,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp96
	movq	%rax, %rdi	; tmp96,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp97
	leaq	1(%rax), %rdi	;, _1
	movq	-16(%rbp), %rax	; method_ptr, tmp98
	movq	(%rax), %rax	; method_ptr_14->name, _2
	movq	-80(%rbp), %rdx	; parser, tmp99
	movq	-64(%rbp), %rsi	; outfile, tmp100
	movq	%rdx, %rcx	; tmp99,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:91:     OUT(0, false, "return_type\n");
	movq	-80(%rbp), %rdx	; parser, tmp101
	movq	-72(%rbp), %rsi	; indent, tmp102
	movq	-64(%rbp), %rax	; outfile, tmp103
	movq	%rdx, %rcx	; tmp101,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp103,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:91:     OUT(0, false, "return_type\n");
	movq	-64(%rbp), %rax	; outfile, tmp104
	movq	%rax, %rcx	; tmp104,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp105
	movq	%rax, %rdi	; tmp105,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:92:     output_name(method_ptr->return_type, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp106
	leaq	1(%rax), %rdi	;, _3
	movq	-16(%rbp), %rax	; method_ptr, tmp107
	movq	8(%rax), %rax	; method_ptr_14->return_type, _4
	movq	-80(%rbp), %rdx	; parser, tmp108
	movq	-64(%rbp), %rsi	; outfile, tmp109
	movq	%rdx, %rcx	; tmp108,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:93:     OUT(0, false, "parameters\n");
	movq	-80(%rbp), %rdx	; parser, tmp110
	movq	-72(%rbp), %rsi	; indent, tmp111
	movq	-64(%rbp), %rax	; outfile, tmp112
	movq	%rdx, %rcx	; tmp110,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp112,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:93:     OUT(0, false, "parameters\n");
	movq	-64(%rbp), %rax	; outfile, tmp113
	movq	%rax, %rcx	; tmp113,
	movl	$11, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC8(%rip), %rax	;, tmp114
	movq	%rax, %rdi	; tmp114,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	-16(%rbp), %rax	; method_ptr, tmp115
	movq	16(%rax), %rax	; method_ptr_14->parameters, _5
	movq	%rax, %rdi	; _5,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp116, parameters
; src/output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	-16(%rbp), %rax	; method_ptr, tmp117
	movq	24(%rax), %rax	; method_ptr_14->body, _6
	movq	%rax, %rdi	; _6,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp118, body
; src/output.c:97:     int index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L19	;
.L20:
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	-72(%rbp), %rax	; indent, tmp119
	leaq	1(%rax), %rsi	;, _7
	movq	-80(%rbp), %rdx	; parser, tmp120
	movq	-64(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rcx	; tmp120,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp121,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp122
	movq	-64(%rbp), %rax	; outfile, tmp123
	leaq	.LC9(%rip), %rcx	;, tmp124
	movq	%rcx, %rsi	; tmp124,
	movq	%rax, %rdi	; tmp123,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	movq	-72(%rbp), %rax	; indent, tmp125
	leaq	2(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; parser, tmp126
	movq	-64(%rbp), %rsi	; outfile, tmp127
	movq	-40(%rbp), %rax	; parameter, tmp128
	movq	%rdx, %rcx	; tmp126,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp128,
	call	output_variable	;
.L19:
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	-24(%rbp), %rax	; parameters, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp130, parameter
; src/output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	cmpq	$0, -40(%rbp)	;, parameter
	jne	.L20	;,
; src/output.c:102:     OUT(0, true, "body\n");
	movq	-80(%rbp), %rdx	; parser, tmp131
	movq	-72(%rbp), %rsi	; indent, tmp132
	movq	-64(%rbp), %rax	; outfile, tmp133
	movq	%rdx, %rcx	; tmp131,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp133,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:102:     OUT(0, true, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp134
	movq	%rax, %rcx	; tmp134,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp135
	movq	%rax, %rdi	; tmp135,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L21	;
.L22:
; src/output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp136
	leaq	1(%rax), %rdi	;, _9
	movq	-80(%rbp), %rdx	; parser, tmp137
	movq	-64(%rbp), %rsi	; outfile, tmp138
	movq	-48(%rbp), %rax	; statement, tmp139
	movq	%rdx, %rcx	; tmp137,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; tmp139,
	call	output_statement	;
.L21:
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-32(%rbp), %rax	; body, tmp140
	movq	%rax, %rdi	; tmp140,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp141, statement
; src/output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -48(%rbp)	;, statement
	jne	.L22	;,
; src/output.c:106: }
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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; class_member, class_member
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:111:     ClassMember* class_member_ptr = class_member;
	movq	-24(%rbp), %rax	; class_member, tmp88
	movq	%rax, -8(%rbp)	; tmp88, class_member_ptr
; src/output.c:112:     switch (class_member_ptr->type) {
	movq	-8(%rbp), %rax	; class_member_ptr, tmp89
	movl	8(%rax), %eax	; class_member_ptr_9->type, _1
; src/output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	; _1
	je	.L24	;,
	cmpl	$1, %eax	;, _1
	je	.L25	;,
	jmp	.L28	;
.L24:
; src/output.c:114:             OUT(0, false, "method\n");
	movq	-48(%rbp), %rdx	; parser, tmp90
	movq	-40(%rbp), %rsi	; indent, tmp91
	movq	-32(%rbp), %rax	; outfile, tmp92
	movq	%rdx, %rcx	; tmp90,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp92,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:114:             OUT(0, false, "method\n");
	movq	-32(%rbp), %rax	; outfile, tmp93
	movq	%rax, %rcx	; tmp93,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC11(%rip), %rax	;, tmp94
	movq	%rax, %rdi	; tmp94,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp95
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; class_member_ptr, tmp96
	movq	(%rax), %rax	; class_member_ptr_9->content.method, _3
	movq	-48(%rbp), %rdx	; parser, tmp97
	movq	-32(%rbp), %rsi	; outfile, tmp98
	movq	%rdx, %rcx	; tmp97,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_method	;
; src/output.c:116:             break;
	jmp	.L27	;
.L25:
; src/output.c:118:             OUT(0, false, "variable\n");
	movq	-48(%rbp), %rdx	; parser, tmp99
	movq	-40(%rbp), %rsi	; indent, tmp100
	movq	-32(%rbp), %rax	; outfile, tmp101
	movq	%rdx, %rcx	; tmp99,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp101,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:118:             OUT(0, false, "variable\n");
	movq	-32(%rbp), %rax	; outfile, tmp102
	movq	%rax, %rcx	; tmp102,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC12(%rip), %rax	;, tmp103
	movq	%rax, %rdi	; tmp103,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:119:             output_variable(class_member_ptr->content.variable, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp104
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; class_member_ptr, tmp105
	movq	(%rax), %rax	; class_member_ptr_9->content.variable, _5
	movq	-48(%rbp), %rdx	; parser, tmp106
	movq	-32(%rbp), %rsi	; outfile, tmp107
	movq	%rdx, %rcx	; tmp106,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_variable	;
; src/output.c:120:             break;
	jmp	.L27	;
.L28:
; src/output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	-48(%rbp), %rdx	; parser, tmp108
	movq	-40(%rbp), %rsi	; indent, tmp109
	movq	-32(%rbp), %rax	; outfile, tmp110
	movq	%rdx, %rcx	; tmp108,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp110,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	-8(%rbp), %rax	; class_member_ptr, tmp111
	movl	8(%rax), %edx	; class_member_ptr_9->type, _6
	movq	-32(%rbp), %rax	; outfile, tmp112
	leaq	.LC13(%rip), %rcx	;, tmp113
	movq	%rcx, %rsi	; tmp113,
	movq	%rax, %rdi	; tmp112,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:123:             break;
	nop	
.L27:
; src/output.c:125: }
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
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; class, class
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
	movq	%rcx, -64(%rbp)	; parser, parser
; src/output.c:130:     Class* class_ptr = class;
	movq	-40(%rbp), %rax	; class, tmp86
	movq	%rax, -8(%rbp)	; tmp86, class_ptr
; src/output.c:131:     OUT(0, false, "name\n");
	movq	-64(%rbp), %rdx	; parser, tmp87
	movq	-56(%rbp), %rsi	; indent, tmp88
	movq	-48(%rbp), %rax	; outfile, tmp89
	movq	%rdx, %rcx	; tmp87,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp89,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:131:     OUT(0, false, "name\n");
	movq	-48(%rbp), %rax	; outfile, tmp90
	movq	%rax, %rcx	; tmp90,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp91
	movq	%rax, %rdi	; tmp91,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp92
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; class_ptr, tmp93
	movq	(%rax), %rax	; class_ptr_7->name, _2
	movq	-64(%rbp), %rdx	; parser, tmp94
	movq	-48(%rbp), %rsi	; outfile, tmp95
	movq	%rdx, %rcx	; tmp94,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:133:     OUT(0, true, "members\n");
	movq	-64(%rbp), %rdx	; parser, tmp96
	movq	-56(%rbp), %rsi	; indent, tmp97
	movq	-48(%rbp), %rax	; outfile, tmp98
	movq	%rdx, %rcx	; tmp96,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp98,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:133:     OUT(0, true, "members\n");
	movq	-48(%rbp), %rax	; outfile, tmp99
	movq	%rax, %rcx	; tmp99,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC14(%rip), %rax	;, tmp100
	movq	%rax, %rdi	; tmp100,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:134:     list(ClassMember*) members = list_copy(class_ptr->members);
	movq	-8(%rbp), %rax	; class_ptr, tmp101
	movq	8(%rax), %rax	; class_ptr_7->members, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp102, members
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	jmp	.L30	;
.L31:
; src/output.c:137:         output_class_member(member, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _4
	movq	-64(%rbp), %rdx	; parser, tmp104
	movq	-48(%rbp), %rsi	; outfile, tmp105
	movq	-24(%rbp), %rax	; member, tmp106
	movq	%rdx, %rcx	; tmp104,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp106,
	call	output_class_member	;
.L30:
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	-16(%rbp), %rax	; members, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, member
; src/output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	cmpq	$0, -24(%rbp)	;, member
	jne	.L31	;,
; src/output.c:138: }
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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; variable, variable
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:143:     Variable* variable_ptr = variable;
	movq	-24(%rbp), %rax	; variable, tmp89
	movq	%rax, -8(%rbp)	; tmp89, variable_ptr
; src/output.c:144:     OUT(0, false, "type\n");
	movq	-48(%rbp), %rdx	; parser, tmp90
	movq	-40(%rbp), %rsi	; indent, tmp91
	movq	-32(%rbp), %rax	; outfile, tmp92
	movq	%rdx, %rcx	; tmp90,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp92,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:144:     OUT(0, false, "type\n");
	movq	-32(%rbp), %rax	; outfile, tmp93
	movq	%rax, %rcx	; tmp93,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp94
	movq	%rax, %rdi	; tmp94,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp95
	leaq	1(%rax), %rdi	;, _1
	movq	-8(%rbp), %rax	; variable_ptr, tmp96
	movq	(%rax), %rax	; variable_ptr_10->type, _2
	movq	-48(%rbp), %rdx	; parser, tmp97
	movq	-32(%rbp), %rsi	; outfile, tmp98
	movq	%rdx, %rcx	; tmp97,
	movq	%rdi, %rdx	; _1,
	movq	%rax, %rdi	; _2,
	call	output_name	;
; src/output.c:146:     OUT(0, false, "name\n");
	movq	-48(%rbp), %rdx	; parser, tmp99
	movq	-40(%rbp), %rsi	; indent, tmp100
	movq	-32(%rbp), %rax	; outfile, tmp101
	movq	%rdx, %rcx	; tmp99,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp101,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:146:     OUT(0, false, "name\n");
	movq	-32(%rbp), %rax	; outfile, tmp102
	movq	%rax, %rcx	; tmp102,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp103
	movq	%rax, %rdi	; tmp103,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:147:     output_name(variable_ptr->name, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp104
	leaq	1(%rax), %rdi	;, _3
	movq	-8(%rbp), %rax	; variable_ptr, tmp105
	movq	8(%rax), %rax	; variable_ptr_10->name, _4
	movq	-48(%rbp), %rdx	; parser, tmp106
	movq	-32(%rbp), %rsi	; outfile, tmp107
	movq	%rdx, %rcx	; tmp106,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_name	;
; src/output.c:148:     if (variable_ptr->value != 0) {
	movq	-8(%rbp), %rax	; variable_ptr, tmp108
	movq	16(%rax), %rax	; variable_ptr_10->value, _5
; src/output.c:148:     if (variable_ptr->value != 0) {
	testq	%rax, %rax	; _5
	je	.L33	;,
; src/output.c:149:         OUT(0, true, "value\n");
	movq	-48(%rbp), %rdx	; parser, tmp109
	movq	-40(%rbp), %rsi	; indent, tmp110
	movq	-32(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:149:         OUT(0, true, "value\n");
	movq	-32(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp114
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; variable_ptr, tmp115
	movq	16(%rax), %rax	; variable_ptr_10->value, _7
	movq	-48(%rbp), %rdx	; parser, tmp116
	movq	-32(%rbp), %rsi	; outfile, tmp117
	movq	%rdx, %rcx	; tmp116,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_expression	;
; src/output.c:153: }
	jmp	.L35	;
.L33:
; src/output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp118
	movq	-40(%rbp), %rsi	; indent, tmp119
	movq	-32(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp118,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp121
	movq	%rax, %rcx	; tmp121,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC17(%rip), %rax	;, tmp122
	movq	%rax, %rdi	; tmp122,
	call	*fwrite@GOTPCREL(%rip)	;
.L35:
; src/output.c:153: }
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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; statement, statement
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:158:     Statement* statement_ptr = statement;
	movq	-24(%rbp), %rax	; statement, tmp98
	movq	%rax, -8(%rbp)	; tmp98, statement_ptr
; src/output.c:159:     switch (statement_ptr->type) {
	movq	-8(%rbp), %rax	; statement_ptr, tmp99
	movl	8(%rax), %eax	; statement_ptr_19->type, _1
; src/output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, %eax	;, _1
	ja	.L37	;,
	movl	%eax, %eax	; _1, tmp100
	leaq	0(,%rax,4), %rdx	;, tmp101
	leaq	.L39(%rip), %rax	;, tmp102
	movl	(%rdx,%rax), %eax	;, tmp103
	cltq
	leaq	.L39(%rip), %rdx	;, tmp106
	addq	%rdx, %rax	; tmp106, tmp105
	jmp	*%rax	; tmp105
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
; src/output.c:161:             OUT(0, false, "if_statement\n");
	movq	-48(%rbp), %rdx	; parser, tmp107
	movq	-40(%rbp), %rsi	; indent, tmp108
	movq	-32(%rbp), %rax	; outfile, tmp109
	movq	%rdx, %rcx	; tmp107,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp109,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:161:             OUT(0, false, "if_statement\n");
	movq	-32(%rbp), %rax	; outfile, tmp110
	movq	%rax, %rcx	; tmp110,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC18(%rip), %rax	;, tmp111
	movq	%rax, %rdi	; tmp111,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp112
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; statement_ptr, tmp113
	movq	(%rax), %rax	; statement_ptr_19->stmt.if_stmt, _3
	movq	-48(%rbp), %rdx	; parser, tmp114
	movq	-32(%rbp), %rsi	; outfile, tmp115
	movq	%rdx, %rcx	; tmp114,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_if	;
; src/output.c:163:             break;
	jmp	.L36	;
.L42:
; src/output.c:165:             OUT(0, false, "for_statement\n");
	movq	-48(%rbp), %rdx	; parser, tmp116
	movq	-40(%rbp), %rsi	; indent, tmp117
	movq	-32(%rbp), %rax	; outfile, tmp118
	movq	%rdx, %rcx	; tmp116,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp118,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:165:             OUT(0, false, "for_statement\n");
	movq	-32(%rbp), %rax	; outfile, tmp119
	movq	%rax, %rcx	; tmp119,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC19(%rip), %rax	;, tmp120
	movq	%rax, %rdi	; tmp120,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp121
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; statement_ptr, tmp122
	movq	(%rax), %rax	; statement_ptr_19->stmt.for_stmt, _5
	movq	-48(%rbp), %rdx	; parser, tmp123
	movq	-32(%rbp), %rsi	; outfile, tmp124
	movq	%rdx, %rcx	; tmp123,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_for	;
; src/output.c:167:             break;
	jmp	.L36	;
.L43:
; src/output.c:169:             OUT(0, false, "while_statement\n");
	movq	-48(%rbp), %rdx	; parser, tmp125
	movq	-40(%rbp), %rsi	; indent, tmp126
	movq	-32(%rbp), %rax	; outfile, tmp127
	movq	%rdx, %rcx	; tmp125,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp127,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:169:             OUT(0, false, "while_statement\n");
	movq	-32(%rbp), %rax	; outfile, tmp128
	movq	%rax, %rcx	; tmp128,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC20(%rip), %rax	;, tmp129
	movq	%rax, %rdi	; tmp129,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp130
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; statement_ptr, tmp131
	movq	(%rax), %rax	; statement_ptr_19->stmt.while_stmt, _7
	movq	-48(%rbp), %rdx	; parser, tmp132
	movq	-32(%rbp), %rsi	; outfile, tmp133
	movq	%rdx, %rcx	; tmp132,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_while	;
; src/output.c:171:             break;
	jmp	.L36	;
.L45:
; src/output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movq	-48(%rbp), %rdx	; parser, tmp134
	movq	-40(%rbp), %rsi	; indent, tmp135
	movq	-32(%rbp), %rax	; outfile, tmp136
	movq	%rdx, %rcx	; tmp134,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp136,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movq	-32(%rbp), %rax	; outfile, tmp137
	movq	%rax, %rcx	; tmp137,
	movl	$31, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC21(%rip), %rax	;, tmp138
	movq	%rax, %rdi	; tmp138,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp139
	leaq	1(%rax), %rdi	;, _8
	movq	-8(%rbp), %rax	; statement_ptr, tmp140
	movq	(%rax), %rax	; statement_ptr_19->stmt.var, _9
	movq	-48(%rbp), %rdx	; parser, tmp141
	movq	-32(%rbp), %rsi	; outfile, tmp142
	movq	%rdx, %rcx	; tmp141,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; _9,
	call	output_variable	;
; src/output.c:175:             break;
	jmp	.L36	;
.L41:
; src/output.c:177:             if (statement_ptr->stmt.expr == 0) {
	movq	-8(%rbp), %rax	; statement_ptr, tmp143
	movq	(%rax), %rax	; statement_ptr_19->stmt.expr, _10
; src/output.c:177:             if (statement_ptr->stmt.expr == 0) {
	testq	%rax, %rax	; _10
	jne	.L48	;,
; src/output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp144
	movq	-40(%rbp), %rsi	; indent, tmp145
	movq	-32(%rbp), %rax	; outfile, tmp146
	movq	%rdx, %rcx	; tmp144,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp146,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp147
	movq	%rax, %rcx	; tmp147,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC22(%rip), %rax	;, tmp148
	movq	%rax, %rdi	; tmp148,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:179:                 return;
	jmp	.L36	;
.L48:
; src/output.c:181:             OUT(0, false, "return_statement\n");
	movq	-48(%rbp), %rdx	; parser, tmp149
	movq	-40(%rbp), %rsi	; indent, tmp150
	movq	-32(%rbp), %rax	; outfile, tmp151
	movq	%rdx, %rcx	; tmp149,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp151,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:181:             OUT(0, false, "return_statement\n");
	movq	-32(%rbp), %rax	; outfile, tmp152
	movq	%rax, %rcx	; tmp152,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC23(%rip), %rax	;, tmp153
	movq	%rax, %rdi	; tmp153,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:182:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp154
	leaq	1(%rax), %rdi	;, _11
	movq	-8(%rbp), %rax	; statement_ptr, tmp155
	movq	(%rax), %rax	; statement_ptr_19->stmt.expr, _12
	movq	-48(%rbp), %rdx	; parser, tmp156
	movq	-32(%rbp), %rsi	; outfile, tmp157
	movq	%rdx, %rcx	; tmp156,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_expression	;
; src/output.c:183:             break;
	jmp	.L36	;
.L40:
; src/output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp158
	movq	-40(%rbp), %rsi	; indent, tmp159
	movq	-32(%rbp), %rax	; outfile, tmp160
	movq	%rdx, %rcx	; tmp158,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp160,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp161
	movq	%rax, %rcx	; tmp161,
	movl	$24, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC24(%rip), %rax	;, tmp162
	movq	%rax, %rdi	; tmp162,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:186:             return;
	jmp	.L36	;
.L38:
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp163
	movq	-40(%rbp), %rsi	; indent, tmp164
	movq	-32(%rbp), %rax	; outfile, tmp165
	movq	%rdx, %rcx	; tmp163,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp165,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp166
	movq	%rax, %rcx	; tmp166,
	movl	$27, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC25(%rip), %rax	;, tmp167
	movq	%rax, %rdi	; tmp167,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:189:             return;
	jmp	.L36	;
.L46:
; src/output.c:191:             if (statement_ptr->stmt.expr == 0) {
	movq	-8(%rbp), %rax	; statement_ptr, tmp168
	movq	(%rax), %rax	; statement_ptr_19->stmt.expr, _13
; src/output.c:191:             if (statement_ptr->stmt.expr == 0) {
	testq	%rax, %rax	; _13
	jne	.L49	;,
; src/output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp169
	movq	-40(%rbp), %rsi	; indent, tmp170
	movq	-32(%rbp), %rax	; outfile, tmp171
	movq	%rdx, %rcx	; tmp169,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp171,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp172
	movq	%rax, %rcx	; tmp172,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC26(%rip), %rax	;, tmp173
	movq	%rax, %rdi	; tmp173,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:193:                 return;
	jmp	.L36	;
.L49:
; src/output.c:195:             OUT(0, false, "expression_statement\n");
	movq	-48(%rbp), %rdx	; parser, tmp174
	movq	-40(%rbp), %rsi	; indent, tmp175
	movq	-32(%rbp), %rax	; outfile, tmp176
	movq	%rdx, %rcx	; tmp174,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp176,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:195:             OUT(0, false, "expression_statement\n");
	movq	-32(%rbp), %rax	; outfile, tmp177
	movq	%rax, %rcx	; tmp177,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC27(%rip), %rax	;, tmp178
	movq	%rax, %rdi	; tmp178,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp179
	leaq	1(%rax), %rdi	;, _14
	movq	-8(%rbp), %rax	; statement_ptr, tmp180
	movq	(%rax), %rax	; statement_ptr_19->stmt.expr, _15
	movq	-48(%rbp), %rdx	; parser, tmp181
	movq	-32(%rbp), %rsi	; outfile, tmp182
	movq	%rdx, %rcx	; tmp181,
	movq	%rdi, %rdx	; _14,
	movq	%rax, %rdi	; _15,
	call	output_expression	;
; src/output.c:197:             break;
	jmp	.L36	;
.L37:
; src/output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movq	-48(%rbp), %rdx	; parser, tmp183
	movq	-40(%rbp), %rsi	; indent, tmp184
	movq	-32(%rbp), %rax	; outfile, tmp185
	movq	%rdx, %rcx	; tmp183,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp185,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movq	-8(%rbp), %rax	; statement_ptr, tmp186
	movl	8(%rax), %edx	; statement_ptr_19->type, _16
	movq	-32(%rbp), %rax	; outfile, tmp187
	leaq	.LC28(%rip), %rcx	;, tmp188
	movq	%rcx, %rsi	; tmp188,
	movq	%rax, %rdi	; tmp187,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:200:             return;
	nop	
.L36:
; src/output.c:202: }
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
; src/output.c:207:     If* if_ptr = if_;
	movq	-56(%rbp), %rax	; if_, tmp90
	movq	%rax, -8(%rbp)	; tmp90, if_ptr
; src/output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	-8(%rbp), %rax	; if_ptr, tmp91
	movq	8(%rax), %rax	; if_ptr_13->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp92, body
; src/output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	-8(%rbp), %rax	; if_ptr, tmp93
	movq	16(%rax), %rax	; if_ptr_13->else_if, _2
	movq	%rax, %rdi	; _2,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp94, else_if_list
; src/output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	-8(%rbp), %rax	; if_ptr, tmp95
	movq	24(%rax), %rax	; if_ptr_13->else_body, _3
	movq	%rax, %rdi	; _3,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp96, else_body
; src/output.c:211:     OUT(0, false, "condition\n");
	movq	-80(%rbp), %rdx	; parser, tmp97
	movq	-72(%rbp), %rsi	; indent, tmp98
	movq	-64(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rcx	; tmp97,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp99,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:211:     OUT(0, false, "condition\n");
	movq	-64(%rbp), %rax	; outfile, tmp100
	movq	%rax, %rcx	; tmp100,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; if_ptr, tmp103
	movq	(%rax), %rax	; if_ptr_13->condition, _5
	movq	-80(%rbp), %rdx	; parser, tmp104
	movq	-64(%rbp), %rsi	; outfile, tmp105
	movq	%rdx, %rcx	; tmp104,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_expression	;
; src/output.c:213:     OUT(0, false, "body\n");
	movq	-80(%rbp), %rdx	; parser, tmp106
	movq	-72(%rbp), %rsi	; indent, tmp107
	movq	-64(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:213:     OUT(0, false, "body\n");
	movq	-64(%rbp), %rax	; outfile, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L51	;
.L52:
; src/output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp111
	leaq	1(%rax), %rdi	;, _6
	movq	-80(%rbp), %rdx	; parser, tmp112
	movq	-64(%rbp), %rsi	; outfile, tmp113
	movq	-40(%rbp), %rax	; statement, tmp114
	movq	%rdx, %rcx	; tmp112,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; tmp114,
	call	output_statement	;
.L51:
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	; body, tmp115
	movq	%rax, %rdi	; tmp115,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp116, statement
; src/output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -40(%rbp)	;, statement
	jne	.L52	;,
; src/output.c:217:     OUT(0, false, "else_if\n");
	movq	-80(%rbp), %rdx	; parser, tmp117
	movq	-72(%rbp), %rsi	; indent, tmp118
	movq	-64(%rbp), %rax	; outfile, tmp119
	movq	%rdx, %rcx	; tmp117,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp119,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:217:     OUT(0, false, "else_if\n");
	movq	-64(%rbp), %rax	; outfile, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC30(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	jmp	.L53	;
.L54:
; src/output.c:220:         output_else_if(else_if, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp122
	leaq	1(%rax), %rdi	;, _7
	movq	-80(%rbp), %rdx	; parser, tmp123
	movq	-64(%rbp), %rsi	; outfile, tmp124
	movq	-48(%rbp), %rax	; else_if, tmp125
	movq	%rdx, %rcx	; tmp123,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; tmp125,
	call	output_else_if	;
.L53:
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	-24(%rbp), %rax	; else_if_list, tmp126
	movq	%rax, %rdi	; tmp126,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -48(%rbp)	; tmp127, else_if
; src/output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	cmpq	$0, -48(%rbp)	;, else_if
	jne	.L54	;,
; src/output.c:221:     OUT(0, true, "else_body\n");
	movq	-80(%rbp), %rdx	; parser, tmp128
	movq	-72(%rbp), %rsi	; indent, tmp129
	movq	-64(%rbp), %rax	; outfile, tmp130
	movq	%rdx, %rcx	; tmp128,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp130,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:221:     OUT(0, true, "else_body\n");
	movq	-64(%rbp), %rax	; outfile, tmp131
	movq	%rax, %rcx	; tmp131,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC31(%rip), %rax	;, tmp132
	movq	%rax, %rdi	; tmp132,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	jmp	.L55	;
.L56:
; src/output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	-72(%rbp), %rax	; indent, tmp133
	leaq	1(%rax), %rdi	;, _8
	movq	-80(%rbp), %rdx	; parser, tmp134
	movq	-64(%rbp), %rsi	; outfile, tmp135
	movq	-40(%rbp), %rax	; statement, tmp136
	movq	%rdx, %rcx	; tmp134,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp136,
	call	output_statement	;
.L55:
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	-32(%rbp), %rax	; else_body, tmp137
	movq	%rax, %rdi	; tmp137,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -40(%rbp)	; tmp138, statement
; src/output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	cmpq	$0, -40(%rbp)	;, statement
	jne	.L56	;,
; src/output.c:224: }
	nop	
	nop	
	leave	
	ret	
	.size	output_if, .-output_if
	.type	output_else_if, @function
output_else_if:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; else_if, else_if
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
	movq	%rcx, -64(%rbp)	; parser, parser
; src/output.c:229:     ElseIf* else_if_ptr = else_if;
	movq	-40(%rbp), %rax	; else_if, tmp86
	movq	%rax, -8(%rbp)	; tmp86, else_if_ptr
; src/output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	-8(%rbp), %rax	; else_if_ptr, tmp87
	movq	8(%rax), %rax	; else_if_ptr_7->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp88, body
; src/output.c:231:     OUT(0, false, "condition\n");
	movq	-64(%rbp), %rdx	; parser, tmp89
	movq	-56(%rbp), %rsi	; indent, tmp90
	movq	-48(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rcx	; tmp89,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp91,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:231:     OUT(0, false, "condition\n");
	movq	-48(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp94
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; else_if_ptr, tmp95
	movq	(%rax), %rax	; else_if_ptr_7->condition, _3
	movq	-64(%rbp), %rdx	; parser, tmp96
	movq	-48(%rbp), %rsi	; outfile, tmp97
	movq	%rdx, %rcx	; tmp96,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_expression	;
; src/output.c:233:     OUT(0, true, "body\n");
	movq	-64(%rbp), %rdx	; parser, tmp98
	movq	-56(%rbp), %rsi	; indent, tmp99
	movq	-48(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rcx	; tmp98,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:233:     OUT(0, true, "body\n");
	movq	-48(%rbp), %rax	; outfile, tmp101
	movq	%rax, %rcx	; tmp101,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L58	;
.L59:
; src/output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _4
	movq	-64(%rbp), %rdx	; parser, tmp104
	movq	-48(%rbp), %rsi	; outfile, tmp105
	movq	-24(%rbp), %rax	; statement, tmp106
	movq	%rdx, %rcx	; tmp104,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp106,
	call	output_statement	;
.L58:
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	; body, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, statement
; src/output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -24(%rbp)	;, statement
	jne	.L59	;,
; src/output.c:237: }
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
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; for_, for_
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
	movq	%rcx, -64(%rbp)	; parser, parser
; src/output.c:242:     For* for_ptr = for_;
	movq	-40(%rbp), %rax	; for_, tmp93
	movq	%rax, -8(%rbp)	; tmp93, for_ptr
; src/output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	-8(%rbp), %rax	; for_ptr, tmp94
	movq	24(%rax), %rax	; for_ptr_17->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp95, body
; src/output.c:244:     if (for_ptr->initializer != 0) {
	movq	-8(%rbp), %rax	; for_ptr, tmp96
	movq	(%rax), %rax	; for_ptr_17->initializer, _2
; src/output.c:244:     if (for_ptr->initializer != 0) {
	testq	%rax, %rax	; _2
	je	.L61	;,
; src/output.c:245:         OUT(0, false, "initializer\n");
	movq	-64(%rbp), %rdx	; parser, tmp97
	movq	-56(%rbp), %rsi	; indent, tmp98
	movq	-48(%rbp), %rax	; outfile, tmp99
	movq	%rdx, %rcx	; tmp97,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp99,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:245:         OUT(0, false, "initializer\n");
	movq	-48(%rbp), %rax	; outfile, tmp100
	movq	%rax, %rcx	; tmp100,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC32(%rip), %rax	;, tmp101
	movq	%rax, %rdi	; tmp101,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:246:         output_variable(for_ptr->initializer, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp102
	leaq	1(%rax), %rdi	;, _3
	movq	-8(%rbp), %rax	; for_ptr, tmp103
	movq	(%rax), %rax	; for_ptr_17->initializer, _4
	movq	-64(%rbp), %rdx	; parser, tmp104
	movq	-48(%rbp), %rsi	; outfile, tmp105
	movq	%rdx, %rcx	; tmp104,
	movq	%rdi, %rdx	; _3,
	movq	%rax, %rdi	; _4,
	call	output_variable	;
	jmp	.L62	;
.L61:
; src/output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp106
	movq	-56(%rbp), %rsi	; indent, tmp107
	movq	-48(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$20, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC33(%rip), %rax	;, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*fwrite@GOTPCREL(%rip)	;
.L62:
; src/output.c:249:     if (for_ptr->condition != 0) {
	movq	-8(%rbp), %rax	; for_ptr, tmp111
	movq	8(%rax), %rax	; for_ptr_17->condition, _5
; src/output.c:249:     if (for_ptr->condition != 0) {
	testq	%rax, %rax	; _5
	je	.L63	;,
; src/output.c:250:         OUT(0, false, "condition\n");
	movq	-64(%rbp), %rdx	; parser, tmp112
	movq	-56(%rbp), %rsi	; indent, tmp113
	movq	-48(%rbp), %rax	; outfile, tmp114
	movq	%rdx, %rcx	; tmp112,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp114,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:250:         OUT(0, false, "condition\n");
	movq	-48(%rbp), %rax	; outfile, tmp115
	movq	%rax, %rcx	; tmp115,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp116
	movq	%rax, %rdi	; tmp116,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:251:         output_expression(for_ptr->condition, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp117
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; for_ptr, tmp118
	movq	8(%rax), %rax	; for_ptr_17->condition, _7
	movq	-64(%rbp), %rdx	; parser, tmp119
	movq	-48(%rbp), %rsi	; outfile, tmp120
	movq	%rdx, %rcx	; tmp119,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_expression	;
	jmp	.L64	;
.L63:
; src/output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp121
	movq	-56(%rbp), %rsi	; indent, tmp122
	movq	-48(%rbp), %rax	; outfile, tmp123
	movq	%rdx, %rcx	; tmp121,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp123,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp124
	movq	%rax, %rcx	; tmp124,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC34(%rip), %rax	;, tmp125
	movq	%rax, %rdi	; tmp125,
	call	*fwrite@GOTPCREL(%rip)	;
.L64:
; src/output.c:254:     if (for_ptr->increment != 0) {
	movq	-8(%rbp), %rax	; for_ptr, tmp126
	movq	16(%rax), %rax	; for_ptr_17->increment, _8
; src/output.c:254:     if (for_ptr->increment != 0) {
	testq	%rax, %rax	; _8
	je	.L65	;,
; src/output.c:255:         OUT(0, false, "increment\n");
	movq	-64(%rbp), %rdx	; parser, tmp127
	movq	-56(%rbp), %rsi	; indent, tmp128
	movq	-48(%rbp), %rax	; outfile, tmp129
	movq	%rdx, %rcx	; tmp127,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp129,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:255:         OUT(0, false, "increment\n");
	movq	-48(%rbp), %rax	; outfile, tmp130
	movq	%rax, %rcx	; tmp130,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC35(%rip), %rax	;, tmp131
	movq	%rax, %rdi	; tmp131,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:256:         output_expression(for_ptr->increment, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp132
	leaq	1(%rax), %rdi	;, _9
	movq	-8(%rbp), %rax	; for_ptr, tmp133
	movq	16(%rax), %rax	; for_ptr_17->increment, _10
	movq	-64(%rbp), %rdx	; parser, tmp134
	movq	-48(%rbp), %rsi	; outfile, tmp135
	movq	%rdx, %rcx	; tmp134,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_expression	;
	jmp	.L66	;
.L65:
; src/output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp136
	movq	-56(%rbp), %rsi	; indent, tmp137
	movq	-48(%rbp), %rax	; outfile, tmp138
	movq	%rdx, %rcx	; tmp136,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp138,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp139
	movq	%rax, %rcx	; tmp139,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC36(%rip), %rax	;, tmp140
	movq	%rax, %rdi	; tmp140,
	call	*fwrite@GOTPCREL(%rip)	;
.L66:
; src/output.c:259:     OUT(0, true, "body\n");
	movq	-64(%rbp), %rdx	; parser, tmp141
	movq	-56(%rbp), %rsi	; indent, tmp142
	movq	-48(%rbp), %rax	; outfile, tmp143
	movq	%rdx, %rcx	; tmp141,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp143,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:259:     OUT(0, true, "body\n");
	movq	-48(%rbp), %rax	; outfile, tmp144
	movq	%rax, %rcx	; tmp144,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp145
	movq	%rax, %rdi	; tmp145,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L67	;
.L68:
; src/output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp146
	leaq	1(%rax), %rdi	;, _11
	movq	-64(%rbp), %rdx	; parser, tmp147
	movq	-48(%rbp), %rsi	; outfile, tmp148
	movq	-24(%rbp), %rax	; statement, tmp149
	movq	%rdx, %rcx	; tmp147,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; tmp149,
	call	output_statement	;
.L67:
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	; body, tmp150
	movq	%rax, %rdi	; tmp150,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp151, statement
; src/output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -24(%rbp)	;, statement
	jne	.L68	;,
; src/output.c:263: }
	nop	
	nop	
	leave	
	ret	
	.size	output_for, .-output_for
	.type	output_while, @function
output_while:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$64, %rsp	;,
	movq	%rdi, -40(%rbp)	; while_, while_
	movq	%rsi, -48(%rbp)	; outfile, outfile
	movq	%rdx, -56(%rbp)	; indent, indent
	movq	%rcx, -64(%rbp)	; parser, parser
; src/output.c:268:     While* while_ptr = while_;
	movq	-40(%rbp), %rax	; while_, tmp86
	movq	%rax, -8(%rbp)	; tmp86, while_ptr
; src/output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	-8(%rbp), %rax	; while_ptr, tmp87
	movq	8(%rax), %rax	; while_ptr_7->body, _1
	movq	%rax, %rdi	; _1,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp88, body
; src/output.c:270:     OUT(0, false, "condition\n");
	movq	-64(%rbp), %rdx	; parser, tmp89
	movq	-56(%rbp), %rsi	; indent, tmp90
	movq	-48(%rbp), %rax	; outfile, tmp91
	movq	%rdx, %rcx	; tmp89,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp91,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:270:     OUT(0, false, "condition\n");
	movq	-48(%rbp), %rax	; outfile, tmp92
	movq	%rax, %rcx	; tmp92,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC29(%rip), %rax	;, tmp93
	movq	%rax, %rdi	; tmp93,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp94
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; while_ptr, tmp95
	movq	(%rax), %rax	; while_ptr_7->condition, _3
	movq	-64(%rbp), %rdx	; parser, tmp96
	movq	-48(%rbp), %rsi	; outfile, tmp97
	movq	%rdx, %rcx	; tmp96,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_expression	;
; src/output.c:272:     OUT(0, true, "body\n");
	movq	-64(%rbp), %rdx	; parser, tmp98
	movq	-56(%rbp), %rsi	; indent, tmp99
	movq	-48(%rbp), %rax	; outfile, tmp100
	movq	%rdx, %rcx	; tmp98,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp100,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:272:     OUT(0, true, "body\n");
	movq	-48(%rbp), %rax	; outfile, tmp101
	movq	%rax, %rcx	; tmp101,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC10(%rip), %rax	;, tmp102
	movq	%rax, %rdi	; tmp102,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L70	;
.L71:
; src/output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp103
	leaq	1(%rax), %rdi	;, _4
	movq	-64(%rbp), %rdx	; parser, tmp104
	movq	-48(%rbp), %rsi	; outfile, tmp105
	movq	-24(%rbp), %rax	; statement, tmp106
	movq	%rdx, %rcx	; tmp104,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; tmp106,
	call	output_statement	;
.L70:
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	; body, tmp107
	movq	%rax, %rdi	; tmp107,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp108, statement
; src/output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -24(%rbp)	;, statement
	jne	.L71	;,
; src/output.c:276: }
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
; src/output.c:281:     Expression* expression_ptr = expression;
	movq	-24(%rbp), %rax	; expression, tmp91
	movq	%rax, -8(%rbp)	; tmp91, expression_ptr
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movq	-8(%rbp), %rax	; expression_ptr, tmp92
	movl	24(%rax), %eax	; expression_ptr_12->operator, _1
; src/output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %eax	;, _1
	jne	.L73	;,
; src/output.c:283:         OUT(0, true, "primary\n");
	movq	-48(%rbp), %rdx	; parser, tmp93
	movq	-40(%rbp), %rsi	; indent, tmp94
	movq	-32(%rbp), %rax	; outfile, tmp95
	movq	%rdx, %rcx	; tmp93,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp95,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:283:         OUT(0, true, "primary\n");
	movq	-32(%rbp), %rax	; outfile, tmp96
	movq	%rax, %rcx	; tmp96,
	movl	$8, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC37(%rip), %rax	;, tmp97
	movq	%rax, %rdi	; tmp97,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp98
	leaq	1(%rax), %rdi	;, _2
	movq	-8(%rbp), %rax	; expression_ptr, tmp99
	movq	8(%rax), %rax	; expression_ptr_12->prim_left, _3
	movq	-48(%rbp), %rdx	; parser, tmp100
	movq	-32(%rbp), %rsi	; outfile, tmp101
	movq	%rdx, %rcx	; tmp100,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_primary	;
; src/output.c:293: }
	jmp	.L77	;
.L73:
; src/output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	movq	-8(%rbp), %rax	; expression_ptr, tmp102
	movl	24(%rax), %eax	; expression_ptr_12->operator, _4
	movl	%eax, %edi	; _4,
	call	*operator_to_string@GOTPCREL(%rip)	;
	movq	%rax, -16(%rbp)	; tmp103, op_str
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	-48(%rbp), %rdx	; parser, tmp104
	movq	-40(%rbp), %rsi	; indent, tmp105
	movq	-32(%rbp), %rax	; outfile, tmp106
	movq	%rdx, %rcx	; tmp104,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp106,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	cmpq	$0, -16(%rbp)	;, op_str
	je	.L75	;,
	movq	-16(%rbp), %rax	; op_str, iftmp.1_9
	jmp	.L76	;
.L75:
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	leaq	.LC38(%rip), %rax	;, iftmp.1_9
.L76:
; src/output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	-32(%rbp), %rcx	; outfile, tmp107
	movq	%rax, %rdx	; iftmp.1_9,
	leaq	.LC39(%rip), %rax	;, tmp108
	movq	%rax, %rsi	; tmp108,
	movq	%rcx, %rdi	; tmp107,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:288:         OUT(0, false, "left\n");
	movq	-48(%rbp), %rdx	; parser, tmp109
	movq	-40(%rbp), %rsi	; indent, tmp110
	movq	-32(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:288:         OUT(0, false, "left\n");
	movq	-32(%rbp), %rax	; outfile, tmp112
	movq	%rax, %rcx	; tmp112,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC40(%rip), %rax	;, tmp113
	movq	%rax, %rdi	; tmp113,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp114
	leaq	1(%rax), %rdi	;, _5
	movq	-8(%rbp), %rax	; expression_ptr, tmp115
	movq	(%rax), %rax	; expression_ptr_12->expr_left, _6
	movq	-48(%rbp), %rdx	; parser, tmp116
	movq	-32(%rbp), %rsi	; outfile, tmp117
	movq	%rdx, %rcx	; tmp116,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_expression	;
; src/output.c:290:         OUT(0, true, "right\n");
	movq	-48(%rbp), %rdx	; parser, tmp118
	movq	-40(%rbp), %rsi	; indent, tmp119
	movq	-32(%rbp), %rax	; outfile, tmp120
	movq	%rdx, %rcx	; tmp118,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp120,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:290:         OUT(0, true, "right\n");
	movq	-32(%rbp), %rax	; outfile, tmp121
	movq	%rax, %rcx	; tmp121,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC41(%rip), %rax	;, tmp122
	movq	%rax, %rdi	; tmp122,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp123
	leaq	1(%rax), %rdi	;, _7
	movq	-8(%rbp), %rax	; expression_ptr, tmp124
	movq	16(%rax), %rax	; expression_ptr_12->right, _8
	movq	-48(%rbp), %rdx	; parser, tmp125
	movq	-32(%rbp), %rsi	; outfile, tmp126
	movq	%rdx, %rcx	; tmp125,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; _8,
	call	output_expression	;
.L77:
; src/output.c:293: }
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
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; primary, primary
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:298:     Primary* primary_ptr = primary;
	movq	-24(%rbp), %rax	; primary, tmp95
	movq	%rax, -8(%rbp)	; tmp95, primary_ptr
; src/output.c:299:     switch (primary_ptr->type) {
	movq	-8(%rbp), %rax	; primary_ptr, tmp96
	movl	8(%rax), %eax	; primary_ptr_16->type, _1
; src/output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, %eax	;, _1
	ja	.L79	;,
	movl	%eax, %eax	; _1, tmp97
	leaq	0(,%rax,4), %rdx	;, tmp98
	leaq	.L81(%rip), %rax	;, tmp99
	movl	(%rdx,%rax), %eax	;, tmp100
	cltq
	leaq	.L81(%rip), %rdx	;, tmp103
	addq	%rdx, %rax	; tmp103, tmp102
	jmp	*%rax	; tmp102
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
; src/output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp104
	movq	-40(%rbp), %rsi	; indent, tmp105
	movq	-32(%rbp), %rax	; outfile, tmp106
	movq	%rdx, %rcx	; tmp104,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp106,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp107
	movq	%rax, %rcx	; tmp107,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC42(%rip), %rax	;, tmp108
	movq	%rax, %rdi	; tmp108,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	-48(%rbp), %rdx	; parser, tmp109
	movq	-40(%rbp), %rsi	; indent, tmp110
	movq	-32(%rbp), %rax	; outfile, tmp111
	movq	%rdx, %rcx	; tmp109,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp111,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	-8(%rbp), %rax	; primary_ptr, tmp112
	movq	(%rax), %rdx	; primary_ptr_16->value.literal_value, _2
	movq	-32(%rbp), %rax	; outfile, tmp113
	leaq	.LC43(%rip), %rcx	;, tmp114
	movq	%rcx, %rsi	; tmp114,
	movq	%rax, %rdi	; tmp113,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:303:             break;
	jmp	.L90	;
.L88:
; src/output.c:305:             OUT(0, false, "type: \"float\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp115
	movq	-40(%rbp), %rsi	; indent, tmp116
	movq	-32(%rbp), %rax	; outfile, tmp117
	movq	%rdx, %rcx	; tmp115,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp117,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:305:             OUT(0, false, "type: \"float\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp118
	movq	%rax, %rcx	; tmp118,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC44(%rip), %rax	;, tmp119
	movq	%rax, %rdi	; tmp119,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	-48(%rbp), %rdx	; parser, tmp120
	movq	-40(%rbp), %rsi	; indent, tmp121
	movq	-32(%rbp), %rax	; outfile, tmp122
	movq	%rdx, %rcx	; tmp120,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp122,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	-8(%rbp), %rax	; primary_ptr, tmp123
	movq	(%rax), %rdx	; primary_ptr_16->value.literal_value, _3
	movq	-32(%rbp), %rax	; outfile, tmp124
	leaq	.LC43(%rip), %rcx	;, tmp125
	movq	%rcx, %rsi	; tmp125,
	movq	%rax, %rdi	; tmp124,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:307:             break;
	jmp	.L90	;
.L87:
; src/output.c:309:             OUT(0, false, "type: \"string\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp126
	movq	-40(%rbp), %rsi	; indent, tmp127
	movq	-32(%rbp), %rax	; outfile, tmp128
	movq	%rdx, %rcx	; tmp126,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp128,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:309:             OUT(0, false, "type: \"string\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp129
	movq	%rax, %rcx	; tmp129,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC45(%rip), %rax	;, tmp130
	movq	%rax, %rdi	; tmp130,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	-48(%rbp), %rdx	; parser, tmp131
	movq	-40(%rbp), %rsi	; indent, tmp132
	movq	-32(%rbp), %rax	; outfile, tmp133
	movq	%rdx, %rcx	; tmp131,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp133,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	-8(%rbp), %rax	; primary_ptr, tmp134
	movq	(%rax), %rdx	; primary_ptr_16->value.literal_value, _4
	movq	-32(%rbp), %rax	; outfile, tmp135
	leaq	.LC46(%rip), %rcx	;, tmp136
	movq	%rcx, %rsi	; tmp136,
	movq	%rax, %rdi	; tmp135,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:311:             break;
	jmp	.L90	;
.L86:
; src/output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp137
	movq	-40(%rbp), %rsi	; indent, tmp138
	movq	-32(%rbp), %rax	; outfile, tmp139
	movq	%rdx, %rcx	; tmp137,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp139,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp140
	movq	%rax, %rcx	; tmp140,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rax	;, tmp141
	movq	%rax, %rdi	; tmp141,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp142
	movq	-40(%rbp), %rsi	; indent, tmp143
	movq	-32(%rbp), %rax	; outfile, tmp144
	movq	%rdx, %rcx	; tmp142,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp144,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp145
	movq	%rax, %rcx	; tmp145,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC48(%rip), %rax	;, tmp146
	movq	%rax, %rdi	; tmp146,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:315:             break;
	jmp	.L90	;
.L85:
; src/output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp147
	movq	-40(%rbp), %rsi	; indent, tmp148
	movq	-32(%rbp), %rax	; outfile, tmp149
	movq	%rdx, %rcx	; tmp147,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp149,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp150
	movq	%rax, %rcx	; tmp150,
	movl	$16, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC47(%rip), %rax	;, tmp151
	movq	%rax, %rdi	; tmp151,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp152
	movq	-40(%rbp), %rsi	; indent, tmp153
	movq	-32(%rbp), %rax	; outfile, tmp154
	movq	%rdx, %rcx	; tmp152,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp154,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp155
	movq	%rax, %rcx	; tmp155,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC49(%rip), %rax	;, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:319:             break;
	jmp	.L90	;
.L84:
; src/output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp157
	movq	-40(%rbp), %rsi	; indent, tmp158
	movq	-32(%rbp), %rax	; outfile, tmp159
	movq	%rdx, %rcx	; tmp157,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp159,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp160
	movq	%rax, %rcx	; tmp160,
	movl	$19, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC50(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:322:             OUT(0, true, "value\n");
	movq	-48(%rbp), %rdx	; parser, tmp162
	movq	-40(%rbp), %rsi	; indent, tmp163
	movq	-32(%rbp), %rax	; outfile, tmp164
	movq	%rdx, %rcx	; tmp162,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp164,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:322:             OUT(0, true, "value\n");
	movq	-32(%rbp), %rax	; outfile, tmp165
	movq	%rax, %rcx	; tmp165,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp167
	leaq	1(%rax), %rdi	;, _5
	movq	-8(%rbp), %rax	; primary_ptr, tmp168
	movq	(%rax), %rax	; primary_ptr_16->value.expr, _6
	movq	-48(%rbp), %rdx	; parser, tmp169
	movq	-32(%rbp), %rsi	; outfile, tmp170
	movq	%rdx, %rcx	; tmp169,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_expression	;
; src/output.c:324:             break;
	jmp	.L90	;
.L83:
; src/output.c:326:             OUT(0, false, "type: \"!\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp171
	movq	-40(%rbp), %rsi	; indent, tmp172
	movq	-32(%rbp), %rax	; outfile, tmp173
	movq	%rdx, %rcx	; tmp171,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp173,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:326:             OUT(0, false, "type: \"!\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp174
	movq	%rax, %rcx	; tmp174,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC51(%rip), %rax	;, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:327:             OUT(0, true, "value\n");
	movq	-48(%rbp), %rdx	; parser, tmp176
	movq	-40(%rbp), %rsi	; indent, tmp177
	movq	-32(%rbp), %rax	; outfile, tmp178
	movq	%rdx, %rcx	; tmp176,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp178,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:327:             OUT(0, true, "value\n");
	movq	-32(%rbp), %rax	; outfile, tmp179
	movq	%rax, %rcx	; tmp179,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp180
	movq	%rax, %rdi	; tmp180,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:328:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp181
	leaq	1(%rax), %rdi	;, _7
	movq	-8(%rbp), %rax	; primary_ptr, tmp182
	movq	(%rax), %rax	; primary_ptr_16->value.operand, _8
	movq	-48(%rbp), %rdx	; parser, tmp183
	movq	-32(%rbp), %rsi	; outfile, tmp184
	movq	%rdx, %rcx	; tmp183,
	movq	%rdi, %rdx	; _7,
	movq	%rax, %rdi	; _8,
	call	output_primary	;
; src/output.c:329:             break;
	jmp	.L90	;
.L82:
; src/output.c:331:             OUT(0, false, "type: \"-\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp185
	movq	-40(%rbp), %rsi	; indent, tmp186
	movq	-32(%rbp), %rax	; outfile, tmp187
	movq	%rdx, %rcx	; tmp185,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp187,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:331:             OUT(0, false, "type: \"-\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp188
	movq	%rax, %rcx	; tmp188,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC52(%rip), %rax	;, tmp189
	movq	%rax, %rdi	; tmp189,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:332:             OUT(0, true, "value\n");
	movq	-48(%rbp), %rdx	; parser, tmp190
	movq	-40(%rbp), %rsi	; indent, tmp191
	movq	-32(%rbp), %rax	; outfile, tmp192
	movq	%rdx, %rcx	; tmp190,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp192,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:332:             OUT(0, true, "value\n");
	movq	-32(%rbp), %rax	; outfile, tmp193
	movq	%rax, %rcx	; tmp193,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp194
	movq	%rax, %rdi	; tmp194,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp195
	leaq	1(%rax), %rdi	;, _9
	movq	-8(%rbp), %rax	; primary_ptr, tmp196
	movq	(%rax), %rax	; primary_ptr_16->value.operand, _10
	movq	-48(%rbp), %rdx	; parser, tmp197
	movq	-32(%rbp), %rsi	; outfile, tmp198
	movq	%rdx, %rcx	; tmp197,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_primary	;
; src/output.c:334:             break;
	jmp	.L90	;
.L80:
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp199
	movq	-40(%rbp), %rsi	; indent, tmp200
	movq	-32(%rbp), %rax	; outfile, tmp201
	movq	%rdx, %rcx	; tmp199,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp201,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp202
	movq	%rax, %rcx	; tmp202,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC53(%rip), %rax	;, tmp203
	movq	%rax, %rdi	; tmp203,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:337:             OUT(0, true, "value\n");
	movq	-48(%rbp), %rdx	; parser, tmp204
	movq	-40(%rbp), %rsi	; indent, tmp205
	movq	-32(%rbp), %rax	; outfile, tmp206
	movq	%rdx, %rcx	; tmp204,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp206,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:337:             OUT(0, true, "value\n");
	movq	-32(%rbp), %rax	; outfile, tmp207
	movq	%rax, %rcx	; tmp207,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC16(%rip), %rax	;, tmp208
	movq	%rax, %rdi	; tmp208,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp209
	leaq	1(%rax), %rdi	;, _11
	movq	-8(%rbp), %rax	; primary_ptr, tmp210
	movq	(%rax), %rax	; primary_ptr_16->value.var, _12
	movq	-48(%rbp), %rdx	; parser, tmp211
	movq	-32(%rbp), %rsi	; outfile, tmp212
	movq	%rdx, %rcx	; tmp211,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_variable_access	;
; src/output.c:339:             break;
	jmp	.L90	;
.L79:
; src/output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movq	-48(%rbp), %rdx	; parser, tmp213
	movq	-40(%rbp), %rsi	; indent, tmp214
	movq	-32(%rbp), %rax	; outfile, tmp215
	movq	%rdx, %rcx	; tmp213,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp215,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movq	-8(%rbp), %rax	; primary_ptr, tmp216
	movl	8(%rax), %edx	; primary_ptr_16->type, _13
	movq	-32(%rbp), %rax	; outfile, tmp217
	leaq	.LC54(%rip), %rcx	;, tmp218
	movq	%rcx, %rsi	; tmp218,
	movq	%rax, %rdi	; tmp217,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:342:             break;
	nop	
.L90:
; src/output.c:344: }
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
; src/output.c:349:     VariableAccess* var_access_ptr = variable_access;
	movq	-40(%rbp), %rax	; variable_access, tmp99
	movq	%rax, -16(%rbp)	; tmp99, var_access_ptr
; src/output.c:352:     switch (var_access_ptr->type) {
	movq	-16(%rbp), %rax	; var_access_ptr, tmp100
	movl	16(%rax), %eax	; var_access_ptr_22->type, _1
; src/output.c:352:     switch (var_access_ptr->type) {
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
; src/output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp101
	movq	-56(%rbp), %rsi	; indent, tmp102
	movq	-48(%rbp), %rax	; outfile, tmp103
	movq	%rdx, %rcx	; tmp101,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp103,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp104
	movq	%rax, %rcx	; tmp104,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC55(%rip), %rax	;, tmp105
	movq	%rax, %rdi	; tmp105,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:355:             OUT(0, true, "name\n");
	movq	-64(%rbp), %rdx	; parser, tmp106
	movq	-56(%rbp), %rsi	; indent, tmp107
	movq	-48(%rbp), %rax	; outfile, tmp108
	movq	%rdx, %rcx	; tmp106,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp108,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:355:             OUT(0, true, "name\n");
	movq	-48(%rbp), %rax	; outfile, tmp109
	movq	%rax, %rcx	; tmp109,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC4(%rip), %rax	;, tmp110
	movq	%rax, %rdi	; tmp110,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp111
	leaq	1(%rax), %rdi	;, _2
	movq	-16(%rbp), %rax	; var_access_ptr, tmp112
	movq	8(%rax), %rax	; var_access_ptr_22->content.name, _3
	movq	-64(%rbp), %rdx	; parser, tmp113
	movq	-48(%rbp), %rsi	; outfile, tmp114
	movq	%rdx, %rcx	; tmp113,
	movq	%rdi, %rdx	; _2,
	movq	%rax, %rdi	; _3,
	call	output_name	;
; src/output.c:357:             break;
	jmp	.L97	;
.L96:
; src/output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	-16(%rbp), %rax	; var_access_ptr, tmp115
	movq	8(%rax), %rax	; var_access_ptr_22->content.args, _4
	movq	%rax, %rdi	; _4,
	call	*list_copy@GOTPCREL(%rip)	;
	movq	%rax, -24(%rbp)	; tmp116, args
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp117
	movq	-56(%rbp), %rsi	; indent, tmp118
	movq	-48(%rbp), %rax	; outfile, tmp119
	movq	%rdx, %rcx	; tmp117,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp119,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp120
	movq	%rax, %rcx	; tmp120,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC56(%rip), %rax	;, tmp121
	movq	%rax, %rdi	; tmp121,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:361:             OUT(0, false, "function\n");
	movq	-64(%rbp), %rdx	; parser, tmp122
	movq	-56(%rbp), %rsi	; indent, tmp123
	movq	-48(%rbp), %rax	; outfile, tmp124
	movq	%rdx, %rcx	; tmp122,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp124,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:361:             OUT(0, false, "function\n");
	movq	-48(%rbp), %rax	; outfile, tmp125
	movq	%rax, %rcx	; tmp125,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC1(%rip), %rax	;, tmp126
	movq	%rax, %rdi	; tmp126,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp127
	leaq	1(%rax), %rdi	;, _5
	movq	-16(%rbp), %rax	; var_access_ptr, tmp128
	movq	(%rax), %rax	; var_access_ptr_22->base, _6
	movq	-64(%rbp), %rdx	; parser, tmp129
	movq	-48(%rbp), %rsi	; outfile, tmp130
	movq	%rdx, %rcx	; tmp129,
	movq	%rdi, %rdx	; _5,
	movq	%rax, %rdi	; _6,
	call	output_variable_access	;
; src/output.c:363:             OUT(0, true, "arguments\n");
	movq	-64(%rbp), %rdx	; parser, tmp131
	movq	-56(%rbp), %rsi	; indent, tmp132
	movq	-48(%rbp), %rax	; outfile, tmp133
	movq	%rdx, %rcx	; tmp131,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp133,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:363:             OUT(0, true, "arguments\n");
	movq	-48(%rbp), %rax	; outfile, tmp134
	movq	%rax, %rcx	; tmp134,
	movl	$10, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC57(%rip), %rax	;, tmp135
	movq	%rax, %rdi	; tmp135,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:365:             index = -1;
	movl	$-1, -4(%rbp)	;, index
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	jmp	.L98	;
.L99:
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	-56(%rbp), %rax	; indent, tmp136
	leaq	1(%rax), %rsi	;, _7
	movq	-64(%rbp), %rdx	; parser, tmp137
	movq	-48(%rbp), %rax	; outfile, tmp138
	movq	%rdx, %rcx	; tmp137,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp138,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	addl	$1, -4(%rbp)	;, index
	movl	-4(%rbp), %edx	; index, tmp139
	movq	-48(%rbp), %rax	; outfile, tmp140
	leaq	.LC58(%rip), %rcx	;, tmp141
	movq	%rcx, %rsi	; tmp141,
	movq	%rax, %rdi	; tmp140,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	movq	-56(%rbp), %rax	; indent, tmp142
	leaq	2(%rax), %rdi	;, _8
	movq	-64(%rbp), %rdx	; parser, tmp143
	movq	-48(%rbp), %rsi	; outfile, tmp144
	movq	-32(%rbp), %rax	; arg, tmp145
	movq	%rdx, %rcx	; tmp143,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; tmp145,
	call	output_expression	;
.L98:
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	-24(%rbp), %rax	; args, tmp146
	movq	%rax, %rdi	; tmp146,
	call	*list_pop@GOTPCREL(%rip)	;
	movq	%rax, -32(%rbp)	; tmp147, arg
; src/output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	cmpq	$0, -32(%rbp)	;, arg
	jne	.L99	;,
; src/output.c:370:             break;
	jmp	.L97	;
.L92:
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp148
	movq	-56(%rbp), %rsi	; indent, tmp149
	movq	-48(%rbp), %rax	; outfile, tmp150
	movq	%rdx, %rcx	; tmp148,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp150,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp151
	movq	%rax, %rcx	; tmp151,
	movl	$29, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC59(%rip), %rax	;, tmp152
	movq	%rax, %rdi	; tmp152,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:373:             OUT(0, false, "sequence\n");
	movq	-64(%rbp), %rdx	; parser, tmp153
	movq	-56(%rbp), %rsi	; indent, tmp154
	movq	-48(%rbp), %rax	; outfile, tmp155
	movq	%rdx, %rcx	; tmp153,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp155,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:373:             OUT(0, false, "sequence\n");
	movq	-48(%rbp), %rax	; outfile, tmp156
	movq	%rax, %rcx	; tmp156,
	movl	$9, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC60(%rip), %rax	;, tmp157
	movq	%rax, %rdi	; tmp157,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp158
	leaq	1(%rax), %rdi	;, _9
	movq	-16(%rbp), %rax	; var_access_ptr, tmp159
	movq	(%rax), %rax	; var_access_ptr_22->base, _10
	movq	-64(%rbp), %rdx	; parser, tmp160
	movq	-48(%rbp), %rsi	; outfile, tmp161
	movq	%rdx, %rcx	; tmp160,
	movq	%rdi, %rdx	; _9,
	movq	%rax, %rdi	; _10,
	call	output_variable_access	;
; src/output.c:375:             OUT(0, true, "index\n");
	movq	-64(%rbp), %rdx	; parser, tmp162
	movq	-56(%rbp), %rsi	; indent, tmp163
	movq	-48(%rbp), %rax	; outfile, tmp164
	movq	%rdx, %rcx	; tmp162,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp164,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:375:             OUT(0, true, "index\n");
	movq	-48(%rbp), %rax	; outfile, tmp165
	movq	%rax, %rcx	; tmp165,
	movl	$6, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC61(%rip), %rax	;, tmp166
	movq	%rax, %rdi	; tmp166,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp167
	leaq	1(%rax), %rdi	;, _11
	movq	-16(%rbp), %rax	; var_access_ptr, tmp168
	movq	8(%rax), %rax	; var_access_ptr_22->content.index, _12
	movq	-64(%rbp), %rdx	; parser, tmp169
	movq	-48(%rbp), %rsi	; outfile, tmp170
	movq	%rdx, %rcx	; tmp169,
	movq	%rdi, %rdx	; _11,
	movq	%rax, %rdi	; _12,
	call	output_expression	;
; src/output.c:377:             break;
	jmp	.L97	;
.L94:
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	-64(%rbp), %rdx	; parser, tmp171
	movq	-56(%rbp), %rsi	; indent, tmp172
	movq	-48(%rbp), %rax	; outfile, tmp173
	movq	%rdx, %rcx	; tmp171,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp173,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	-48(%rbp), %rax	; outfile, tmp174
	movq	%rax, %rcx	; tmp174,
	movl	$22, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC62(%rip), %rax	;, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:380:             OUT(0, false, "object\n");
	movq	-64(%rbp), %rdx	; parser, tmp176
	movq	-56(%rbp), %rsi	; indent, tmp177
	movq	-48(%rbp), %rax	; outfile, tmp178
	movq	%rdx, %rcx	; tmp176,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp178,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:380:             OUT(0, false, "object\n");
	movq	-48(%rbp), %rax	; outfile, tmp179
	movq	%rax, %rcx	; tmp179,
	movl	$7, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC63(%rip), %rax	;, tmp180
	movq	%rax, %rdi	; tmp180,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp181
	leaq	1(%rax), %rdi	;, _13
	movq	-16(%rbp), %rax	; var_access_ptr, tmp182
	movq	(%rax), %rax	; var_access_ptr_22->base, _14
	movq	-64(%rbp), %rdx	; parser, tmp183
	movq	-48(%rbp), %rsi	; outfile, tmp184
	movq	%rdx, %rcx	; tmp183,
	movq	%rdi, %rdx	; _13,
	movq	%rax, %rdi	; _14,
	call	output_variable_access	;
; src/output.c:382:             OUT(0, true, "attribute_name\n");
	movq	-64(%rbp), %rdx	; parser, tmp185
	movq	-56(%rbp), %rsi	; indent, tmp186
	movq	-48(%rbp), %rax	; outfile, tmp187
	movq	%rdx, %rcx	; tmp185,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp187,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:382:             OUT(0, true, "attribute_name\n");
	movq	-48(%rbp), %rax	; outfile, tmp188
	movq	%rax, %rcx	; tmp188,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC64(%rip), %rax	;, tmp189
	movq	%rax, %rdi	; tmp189,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	-56(%rbp), %rax	; indent, tmp190
	leaq	1(%rax), %rdi	;, _15
	movq	-16(%rbp), %rax	; var_access_ptr, tmp191
	movq	8(%rax), %rax	; var_access_ptr_22->content.attr_name, _16
	movq	-64(%rbp), %rdx	; parser, tmp192
	movq	-48(%rbp), %rsi	; outfile, tmp193
	movq	%rdx, %rcx	; tmp192,
	movq	%rdi, %rdx	; _15,
	movq	%rax, %rdi	; _16,
	call	output_name	;
; src/output.c:384:             break;
	jmp	.L97	;
.L93:
; src/output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movq	-64(%rbp), %rdx	; parser, tmp194
	movq	-56(%rbp), %rsi	; indent, tmp195
	movq	-48(%rbp), %rax	; outfile, tmp196
	movq	%rdx, %rcx	; tmp194,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp196,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movq	-16(%rbp), %rax	; var_access_ptr, tmp197
	movl	16(%rax), %edx	; var_access_ptr_22->type, _17
	movq	-48(%rbp), %rax	; outfile, tmp198
	leaq	.LC65(%rip), %rcx	;, tmp199
	movq	%rcx, %rsi	; tmp199,
	movq	%rax, %rdi	; tmp198,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:387:             break;
	nop	
.L97:
; src/output.c:389: }
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
	.string	"kind: \"unknown_NameType\"\n"
	.text
	.type	output_name, @function
output_name:
	pushq	%rbp	;
	movq	%rsp, %rbp	;,
	subq	$48, %rsp	;,
	movq	%rdi, -24(%rbp)	; name, name
	movq	%rsi, -32(%rbp)	; outfile, outfile
	movq	%rdx, -40(%rbp)	; indent, indent
	movq	%rcx, -48(%rbp)	; parser, parser
; src/output.c:394:     Name* name_ptr = name;
	movq	-24(%rbp), %rax	; name, tmp93
	movq	%rax, -8(%rbp)	; tmp93, name_ptr
; src/output.c:395:     if (name_ptr == NULL) {
	cmpq	$0, -8(%rbp)	;, name_ptr
	jne	.L101	;,
; src/output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp94
	movq	-40(%rbp), %rsi	; indent, tmp95
	movq	-32(%rbp), %rax	; outfile, tmp96
	movq	%rdx, %rcx	; tmp94,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp96,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp97
	movq	%rax, %rcx	; tmp97,
	movl	$21, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC66(%rip), %rax	;, tmp98
	movq	%rax, %rdi	; tmp98,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:397:         return;
	jmp	.L100	;
.L101:
; src/output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	-48(%rbp), %rdx	; parser, tmp99
	movq	-40(%rbp), %rsi	; indent, tmp100
	movq	-32(%rbp), %rax	; outfile, tmp101
	movq	%rdx, %rcx	; tmp99,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp101,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	-8(%rbp), %rax	; name_ptr, tmp102
	movq	(%rax), %rdx	; name_ptr_14->name, _1
	movq	-32(%rbp), %rax	; outfile, tmp103
	leaq	.LC67(%rip), %rcx	;, tmp104
	movq	%rcx, %rsi	; tmp104,
	movq	%rax, %rdi	; tmp103,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	-48(%rbp), %rdx	; parser, tmp105
	movq	-40(%rbp), %rsi	; indent, tmp106
	movq	-32(%rbp), %rax	; outfile, tmp107
	movq	%rdx, %rcx	; tmp105,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp107,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	-8(%rbp), %rax	; name_ptr, tmp108
	movq	8(%rax), %rdx	; name_ptr_14->id, _2
	movq	-32(%rbp), %rax	; outfile, tmp109
	leaq	.LC68(%rip), %rcx	;, tmp110
	movq	%rcx, %rsi	; tmp110,
	movq	%rax, %rdi	; tmp109,
	movl	$0, %eax	;,
	call	*fprintf@GOTPCREL(%rip)	;
; src/output.c:401:     switch (name_ptr->kind) {
	movq	-8(%rbp), %rax	; name_ptr, tmp111
	movl	24(%rax), %eax	; name_ptr_14->kind, _3
; src/output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, %eax	;, _3
	ja	.L103	;,
	movl	%eax, %eax	; _3, tmp112
	leaq	0(,%rax,4), %rdx	;, tmp113
	leaq	.L105(%rip), %rax	;, tmp114
	movl	(%rdx,%rax), %eax	;, tmp115
	cltq
	leaq	.L105(%rip), %rdx	;, tmp118
	addq	%rdx, %rax	; tmp118, tmp117
	jmp	*%rax	; tmp117
	.section	.rodata
	.align 4
	.align 4
.L105:
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L110:
; src/output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp119
	movq	-40(%rbp), %rsi	; indent, tmp120
	movq	-32(%rbp), %rax	; outfile, tmp121
	movq	%rdx, %rcx	; tmp119,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp121,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp122
	movq	%rax, %rcx	; tmp122,
	movl	$13, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC69(%rip), %rax	;, tmp123
	movq	%rax, %rdi	; tmp123,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:404:             break;
	jmp	.L100	;
.L109:
; src/output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp124
	movq	-40(%rbp), %rsi	; indent, tmp125
	movq	-32(%rbp), %rax	; outfile, tmp126
	movq	%rdx, %rcx	; tmp124,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp126,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp127
	movq	%rax, %rcx	; tmp127,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC70(%rip), %rax	;, tmp128
	movq	%rax, %rdi	; tmp128,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:407:             OUT(0, true, "type\n");
	movq	-48(%rbp), %rdx	; parser, tmp129
	movq	-40(%rbp), %rsi	; indent, tmp130
	movq	-32(%rbp), %rax	; outfile, tmp131
	movq	%rdx, %rcx	; tmp129,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp131,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:407:             OUT(0, true, "type\n");
	movq	-32(%rbp), %rax	; outfile, tmp132
	movq	%rax, %rcx	; tmp132,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp133
	movq	%rax, %rdi	; tmp133,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:408:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp134
	leaq	1(%rax), %rdi	;, _4
	movq	-8(%rbp), %rax	; name_ptr, tmp135
	movq	16(%rax), %rax	; name_ptr_14->info.type, _5
	movq	-48(%rbp), %rdx	; parser, tmp136
	movq	-32(%rbp), %rsi	; outfile, tmp137
	movq	%rdx, %rcx	; tmp136,
	movq	%rdi, %rdx	; _4,
	movq	%rax, %rdi	; _5,
	call	output_name	;
; src/output.c:409:             break;
	jmp	.L100	;
.L108:
; src/output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp138
	movq	-40(%rbp), %rsi	; indent, tmp139
	movq	-32(%rbp), %rax	; outfile, tmp140
	movq	%rdx, %rcx	; tmp138,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp140,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp141
	movq	%rax, %rcx	; tmp141,
	movl	$17, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC71(%rip), %rax	;, tmp142
	movq	%rax, %rdi	; tmp142,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:412:             OUT(0, true, "return_type\n");
	movq	-48(%rbp), %rdx	; parser, tmp143
	movq	-40(%rbp), %rsi	; indent, tmp144
	movq	-32(%rbp), %rax	; outfile, tmp145
	movq	%rdx, %rcx	; tmp143,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp145,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:412:             OUT(0, true, "return_type\n");
	movq	-32(%rbp), %rax	; outfile, tmp146
	movq	%rax, %rcx	; tmp146,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp147
	movq	%rax, %rdi	; tmp147,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:413:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp148
	leaq	1(%rax), %rdi	;, _6
	movq	-8(%rbp), %rax	; name_ptr, tmp149
	movq	16(%rax), %rax	; name_ptr_14->info.type, _7
	movq	-48(%rbp), %rdx	; parser, tmp150
	movq	-32(%rbp), %rsi	; outfile, tmp151
	movq	%rdx, %rcx	; tmp150,
	movq	%rdi, %rdx	; _6,
	movq	%rax, %rdi	; _7,
	call	output_name	;
; src/output.c:414:             break;
	jmp	.L100	;
.L107:
; src/output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp152
	movq	-40(%rbp), %rsi	; indent, tmp153
	movq	-32(%rbp), %rax	; outfile, tmp154
	movq	%rdx, %rcx	; tmp152,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp154,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp155
	movq	%rax, %rcx	; tmp155,
	movl	$15, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC72(%rip), %rax	;, tmp156
	movq	%rax, %rdi	; tmp156,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:417:             OUT(0, true, "return_type\n");
	movq	-48(%rbp), %rdx	; parser, tmp157
	movq	-40(%rbp), %rsi	; indent, tmp158
	movq	-32(%rbp), %rax	; outfile, tmp159
	movq	%rdx, %rcx	; tmp157,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp159,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:417:             OUT(0, true, "return_type\n");
	movq	-32(%rbp), %rax	; outfile, tmp160
	movq	%rax, %rcx	; tmp160,
	movl	$12, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC7(%rip), %rax	;, tmp161
	movq	%rax, %rdi	; tmp161,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp162
	leaq	1(%rax), %rdi	;, _8
	movq	-8(%rbp), %rax	; name_ptr, tmp163
	movq	16(%rax), %rax	; name_ptr_14->info.type, _9
	movq	-48(%rbp), %rdx	; parser, tmp164
	movq	-32(%rbp), %rsi	; outfile, tmp165
	movq	%rdx, %rcx	; tmp164,
	movq	%rdi, %rdx	; _8,
	movq	%rax, %rdi	; _9,
	call	output_name	;
; src/output.c:419:             break;
	jmp	.L100	;
.L106:
; src/output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp166
	movq	-40(%rbp), %rsi	; indent, tmp167
	movq	-32(%rbp), %rax	; outfile, tmp168
	movq	%rdx, %rcx	; tmp166,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp168,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp169
	movq	%rax, %rcx	; tmp169,
	movl	$14, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC73(%rip), %rax	;, tmp170
	movq	%rax, %rdi	; tmp170,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:422:             break;
	jmp	.L100	;
.L104:
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp171
	movq	-40(%rbp), %rsi	; indent, tmp172
	movq	-32(%rbp), %rax	; outfile, tmp173
	movq	%rdx, %rcx	; tmp171,
	movl	$0, %edx	;,
	movq	%rax, %rdi	; tmp173,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp174
	movq	%rax, %rcx	; tmp174,
	movl	$18, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC74(%rip), %rax	;, tmp175
	movq	%rax, %rdi	; tmp175,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:425:             OUT(0, true, "type\n");
	movq	-48(%rbp), %rdx	; parser, tmp176
	movq	-40(%rbp), %rsi	; indent, tmp177
	movq	-32(%rbp), %rax	; outfile, tmp178
	movq	%rdx, %rcx	; tmp176,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp178,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:425:             OUT(0, true, "type\n");
	movq	-32(%rbp), %rax	; outfile, tmp179
	movq	%rax, %rcx	; tmp179,
	movl	$5, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC15(%rip), %rax	;, tmp180
	movq	%rax, %rdi	; tmp180,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:426:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	-40(%rbp), %rax	; indent, tmp181
	leaq	1(%rax), %rdi	;, _10
	movq	-8(%rbp), %rax	; name_ptr, tmp182
	movq	16(%rax), %rax	; name_ptr_14->info.type, _11
	movq	-48(%rbp), %rdx	; parser, tmp183
	movq	-32(%rbp), %rsi	; outfile, tmp184
	movq	%rdx, %rcx	; tmp183,
	movq	%rdi, %rdx	; _10,
	movq	%rax, %rdi	; _11,
	call	output_name	;
; src/output.c:427:             break;
	jmp	.L100	;
.L103:
; src/output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	-48(%rbp), %rdx	; parser, tmp185
	movq	-40(%rbp), %rsi	; indent, tmp186
	movq	-32(%rbp), %rax	; outfile, tmp187
	movq	%rdx, %rcx	; tmp185,
	movl	$1, %edx	;,
	movq	%rax, %rdi	; tmp187,
	call	*indention@GOTPCREL(%rip)	;
; src/output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	-32(%rbp), %rax	; outfile, tmp188
	movq	%rax, %rcx	; tmp188,
	movl	$25, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC75(%rip), %rax	;, tmp189
	movq	%rax, %rdi	; tmp189,
	call	*fwrite@GOTPCREL(%rip)	;
; src/output.c:430:             break;
	nop	
.L100:
; src/output.c:432: }
	leave	
	ret	
	.size	output_name, .-output_name
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

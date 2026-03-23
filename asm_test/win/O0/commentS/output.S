	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "import\12\0"
.LC1:
	.ascii "function\12\0"
.LC2:
	.ascii "class\12\0"
.LC3:
	.ascii "unknown_CodeMemberType: %u\12\0"
	.text
	.def	output_code_member;	.scl	3;	.type	32;	.endef
output_code_member:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; code_member, code_member
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:21:     switch (code_member->type) {
	movq	16(%rbp), %rax	 ; code_member, tmp90
	movl	8(%rax), %eax	 ; code_member_11(D)->type, _1
 ; D:\TC\src\output.c:21:     switch (code_member->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L2	 ;,
	cmpl	$2, %eax	 ;, _1
	ja	.L3	 ;,
	testl	%eax, %eax	 ; _1
	je	.L4	 ;,
	cmpl	$1, %eax	 ;, _1
	je	.L5	 ;,
	jmp	.L3	 ;
.L4:
 ; D:\TC\src\output.c:23:             ast_output(0, false, "import\n");
	movq	40(%rbp), %rcx	 ; parser, tmp91
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rcx, %r9	 ; tmp91,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp93,
	call	indention	 ;
 ; D:\TC\src\output.c:23:             ast_output(0, false, "import\n");
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rax, %r9	 ; tmp94,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:\TC\src\output.c:24:             output_import(code_member->content.import, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp96
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; code_member, tmp97
	movq	(%rax), %rax	 ; code_member_11(D)->content.import, _3
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	24(%rbp), %rdx	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp98,
	movq	%rax, %rcx	 ; _3,
	call	output_import	 ;
 ; D:\TC\src\output.c:25:             break;
	jmp	.L6	 ;
.L5:
 ; D:\TC\src\output.c:27:             ast_output(0, false, "function\n");
	movq	40(%rbp), %rcx	 ; parser, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:\TC\src\output.c:27:             ast_output(0, false, "function\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:\TC\src\output.c:28:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp105
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; code_member, tmp106
	movq	(%rax), %rax	 ; code_member_11(D)->content.function, _5
	movq	40(%rbp), %rcx	 ; parser, tmp107
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp107,
	movq	%rax, %rcx	 ; _5,
	call	output_function	 ;
 ; D:\TC\src\output.c:29:             break;
	jmp	.L6	 ;
.L2:
 ; D:\TC\src\output.c:31:             ast_output(0, false, "class\n");
	movq	40(%rbp), %rcx	 ; parser, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:\TC\src\output.c:31:             ast_output(0, false, "class\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:\TC\src\output.c:32:             output_class(code_member->content.class_, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp114
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; code_member, tmp115
	movq	(%rax), %rax	 ; code_member_11(D)->content.class_, _7
	movq	40(%rbp), %rcx	 ; parser, tmp116
	movq	24(%rbp), %rdx	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp116,
	movq	%rax, %rcx	 ; _7,
	call	output_class	 ;
 ; D:\TC\src\output.c:33:             break;
	jmp	.L6	 ;
.L3:
 ; D:\TC\src\output.c:35:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	40(%rbp), %rcx	 ; parser, tmp118
	movq	32(%rbp), %rdx	 ; indent, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp118,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:\TC\src\output.c:35:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	16(%rbp), %rax	 ; code_member, tmp121
	movl	8(%rax), %edx	 ; code_member_11(D)->type, _8
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	%edx, %r8d	 ; _8,
	leaq	.LC3(%rip), %rdx	 ;, tmp123
	movq	%rax, %rcx	 ; tmp122,
	call	fprintf	 ;
 ; D:\TC\src\output.c:36:             break;
	nop	
.L6:
 ; D:\TC\src\output.c:38: }
	nop	
	leave	
	ret	
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; code, code
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:40:     list(CodeMember*) members = list_copy(code->members);
	movq	16(%rbp), %rax	 ; code, tmp84
	movq	(%rax), %rax	 ; code_5(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, members
 ; D:\TC\src\output.c:42:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L8	 ;
.L9:
 ; D:\TC\src\output.c:43:         output_code_member(member, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp86
	leaq	1(%rax), %r8	 ;, _2
	movq	40(%rbp), %rcx	 ; parser, tmp87
	movq	24(%rbp), %rdx	 ; outfile, tmp88
	movq	-16(%rbp), %rax	 ; member, tmp89
	movq	%rcx, %r9	 ; tmp87,
	movq	%rax, %rcx	 ; tmp89,
	call	output_code_member	 ;
.L8:
 ; D:\TC\src\output.c:42:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	 ; members, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp91, member
 ; D:\TC\src\output.c:42:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, member
	jne	.L9	 ;,
 ; D:\TC\src\output.c:44: }
	nop	
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC4:
	.ascii "name\12\0"
.LC5:
	.ascii "NULL\0"
.LC6:
	.ascii "source: \"%s\"\12\0"
	.text
	.def	output_import;	.scl	3;	.type	32;	.endef
output_import:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; import, import
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:46:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp86
	movq	32(%rbp), %rdx	 ; indent, tmp87
	movq	24(%rbp), %rax	 ; outfile, tmp88
	movq	%rcx, %r9	 ; tmp86,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp88,
	call	indention	 ;
 ; D:\TC\src\output.c:46:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rax, %r9	 ; tmp89,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	fwrite	 ;
 ; D:\TC\src\output.c:47:     output_name(import->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp91
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; import, tmp92
	movq	(%rax), %rax	 ; import_11(D)->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp93
	movq	24(%rbp), %rdx	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp93,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	40(%rbp), %rcx	 ; parser, tmp95
	movq	32(%rbp), %rdx	 ; indent, tmp96
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp95,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	indention	 ;
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	16(%rbp), %rax	 ; import, tmp98
	movq	8(%rax), %rax	 ; import_11(D)->source, _3
	testq	%rax, %rax	 ; _3
	je	.L11	 ;,
	movq	16(%rbp), %rax	 ; import, tmp99
	movq	8(%rax), %rax	 ; import_11(D)->source, iftmp.0_4
	jmp	.L12	 ;
.L11:
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC5(%rip), %rax	 ;, iftmp.0_4
.L12:
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	24(%rbp), %rcx	 ; outfile, tmp100
	movq	%rax, %r8	 ; iftmp.0_4,
	leaq	.LC6(%rip), %rax	 ;, tmp101
	movq	%rax, %rdx	 ; tmp101,
	call	fprintf	 ;
 ; D:\TC\src\output.c:49: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC7:
	.ascii "return_type\12\0"
.LC8:
	.ascii "parameters\12\0"
.LC9:
	.ascii "parameters[%d]\12\0"
.LC10:
	.ascii "body\12\0"
	.text
	.def	output_function;	.scl	3;	.type	32;	.endef
output_function:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; function, function
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp91
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rcx, %r9	 ; tmp91,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp93,
	call	indention	 ;
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rax, %r9	 ; tmp94,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:\TC\src\output.c:52:     output_name(function->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp96
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; function, tmp97
	movq	(%rax), %rax	 ; function_19(D)->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	24(%rbp), %rdx	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp98,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, false, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, false, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:\TC\src\output.c:54:     output_name(function->return_type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp105
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; function, tmp106
	movq	8(%rax), %rax	 ; function_19(D)->return_type, _4
	movq	40(%rbp), %rcx	 ; parser, tmp107
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp107,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:\TC\src\output.c:55:     ast_output(0, false, "parameters\n");
	movq	40(%rbp), %rcx	 ; parser, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:\TC\src\output.c:55:     ast_output(0, false, "parameters\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:\TC\src\output.c:56:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp114
	movq	16(%rax), %rax	 ; function_19(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp115, parameters
 ; D:\TC\src\output.c:57:     list(Statement*) body = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp116
	movq	24(%rax), %rax	 ; function_19(D)->body, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp117, body
 ; D:\TC\src\output.c:59:     int index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:\TC\src\output.c:60:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L14	 ;
.L15:
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp118
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp119,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	%edx, %r8d	 ; tmp121,
	leaq	.LC9(%rip), %rdx	 ;, tmp123
	movq	%rax, %rcx	 ; tmp122,
	call	fprintf	 ;
 ; D:\TC\src\output.c:62:         output_variable(parameter, outfile, indent + 2, parser);
	movq	32(%rbp), %rax	 ; indent, tmp124
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp125
	movq	24(%rbp), %rdx	 ; outfile, tmp126
	movq	-32(%rbp), %rax	 ; parameter, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movq	%rax, %rcx	 ; tmp127,
	call	output_variable	 ;
.L14:
 ; D:\TC\src\output.c:60:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	 ; parameters, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp129, parameter
 ; D:\TC\src\output.c:60:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, parameter
	jne	.L15	 ;,
 ; D:\TC\src\output.c:64:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:\TC\src\output.c:64:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:\TC\src\output.c:66:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L16	 ;
.L17:
 ; D:\TC\src\output.c:67:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %r8	 ;, _9
	movq	40(%rbp), %rcx	 ; parser, tmp136
	movq	24(%rbp), %rdx	 ; outfile, tmp137
	movq	-40(%rbp), %rax	 ; statement, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	output_statement	 ;
.L16:
 ; D:\TC\src\output.c:66:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	 ; body, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp140, statement
 ; D:\TC\src\output.c:66:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L17	 ;,
 ; D:\TC\src\output.c:68: }
	nop	
	nop	
	leave	
	ret	
	.def	output_method;	.scl	3;	.type	32;	.endef
output_method:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; method, method
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:70:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp91
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rcx, %r9	 ; tmp91,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp93,
	call	indention	 ;
 ; D:\TC\src\output.c:70:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rax, %r9	 ; tmp94,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:\TC\src\output.c:71:     output_name(method->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp96
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; method, tmp97
	movq	(%rax), %rax	 ; method_19(D)->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	24(%rbp), %rdx	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp98,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:72:     ast_output(0, false, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:\TC\src\output.c:72:     ast_output(0, false, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:\TC\src\output.c:73:     output_name(method->return_type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp105
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; method, tmp106
	movq	8(%rax), %rax	 ; method_19(D)->return_type, _4
	movq	40(%rbp), %rcx	 ; parser, tmp107
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp107,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:\TC\src\output.c:74:     ast_output(0, false, "parameters\n");
	movq	40(%rbp), %rcx	 ; parser, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:\TC\src\output.c:74:     ast_output(0, false, "parameters\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:\TC\src\output.c:75:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rax	 ; method, tmp114
	movq	16(%rax), %rax	 ; method_19(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp115, parameters
 ; D:\TC\src\output.c:76:     list(Statement*) body = list_copy(method->body);
	movq	16(%rbp), %rax	 ; method, tmp116
	movq	24(%rax), %rax	 ; method_19(D)->body, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp117, body
 ; D:\TC\src\output.c:78:     int index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:\TC\src\output.c:79:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L19	 ;
.L20:
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp118
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp119,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	%edx, %r8d	 ; tmp121,
	leaq	.LC9(%rip), %rdx	 ;, tmp123
	movq	%rax, %rcx	 ; tmp122,
	call	fprintf	 ;
 ; D:\TC\src\output.c:81:         output_variable(parameter, outfile, indent + 2, parser);
	movq	32(%rbp), %rax	 ; indent, tmp124
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp125
	movq	24(%rbp), %rdx	 ; outfile, tmp126
	movq	-32(%rbp), %rax	 ; parameter, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movq	%rax, %rcx	 ; tmp127,
	call	output_variable	 ;
.L19:
 ; D:\TC\src\output.c:79:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	 ; parameters, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp129, parameter
 ; D:\TC\src\output.c:79:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, parameter
	jne	.L20	 ;,
 ; D:\TC\src\output.c:83:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:\TC\src\output.c:83:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:\TC\src\output.c:85:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L21	 ;
.L22:
 ; D:\TC\src\output.c:86:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %r8	 ;, _9
	movq	40(%rbp), %rcx	 ; parser, tmp136
	movq	24(%rbp), %rdx	 ; outfile, tmp137
	movq	-40(%rbp), %rax	 ; statement, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	output_statement	 ;
.L21:
 ; D:\TC\src\output.c:85:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	 ; body, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp140, statement
 ; D:\TC\src\output.c:85:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L22	 ;,
 ; D:\TC\src\output.c:87: }
	nop	
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC11:
	.ascii "method\12\0"
.LC12:
	.ascii "variable\12\0"
.LC13:
	.ascii "unknown_ClassMemberType: %u\12\0"
	.text
	.def	output_class_member;	.scl	3;	.type	32;	.endef
output_class_member:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class_member, class_member
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:89:     switch (class_member->type) {
	movq	16(%rbp), %rax	 ; class_member, tmp88
	movl	8(%rax), %eax	 ; class_member_9(D)->type, _1
 ; D:\TC\src\output.c:89:     switch (class_member->type) {
	testl	%eax, %eax	 ; _1
	je	.L24	 ;,
	cmpl	$1, %eax	 ;, _1
	je	.L25	 ;,
	jmp	.L28	 ;
.L24:
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	movq	40(%rbp), %rcx	 ; parser, tmp89
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rcx, %r9	 ; tmp89,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	indention	 ;
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:\TC\src\output.c:92:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp94
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; class_member, tmp95
	movq	(%rax), %rax	 ; class_member_9(D)->content.method, _3
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	24(%rbp), %rdx	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp96,
	movq	%rax, %rcx	 ; _3,
	call	output_method	 ;
 ; D:\TC\src\output.c:93:             break;
	jmp	.L27	 ;
.L25:
 ; D:\TC\src\output.c:95:             ast_output(0, false, "variable\n");
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:\TC\src\output.c:95:             ast_output(0, false, "variable\n");
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rax, %r9	 ; tmp101,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	fwrite	 ;
 ; D:\TC\src\output.c:96:             output_variable(class_member->content.variable, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; class_member, tmp104
	movq	(%rax), %rax	 ; class_member_9(D)->content.variable, _5
	movq	40(%rbp), %rcx	 ; parser, tmp105
	movq	24(%rbp), %rdx	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp105,
	movq	%rax, %rcx	 ; _5,
	call	output_variable	 ;
 ; D:\TC\src\output.c:97:             break;
	jmp	.L27	 ;
.L28:
 ; D:\TC\src\output.c:99:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	40(%rbp), %rcx	 ; parser, tmp107
	movq	32(%rbp), %rdx	 ; indent, tmp108
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rcx, %r9	 ; tmp107,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp109,
	call	indention	 ;
 ; D:\TC\src\output.c:99:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	16(%rbp), %rax	 ; class_member, tmp110
	movl	8(%rax), %edx	 ; class_member_9(D)->type, _6
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movl	%edx, %r8d	 ; _6,
	leaq	.LC13(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; tmp111,
	call	fprintf	 ;
 ; D:\TC\src\output.c:100:             break;
	nop	
.L27:
 ; D:\TC\src\output.c:102: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC14:
	.ascii "members\12\0"
	.text
	.def	output_class;	.scl	3;	.type	32;	.endef
output_class:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; class, class
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:104:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp86
	movq	32(%rbp), %rdx	 ; indent, tmp87
	movq	24(%rbp), %rax	 ; outfile, tmp88
	movq	%rcx, %r9	 ; tmp86,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp88,
	call	indention	 ;
 ; D:\TC\src\output.c:104:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rax, %r9	 ; tmp89,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	fwrite	 ;
 ; D:\TC\src\output.c:105:     output_name(class->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp91
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; class, tmp92
	movq	(%rax), %rax	 ; class_12(D)->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp93
	movq	24(%rbp), %rdx	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp93,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:106:     ast_output(0, true, "members\n");
	movq	40(%rbp), %rcx	 ; parser, tmp95
	movq	32(%rbp), %rdx	 ; indent, tmp96
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp95,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	indention	 ;
 ; D:\TC\src\output.c:106:     ast_output(0, true, "members\n");
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rax, %r9	 ; tmp98,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	fwrite	 ;
 ; D:\TC\src\output.c:107:     list(ClassMember*) members = list_copy(class->members);
	movq	16(%rbp), %rax	 ; class, tmp100
	movq	8(%rax), %rax	 ; class_12(D)->members, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp101, members
 ; D:\TC\src\output.c:109:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L30	 ;
.L31:
 ; D:\TC\src\output.c:110:         output_class_member(member, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	-16(%rbp), %rax	 ; member, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; tmp105,
	call	output_class_member	 ;
.L30:
 ; D:\TC\src\output.c:109:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	 ; members, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp107, member
 ; D:\TC\src\output.c:109:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, member
	jne	.L31	 ;,
 ; D:\TC\src\output.c:111: }
	nop	
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC15:
	.ascii "type\12\0"
.LC16:
	.ascii "value\12\0"
.LC17:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable, variable
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:113:     ast_output(0, false, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp89
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rcx, %r9	 ; tmp89,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	indention	 ;
 ; D:\TC\src\output.c:113:     ast_output(0, false, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:\TC\src\output.c:114:     output_name(variable->type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp94
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; variable, tmp95
	movq	(%rax), %rax	 ; variable_15(D)->type, _2
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	24(%rbp), %rdx	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp96,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:115:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:\TC\src\output.c:115:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rax, %r9	 ; tmp101,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	fwrite	 ;
 ; D:\TC\src\output.c:116:     output_name(variable->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; variable, tmp104
	movq	8(%rax), %rax	 ; variable_15(D)->name, _4
	movq	40(%rbp), %rcx	 ; parser, tmp105
	movq	24(%rbp), %rdx	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp105,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:\TC\src\output.c:117:     if (variable->value != NULL) {
	movq	16(%rbp), %rax	 ; variable, tmp107
	movq	16(%rax), %rax	 ; variable_15(D)->value, _5
 ; D:\TC\src\output.c:117:     if (variable->value != NULL) {
	testq	%rax, %rax	 ; _5
	je	.L33	 ;,
 ; D:\TC\src\output.c:118:         ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:\TC\src\output.c:118:         ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
 ; D:\TC\src\output.c:119:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp113
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; variable, tmp114
	movq	16(%rax), %rax	 ; variable_15(D)->value, _7
	movq	40(%rbp), %rcx	 ; parser, tmp115
	movq	24(%rbp), %rdx	 ; outfile, tmp116
	movq	%rcx, %r9	 ; tmp115,
	movq	%rax, %rcx	 ; _7,
	call	output_expression	 ;
 ; D:\TC\src\output.c:122: }
	jmp	.L35	 ;
.L33:
 ; D:\TC\src\output.c:121:         ast_output(0, true, "value: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp117
	movq	32(%rbp), %rdx	 ; indent, tmp118
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp117,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp119,
	call	indention	 ;
 ; D:\TC\src\output.c:121:         ast_output(0, true, "value: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
.L35:
 ; D:\TC\src\output.c:122: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC18:
	.ascii "if_statement\12\0"
.LC19:
	.ascii "for_statement\12\0"
.LC20:
	.ascii "while_statement\12\0"
	.align 8
.LC21:
	.ascii "variable_declaration_statement\12\0"
.LC22:
	.ascii "return_statement: \"NULL\"\12\0"
.LC23:
	.ascii "return_statement\12\0"
.LC24:
	.ascii "break_statement: \"NULL\"\12\0"
.LC25:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC26:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC27:
	.ascii "expression_statement\12\0"
.LC28:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; statement, statement
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:124:     switch (statement->type) {
	movq	16(%rbp), %rax	 ; statement, tmp98
	movl	8(%rax), %eax	 ; statement_19(D)->type, _1
 ; D:\TC\src\output.c:124:     switch (statement->type) {
	cmpl	$7, %eax	 ;, _1
	ja	.L37	 ;,
	movl	%eax, %eax	 ; _1, tmp99
	leaq	0(,%rax,4), %rdx	 ;, tmp100
	leaq	.L39(%rip), %rax	 ;, tmp101
	movl	(%rdx,%rax), %eax	 ;, tmp102
	cltq
	leaq	.L39(%rip), %rdx	 ;, tmp105
	addq	%rdx, %rax	 ; tmp105, tmp104
	jmp	*%rax	 ; tmp104
	.section .rdata,"dr"
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
 ; D:\TC\src\output.c:126:             ast_output(0, false, "if_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp106
	movq	32(%rbp), %rdx	 ; indent, tmp107
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	indention	 ;
 ; D:\TC\src\output.c:126:             ast_output(0, false, "if_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	fwrite	 ;
 ; D:\TC\src\output.c:127:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp111
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; statement, tmp112
	movq	(%rax), %rax	 ; statement_19(D)->stmt.if_stmt, _3
	movq	40(%rbp), %rcx	 ; parser, tmp113
	movq	24(%rbp), %rdx	 ; outfile, tmp114
	movq	%rcx, %r9	 ; tmp113,
	movq	%rax, %rcx	 ; _3,
	call	output_if	 ;
 ; D:\TC\src\output.c:128:             break;
	jmp	.L36	 ;
.L42:
 ; D:\TC\src\output.c:130:             ast_output(0, false, "for_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp115
	movq	32(%rbp), %rdx	 ; indent, tmp116
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp115,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	indention	 ;
 ; D:\TC\src\output.c:130:             ast_output(0, false, "for_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rax, %r9	 ; tmp118,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rax	 ;, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	fwrite	 ;
 ; D:\TC\src\output.c:131:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp120
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; statement, tmp121
	movq	(%rax), %rax	 ; statement_19(D)->stmt.for_stmt, _5
	movq	40(%rbp), %rcx	 ; parser, tmp122
	movq	24(%rbp), %rdx	 ; outfile, tmp123
	movq	%rcx, %r9	 ; tmp122,
	movq	%rax, %rcx	 ; _5,
	call	output_for	 ;
 ; D:\TC\src\output.c:132:             break;
	jmp	.L36	 ;
.L43:
 ; D:\TC\src\output.c:134:             ast_output(0, false, "while_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp124
	movq	32(%rbp), %rdx	 ; indent, tmp125
	movq	24(%rbp), %rax	 ; outfile, tmp126
	movq	%rcx, %r9	 ; tmp124,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp126,
	call	indention	 ;
 ; D:\TC\src\output.c:134:             ast_output(0, false, "while_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rax, %r9	 ; tmp127,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	fwrite	 ;
 ; D:\TC\src\output.c:135:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp129
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; statement, tmp130
	movq	(%rax), %rax	 ; statement_19(D)->stmt.while_stmt, _7
	movq	40(%rbp), %rcx	 ; parser, tmp131
	movq	24(%rbp), %rdx	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp131,
	movq	%rax, %rcx	 ; _7,
	call	output_while	 ;
 ; D:\TC\src\output.c:136:             break;
	jmp	.L36	 ;
.L45:
 ; D:\TC\src\output.c:138:             ast_output(0, false, "variable_declaration_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp133
	movq	32(%rbp), %rdx	 ; indent, tmp134
	movq	24(%rbp), %rax	 ; outfile, tmp135
	movq	%rcx, %r9	 ; tmp133,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp135,
	call	indention	 ;
 ; D:\TC\src\output.c:138:             ast_output(0, false, "variable_declaration_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp136
	movq	%rax, %r9	 ; tmp136,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rax	 ;, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	fwrite	 ;
 ; D:\TC\src\output.c:139:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp138
	leaq	1(%rax), %r8	 ;, _8
	movq	16(%rbp), %rax	 ; statement, tmp139
	movq	(%rax), %rax	 ; statement_19(D)->stmt.var, _9
	movq	40(%rbp), %rcx	 ; parser, tmp140
	movq	24(%rbp), %rdx	 ; outfile, tmp141
	movq	%rcx, %r9	 ; tmp140,
	movq	%rax, %rcx	 ; _9,
	call	output_variable	 ;
 ; D:\TC\src\output.c:140:             break;
	jmp	.L36	 ;
.L41:
 ; D:\TC\src\output.c:142:             if (statement->stmt.expr == NULL) {
	movq	16(%rbp), %rax	 ; statement, tmp142
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _10
 ; D:\TC\src\output.c:142:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	 ; _10
	jne	.L48	 ;,
 ; D:\TC\src\output.c:143:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp143
	movq	32(%rbp), %rdx	 ; indent, tmp144
	movq	24(%rbp), %rax	 ; outfile, tmp145
	movq	%rcx, %r9	 ; tmp143,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp145,
	call	indention	 ;
 ; D:\TC\src\output.c:143:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rax, %r9	 ; tmp146,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rax	 ;, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	fwrite	 ;
 ; D:\TC\src\output.c:144:                 return;
	jmp	.L36	 ;
.L48:
 ; D:\TC\src\output.c:146:             ast_output(0, false, "return_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp148
	movq	32(%rbp), %rdx	 ; indent, tmp149
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rcx, %r9	 ; tmp148,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp150,
	call	indention	 ;
 ; D:\TC\src\output.c:146:             ast_output(0, false, "return_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rax, %r9	 ; tmp151,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
 ; D:\TC\src\output.c:147:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp153
	leaq	1(%rax), %r8	 ;, _11
	movq	16(%rbp), %rax	 ; statement, tmp154
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _12
	movq	40(%rbp), %rcx	 ; parser, tmp155
	movq	24(%rbp), %rdx	 ; outfile, tmp156
	movq	%rcx, %r9	 ; tmp155,
	movq	%rax, %rcx	 ; _12,
	call	output_expression	 ;
 ; D:\TC\src\output.c:148:             break;
	jmp	.L36	 ;
.L40:
 ; D:\TC\src\output.c:150:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp157
	movq	32(%rbp), %rdx	 ; indent, tmp158
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rcx, %r9	 ; tmp157,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp159,
	call	indention	 ;
 ; D:\TC\src\output.c:150:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rax, %r9	 ; tmp160,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	fwrite	 ;
 ; D:\TC\src\output.c:151:             return;
	jmp	.L36	 ;
.L38:
 ; D:\TC\src\output.c:153:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp162
	movq	32(%rbp), %rdx	 ; indent, tmp163
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rcx, %r9	 ; tmp162,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp164,
	call	indention	 ;
 ; D:\TC\src\output.c:153:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp165
	movq	%rax, %r9	 ; tmp165,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rax	 ;, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	fwrite	 ;
 ; D:\TC\src\output.c:154:             return;
	jmp	.L36	 ;
.L46:
 ; D:\TC\src\output.c:156:             if (statement->stmt.expr == NULL) {
	movq	16(%rbp), %rax	 ; statement, tmp167
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _13
 ; D:\TC\src\output.c:156:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	 ; _13
	jne	.L49	 ;,
 ; D:\TC\src\output.c:157:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp168
	movq	32(%rbp), %rdx	 ; indent, tmp169
	movq	24(%rbp), %rax	 ; outfile, tmp170
	movq	%rcx, %r9	 ; tmp168,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp170,
	call	indention	 ;
 ; D:\TC\src\output.c:157:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp171
	movq	%rax, %r9	 ; tmp171,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rax	 ;, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	fwrite	 ;
 ; D:\TC\src\output.c:158:                 return;
	jmp	.L36	 ;
.L49:
 ; D:\TC\src\output.c:160:             ast_output(0, false, "expression_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp173
	movq	32(%rbp), %rdx	 ; indent, tmp174
	movq	24(%rbp), %rax	 ; outfile, tmp175
	movq	%rcx, %r9	 ; tmp173,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp175,
	call	indention	 ;
 ; D:\TC\src\output.c:160:             ast_output(0, false, "expression_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp176
	movq	%rax, %r9	 ; tmp176,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	fwrite	 ;
 ; D:\TC\src\output.c:161:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp178
	leaq	1(%rax), %r8	 ;, _14
	movq	16(%rbp), %rax	 ; statement, tmp179
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _15
	movq	40(%rbp), %rcx	 ; parser, tmp180
	movq	24(%rbp), %rdx	 ; outfile, tmp181
	movq	%rcx, %r9	 ; tmp180,
	movq	%rax, %rcx	 ; _15,
	call	output_expression	 ;
 ; D:\TC\src\output.c:162:             break;
	jmp	.L36	 ;
.L37:
 ; D:\TC\src\output.c:164:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	40(%rbp), %rcx	 ; parser, tmp182
	movq	32(%rbp), %rdx	 ; indent, tmp183
	movq	24(%rbp), %rax	 ; outfile, tmp184
	movq	%rcx, %r9	 ; tmp182,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp184,
	call	indention	 ;
 ; D:\TC\src\output.c:164:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	16(%rbp), %rax	 ; statement, tmp185
	movl	8(%rax), %edx	 ; statement_19(D)->type, _16
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movl	%edx, %r8d	 ; _16,
	leaq	.LC28(%rip), %rdx	 ;, tmp187
	movq	%rax, %rcx	 ; tmp186,
	call	fprintf	 ;
 ; D:\TC\src\output.c:165:             return;
	nop	
.L36:
 ; D:\TC\src\output.c:167: }
	leave	
	ret	
	.section .rdata,"dr"
.LC29:
	.ascii "condition\12\0"
.LC30:
	.ascii "else_if\12\0"
.LC31:
	.ascii "else_body\12\0"
	.text
	.def	output_if;	.scl	3;	.type	32;	.endef
output_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$80, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; if_, if_
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:169:     list(Statement*) body = list_copy(if_->body);
	movq	16(%rbp), %rax	 ; if_, tmp90
	movq	8(%rax), %rax	 ; if__13(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp91, body
 ; D:\TC\src\output.c:170:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%rbp), %rax	 ; if_, tmp92
	movq	16(%rax), %rax	 ; if__13(D)->else_if, _2
	movq	%rax, %rcx	 ; _2,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp93, else_if_list
 ; D:\TC\src\output.c:171:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	16(%rbp), %rax	 ; if_, tmp94
	movq	24(%rax), %rax	 ; if__13(D)->else_body, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp95, else_body
 ; D:\TC\src\output.c:172:     ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	indention	 ;
 ; D:\TC\src\output.c:172:     ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %r9	 ; tmp99,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:\TC\src\output.c:173:     output_expression(if_->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp101
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; if_, tmp102
	movq	(%rax), %rax	 ; if__13(D)->condition, _5
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; _5,
	call	output_expression	 ;
 ; D:\TC\src\output.c:174:     ast_output(0, false, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:\TC\src\output.c:174:     ast_output(0, false, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
 ; D:\TC\src\output.c:176:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L51	 ;
.L52:
 ; D:\TC\src\output.c:177:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp110
	leaq	1(%rax), %r8	 ;, _6
	movq	40(%rbp), %rcx	 ; parser, tmp111
	movq	24(%rbp), %rdx	 ; outfile, tmp112
	movq	-32(%rbp), %rax	 ; statement, tmp113
	movq	%rcx, %r9	 ; tmp111,
	movq	%rax, %rcx	 ; tmp113,
	call	output_statement	 ;
.L51:
 ; D:\TC\src\output.c:176:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp115, statement
 ; D:\TC\src\output.c:176:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -32(%rbp)	 ;, statement
	jne	.L52	 ;,
 ; D:\TC\src\output.c:178:     ast_output(0, false, "else_if\n");
	movq	40(%rbp), %rcx	 ; parser, tmp116
	movq	32(%rbp), %rdx	 ; indent, tmp117
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rcx, %r9	 ; tmp116,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	indention	 ;
 ; D:\TC\src\output.c:178:     ast_output(0, false, "else_if\n");
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
 ; D:\TC\src\output.c:180:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	jmp	.L53	 ;
.L54:
 ; D:\TC\src\output.c:181:         output_else_if(else_if, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp121
	leaq	1(%rax), %r8	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp122
	movq	24(%rbp), %rdx	 ; outfile, tmp123
	movq	-40(%rbp), %rax	 ; else_if, tmp124
	movq	%rcx, %r9	 ; tmp122,
	movq	%rax, %rcx	 ; tmp124,
	call	output_else_if	 ;
.L53:
 ; D:\TC\src\output.c:180:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	-16(%rbp), %rax	 ; else_if_list, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp126, else_if
 ; D:\TC\src\output.c:180:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, else_if
	jne	.L54	 ;,
 ; D:\TC\src\output.c:182:     ast_output(0, true, "else_body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp127
	movq	32(%rbp), %rdx	 ; indent, tmp128
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rcx, %r9	 ; tmp127,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp129,
	call	indention	 ;
 ; D:\TC\src\output.c:182:     ast_output(0, true, "else_body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rax	 ;, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	fwrite	 ;
 ; D:\TC\src\output.c:183:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	jmp	.L55	 ;
.L56:
 ; D:\TC\src\output.c:184:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp132
	leaq	1(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp133
	movq	24(%rbp), %rdx	 ; outfile, tmp134
	movq	-32(%rbp), %rax	 ; statement, tmp135
	movq	%rcx, %r9	 ; tmp133,
	movq	%rax, %rcx	 ; tmp135,
	call	output_statement	 ;
.L55:
 ; D:\TC\src\output.c:183:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	-24(%rbp), %rax	 ; else_body, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp137, statement
 ; D:\TC\src\output.c:183:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	cmpq	$0, -32(%rbp)	 ;, statement
	jne	.L56	 ;,
 ; D:\TC\src\output.c:185: }
	nop	
	nop	
	leave	
	ret	
	.def	output_else_if;	.scl	3;	.type	32;	.endef
output_else_if:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; else_if, else_if
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:187:     list(Statement*) body = list_copy(else_if->body);
	movq	16(%rbp), %rax	 ; else_if, tmp86
	movq	8(%rax), %rax	 ; else_if_7(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, body
 ; D:\TC\src\output.c:188:     ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp88
	movq	32(%rbp), %rdx	 ; indent, tmp89
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	indention	 ;
 ; D:\TC\src\output.c:188:     ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %r9	 ; tmp91,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	fwrite	 ;
 ; D:\TC\src\output.c:189:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp93
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; else_if, tmp94
	movq	(%rax), %rax	 ; else_if_7(D)->condition, _3
	movq	40(%rbp), %rcx	 ; parser, tmp95
	movq	24(%rbp), %rdx	 ; outfile, tmp96
	movq	%rcx, %r9	 ; tmp95,
	movq	%rax, %rcx	 ; _3,
	call	output_expression	 ;
 ; D:\TC\src\output.c:190:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp97
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp97,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	indention	 ;
 ; D:\TC\src\output.c:190:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %r9	 ; tmp100,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	fwrite	 ;
 ; D:\TC\src\output.c:192:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L58	 ;
.L59:
 ; D:\TC\src\output.c:193:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	-16(%rbp), %rax	 ; statement, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; tmp105,
	call	output_statement	 ;
.L58:
 ; D:\TC\src\output.c:192:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp107, statement
 ; D:\TC\src\output.c:192:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, statement
	jne	.L59	 ;,
 ; D:\TC\src\output.c:194: }
	nop	
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC32:
	.ascii "initializer\12\0"
.LC33:
	.ascii "initializer: \"NULL\"\12\0"
.LC34:
	.ascii "condition: \"NULL\"\12\0"
.LC35:
	.ascii "increment\12\0"
.LC36:
	.ascii "increment: \"NULL\"\12\0"
	.text
	.def	output_for;	.scl	3;	.type	32;	.endef
output_for:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; for_, for_
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:196:     list(Statement*) body = list_copy(for_->body);
	movq	16(%rbp), %rax	 ; for_, tmp93
	movq	24(%rax), %rax	 ; for__17(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp94, body
 ; D:\TC\src\output.c:197:     if (for_->initializer != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp95
	movq	(%rax), %rax	 ; for__17(D)->initializer, _2
 ; D:\TC\src\output.c:197:     if (for_->initializer != NULL) {
	testq	%rax, %rax	 ; _2
	je	.L61	 ;,
 ; D:\TC\src\output.c:198:         ast_output(0, false, "initializer\n");
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	indention	 ;
 ; D:\TC\src\output.c:198:         ast_output(0, false, "initializer\n");
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %r9	 ; tmp99,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:\TC\src\output.c:199:         output_variable(for_->initializer, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp101
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; for_, tmp102
	movq	(%rax), %rax	 ; for__17(D)->initializer, _4
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; _4,
	call	output_variable	 ;
	jmp	.L62	 ;
.L61:
 ; D:\TC\src\output.c:201:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:\TC\src\output.c:201:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
.L62:
 ; D:\TC\src\output.c:202:     if (for_->condition != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp110
	movq	8(%rax), %rax	 ; for__17(D)->condition, _5
 ; D:\TC\src\output.c:202:     if (for_->condition != NULL) {
	testq	%rax, %rax	 ; _5
	je	.L63	 ;,
 ; D:\TC\src\output.c:203:         ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp111
	movq	32(%rbp), %rdx	 ; indent, tmp112
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rcx, %r9	 ; tmp111,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp113,
	call	indention	 ;
 ; D:\TC\src\output.c:203:         ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp114
	movq	%rax, %r9	 ; tmp114,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	fwrite	 ;
 ; D:\TC\src\output.c:204:         output_expression(for_->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp116
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; for_, tmp117
	movq	8(%rax), %rax	 ; for__17(D)->condition, _7
	movq	40(%rbp), %rcx	 ; parser, tmp118
	movq	24(%rbp), %rdx	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp118,
	movq	%rax, %rcx	 ; _7,
	call	output_expression	 ;
	jmp	.L64	 ;
.L63:
 ; D:\TC\src\output.c:206:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp120
	movq	32(%rbp), %rdx	 ; indent, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rcx, %r9	 ; tmp120,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp122,
	call	indention	 ;
 ; D:\TC\src\output.c:206:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
.L64:
 ; D:\TC\src\output.c:207:     if (for_->increment != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp125
	movq	16(%rax), %rax	 ; for__17(D)->increment, _8
 ; D:\TC\src\output.c:207:     if (for_->increment != NULL) {
	testq	%rax, %rax	 ; _8
	je	.L65	 ;,
 ; D:\TC\src\output.c:208:         ast_output(0, false, "increment\n");
	movq	40(%rbp), %rcx	 ; parser, tmp126
	movq	32(%rbp), %rdx	 ; indent, tmp127
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp128,
	call	indention	 ;
 ; D:\TC\src\output.c:208:         ast_output(0, false, "increment\n");
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rax, %r9	 ; tmp129,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	fwrite	 ;
 ; D:\TC\src\output.c:209:         output_expression(for_->increment, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp131
	leaq	1(%rax), %r8	 ;, _9
	movq	16(%rbp), %rax	 ; for_, tmp132
	movq	16(%rax), %rax	 ; for__17(D)->increment, _10
	movq	40(%rbp), %rcx	 ; parser, tmp133
	movq	24(%rbp), %rdx	 ; outfile, tmp134
	movq	%rcx, %r9	 ; tmp133,
	movq	%rax, %rcx	 ; _10,
	call	output_expression	 ;
	jmp	.L66	 ;
.L65:
 ; D:\TC\src\output.c:211:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp135
	movq	32(%rbp), %rdx	 ; indent, tmp136
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rcx, %r9	 ; tmp135,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp137,
	call	indention	 ;
 ; D:\TC\src\output.c:211:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rax, %r9	 ; tmp138,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rax	 ;, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	fwrite	 ;
.L66:
 ; D:\TC\src\output.c:212:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp140
	movq	32(%rbp), %rdx	 ; indent, tmp141
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movq	%rcx, %r9	 ; tmp140,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp142,
	call	indention	 ;
 ; D:\TC\src\output.c:212:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp143
	movq	%rax, %r9	 ; tmp143,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	fwrite	 ;
 ; D:\TC\src\output.c:214:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L67	 ;
.L68:
 ; D:\TC\src\output.c:215:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp145
	leaq	1(%rax), %r8	 ;, _11
	movq	40(%rbp), %rcx	 ; parser, tmp146
	movq	24(%rbp), %rdx	 ; outfile, tmp147
	movq	-16(%rbp), %rax	 ; statement, tmp148
	movq	%rcx, %r9	 ; tmp146,
	movq	%rax, %rcx	 ; tmp148,
	call	output_statement	 ;
.L67:
 ; D:\TC\src\output.c:214:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp150, statement
 ; D:\TC\src\output.c:214:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, statement
	jne	.L68	 ;,
 ; D:\TC\src\output.c:216: }
	nop	
	nop	
	leave	
	ret	
	.def	output_while;	.scl	3;	.type	32;	.endef
output_while:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; while_, while_
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:218:     list(Statement*) body = list_copy(while_->body);
	movq	16(%rbp), %rax	 ; while_, tmp86
	movq	8(%rax), %rax	 ; while__7(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, body
 ; D:\TC\src\output.c:219:     ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp88
	movq	32(%rbp), %rdx	 ; indent, tmp89
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	indention	 ;
 ; D:\TC\src\output.c:219:     ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %r9	 ; tmp91,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	fwrite	 ;
 ; D:\TC\src\output.c:220:     output_expression(while_->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp93
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; while_, tmp94
	movq	(%rax), %rax	 ; while__7(D)->condition, _3
	movq	40(%rbp), %rcx	 ; parser, tmp95
	movq	24(%rbp), %rdx	 ; outfile, tmp96
	movq	%rcx, %r9	 ; tmp95,
	movq	%rax, %rcx	 ; _3,
	call	output_expression	 ;
 ; D:\TC\src\output.c:221:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp97
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp97,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	indention	 ;
 ; D:\TC\src\output.c:221:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %r9	 ; tmp100,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	fwrite	 ;
 ; D:\TC\src\output.c:223:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L70	 ;
.L71:
 ; D:\TC\src\output.c:224:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	-16(%rbp), %rax	 ; statement, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; tmp105,
	call	output_statement	 ;
.L70:
 ; D:\TC\src\output.c:223:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp107, statement
 ; D:\TC\src\output.c:223:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, statement
	jne	.L71	 ;,
 ; D:\TC\src\output.c:225: }
	nop	
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC37:
	.ascii "primary\12\0"
.LC38:
	.ascii "UNKNOWN_OPERATOR\0"
.LC39:
	.ascii "operator: \"%s\"\12\0"
.LC40:
	.ascii "left\12\0"
.LC41:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; expression, expression
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:227:     if (expression->operator == OP_NONE) {
	movq	16(%rbp), %rax	 ; expression, tmp91
	movl	24(%rax), %eax	 ; expression_12(D)->operator, _1
 ; D:\TC\src\output.c:227:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	jne	.L73	 ;,
 ; D:\TC\src\output.c:228:         ast_output(0, true, "primary\n");
	movq	40(%rbp), %rcx	 ; parser, tmp92
	movq	32(%rbp), %rdx	 ; indent, tmp93
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp92,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp94,
	call	indention	 ;
 ; D:\TC\src\output.c:228:         ast_output(0, true, "primary\n");
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %r9	 ; tmp95,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rax	 ;, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	fwrite	 ;
 ; D:\TC\src\output.c:229:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp97
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; expression, tmp98
	movq	8(%rax), %rax	 ; expression_12(D)->prim_left, _3
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	24(%rbp), %rdx	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp99,
	movq	%rax, %rcx	 ; _3,
	call	output_primary	 ;
 ; D:\TC\src\output.c:238: }
	jmp	.L77	 ;
.L73:
 ; D:\TC\src\output.c:231:         string op_str = operator_to_string(expression->operator);
	movq	16(%rbp), %rax	 ; expression, tmp101
	movl	24(%rax), %eax	 ; expression_12(D)->operator, _4
	movl	%eax, %ecx	 ; _4,
	call	operator_to_string	 ;
	movq	%rax, -8(%rbp)	 ; tmp102, op_str
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	32(%rbp), %rdx	 ; indent, tmp104
	movq	24(%rbp), %rax	 ; outfile, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp105,
	call	indention	 ;
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmpq	$0, -8(%rbp)	 ;, op_str
	je	.L75	 ;,
	movq	-8(%rbp), %rax	 ; op_str, iftmp.1_9
	jmp	.L76	 ;
.L75:
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC38(%rip), %rax	 ;, iftmp.1_9
.L76:
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	24(%rbp), %rcx	 ; outfile, tmp106
	movq	%rax, %r8	 ; iftmp.1_9,
	leaq	.LC39(%rip), %rax	 ;, tmp107
	movq	%rax, %rdx	 ; tmp107,
	call	fprintf	 ;
 ; D:\TC\src\output.c:233:         ast_output(0, false, "left\n");
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:\TC\src\output.c:233:         ast_output(0, false, "left\n");
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
 ; D:\TC\src\output.c:234:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp113
	leaq	1(%rax), %r8	 ;, _5
	movq	16(%rbp), %rax	 ; expression, tmp114
	movq	(%rax), %rax	 ; expression_12(D)->expr_left, _6
	movq	40(%rbp), %rcx	 ; parser, tmp115
	movq	24(%rbp), %rdx	 ; outfile, tmp116
	movq	%rcx, %r9	 ; tmp115,
	movq	%rax, %rcx	 ; _6,
	call	output_expression	 ;
 ; D:\TC\src\output.c:235:         ast_output(0, true, "right\n");
	movq	40(%rbp), %rcx	 ; parser, tmp117
	movq	32(%rbp), %rdx	 ; indent, tmp118
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp117,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp119,
	call	indention	 ;
 ; D:\TC\src\output.c:235:         ast_output(0, true, "right\n");
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
 ; D:\TC\src\output.c:236:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp122
	leaq	1(%rax), %r8	 ;, _7
	movq	16(%rbp), %rax	 ; expression, tmp123
	movq	16(%rax), %rax	 ; expression_12(D)->right, _8
	movq	40(%rbp), %rcx	 ; parser, tmp124
	movq	24(%rbp), %rdx	 ; outfile, tmp125
	movq	%rcx, %r9	 ; tmp124,
	movq	%rax, %rcx	 ; _8,
	call	output_expression	 ;
.L77:
 ; D:\TC\src\output.c:238: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC42:
	.ascii "type: \"integer\"\12\0"
.LC43:
	.ascii "value: %s\12\0"
.LC44:
	.ascii "type: \"float\"\12\0"
.LC45:
	.ascii "type: \"string\"\12\0"
.LC46:
	.ascii "value: \"%s\"\12\0"
.LC47:
	.ascii "type: \"boolean\"\12\0"
.LC48:
	.ascii "value: \"true\"\12\0"
.LC49:
	.ascii "value: \"false\"\12\0"
.LC50:
	.ascii "type: \"expression\"\12\0"
.LC51:
	.ascii "type: \"!\"\12\0"
.LC52:
	.ascii "type: \"-\"\12\0"
.LC53:
	.ascii "type: \"variable\"\12\0"
.LC54:
	.ascii "unknown_PrimaryType: %u\12\0"
	.text
	.def	output_primary;	.scl	3;	.type	32;	.endef
output_primary:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; primary, primary
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:240:     switch (primary->type) {
	movq	16(%rbp), %rax	 ; primary, tmp95
	movl	8(%rax), %eax	 ; primary_16(D)->type, _1
 ; D:\TC\src\output.c:240:     switch (primary->type) {
	cmpl	$8, %eax	 ;, _1
	ja	.L79	 ;,
	movl	%eax, %eax	 ; _1, tmp96
	leaq	0(,%rax,4), %rdx	 ;, tmp97
	leaq	.L81(%rip), %rax	 ;, tmp98
	movl	(%rdx,%rax), %eax	 ;, tmp99
	cltq
	leaq	.L81(%rip), %rdx	 ;, tmp102
	addq	%rdx, %rax	 ; tmp102, tmp101
	jmp	*%rax	 ; tmp101
	.section .rdata,"dr"
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
 ; D:\TC\src\output.c:242:             ast_output(0, false, "type: \"integer\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp103
	movq	32(%rbp), %rdx	 ; indent, tmp104
	movq	24(%rbp), %rax	 ; outfile, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp105,
	call	indention	 ;
 ; D:\TC\src\output.c:242:             ast_output(0, false, "type: \"integer\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movq	%rax, %r9	 ; tmp106,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	fwrite	 ;
 ; D:\TC\src\output.c:243:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:\TC\src\output.c:243:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp111
	movq	(%rax), %rdx	 ; primary_16(D)->value.literal_value, _2
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rdx, %r8	 ; _2,
	leaq	.LC43(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; tmp112,
	call	fprintf	 ;
 ; D:\TC\src\output.c:244:             break;
	jmp	.L90	 ;
.L88:
 ; D:\TC\src\output.c:246:             ast_output(0, false, "type: \"float\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp114
	movq	32(%rbp), %rdx	 ; indent, tmp115
	movq	24(%rbp), %rax	 ; outfile, tmp116
	movq	%rcx, %r9	 ; tmp114,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp116,
	call	indention	 ;
 ; D:\TC\src\output.c:246:             ast_output(0, false, "type: \"float\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rax, %r9	 ; tmp117,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC44(%rip), %rax	 ;, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	fwrite	 ;
 ; D:\TC\src\output.c:247:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	40(%rbp), %rcx	 ; parser, tmp119
	movq	32(%rbp), %rdx	 ; indent, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rcx, %r9	 ; tmp119,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp121,
	call	indention	 ;
 ; D:\TC\src\output.c:247:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp122
	movq	(%rax), %rdx	 ; primary_16(D)->value.literal_value, _3
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rdx, %r8	 ; _3,
	leaq	.LC43(%rip), %rdx	 ;, tmp124
	movq	%rax, %rcx	 ; tmp123,
	call	fprintf	 ;
 ; D:\TC\src\output.c:248:             break;
	jmp	.L90	 ;
.L87:
 ; D:\TC\src\output.c:250:             ast_output(0, false, "type: \"string\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp125
	movq	32(%rbp), %rdx	 ; indent, tmp126
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	indention	 ;
 ; D:\TC\src\output.c:250:             ast_output(0, false, "type: \"string\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rax, %r9	 ; tmp128,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC45(%rip), %rax	 ;, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	fwrite	 ;
 ; D:\TC\src\output.c:251:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	40(%rbp), %rcx	 ; parser, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:\TC\src\output.c:251:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp133
	movq	(%rax), %rdx	 ; primary_16(D)->value.literal_value, _4
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movq	%rdx, %r8	 ; _4,
	leaq	.LC46(%rip), %rdx	 ;, tmp135
	movq	%rax, %rcx	 ; tmp134,
	call	fprintf	 ;
 ; D:\TC\src\output.c:252:             break;
	jmp	.L90	 ;
.L86:
 ; D:\TC\src\output.c:254:             ast_output(0, false, "type: \"boolean\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp136
	movq	32(%rbp), %rdx	 ; indent, tmp137
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp138,
	call	indention	 ;
 ; D:\TC\src\output.c:254:             ast_output(0, false, "type: \"boolean\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movq	%rax, %r9	 ; tmp139,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rax	 ;, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	fwrite	 ;
 ; D:\TC\src\output.c:255:             ast_output(0, true, "value: \"true\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp141
	movq	32(%rbp), %rdx	 ; indent, tmp142
	movq	24(%rbp), %rax	 ; outfile, tmp143
	movq	%rcx, %r9	 ; tmp141,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	indention	 ;
 ; D:\TC\src\output.c:255:             ast_output(0, true, "value: \"true\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp144
	movq	%rax, %r9	 ; tmp144,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	fwrite	 ;
 ; D:\TC\src\output.c:256:             break;
	jmp	.L90	 ;
.L85:
 ; D:\TC\src\output.c:258:             ast_output(0, false, "type: \"boolean\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp146
	movq	32(%rbp), %rdx	 ; indent, tmp147
	movq	24(%rbp), %rax	 ; outfile, tmp148
	movq	%rcx, %r9	 ; tmp146,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp148,
	call	indention	 ;
 ; D:\TC\src\output.c:258:             ast_output(0, false, "type: \"boolean\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp149
	movq	%rax, %r9	 ; tmp149,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rax	 ;, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	fwrite	 ;
 ; D:\TC\src\output.c:259:             ast_output(0, true, "value: \"false\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp151
	movq	32(%rbp), %rdx	 ; indent, tmp152
	movq	24(%rbp), %rax	 ; outfile, tmp153
	movq	%rcx, %r9	 ; tmp151,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp153,
	call	indention	 ;
 ; D:\TC\src\output.c:259:             ast_output(0, true, "value: \"false\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rax, %r9	 ; tmp154,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rax	 ;, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	fwrite	 ;
 ; D:\TC\src\output.c:260:             break;
	jmp	.L90	 ;
.L84:
 ; D:\TC\src\output.c:262:             ast_output(0, false, "type: \"expression\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp156
	movq	32(%rbp), %rdx	 ; indent, tmp157
	movq	24(%rbp), %rax	 ; outfile, tmp158
	movq	%rcx, %r9	 ; tmp156,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	indention	 ;
 ; D:\TC\src\output.c:262:             ast_output(0, false, "type: \"expression\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rax, %r9	 ; tmp159,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	fwrite	 ;
 ; D:\TC\src\output.c:263:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp161
	movq	32(%rbp), %rdx	 ; indent, tmp162
	movq	24(%rbp), %rax	 ; outfile, tmp163
	movq	%rcx, %r9	 ; tmp161,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp163,
	call	indention	 ;
 ; D:\TC\src\output.c:263:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rax, %r9	 ; tmp164,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	fwrite	 ;
 ; D:\TC\src\output.c:264:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp166
	leaq	1(%rax), %r8	 ;, _5
	movq	16(%rbp), %rax	 ; primary, tmp167
	movq	(%rax), %rax	 ; primary_16(D)->value.expr, _6
	movq	40(%rbp), %rcx	 ; parser, tmp168
	movq	24(%rbp), %rdx	 ; outfile, tmp169
	movq	%rcx, %r9	 ; tmp168,
	movq	%rax, %rcx	 ; _6,
	call	output_expression	 ;
 ; D:\TC\src\output.c:265:             break;
	jmp	.L90	 ;
.L83:
 ; D:\TC\src\output.c:267:             ast_output(0, false, "type: \"!\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp170
	movq	32(%rbp), %rdx	 ; indent, tmp171
	movq	24(%rbp), %rax	 ; outfile, tmp172
	movq	%rcx, %r9	 ; tmp170,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	indention	 ;
 ; D:\TC\src\output.c:267:             ast_output(0, false, "type: \"!\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rax, %r9	 ; tmp173,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rax	 ;, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	fwrite	 ;
 ; D:\TC\src\output.c:268:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp175
	movq	32(%rbp), %rdx	 ; indent, tmp176
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rcx, %r9	 ; tmp175,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp177,
	call	indention	 ;
 ; D:\TC\src\output.c:268:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
 ; D:\TC\src\output.c:269:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp180
	leaq	1(%rax), %r8	 ;, _7
	movq	16(%rbp), %rax	 ; primary, tmp181
	movq	(%rax), %rax	 ; primary_16(D)->value.operand, _8
	movq	40(%rbp), %rcx	 ; parser, tmp182
	movq	24(%rbp), %rdx	 ; outfile, tmp183
	movq	%rcx, %r9	 ; tmp182,
	movq	%rax, %rcx	 ; _8,
	call	output_primary	 ;
 ; D:\TC\src\output.c:270:             break;
	jmp	.L90	 ;
.L82:
 ; D:\TC\src\output.c:272:             ast_output(0, false, "type: \"-\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp184
	movq	32(%rbp), %rdx	 ; indent, tmp185
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rcx, %r9	 ; tmp184,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	indention	 ;
 ; D:\TC\src\output.c:272:             ast_output(0, false, "type: \"-\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
 ; D:\TC\src\output.c:273:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp189
	movq	32(%rbp), %rdx	 ; indent, tmp190
	movq	24(%rbp), %rax	 ; outfile, tmp191
	movq	%rcx, %r9	 ; tmp189,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp191,
	call	indention	 ;
 ; D:\TC\src\output.c:273:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp192
	movq	%rax, %r9	 ; tmp192,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	fwrite	 ;
 ; D:\TC\src\output.c:274:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp194
	leaq	1(%rax), %r8	 ;, _9
	movq	16(%rbp), %rax	 ; primary, tmp195
	movq	(%rax), %rax	 ; primary_16(D)->value.operand, _10
	movq	40(%rbp), %rcx	 ; parser, tmp196
	movq	24(%rbp), %rdx	 ; outfile, tmp197
	movq	%rcx, %r9	 ; tmp196,
	movq	%rax, %rcx	 ; _10,
	call	output_primary	 ;
 ; D:\TC\src\output.c:275:             break;
	jmp	.L90	 ;
.L80:
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"variable\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp198
	movq	32(%rbp), %rdx	 ; indent, tmp199
	movq	24(%rbp), %rax	 ; outfile, tmp200
	movq	%rcx, %r9	 ; tmp198,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp200,
	call	indention	 ;
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"variable\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp201
	movq	%rax, %r9	 ; tmp201,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rax	 ;, tmp202
	movq	%rax, %rcx	 ; tmp202,
	call	fwrite	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp203
	movq	32(%rbp), %rdx	 ; indent, tmp204
	movq	24(%rbp), %rax	 ; outfile, tmp205
	movq	%rcx, %r9	 ; tmp203,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp205,
	call	indention	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp206
	movq	%rax, %r9	 ; tmp206,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp207
	movq	%rax, %rcx	 ; tmp207,
	call	fwrite	 ;
 ; D:\TC\src\output.c:279:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp208
	leaq	1(%rax), %r8	 ;, _11
	movq	16(%rbp), %rax	 ; primary, tmp209
	movq	(%rax), %rax	 ; primary_16(D)->value.var, _12
	movq	40(%rbp), %rcx	 ; parser, tmp210
	movq	24(%rbp), %rdx	 ; outfile, tmp211
	movq	%rcx, %r9	 ; tmp210,
	movq	%rax, %rcx	 ; _12,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:280:             break;
	jmp	.L90	 ;
.L79:
 ; D:\TC\src\output.c:282:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	40(%rbp), %rcx	 ; parser, tmp212
	movq	32(%rbp), %rdx	 ; indent, tmp213
	movq	24(%rbp), %rax	 ; outfile, tmp214
	movq	%rcx, %r9	 ; tmp212,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp214,
	call	indention	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	16(%rbp), %rax	 ; primary, tmp215
	movl	8(%rax), %edx	 ; primary_16(D)->type, _13
	movq	24(%rbp), %rax	 ; outfile, tmp216
	movl	%edx, %r8d	 ; _13,
	leaq	.LC54(%rip), %rdx	 ;, tmp217
	movq	%rax, %rcx	 ; tmp216,
	call	fprintf	 ;
 ; D:\TC\src\output.c:283:             break;
	nop	
.L90:
 ; D:\TC\src\output.c:285: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC55:
	.ascii "type: \"name\"\12\0"
.LC56:
	.ascii "type: \"function_call\"\12\0"
.LC57:
	.ascii "arguments\12\0"
.LC58:
	.ascii "arguments[%d]\12\0"
.LC59:
	.ascii "type: \"get sequence_element\"\12\0"
.LC60:
	.ascii "sequence\12\0"
.LC61:
	.ascii "index\12\0"
.LC62:
	.ascii "type: \"get_attribute\"\12\0"
.LC63:
	.ascii "object\12\0"
.LC64:
	.ascii "attribute_name\12\0"
	.align 8
.LC65:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; variable_access, variable_access
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:289:     switch (variable_access->type) {
	movq	16(%rbp), %rax	 ; variable_access, tmp99
	movl	16(%rax), %eax	 ; variable_access_22(D)->type, _1
 ; D:\TC\src\output.c:289:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	je	.L92	 ;,
	cmpl	$3, %eax	 ;, _1
	ja	.L93	 ;,
	cmpl	$2, %eax	 ;, _1
	je	.L94	 ;,
	cmpl	$2, %eax	 ;, _1
	ja	.L93	 ;,
	testl	%eax, %eax	 ; _1
	je	.L95	 ;,
	cmpl	$1, %eax	 ;, _1
	je	.L96	 ;,
	jmp	.L93	 ;
.L95:
 ; D:\TC\src\output.c:291:             ast_output(0, false, "type: \"name\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:\TC\src\output.c:291:             ast_output(0, false, "type: \"name\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:\TC\src\output.c:292:             ast_output(0, true, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:\TC\src\output.c:292:             ast_output(0, true, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
 ; D:\TC\src\output.c:293:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp110
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; variable_access, tmp111
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.name, _3
	movq	40(%rbp), %rcx	 ; parser, tmp112
	movq	24(%rbp), %rdx	 ; outfile, tmp113
	movq	%rcx, %r9	 ; tmp112,
	movq	%rax, %rcx	 ; _3,
	call	output_name	 ;
 ; D:\TC\src\output.c:294:             break;
	jmp	.L97	 ;
.L96:
 ; D:\TC\src\output.c:296:             args = list_copy(variable_access->content.args);
	movq	16(%rbp), %rax	 ; variable_access, tmp114
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.args, _4
	movq	%rax, %rcx	 ; _4,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp115, args
 ; D:\TC\src\output.c:297:             ast_output(0, false, "type: \"function_call\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp116
	movq	32(%rbp), %rdx	 ; indent, tmp117
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rcx, %r9	 ; tmp116,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	indention	 ;
 ; D:\TC\src\output.c:297:             ast_output(0, false, "type: \"function_call\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
 ; D:\TC\src\output.c:298:             ast_output(0, false, "function\n");
	movq	40(%rbp), %rcx	 ; parser, tmp121
	movq	32(%rbp), %rdx	 ; indent, tmp122
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rcx, %r9	 ; tmp121,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp123,
	call	indention	 ;
 ; D:\TC\src\output.c:298:             ast_output(0, false, "function\n");
	movq	24(%rbp), %rax	 ; outfile, tmp124
	movq	%rax, %r9	 ; tmp124,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	fwrite	 ;
 ; D:\TC\src\output.c:299:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp126
	leaq	1(%rax), %r8	 ;, _5
	movq	16(%rbp), %rax	 ; variable_access, tmp127
	movq	(%rax), %rax	 ; variable_access_22(D)->base, _6
	movq	40(%rbp), %rcx	 ; parser, tmp128
	movq	24(%rbp), %rdx	 ; outfile, tmp129
	movq	%rcx, %r9	 ; tmp128,
	movq	%rax, %rcx	 ; _6,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:300:             ast_output(0, true, "arguments\n");
	movq	40(%rbp), %rcx	 ; parser, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:\TC\src\output.c:300:             ast_output(0, true, "arguments\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:\TC\src\output.c:302:             index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:\TC\src\output.c:303:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L98	 ;
.L99:
 ; D:\TC\src\output.c:304:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp136
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rcx, %r9	 ; tmp136,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp137,
	call	indention	 ;
 ; D:\TC\src\output.c:304:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp138
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movl	%edx, %r8d	 ; tmp138,
	leaq	.LC58(%rip), %rdx	 ;, tmp140
	movq	%rax, %rcx	 ; tmp139,
	call	fprintf	 ;
 ; D:\TC\src\output.c:305:                 output_expression(arg, outfile, indent + 2, parser);
	movq	32(%rbp), %rax	 ; indent, tmp141
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp142
	movq	24(%rbp), %rdx	 ; outfile, tmp143
	movq	-24(%rbp), %rax	 ; arg, tmp144
	movq	%rcx, %r9	 ; tmp142,
	movq	%rax, %rcx	 ; tmp144,
	call	output_expression	 ;
.L98:
 ; D:\TC\src\output.c:303:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	-16(%rbp), %rax	 ; args, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp146, arg
 ; D:\TC\src\output.c:303:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -24(%rbp)	 ;, arg
	jne	.L99	 ;,
 ; D:\TC\src\output.c:307:             break;
	jmp	.L97	 ;
.L92:
 ; D:\TC\src\output.c:309:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp147
	movq	32(%rbp), %rdx	 ; indent, tmp148
	movq	24(%rbp), %rax	 ; outfile, tmp149
	movq	%rcx, %r9	 ; tmp147,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp149,
	call	indention	 ;
 ; D:\TC\src\output.c:309:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rax, %r9	 ; tmp150,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rax	 ;, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	fwrite	 ;
 ; D:\TC\src\output.c:310:             ast_output(0, false, "sequence\n");
	movq	40(%rbp), %rcx	 ; parser, tmp152
	movq	32(%rbp), %rdx	 ; indent, tmp153
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rcx, %r9	 ; tmp152,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp154,
	call	indention	 ;
 ; D:\TC\src\output.c:310:             ast_output(0, false, "sequence\n");
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rax, %r9	 ; tmp155,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	fwrite	 ;
 ; D:\TC\src\output.c:311:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp157
	leaq	1(%rax), %r8	 ;, _9
	movq	16(%rbp), %rax	 ; variable_access, tmp158
	movq	(%rax), %rax	 ; variable_access_22(D)->base, _10
	movq	40(%rbp), %rcx	 ; parser, tmp159
	movq	24(%rbp), %rdx	 ; outfile, tmp160
	movq	%rcx, %r9	 ; tmp159,
	movq	%rax, %rcx	 ; _10,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:312:             ast_output(0, true, "index\n");
	movq	40(%rbp), %rcx	 ; parser, tmp161
	movq	32(%rbp), %rdx	 ; indent, tmp162
	movq	24(%rbp), %rax	 ; outfile, tmp163
	movq	%rcx, %r9	 ; tmp161,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp163,
	call	indention	 ;
 ; D:\TC\src\output.c:312:             ast_output(0, true, "index\n");
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rax, %r9	 ; tmp164,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	fwrite	 ;
 ; D:\TC\src\output.c:313:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp166
	leaq	1(%rax), %r8	 ;, _11
	movq	16(%rbp), %rax	 ; variable_access, tmp167
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.index, _12
	movq	40(%rbp), %rcx	 ; parser, tmp168
	movq	24(%rbp), %rdx	 ; outfile, tmp169
	movq	%rcx, %r9	 ; tmp168,
	movq	%rax, %rcx	 ; _12,
	call	output_expression	 ;
 ; D:\TC\src\output.c:314:             break;
	jmp	.L97	 ;
.L94:
 ; D:\TC\src\output.c:316:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp170
	movq	32(%rbp), %rdx	 ; indent, tmp171
	movq	24(%rbp), %rax	 ; outfile, tmp172
	movq	%rcx, %r9	 ; tmp170,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	indention	 ;
 ; D:\TC\src\output.c:316:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rax, %r9	 ; tmp173,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rax	 ;, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	fwrite	 ;
 ; D:\TC\src\output.c:317:             ast_output(0, false, "object\n");
	movq	40(%rbp), %rcx	 ; parser, tmp175
	movq	32(%rbp), %rdx	 ; indent, tmp176
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rcx, %r9	 ; tmp175,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp177,
	call	indention	 ;
 ; D:\TC\src\output.c:317:             ast_output(0, false, "object\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
 ; D:\TC\src\output.c:318:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp180
	leaq	1(%rax), %r8	 ;, _13
	movq	16(%rbp), %rax	 ; variable_access, tmp181
	movq	(%rax), %rax	 ; variable_access_22(D)->base, _14
	movq	40(%rbp), %rcx	 ; parser, tmp182
	movq	24(%rbp), %rdx	 ; outfile, tmp183
	movq	%rcx, %r9	 ; tmp182,
	movq	%rax, %rcx	 ; _14,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:319:             ast_output(0, true, "attribute_name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp184
	movq	32(%rbp), %rdx	 ; indent, tmp185
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rcx, %r9	 ; tmp184,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	indention	 ;
 ; D:\TC\src\output.c:319:             ast_output(0, true, "attribute_name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
 ; D:\TC\src\output.c:320:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp189
	leaq	1(%rax), %r8	 ;, _15
	movq	16(%rbp), %rax	 ; variable_access, tmp190
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.attr_name, _16
	movq	40(%rbp), %rcx	 ; parser, tmp191
	movq	24(%rbp), %rdx	 ; outfile, tmp192
	movq	%rcx, %r9	 ; tmp191,
	movq	%rax, %rcx	 ; _16,
	call	output_name	 ;
 ; D:\TC\src\output.c:321:             break;
	jmp	.L97	 ;
.L93:
 ; D:\TC\src\output.c:323:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	40(%rbp), %rcx	 ; parser, tmp193
	movq	32(%rbp), %rdx	 ; indent, tmp194
	movq	24(%rbp), %rax	 ; outfile, tmp195
	movq	%rcx, %r9	 ; tmp193,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp195,
	call	indention	 ;
 ; D:\TC\src\output.c:323:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	16(%rbp), %rax	 ; variable_access, tmp196
	movl	16(%rax), %edx	 ; variable_access_22(D)->type, _17
	movq	24(%rbp), %rax	 ; outfile, tmp197
	movl	%edx, %r8d	 ; _17,
	leaq	.LC65(%rip), %rdx	 ;, tmp198
	movq	%rax, %rcx	 ; tmp197,
	call	fprintf	 ;
 ; D:\TC\src\output.c:324:             break;
	nop	
.L97:
 ; D:\TC\src\output.c:326: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC66:
	.ascii "Name pointer: \"NULL\"\12\0"
.LC67:
	.ascii "name: \"%s\"\12\0"
.LC68:
	.ascii "id: %zu\12\0"
.LC69:
	.ascii "kind: \"type\"\12\0"
.LC70:
	.ascii "kind: \"variable\"\12\0"
.LC71:
	.ascii "kind: \"subroutine\"\12\0"
.LC72:
	.ascii "kind: \"class\"\12\0"
.LC73:
	.ascii "kind: \"attribute\"\12\0"
.LC74:
	.ascii "kind: \"parameter\"\12\0"
.LC75:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:328:     if (name == NULL) {
	cmpq	$0, 16(%rbp)	 ;, name
	jne	.L101	 ;,
 ; D:\TC\src\output.c:329:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp93
	movq	32(%rbp), %rdx	 ; indent, tmp94
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rcx, %r9	 ; tmp93,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp95,
	call	indention	 ;
 ; D:\TC\src\output.c:329:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rax, %r9	 ; tmp96,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
 ; D:\TC\src\output.c:330:         return;
	jmp	.L100	 ;
.L101:
 ; D:\TC\src\output.c:332:     ast_output(0, false, "name: \"%s\"\n", name->original_name);
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:\TC\src\output.c:332:     ast_output(0, false, "name: \"%s\"\n", name->original_name);
	movq	16(%rbp), %rax	 ; name, tmp101
	movq	16(%rax), %rdx	 ; name_13(D)->original_name, _1
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rdx, %r8	 ; _1,
	leaq	.LC67(%rip), %rdx	 ;, tmp103
	movq	%rax, %rcx	 ; tmp102,
	call	fprintf	 ;
 ; D:\TC\src\output.c:333:     ast_output(0, false, "id: %zu\n", name->id);
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	32(%rbp), %rdx	 ; indent, tmp105
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp104,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp106,
	call	indention	 ;
 ; D:\TC\src\output.c:333:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rbp), %rax	 ; name, tmp107
	movq	24(%rax), %rdx	 ; name_13(D)->id, _2
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rdx, %r8	 ; _2,
	leaq	.LC68(%rip), %rdx	 ;, tmp109
	movq	%rax, %rcx	 ; tmp108,
	call	fprintf	 ;
 ; D:\TC\src\output.c:334:     switch (name->kind) {
	movq	16(%rbp), %rax	 ; name, tmp110
	movl	32(%rax), %eax	 ; name_13(D)->kind, _3
 ; D:\TC\src\output.c:334:     switch (name->kind) {
	cmpl	$5, %eax	 ;, _3
	ja	.L103	 ;,
	movl	%eax, %eax	 ; _3, tmp111
	leaq	0(,%rax,4), %rdx	 ;, tmp112
	leaq	.L105(%rip), %rax	 ;, tmp113
	movl	(%rdx,%rax), %eax	 ;, tmp114
	cltq
	leaq	.L105(%rip), %rdx	 ;, tmp117
	addq	%rdx, %rax	 ; tmp117, tmp116
	jmp	*%rax	 ; tmp116
	.section .rdata,"dr"
	.align 4
.L105:
	.long	.L110-.L105
	.long	.L109-.L105
	.long	.L108-.L105
	.long	.L107-.L105
	.long	.L106-.L105
	.long	.L104-.L105
	.text
.L104:
 ; D:\TC\src\output.c:336:             ast_output(0, true, "kind: \"type\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp118
	movq	32(%rbp), %rdx	 ; indent, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp118,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:\TC\src\output.c:336:             ast_output(0, true, "kind: \"type\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rax, %r9	 ; tmp121,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC69(%rip), %rax	 ;, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	fwrite	 ;
 ; D:\TC\src\output.c:337:             break;
	jmp	.L100	 ;
.L108:
 ; D:\TC\src\output.c:339:             ast_output(0, false, "kind: \"variable\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp123
	movq	32(%rbp), %rdx	 ; indent, tmp124
	movq	24(%rbp), %rax	 ; outfile, tmp125
	movq	%rcx, %r9	 ; tmp123,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp125,
	call	indention	 ;
 ; D:\TC\src\output.c:339:             ast_output(0, false, "kind: \"variable\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp126
	movq	%rax, %r9	 ; tmp126,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC70(%rip), %rax	 ;, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	fwrite	 ;
 ; D:\TC\src\output.c:340:             ast_output(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp128
	movq	32(%rbp), %rdx	 ; indent, tmp129
	movq	24(%rbp), %rax	 ; outfile, tmp130
	movq	%rcx, %r9	 ; tmp128,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp130,
	call	indention	 ;
 ; D:\TC\src\output.c:340:             ast_output(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movq	%rax, %r9	 ; tmp131,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	fwrite	 ;
 ; D:\TC\src\output.c:341:             output_name(name->type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp133
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; name, tmp134
	movq	(%rax), %rax	 ; name_13(D)->type, _5
	movq	40(%rbp), %rcx	 ; parser, tmp135
	movq	24(%rbp), %rdx	 ; outfile, tmp136
	movq	%rcx, %r9	 ; tmp135,
	movq	%rax, %rcx	 ; _5,
	call	output_name	 ;
 ; D:\TC\src\output.c:342:             break;
	jmp	.L100	 ;
.L109:
 ; D:\TC\src\output.c:344:             ast_output(0, false, "kind: \"subroutine\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp137
	movq	32(%rbp), %rdx	 ; indent, tmp138
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movq	%rcx, %r9	 ; tmp137,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp139,
	call	indention	 ;
 ; D:\TC\src\output.c:344:             ast_output(0, false, "kind: \"subroutine\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp140
	movq	%rax, %r9	 ; tmp140,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rax	 ;, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	fwrite	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp142
	movq	32(%rbp), %rdx	 ; indent, tmp143
	movq	24(%rbp), %rax	 ; outfile, tmp144
	movq	%rcx, %r9	 ; tmp142,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp144,
	call	indention	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp145
	movq	%rax, %r9	 ; tmp145,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	fwrite	 ;
 ; D:\TC\src\output.c:346:             output_name(name->type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp147
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; name, tmp148
	movq	(%rax), %rax	 ; name_13(D)->type, _7
	movq	40(%rbp), %rcx	 ; parser, tmp149
	movq	24(%rbp), %rdx	 ; outfile, tmp150
	movq	%rcx, %r9	 ; tmp149,
	movq	%rax, %rcx	 ; _7,
	call	output_name	 ;
 ; D:\TC\src\output.c:347:             break;
	jmp	.L100	 ;
.L110:
 ; D:\TC\src\output.c:349:             ast_output(0, true, "kind: \"class\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp151
	movq	32(%rbp), %rdx	 ; indent, tmp152
	movq	24(%rbp), %rax	 ; outfile, tmp153
	movq	%rcx, %r9	 ; tmp151,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp153,
	call	indention	 ;
 ; D:\TC\src\output.c:349:             ast_output(0, true, "kind: \"class\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rax, %r9	 ; tmp154,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rax	 ;, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	fwrite	 ;
 ; D:\TC\src\output.c:350:             break;
	jmp	.L100	 ;
.L106:
 ; D:\TC\src\output.c:352:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp156
	movq	32(%rbp), %rdx	 ; indent, tmp157
	movq	24(%rbp), %rax	 ; outfile, tmp158
	movq	%rcx, %r9	 ; tmp156,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	indention	 ;
 ; D:\TC\src\output.c:352:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rax, %r9	 ; tmp159,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	fwrite	 ;
 ; D:\TC\src\output.c:353:             ast_output(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp161
	movq	32(%rbp), %rdx	 ; indent, tmp162
	movq	24(%rbp), %rax	 ; outfile, tmp163
	movq	%rcx, %r9	 ; tmp161,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp163,
	call	indention	 ;
 ; D:\TC\src\output.c:353:             ast_output(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rax, %r9	 ; tmp164,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	fwrite	 ;
 ; D:\TC\src\output.c:354:             output_name(name->type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp166
	leaq	1(%rax), %r8	 ;, _8
	movq	16(%rbp), %rax	 ; name, tmp167
	movq	(%rax), %rax	 ; name_13(D)->type, _9
	movq	40(%rbp), %rcx	 ; parser, tmp168
	movq	24(%rbp), %rdx	 ; outfile, tmp169
	movq	%rcx, %r9	 ; tmp168,
	movq	%rax, %rcx	 ; _9,
	call	output_name	 ;
 ; D:\TC\src\output.c:355:             break;
	jmp	.L100	 ;
.L107:
 ; D:\TC\src\output.c:357:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp170
	movq	32(%rbp), %rdx	 ; indent, tmp171
	movq	24(%rbp), %rax	 ; outfile, tmp172
	movq	%rcx, %r9	 ; tmp170,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	indention	 ;
 ; D:\TC\src\output.c:357:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rax, %r9	 ; tmp173,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC74(%rip), %rax	 ;, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	fwrite	 ;
 ; D:\TC\src\output.c:358:             ast_output(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp175
	movq	32(%rbp), %rdx	 ; indent, tmp176
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rcx, %r9	 ; tmp175,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp177,
	call	indention	 ;
 ; D:\TC\src\output.c:358:             ast_output(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
 ; D:\TC\src\output.c:359:             output_name(name->type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp180
	leaq	1(%rax), %r8	 ;, _10
	movq	16(%rbp), %rax	 ; name, tmp181
	movq	(%rax), %rax	 ; name_13(D)->type, _11
	movq	40(%rbp), %rcx	 ; parser, tmp182
	movq	24(%rbp), %rdx	 ; outfile, tmp183
	movq	%rcx, %r9	 ; tmp182,
	movq	%rax, %rcx	 ; _11,
	call	output_name	 ;
 ; D:\TC\src\output.c:360:             break;
	jmp	.L100	 ;
.L103:
 ; D:\TC\src\output.c:362:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp184
	movq	32(%rbp), %rdx	 ; indent, tmp185
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rcx, %r9	 ; tmp184,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	indention	 ;
 ; D:\TC\src\output.c:362:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC75(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
 ; D:\TC\src\output.c:363:             break;
	nop	
.L100:
 ; D:\TC\src\output.c:365: }
	leave	
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef

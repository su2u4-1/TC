	.file	"output.c"
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
	movq	16(%rbp), %rax	 ; code_member, tmp90
	movl	8(%rax), %eax	 ; code_member_11(D)->type, _1
 ; D:/TC/src/output.c:24:     switch (code_member->type) {
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
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp91
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rcx, %r9	 ; tmp91,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp93,
	call	indention	 ;
 ; D:/TC/src/output.c:26:             ast_output(0, false, "import\n");
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rax, %r9	 ; tmp94,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:/TC/src/output.c:27:             output_import(code_member->content.import, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp96
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; code_member, tmp97
	movq	(%rax), %rax	 ; code_member_11(D)->content.import, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp98
	movq	24(%rbp), %rdx	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp98,
	movq	%rax, %rcx	 ; _3,
	call	output_import	 ;
 ; D:/TC/src/output.c:28:             break;
	jmp	.L6	 ;
.L5:
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:/TC/src/output.c:30:             ast_output(0, false, "function\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:/TC/src/output.c:31:             output_function(code_member->content.function, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp105
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; code_member, tmp106
	movq	(%rax), %rax	 ; code_member_11(D)->content.function, _5
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp107
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp107,
	movq	%rax, %rcx	 ; _5,
	call	output_function	 ;
 ; D:/TC/src/output.c:32:             break;
	jmp	.L6	 ;
.L2:
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:/TC/src/output.c:34:             ast_output(0, false, "class\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:/TC/src/output.c:35:             output_class(code_member->content.class, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp114
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; code_member, tmp115
	movq	(%rax), %rax	 ; code_member_11(D)->content.class, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp116
	movq	24(%rbp), %rdx	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp116,
	movq	%rax, %rcx	 ; _7,
	call	output_class	 ;
 ; D:/TC/src/output.c:36:             break;
	jmp	.L6	 ;
.L3:
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp118
	movq	32(%rbp), %rdx	 ; indent, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp118,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:/TC/src/output.c:38:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	16(%rbp), %rax	 ; code_member, tmp121
	movl	8(%rax), %edx	 ; code_member_11(D)->type, _8
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	%edx, %r8d	 ; _8,
	leaq	.LC3(%rip), %rdx	 ;, tmp123
	movq	%rax, %rcx	 ; tmp122,
	call	fprintf	 ;
 ; D:/TC/src/output.c:39:             break;
	nop	
.L6:
 ; D:/TC/src/output.c:42: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:45:     list(CodeMember*) members = list_copy(code->members);
	movq	16(%rbp), %rax	 ; code, tmp84
	movq	(%rax), %rax	 ; code_5(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, members
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	jmp	.L8	 ;
.L9:
 ; D:/TC/src/output.c:48:         output_code_member(member, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp86
	leaq	1(%rax), %r8	 ;, _2
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp87
	movq	24(%rbp), %rdx	 ; outfile, tmp88
	movq	-16(%rbp), %rax	 ; member, tmp89
	movq	%rcx, %r9	 ; tmp87,
	movq	%rax, %rcx	 ; tmp89,
	call	output_code_member	 ;
.L8:
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	 ; members, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp91, member
 ; D:/TC/src/output.c:47:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, member
	jne	.L9	 ;,
 ; D:/TC/src/output.c:50: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp86
	movq	32(%rbp), %rdx	 ; indent, tmp87
	movq	24(%rbp), %rax	 ; outfile, tmp88
	movq	%rcx, %r9	 ; tmp86,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp88,
	call	indention	 ;
 ; D:/TC/src/output.c:53:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rax, %r9	 ; tmp89,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	fwrite	 ;
 ; D:/TC/src/output.c:54:     output_name(import->name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp91
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; import, tmp92
	movq	(%rax), %rax	 ; import_11(D)->name, _2
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp93
	movq	24(%rbp), %rdx	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp93,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp95
	movq	32(%rbp), %rdx	 ; indent, tmp96
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp95,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	indention	 ;
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	16(%rbp), %rax	 ; import, tmp98
	movq	8(%rax), %rax	 ; import_11(D)->source, _3
	testq	%rax, %rax	 ; _3
	je	.L11	 ;,
	movq	16(%rbp), %rax	 ; import, tmp99
	movq	8(%rax), %rax	 ; import_11(D)->source, iftmp.0_4
	jmp	.L12	 ;
.L11:
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC5(%rip), %rax	 ;, iftmp.0_4
.L12:
 ; D:/TC/src/output.c:55:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	24(%rbp), %rcx	 ; outfile, tmp100
	movq	%rax, %r8	 ; iftmp.0_4,
	leaq	.LC6(%rip), %rax	 ;, tmp101
	movq	%rax, %rdx	 ; tmp101,
	call	fprintf	 ;
 ; D:/TC/src/output.c:57: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp91
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rcx, %r9	 ; tmp91,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp93,
	call	indention	 ;
 ; D:/TC/src/output.c:60:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rax, %r9	 ; tmp94,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:/TC/src/output.c:61:     output_name(function->name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp96
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; function, tmp97
	movq	(%rax), %rax	 ; function_19(D)->name, _2
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp98
	movq	24(%rbp), %rdx	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp98,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:/TC/src/output.c:62:     ast_output(0, false, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:/TC/src/output.c:63:     output_name(function->return_type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp105
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; function, tmp106
	movq	8(%rax), %rax	 ; function_19(D)->return_type, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp107
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp107,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:/TC/src/output.c:64:     ast_output(0, false, "parameters\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:/TC/src/output.c:65:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rax	 ; function, tmp114
	movq	16(%rax), %rax	 ; function_19(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp115, parameters
 ; D:/TC/src/output.c:66:     list(Statement*) body = list_copy(function->body);
	movq	16(%rbp), %rax	 ; function, tmp116
	movq	24(%rax), %rax	 ; function_19(D)->body, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp117, body
 ; D:/TC/src/output.c:68:     int index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L14	 ;
.L15:
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp118
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp119,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:/TC/src/output.c:70:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	%edx, %r8d	 ; tmp121,
	leaq	.LC9(%rip), %rdx	 ;, tmp123
	movq	%rax, %rcx	 ; tmp122,
	call	fprintf	 ;
 ; D:/TC/src/output.c:71:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp124
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp125
	movq	24(%rbp), %rdx	 ; outfile, tmp126
	movq	-32(%rbp), %rax	 ; parameter, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movq	%rax, %rcx	 ; tmp127,
	call	output_variable	 ;
.L14:
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	 ; parameters, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp129, parameter
 ; D:/TC/src/output.c:69:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, parameter
	jne	.L15	 ;,
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:/TC/src/output.c:73:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L16	 ;
.L17:
 ; D:/TC/src/output.c:76:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %r8	 ;, _9
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp136
	movq	24(%rbp), %rdx	 ; outfile, tmp137
	movq	-40(%rbp), %rax	 ; statement, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	output_statement	 ;
.L16:
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	 ; body, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp140, statement
 ; D:/TC/src/output.c:75:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L17	 ;,
 ; D:/TC/src/output.c:78: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp91
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rcx, %r9	 ; tmp91,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp93,
	call	indention	 ;
 ; D:/TC/src/output.c:81:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rax, %r9	 ; tmp94,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	fwrite	 ;
 ; D:/TC/src/output.c:82:     output_name(method->name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp96
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; method, tmp97
	movq	(%rax), %rax	 ; method_19(D)->name, _2
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp98
	movq	24(%rbp), %rdx	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp98,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:/TC/src/output.c:83:     ast_output(0, false, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:/TC/src/output.c:84:     output_name(method->return_type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp105
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; method, tmp106
	movq	8(%rax), %rax	 ; method_19(D)->return_type, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp107
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp107,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:/TC/src/output.c:85:     ast_output(0, false, "parameters\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:/TC/src/output.c:86:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rax	 ; method, tmp114
	movq	16(%rax), %rax	 ; method_19(D)->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp115, parameters
 ; D:/TC/src/output.c:87:     list(Statement*) body = list_copy(method->body);
	movq	16(%rbp), %rax	 ; method, tmp116
	movq	24(%rax), %rax	 ; method_19(D)->body, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp117, body
 ; D:/TC/src/output.c:89:     int index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	jmp	.L19	 ;
.L20:
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp118
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp119,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:/TC/src/output.c:91:         ast_output(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	%edx, %r8d	 ; tmp121,
	leaq	.LC9(%rip), %rdx	 ;, tmp123
	movq	%rax, %rcx	 ; tmp122,
	call	fprintf	 ;
 ; D:/TC/src/output.c:92:         output_variable(parameter, outfile, indent + 2, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp124
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp125
	movq	24(%rbp), %rdx	 ; outfile, tmp126
	movq	-32(%rbp), %rax	 ; parameter, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movq	%rax, %rcx	 ; tmp127,
	call	output_variable	 ;
.L19:
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	-16(%rbp), %rax	 ; parameters, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp129, parameter
 ; D:/TC/src/output.c:90:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	cmpq	$0, -32(%rbp)	 ;, parameter
	jne	.L20	 ;,
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:/TC/src/output.c:94:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L21	 ;
.L22:
 ; D:/TC/src/output.c:97:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %r8	 ;, _9
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp136
	movq	24(%rbp), %rdx	 ; outfile, tmp137
	movq	-40(%rbp), %rax	 ; statement, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movq	%rax, %rcx	 ; tmp138,
	call	output_statement	 ;
.L21:
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-24(%rbp), %rax	 ; body, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp140, statement
 ; D:/TC/src/output.c:96:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L22	 ;,
 ; D:/TC/src/output.c:99: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	movq	16(%rbp), %rax	 ; class_member, tmp88
	movl	8(%rax), %eax	 ; class_member_9(D)->type, _1
 ; D:/TC/src/output.c:102:     switch (class_member->type) {
	testl	%eax, %eax	 ; _1
	je	.L24	 ;,
	cmpl	$1, %eax	 ;, _1
	je	.L25	 ;,
	jmp	.L28	 ;
.L24:
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp89
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rcx, %r9	 ; tmp89,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	indention	 ;
 ; D:/TC/src/output.c:104:             ast_output(0, false, "method\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:/TC/src/output.c:105:             output_method(class_member->content.method, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp94
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; class_member, tmp95
	movq	(%rax), %rax	 ; class_member_9(D)->content.method, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp96
	movq	24(%rbp), %rdx	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp96,
	movq	%rax, %rcx	 ; _3,
	call	output_method	 ;
 ; D:/TC/src/output.c:106:             break;
	jmp	.L27	 ;
.L25:
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:/TC/src/output.c:108:             ast_output(0, false, "variable\n");
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rax, %r9	 ; tmp101,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	fwrite	 ;
 ; D:/TC/src/output.c:109:             output_variable(class_member->content.variable, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; class_member, tmp104
	movq	(%rax), %rax	 ; class_member_9(D)->content.variable, _5
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp105
	movq	24(%rbp), %rdx	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp105,
	movq	%rax, %rcx	 ; _5,
	call	output_variable	 ;
 ; D:/TC/src/output.c:110:             break;
	jmp	.L27	 ;
.L28:
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp107
	movq	32(%rbp), %rdx	 ; indent, tmp108
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rcx, %r9	 ; tmp107,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp109,
	call	indention	 ;
 ; D:/TC/src/output.c:112:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	16(%rbp), %rax	 ; class_member, tmp110
	movl	8(%rax), %edx	 ; class_member_9(D)->type, _6
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movl	%edx, %r8d	 ; _6,
	leaq	.LC13(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; tmp111,
	call	fprintf	 ;
 ; D:/TC/src/output.c:113:             break;
	nop	
.L27:
 ; D:/TC/src/output.c:116: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp86
	movq	32(%rbp), %rdx	 ; indent, tmp87
	movq	24(%rbp), %rax	 ; outfile, tmp88
	movq	%rcx, %r9	 ; tmp86,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp88,
	call	indention	 ;
 ; D:/TC/src/output.c:119:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rax, %r9	 ; tmp89,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	fwrite	 ;
 ; D:/TC/src/output.c:120:     output_name(class->name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp91
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; class, tmp92
	movq	(%rax), %rax	 ; class_12(D)->name, _2
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp93
	movq	24(%rbp), %rdx	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp93,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp95
	movq	32(%rbp), %rdx	 ; indent, tmp96
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp95,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	indention	 ;
 ; D:/TC/src/output.c:121:     ast_output(0, true, "members\n");
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rax, %r9	 ; tmp98,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	fwrite	 ;
 ; D:/TC/src/output.c:122:     list(ClassMember*) members = list_copy(class->members);
	movq	16(%rbp), %rax	 ; class, tmp100
	movq	8(%rax), %rax	 ; class_12(D)->members, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp101, members
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	jmp	.L30	 ;
.L31:
 ; D:/TC/src/output.c:125:         output_class_member(member, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	-16(%rbp), %rax	 ; member, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; tmp105,
	call	output_class_member	 ;
.L30:
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	-8(%rbp), %rax	 ; members, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp107, member
 ; D:/TC/src/output.c:124:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, member
	jne	.L31	 ;,
 ; D:/TC/src/output.c:127: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp89
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rcx, %r9	 ; tmp89,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	indention	 ;
 ; D:/TC/src/output.c:130:     ast_output(0, false, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:/TC/src/output.c:131:     output_name(variable->type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp94
	leaq	1(%rax), %r8	 ;, _1
	movq	16(%rbp), %rax	 ; variable, tmp95
	movq	(%rax), %rax	 ; variable_15(D)->type, _2
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp96
	movq	24(%rbp), %rdx	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp96,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:/TC/src/output.c:132:     ast_output(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:/TC/src/output.c:132:     ast_output(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rax, %r9	 ; tmp101,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	fwrite	 ;
 ; D:/TC/src/output.c:133:     output_name(variable->name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; variable, tmp104
	movq	8(%rax), %rax	 ; variable_15(D)->name, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp105
	movq	24(%rbp), %rdx	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp105,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:/TC/src/output.c:134:     if (variable->value != NULL) {
	movq	16(%rbp), %rax	 ; variable, tmp107
	movq	16(%rax), %rax	 ; variable_15(D)->value, _5
 ; D:/TC/src/output.c:134:     if (variable->value != NULL) {
	testq	%rax, %rax	 ; _5
	je	.L33	 ;,
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:/TC/src/output.c:135:         ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
 ; D:/TC/src/output.c:136:         output_expression(variable->value, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp113
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; variable, tmp114
	movq	16(%rax), %rax	 ; variable_15(D)->value, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp115
	movq	24(%rbp), %rdx	 ; outfile, tmp116
	movq	%rcx, %r9	 ; tmp115,
	movq	%rax, %rcx	 ; _7,
	call	output_expression	 ;
 ; D:/TC/src/output.c:140: }
	jmp	.L35	 ;
.L33:
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp117
	movq	32(%rbp), %rdx	 ; indent, tmp118
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp117,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp119,
	call	indention	 ;
 ; D:/TC/src/output.c:138:         ast_output(0, true, "value: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
.L35:
 ; D:/TC/src/output.c:140: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:143:     switch (statement->type) {
	movq	16(%rbp), %rax	 ; statement, tmp98
	movl	8(%rax), %eax	 ; statement_19(D)->type, _1
 ; D:/TC/src/output.c:143:     switch (statement->type) {
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
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp106
	movq	32(%rbp), %rdx	 ; indent, tmp107
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	indention	 ;
 ; D:/TC/src/output.c:145:             ast_output(0, false, "if_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	fwrite	 ;
 ; D:/TC/src/output.c:146:             output_if(statement->stmt.if_stmt, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp111
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; statement, tmp112
	movq	(%rax), %rax	 ; statement_19(D)->stmt.if_stmt, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp113
	movq	24(%rbp), %rdx	 ; outfile, tmp114
	movq	%rcx, %r9	 ; tmp113,
	movq	%rax, %rcx	 ; _3,
	call	output_if	 ;
 ; D:/TC/src/output.c:147:             break;
	jmp	.L36	 ;
.L42:
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp115
	movq	32(%rbp), %rdx	 ; indent, tmp116
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp115,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	indention	 ;
 ; D:/TC/src/output.c:149:             ast_output(0, false, "for_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rax, %r9	 ; tmp118,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rax	 ;, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	fwrite	 ;
 ; D:/TC/src/output.c:150:             output_for(statement->stmt.for_stmt, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp120
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; statement, tmp121
	movq	(%rax), %rax	 ; statement_19(D)->stmt.for_stmt, _5
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp122
	movq	24(%rbp), %rdx	 ; outfile, tmp123
	movq	%rcx, %r9	 ; tmp122,
	movq	%rax, %rcx	 ; _5,
	call	output_for	 ;
 ; D:/TC/src/output.c:151:             break;
	jmp	.L36	 ;
.L43:
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp124
	movq	32(%rbp), %rdx	 ; indent, tmp125
	movq	24(%rbp), %rax	 ; outfile, tmp126
	movq	%rcx, %r9	 ; tmp124,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp126,
	call	indention	 ;
 ; D:/TC/src/output.c:153:             ast_output(0, false, "while_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rax, %r9	 ; tmp127,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	fwrite	 ;
 ; D:/TC/src/output.c:154:             output_while(statement->stmt.while_stmt, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp129
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; statement, tmp130
	movq	(%rax), %rax	 ; statement_19(D)->stmt.while_stmt, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp131
	movq	24(%rbp), %rdx	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp131,
	movq	%rax, %rcx	 ; _7,
	call	output_while	 ;
 ; D:/TC/src/output.c:155:             break;
	jmp	.L36	 ;
.L45:
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp133
	movq	32(%rbp), %rdx	 ; indent, tmp134
	movq	24(%rbp), %rax	 ; outfile, tmp135
	movq	%rcx, %r9	 ; tmp133,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp135,
	call	indention	 ;
 ; D:/TC/src/output.c:157:             ast_output(0, false, "variable_declaration_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp136
	movq	%rax, %r9	 ; tmp136,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rax	 ;, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	fwrite	 ;
 ; D:/TC/src/output.c:158:             output_variable(statement->stmt.var, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp138
	leaq	1(%rax), %r8	 ;, _8
	movq	16(%rbp), %rax	 ; statement, tmp139
	movq	(%rax), %rax	 ; statement_19(D)->stmt.var, _9
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp140
	movq	24(%rbp), %rdx	 ; outfile, tmp141
	movq	%rcx, %r9	 ; tmp140,
	movq	%rax, %rcx	 ; _9,
	call	output_variable	 ;
 ; D:/TC/src/output.c:159:             break;
	jmp	.L36	 ;
.L41:
 ; D:/TC/src/output.c:161:             if (statement->stmt.expr == NULL) {
	movq	16(%rbp), %rax	 ; statement, tmp142
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _10
 ; D:/TC/src/output.c:161:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	 ; _10
	jne	.L48	 ;,
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp143
	movq	32(%rbp), %rdx	 ; indent, tmp144
	movq	24(%rbp), %rax	 ; outfile, tmp145
	movq	%rcx, %r9	 ; tmp143,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp145,
	call	indention	 ;
 ; D:/TC/src/output.c:162:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rax, %r9	 ; tmp146,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rax	 ;, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	fwrite	 ;
 ; D:/TC/src/output.c:164:                 return;
	jmp	.L36	 ;
.L48:
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp148
	movq	32(%rbp), %rdx	 ; indent, tmp149
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rcx, %r9	 ; tmp148,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp150,
	call	indention	 ;
 ; D:/TC/src/output.c:166:             ast_output(0, false, "return_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rax, %r9	 ; tmp151,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
 ; D:/TC/src/output.c:167:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp153
	leaq	1(%rax), %r8	 ;, _11
	movq	16(%rbp), %rax	 ; statement, tmp154
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _12
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp155
	movq	24(%rbp), %rdx	 ; outfile, tmp156
	movq	%rcx, %r9	 ; tmp155,
	movq	%rax, %rcx	 ; _12,
	call	output_expression	 ;
 ; D:/TC/src/output.c:168:             break;
	jmp	.L36	 ;
.L40:
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp157
	movq	32(%rbp), %rdx	 ; indent, tmp158
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rcx, %r9	 ; tmp157,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp159,
	call	indention	 ;
 ; D:/TC/src/output.c:170:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rax, %r9	 ; tmp160,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	fwrite	 ;
 ; D:/TC/src/output.c:171:             break;
	jmp	.L36	 ;
.L38:
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp162
	movq	32(%rbp), %rdx	 ; indent, tmp163
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rcx, %r9	 ; tmp162,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp164,
	call	indention	 ;
 ; D:/TC/src/output.c:173:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp165
	movq	%rax, %r9	 ; tmp165,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rax	 ;, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	fwrite	 ;
 ; D:/TC/src/output.c:174:             break;
	jmp	.L36	 ;
.L46:
 ; D:/TC/src/output.c:176:             if (statement->stmt.expr == NULL) {
	movq	16(%rbp), %rax	 ; statement, tmp167
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _13
 ; D:/TC/src/output.c:176:             if (statement->stmt.expr == NULL) {
	testq	%rax, %rax	 ; _13
	jne	.L49	 ;,
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp168
	movq	32(%rbp), %rdx	 ; indent, tmp169
	movq	24(%rbp), %rax	 ; outfile, tmp170
	movq	%rcx, %r9	 ; tmp168,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp170,
	call	indention	 ;
 ; D:/TC/src/output.c:177:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp171
	movq	%rax, %r9	 ; tmp171,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rax	 ;, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	fwrite	 ;
 ; D:/TC/src/output.c:179:                 return;
	jmp	.L36	 ;
.L49:
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp173
	movq	32(%rbp), %rdx	 ; indent, tmp174
	movq	24(%rbp), %rax	 ; outfile, tmp175
	movq	%rcx, %r9	 ; tmp173,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp175,
	call	indention	 ;
 ; D:/TC/src/output.c:181:             ast_output(0, false, "expression_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp176
	movq	%rax, %r9	 ; tmp176,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rax	 ;, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	fwrite	 ;
 ; D:/TC/src/output.c:182:             output_expression(statement->stmt.expr, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp178
	leaq	1(%rax), %r8	 ;, _14
	movq	16(%rbp), %rax	 ; statement, tmp179
	movq	(%rax), %rax	 ; statement_19(D)->stmt.expr, _15
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp180
	movq	24(%rbp), %rdx	 ; outfile, tmp181
	movq	%rcx, %r9	 ; tmp180,
	movq	%rax, %rcx	 ; _15,
	call	output_expression	 ;
 ; D:/TC/src/output.c:183:             break;
	jmp	.L36	 ;
.L37:
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp182
	movq	32(%rbp), %rdx	 ; indent, tmp183
	movq	24(%rbp), %rax	 ; outfile, tmp184
	movq	%rcx, %r9	 ; tmp182,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp184,
	call	indention	 ;
 ; D:/TC/src/output.c:185:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	16(%rbp), %rax	 ; statement, tmp185
	movl	8(%rax), %edx	 ; statement_19(D)->type, _16
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movl	%edx, %r8d	 ; _16,
	leaq	.LC28(%rip), %rdx	 ;, tmp187
	movq	%rax, %rcx	 ; tmp186,
	call	fprintf	 ;
 ; D:/TC/src/output.c:186:             break;
	nop	
.L36:
 ; D:/TC/src/output.c:189: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:192:     list(Statement*) body = list_copy(if_->body);
	movq	16(%rbp), %rax	 ; if_, tmp90
	movq	8(%rax), %rax	 ; if__13(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp91, body
 ; D:/TC/src/output.c:193:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%rbp), %rax	 ; if_, tmp92
	movq	16(%rax), %rax	 ; if__13(D)->else_if, _2
	movq	%rax, %rcx	 ; _2,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp93, else_if_list
 ; D:/TC/src/output.c:194:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	16(%rbp), %rax	 ; if_, tmp94
	movq	24(%rax), %rax	 ; if__13(D)->else_body, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp95, else_body
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp96
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	indention	 ;
 ; D:/TC/src/output.c:195:     ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %r9	 ; tmp99,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:/TC/src/output.c:196:     output_expression(if_->condition, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp101
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; if_, tmp102
	movq	(%rax), %rax	 ; if__13(D)->condition, _5
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; _5,
	call	output_expression	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:/TC/src/output.c:197:     ast_output(0, false, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L51	 ;
.L52:
 ; D:/TC/src/output.c:200:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp110
	leaq	1(%rax), %r8	 ;, _6
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp111
	movq	24(%rbp), %rdx	 ; outfile, tmp112
	movq	-32(%rbp), %rax	 ; statement, tmp113
	movq	%rcx, %r9	 ; tmp111,
	movq	%rax, %rcx	 ; tmp113,
	call	output_statement	 ;
.L51:
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp115, statement
 ; D:/TC/src/output.c:199:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -32(%rbp)	 ;, statement
	jne	.L52	 ;,
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp116
	movq	32(%rbp), %rdx	 ; indent, tmp117
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rcx, %r9	 ; tmp116,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	indention	 ;
 ; D:/TC/src/output.c:201:     ast_output(0, false, "else_if\n");
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	jmp	.L53	 ;
.L54:
 ; D:/TC/src/output.c:204:         output_else_if(else_if, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp121
	leaq	1(%rax), %r8	 ;, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp122
	movq	24(%rbp), %rdx	 ; outfile, tmp123
	movq	-40(%rbp), %rax	 ; else_if, tmp124
	movq	%rcx, %r9	 ; tmp122,
	movq	%rax, %rcx	 ; tmp124,
	call	output_else_if	 ;
.L53:
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	-16(%rbp), %rax	 ; else_if_list, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp126, else_if
 ; D:/TC/src/output.c:203:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	cmpq	$0, -40(%rbp)	 ;, else_if
	jne	.L54	 ;,
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp127
	movq	32(%rbp), %rdx	 ; indent, tmp128
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rcx, %r9	 ; tmp127,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp129,
	call	indention	 ;
 ; D:/TC/src/output.c:205:     ast_output(0, true, "else_body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rax	 ;, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	fwrite	 ;
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	jmp	.L55	 ;
.L56:
 ; D:/TC/src/output.c:207:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp132
	leaq	1(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp133
	movq	24(%rbp), %rdx	 ; outfile, tmp134
	movq	-32(%rbp), %rax	 ; statement, tmp135
	movq	%rcx, %r9	 ; tmp133,
	movq	%rax, %rcx	 ; tmp135,
	call	output_statement	 ;
.L55:
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	-24(%rbp), %rax	 ; else_body, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp137, statement
 ; D:/TC/src/output.c:206:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	cmpq	$0, -32(%rbp)	 ;, statement
	jne	.L56	 ;,
 ; D:/TC/src/output.c:209: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:212:     list(Statement*) body = list_copy(else_if->body);
	movq	16(%rbp), %rax	 ; else_if, tmp86
	movq	8(%rax), %rax	 ; else_if_7(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, body
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp88
	movq	32(%rbp), %rdx	 ; indent, tmp89
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	indention	 ;
 ; D:/TC/src/output.c:213:     ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %r9	 ; tmp91,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	fwrite	 ;
 ; D:/TC/src/output.c:214:     output_expression(else_if->condition, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp93
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; else_if, tmp94
	movq	(%rax), %rax	 ; else_if_7(D)->condition, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp95
	movq	24(%rbp), %rdx	 ; outfile, tmp96
	movq	%rcx, %r9	 ; tmp95,
	movq	%rax, %rcx	 ; _3,
	call	output_expression	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp97
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp97,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	indention	 ;
 ; D:/TC/src/output.c:215:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %r9	 ; tmp100,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	fwrite	 ;
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L58	 ;
.L59:
 ; D:/TC/src/output.c:218:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	-16(%rbp), %rax	 ; statement, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; tmp105,
	call	output_statement	 ;
.L58:
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp107, statement
 ; D:/TC/src/output.c:217:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, statement
	jne	.L59	 ;,
 ; D:/TC/src/output.c:220: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:223:     list(Statement*) body = list_copy(for_->body);
	movq	16(%rbp), %rax	 ; for_, tmp93
	movq	24(%rax), %rax	 ; for__17(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp94, body
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp95
	movq	(%rax), %rax	 ; for__17(D)->initializer, _2
 ; D:/TC/src/output.c:224:     if (for_->initializer != NULL) {
	testq	%rax, %rax	 ; _2
	je	.L61	 ;,
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp96
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	indention	 ;
 ; D:/TC/src/output.c:225:         ast_output(0, false, "initializer\n");
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %r9	 ; tmp99,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:/TC/src/output.c:226:         output_variable(for_->initializer, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp101
	leaq	1(%rax), %r8	 ;, _3
	movq	16(%rbp), %rax	 ; for_, tmp102
	movq	(%rax), %rax	 ; for__17(D)->initializer, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; _4,
	call	output_variable	 ;
	jmp	.L62	 ;
.L61:
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:/TC/src/output.c:228:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
.L62:
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp110
	movq	8(%rax), %rax	 ; for__17(D)->condition, _5
 ; D:/TC/src/output.c:229:     if (for_->condition != NULL) {
	testq	%rax, %rax	 ; _5
	je	.L63	 ;,
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp111
	movq	32(%rbp), %rdx	 ; indent, tmp112
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rcx, %r9	 ; tmp111,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp113,
	call	indention	 ;
 ; D:/TC/src/output.c:230:         ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp114
	movq	%rax, %r9	 ; tmp114,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	fwrite	 ;
 ; D:/TC/src/output.c:231:         output_expression(for_->condition, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp116
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; for_, tmp117
	movq	8(%rax), %rax	 ; for__17(D)->condition, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp118
	movq	24(%rbp), %rdx	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp118,
	movq	%rax, %rcx	 ; _7,
	call	output_expression	 ;
	jmp	.L64	 ;
.L63:
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp120
	movq	32(%rbp), %rdx	 ; indent, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rcx, %r9	 ; tmp120,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp122,
	call	indention	 ;
 ; D:/TC/src/output.c:233:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
.L64:
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	movq	16(%rbp), %rax	 ; for_, tmp125
	movq	16(%rax), %rax	 ; for__17(D)->increment, _8
 ; D:/TC/src/output.c:234:     if (for_->increment != NULL) {
	testq	%rax, %rax	 ; _8
	je	.L65	 ;,
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp126
	movq	32(%rbp), %rdx	 ; indent, tmp127
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp128,
	call	indention	 ;
 ; D:/TC/src/output.c:235:         ast_output(0, false, "increment\n");
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rax, %r9	 ; tmp129,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	fwrite	 ;
 ; D:/TC/src/output.c:236:         output_expression(for_->increment, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp131
	leaq	1(%rax), %r8	 ;, _9
	movq	16(%rbp), %rax	 ; for_, tmp132
	movq	16(%rax), %rax	 ; for__17(D)->increment, _10
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp133
	movq	24(%rbp), %rdx	 ; outfile, tmp134
	movq	%rcx, %r9	 ; tmp133,
	movq	%rax, %rcx	 ; _10,
	call	output_expression	 ;
	jmp	.L66	 ;
.L65:
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp135
	movq	32(%rbp), %rdx	 ; indent, tmp136
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rcx, %r9	 ; tmp135,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp137,
	call	indention	 ;
 ; D:/TC/src/output.c:238:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rax, %r9	 ; tmp138,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rax	 ;, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	fwrite	 ;
.L66:
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp140
	movq	32(%rbp), %rdx	 ; indent, tmp141
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movq	%rcx, %r9	 ; tmp140,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp142,
	call	indention	 ;
 ; D:/TC/src/output.c:239:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp143
	movq	%rax, %r9	 ; tmp143,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	fwrite	 ;
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L67	 ;
.L68:
 ; D:/TC/src/output.c:242:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp145
	leaq	1(%rax), %r8	 ;, _11
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp146
	movq	24(%rbp), %rdx	 ; outfile, tmp147
	movq	-16(%rbp), %rax	 ; statement, tmp148
	movq	%rcx, %r9	 ; tmp146,
	movq	%rax, %rcx	 ; tmp148,
	call	output_statement	 ;
.L67:
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp150, statement
 ; D:/TC/src/output.c:241:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, statement
	jne	.L68	 ;,
 ; D:/TC/src/output.c:244: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:247:     list(Statement*) body = list_copy(while_->body);
	movq	16(%rbp), %rax	 ; while_, tmp86
	movq	8(%rax), %rax	 ; while__7(D)->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp87, body
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp88
	movq	32(%rbp), %rdx	 ; indent, tmp89
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rcx, %r9	 ; tmp88,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp90,
	call	indention	 ;
 ; D:/TC/src/output.c:248:     ast_output(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %r9	 ; tmp91,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	fwrite	 ;
 ; D:/TC/src/output.c:249:     output_expression(while_->condition, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp93
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; while_, tmp94
	movq	(%rax), %rax	 ; while__7(D)->condition, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp95
	movq	24(%rbp), %rdx	 ; outfile, tmp96
	movq	%rcx, %r9	 ; tmp95,
	movq	%rax, %rcx	 ; _3,
	call	output_expression	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp97
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp97,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	indention	 ;
 ; D:/TC/src/output.c:250:     ast_output(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %r9	 ; tmp100,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	fwrite	 ;
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	jmp	.L70	 ;
.L71:
 ; D:/TC/src/output.c:253:         output_statement(statement, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	24(%rbp), %rdx	 ; outfile, tmp104
	movq	-16(%rbp), %rax	 ; statement, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movq	%rax, %rcx	 ; tmp105,
	call	output_statement	 ;
.L70:
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	-8(%rbp), %rax	 ; body, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp107, statement
 ; D:/TC/src/output.c:252:     while ((statement = (Statement*)list_pop(body)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, statement
	jne	.L71	 ;,
 ; D:/TC/src/output.c:255: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	movq	16(%rbp), %rax	 ; expression, tmp91
	movl	24(%rax), %eax	 ; expression_12(D)->operator, _1
 ; D:/TC/src/output.c:258:     if (expression->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	jne	.L73	 ;,
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp92
	movq	32(%rbp), %rdx	 ; indent, tmp93
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp92,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp94,
	call	indention	 ;
 ; D:/TC/src/output.c:259:         ast_output(0, true, "primary\n");
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %r9	 ; tmp95,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rax	 ;, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	fwrite	 ;
 ; D:/TC/src/output.c:260:         output_primary(expression->prim_left, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp97
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; expression, tmp98
	movq	8(%rax), %rax	 ; expression_12(D)->prim_left, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp99
	movq	24(%rbp), %rdx	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp99,
	movq	%rax, %rcx	 ; _3,
	call	output_primary	 ;
 ; D:/TC/src/output.c:270: }
	jmp	.L77	 ;
.L73:
 ; D:/TC/src/output.c:262:         string op_str = operator_to_string(expression->operator);
	movq	16(%rbp), %rax	 ; expression, tmp101
	movl	24(%rax), %eax	 ; expression_12(D)->operator, _4
	movl	%eax, %ecx	 ; _4,
	call	operator_to_string	 ;
	movq	%rax, -8(%rbp)	 ; tmp102, op_str
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	32(%rbp), %rdx	 ; indent, tmp104
	movq	24(%rbp), %rax	 ; outfile, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp105,
	call	indention	 ;
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmpq	$0, -8(%rbp)	 ;, op_str
	je	.L75	 ;,
	movq	-8(%rbp), %rax	 ; op_str, iftmp.1_9
	jmp	.L76	 ;
.L75:
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC38(%rip), %rax	 ;, iftmp.1_9
.L76:
 ; D:/TC/src/output.c:263:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	24(%rbp), %rcx	 ; outfile, tmp106
	movq	%rax, %r8	 ; iftmp.1_9,
	leaq	.LC39(%rip), %rax	 ;, tmp107
	movq	%rax, %rdx	 ; tmp107,
	call	fprintf	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:/TC/src/output.c:264:         ast_output(0, false, "left\n");
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
 ; D:/TC/src/output.c:265:         output_expression(expression->expr_left, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp113
	leaq	1(%rax), %r8	 ;, _5
	movq	16(%rbp), %rax	 ; expression, tmp114
	movq	(%rax), %rax	 ; expression_12(D)->expr_left, _6
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp115
	movq	24(%rbp), %rdx	 ; outfile, tmp116
	movq	%rcx, %r9	 ; tmp115,
	movq	%rax, %rcx	 ; _6,
	call	output_expression	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp117
	movq	32(%rbp), %rdx	 ; indent, tmp118
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp117,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp119,
	call	indention	 ;
 ; D:/TC/src/output.c:266:         ast_output(0, true, "right\n");
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
 ; D:/TC/src/output.c:267:         output_expression(expression->right, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp122
	leaq	1(%rax), %r8	 ;, _7
	movq	16(%rbp), %rax	 ; expression, tmp123
	movq	16(%rax), %rax	 ; expression_12(D)->right, _8
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp124
	movq	24(%rbp), %rdx	 ; outfile, tmp125
	movq	%rcx, %r9	 ; tmp124,
	movq	%rax, %rcx	 ; _8,
	call	output_expression	 ;
.L77:
 ; D:/TC/src/output.c:270: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:273:     switch (primary->type) {
	movq	16(%rbp), %rax	 ; primary, tmp95
	movl	8(%rax), %eax	 ; primary_16(D)->type, _1
 ; D:/TC/src/output.c:273:     switch (primary->type) {
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
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp103
	movq	32(%rbp), %rdx	 ; indent, tmp104
	movq	24(%rbp), %rax	 ; outfile, tmp105
	movq	%rcx, %r9	 ; tmp103,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp105,
	call	indention	 ;
 ; D:/TC/src/output.c:275:             ast_output(0, false, "type: \"integer\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movq	%rax, %r9	 ; tmp106,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rax	 ;, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	fwrite	 ;
 ; D:/TC/src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:/TC/src/output.c:276:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp111
	movq	(%rax), %rdx	 ; primary_16(D)->value.literal_value, _2
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rdx, %r8	 ; _2,
	leaq	.LC43(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; tmp112,
	call	fprintf	 ;
 ; D:/TC/src/output.c:277:             break;
	jmp	.L90	 ;
.L88:
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp114
	movq	32(%rbp), %rdx	 ; indent, tmp115
	movq	24(%rbp), %rax	 ; outfile, tmp116
	movq	%rcx, %r9	 ; tmp114,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp116,
	call	indention	 ;
 ; D:/TC/src/output.c:279:             ast_output(0, false, "type: \"float\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rax, %r9	 ; tmp117,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC44(%rip), %rax	 ;, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	fwrite	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp119
	movq	32(%rbp), %rdx	 ; indent, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rcx, %r9	 ; tmp119,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp121,
	call	indention	 ;
 ; D:/TC/src/output.c:280:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp122
	movq	(%rax), %rdx	 ; primary_16(D)->value.literal_value, _3
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rdx, %r8	 ; _3,
	leaq	.LC43(%rip), %rdx	 ;, tmp124
	movq	%rax, %rcx	 ; tmp123,
	call	fprintf	 ;
 ; D:/TC/src/output.c:281:             break;
	jmp	.L90	 ;
.L87:
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp125
	movq	32(%rbp), %rdx	 ; indent, tmp126
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	indention	 ;
 ; D:/TC/src/output.c:283:             ast_output(0, false, "type: \"string\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rax, %r9	 ; tmp128,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC45(%rip), %rax	 ;, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	fwrite	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:/TC/src/output.c:284:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	16(%rbp), %rax	 ; primary, tmp133
	movq	(%rax), %rdx	 ; primary_16(D)->value.literal_value, _4
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movq	%rdx, %r8	 ; _4,
	leaq	.LC46(%rip), %rdx	 ;, tmp135
	movq	%rax, %rcx	 ; tmp134,
	call	fprintf	 ;
 ; D:/TC/src/output.c:285:             break;
	jmp	.L90	 ;
.L86:
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp136
	movq	32(%rbp), %rdx	 ; indent, tmp137
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp138,
	call	indention	 ;
 ; D:/TC/src/output.c:287:             ast_output(0, false, "type: \"boolean\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movq	%rax, %r9	 ; tmp139,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rax	 ;, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	fwrite	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp141
	movq	32(%rbp), %rdx	 ; indent, tmp142
	movq	24(%rbp), %rax	 ; outfile, tmp143
	movq	%rcx, %r9	 ; tmp141,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	indention	 ;
 ; D:/TC/src/output.c:288:             ast_output(0, true, "value: \"true\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp144
	movq	%rax, %r9	 ; tmp144,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	fwrite	 ;
 ; D:/TC/src/output.c:289:             break;
	jmp	.L90	 ;
.L85:
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp146
	movq	32(%rbp), %rdx	 ; indent, tmp147
	movq	24(%rbp), %rax	 ; outfile, tmp148
	movq	%rcx, %r9	 ; tmp146,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp148,
	call	indention	 ;
 ; D:/TC/src/output.c:291:             ast_output(0, false, "type: \"boolean\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp149
	movq	%rax, %r9	 ; tmp149,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rax	 ;, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	fwrite	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp151
	movq	32(%rbp), %rdx	 ; indent, tmp152
	movq	24(%rbp), %rax	 ; outfile, tmp153
	movq	%rcx, %r9	 ; tmp151,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp153,
	call	indention	 ;
 ; D:/TC/src/output.c:292:             ast_output(0, true, "value: \"false\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rax, %r9	 ; tmp154,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rax	 ;, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	fwrite	 ;
 ; D:/TC/src/output.c:293:             break;
	jmp	.L90	 ;
.L84:
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp156
	movq	32(%rbp), %rdx	 ; indent, tmp157
	movq	24(%rbp), %rax	 ; outfile, tmp158
	movq	%rcx, %r9	 ; tmp156,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp158,
	call	indention	 ;
 ; D:/TC/src/output.c:295:             ast_output(0, false, "type: \"expression\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rax, %r9	 ; tmp159,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	fwrite	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp161
	movq	32(%rbp), %rdx	 ; indent, tmp162
	movq	24(%rbp), %rax	 ; outfile, tmp163
	movq	%rcx, %r9	 ; tmp161,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp163,
	call	indention	 ;
 ; D:/TC/src/output.c:296:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rax, %r9	 ; tmp164,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	fwrite	 ;
 ; D:/TC/src/output.c:297:             output_expression(primary->value.expr, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp166
	leaq	1(%rax), %r8	 ;, _5
	movq	16(%rbp), %rax	 ; primary, tmp167
	movq	(%rax), %rax	 ; primary_16(D)->value.expr, _6
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp168
	movq	24(%rbp), %rdx	 ; outfile, tmp169
	movq	%rcx, %r9	 ; tmp168,
	movq	%rax, %rcx	 ; _6,
	call	output_expression	 ;
 ; D:/TC/src/output.c:298:             break;
	jmp	.L90	 ;
.L83:
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp170
	movq	32(%rbp), %rdx	 ; indent, tmp171
	movq	24(%rbp), %rax	 ; outfile, tmp172
	movq	%rcx, %r9	 ; tmp170,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	indention	 ;
 ; D:/TC/src/output.c:300:             ast_output(0, false, "type: \"!\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rax, %r9	 ; tmp173,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rax	 ;, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	fwrite	 ;
 ; D:/TC/src/output.c:301:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp175
	movq	32(%rbp), %rdx	 ; indent, tmp176
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rcx, %r9	 ; tmp175,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp177,
	call	indention	 ;
 ; D:/TC/src/output.c:301:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
 ; D:/TC/src/output.c:302:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp180
	leaq	1(%rax), %r8	 ;, _7
	movq	16(%rbp), %rax	 ; primary, tmp181
	movq	(%rax), %rax	 ; primary_16(D)->value.operand, _8
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp182
	movq	24(%rbp), %rdx	 ; outfile, tmp183
	movq	%rcx, %r9	 ; tmp182,
	movq	%rax, %rcx	 ; _8,
	call	output_primary	 ;
 ; D:/TC/src/output.c:303:             break;
	jmp	.L90	 ;
.L82:
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp184
	movq	32(%rbp), %rdx	 ; indent, tmp185
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rcx, %r9	 ; tmp184,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	indention	 ;
 ; D:/TC/src/output.c:305:             ast_output(0, false, "type: \"-\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp189
	movq	32(%rbp), %rdx	 ; indent, tmp190
	movq	24(%rbp), %rax	 ; outfile, tmp191
	movq	%rcx, %r9	 ; tmp189,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp191,
	call	indention	 ;
 ; D:/TC/src/output.c:306:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp192
	movq	%rax, %r9	 ; tmp192,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp193
	movq	%rax, %rcx	 ; tmp193,
	call	fwrite	 ;
 ; D:/TC/src/output.c:307:             output_primary(primary->value.operand, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp194
	leaq	1(%rax), %r8	 ;, _9
	movq	16(%rbp), %rax	 ; primary, tmp195
	movq	(%rax), %rax	 ; primary_16(D)->value.operand, _10
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp196
	movq	24(%rbp), %rdx	 ; outfile, tmp197
	movq	%rcx, %r9	 ; tmp196,
	movq	%rax, %rcx	 ; _10,
	call	output_primary	 ;
 ; D:/TC/src/output.c:308:             break;
	jmp	.L90	 ;
.L80:
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp198
	movq	32(%rbp), %rdx	 ; indent, tmp199
	movq	24(%rbp), %rax	 ; outfile, tmp200
	movq	%rcx, %r9	 ; tmp198,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp200,
	call	indention	 ;
 ; D:/TC/src/output.c:310:             ast_output(0, false, "type: \"variable\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp201
	movq	%rax, %r9	 ; tmp201,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rax	 ;, tmp202
	movq	%rax, %rcx	 ; tmp202,
	call	fwrite	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp203
	movq	32(%rbp), %rdx	 ; indent, tmp204
	movq	24(%rbp), %rax	 ; outfile, tmp205
	movq	%rcx, %r9	 ; tmp203,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp205,
	call	indention	 ;
 ; D:/TC/src/output.c:311:             ast_output(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp206
	movq	%rax, %r9	 ; tmp206,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp207
	movq	%rax, %rcx	 ; tmp207,
	call	fwrite	 ;
 ; D:/TC/src/output.c:312:             output_variable_access(primary->value.var, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp208
	leaq	1(%rax), %r8	 ;, _11
	movq	16(%rbp), %rax	 ; primary, tmp209
	movq	(%rax), %rax	 ; primary_16(D)->value.var, _12
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp210
	movq	24(%rbp), %rdx	 ; outfile, tmp211
	movq	%rcx, %r9	 ; tmp210,
	movq	%rax, %rcx	 ; _12,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:313:             break;
	jmp	.L90	 ;
.L79:
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp212
	movq	32(%rbp), %rdx	 ; indent, tmp213
	movq	24(%rbp), %rax	 ; outfile, tmp214
	movq	%rcx, %r9	 ; tmp212,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp214,
	call	indention	 ;
 ; D:/TC/src/output.c:315:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	16(%rbp), %rax	 ; primary, tmp215
	movl	8(%rax), %edx	 ; primary_16(D)->type, _13
	movq	24(%rbp), %rax	 ; outfile, tmp216
	movl	%edx, %r8d	 ; _13,
	leaq	.LC54(%rip), %rdx	 ;, tmp217
	movq	%rax, %rcx	 ; tmp216,
	call	fprintf	 ;
 ; D:/TC/src/output.c:316:             break;
	nop	
.L90:
 ; D:/TC/src/output.c:319: }
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
	movq	16(%rbp), %rax	 ; variable_access, tmp99
	movl	16(%rax), %eax	 ; variable_access_22(D)->type, _1
 ; D:/TC/src/output.c:324:     switch (variable_access->type) {
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
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:/TC/src/output.c:326:             ast_output(0, false, "type: \"name\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rax, %r9	 ; tmp103,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	fwrite	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:/TC/src/output.c:327:             ast_output(0, true, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
 ; D:/TC/src/output.c:328:             output_name(variable_access->content.name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp110
	leaq	1(%rax), %r8	 ;, _2
	movq	16(%rbp), %rax	 ; variable_access, tmp111
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.name, _3
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp112
	movq	24(%rbp), %rdx	 ; outfile, tmp113
	movq	%rcx, %r9	 ; tmp112,
	movq	%rax, %rcx	 ; _3,
	call	output_name	 ;
 ; D:/TC/src/output.c:329:             break;
	jmp	.L97	 ;
.L96:
 ; D:/TC/src/output.c:331:             args = list_copy(variable_access->content.args);
	movq	16(%rbp), %rax	 ; variable_access, tmp114
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.args, _4
	movq	%rax, %rcx	 ; _4,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp115, args
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp116
	movq	32(%rbp), %rdx	 ; indent, tmp117
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rcx, %r9	 ; tmp116,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	indention	 ;
 ; D:/TC/src/output.c:332:             ast_output(0, false, "type: \"function_call\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp121
	movq	32(%rbp), %rdx	 ; indent, tmp122
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rcx, %r9	 ; tmp121,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp123,
	call	indention	 ;
 ; D:/TC/src/output.c:333:             ast_output(0, false, "function\n");
	movq	24(%rbp), %rax	 ; outfile, tmp124
	movq	%rax, %r9	 ; tmp124,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	fwrite	 ;
 ; D:/TC/src/output.c:334:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp126
	leaq	1(%rax), %r8	 ;, _5
	movq	16(%rbp), %rax	 ; variable_access, tmp127
	movq	(%rax), %rax	 ; variable_access_22(D)->base, _6
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp128
	movq	24(%rbp), %rdx	 ; outfile, tmp129
	movq	%rcx, %r9	 ; tmp128,
	movq	%rax, %rcx	 ; _6,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:/TC/src/output.c:335:             ast_output(0, true, "arguments\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:/TC/src/output.c:337:             index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	jmp	.L98	 ;
.L99:
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp136
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rcx, %r9	 ; tmp136,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp137,
	call	indention	 ;
 ; D:/TC/src/output.c:339:                 ast_output(1, false, "arguments[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp138
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movl	%edx, %r8d	 ; tmp138,
	leaq	.LC58(%rip), %rdx	 ;, tmp140
	movq	%rax, %rcx	 ; tmp139,
	call	fprintf	 ;
 ; D:/TC/src/output.c:340:                 output_expression(arg, outfile, indent + 2, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp141
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp142
	movq	24(%rbp), %rdx	 ; outfile, tmp143
	movq	-24(%rbp), %rax	 ; arg, tmp144
	movq	%rcx, %r9	 ; tmp142,
	movq	%rax, %rcx	 ; tmp144,
	call	output_expression	 ;
.L98:
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	-16(%rbp), %rax	 ; args, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp146, arg
 ; D:/TC/src/output.c:338:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	cmpq	$0, -24(%rbp)	 ;, arg
	jne	.L99	 ;,
 ; D:/TC/src/output.c:342:             break;
	jmp	.L97	 ;
.L92:
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp147
	movq	32(%rbp), %rdx	 ; indent, tmp148
	movq	24(%rbp), %rax	 ; outfile, tmp149
	movq	%rcx, %r9	 ; tmp147,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp149,
	call	indention	 ;
 ; D:/TC/src/output.c:344:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rax, %r9	 ; tmp150,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rax	 ;, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	fwrite	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp152
	movq	32(%rbp), %rdx	 ; indent, tmp153
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rcx, %r9	 ; tmp152,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp154,
	call	indention	 ;
 ; D:/TC/src/output.c:345:             ast_output(0, false, "sequence\n");
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rax, %r9	 ; tmp155,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	fwrite	 ;
 ; D:/TC/src/output.c:346:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp157
	leaq	1(%rax), %r8	 ;, _9
	movq	16(%rbp), %rax	 ; variable_access, tmp158
	movq	(%rax), %rax	 ; variable_access_22(D)->base, _10
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp159
	movq	24(%rbp), %rdx	 ; outfile, tmp160
	movq	%rcx, %r9	 ; tmp159,
	movq	%rax, %rcx	 ; _10,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp161
	movq	32(%rbp), %rdx	 ; indent, tmp162
	movq	24(%rbp), %rax	 ; outfile, tmp163
	movq	%rcx, %r9	 ; tmp161,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp163,
	call	indention	 ;
 ; D:/TC/src/output.c:347:             ast_output(0, true, "index\n");
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rax, %r9	 ; tmp164,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rax	 ;, tmp165
	movq	%rax, %rcx	 ; tmp165,
	call	fwrite	 ;
 ; D:/TC/src/output.c:348:             output_expression(variable_access->content.index, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp166
	leaq	1(%rax), %r8	 ;, _11
	movq	16(%rbp), %rax	 ; variable_access, tmp167
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.index, _12
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp168
	movq	24(%rbp), %rdx	 ; outfile, tmp169
	movq	%rcx, %r9	 ; tmp168,
	movq	%rax, %rcx	 ; _12,
	call	output_expression	 ;
 ; D:/TC/src/output.c:349:             break;
	jmp	.L97	 ;
.L94:
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp170
	movq	32(%rbp), %rdx	 ; indent, tmp171
	movq	24(%rbp), %rax	 ; outfile, tmp172
	movq	%rcx, %r9	 ; tmp170,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp172,
	call	indention	 ;
 ; D:/TC/src/output.c:351:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rax, %r9	 ; tmp173,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rax	 ;, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	fwrite	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp175
	movq	32(%rbp), %rdx	 ; indent, tmp176
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rcx, %r9	 ; tmp175,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp177,
	call	indention	 ;
 ; D:/TC/src/output.c:352:             ast_output(0, false, "object\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
 ; D:/TC/src/output.c:353:             output_variable_access(variable_access->base, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp180
	leaq	1(%rax), %r8	 ;, _13
	movq	16(%rbp), %rax	 ; variable_access, tmp181
	movq	(%rax), %rax	 ; variable_access_22(D)->base, _14
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp182
	movq	24(%rbp), %rdx	 ; outfile, tmp183
	movq	%rcx, %r9	 ; tmp182,
	movq	%rax, %rcx	 ; _14,
	call	output_variable_access	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp184
	movq	32(%rbp), %rdx	 ; indent, tmp185
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rcx, %r9	 ; tmp184,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp186,
	call	indention	 ;
 ; D:/TC/src/output.c:354:             ast_output(0, true, "attribute_name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
 ; D:/TC/src/output.c:355:             output_name(variable_access->content.attr_name, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp189
	leaq	1(%rax), %r8	 ;, _15
	movq	16(%rbp), %rax	 ; variable_access, tmp190
	movq	8(%rax), %rax	 ; variable_access_22(D)->content.attr_name, _16
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp191
	movq	24(%rbp), %rdx	 ; outfile, tmp192
	movq	%rcx, %r9	 ; tmp191,
	movq	%rax, %rcx	 ; _16,
	call	output_name	 ;
 ; D:/TC/src/output.c:356:             break;
	jmp	.L97	 ;
.L93:
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp193
	movq	32(%rbp), %rdx	 ; indent, tmp194
	movq	24(%rbp), %rax	 ; outfile, tmp195
	movq	%rcx, %r9	 ; tmp193,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp195,
	call	indention	 ;
 ; D:/TC/src/output.c:358:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	16(%rbp), %rax	 ; variable_access, tmp196
	movl	16(%rax), %edx	 ; variable_access_22(D)->type, _17
	movq	24(%rbp), %rax	 ; outfile, tmp197
	movl	%edx, %r8d	 ; _17,
	leaq	.LC65(%rip), %rdx	 ;, tmp198
	movq	%rax, %rcx	 ; tmp197,
	call	fprintf	 ;
 ; D:/TC/src/output.c:359:             break;
	nop	
.L97:
 ; D:/TC/src/output.c:362: }
	nop	
	leave	
	ret	
	.section .rdata,"dr"
.LC66:
	.ascii "Name: \"NULL\"\12\0"
.LC67:
	.ascii "name: \"%s\"\12\0"
.LC68:
	.ascii "id: %zu\12\0"
.LC69:
	.ascii "kind: \"type\"\12\0"
.LC70:
	.ascii "kind: \"variable\"\12\0"
.LC71:
	.ascii "kind: \"function\"\12\0"
.LC72:
	.ascii "kind: \"method\"\12\0"
.LC73:
	.ascii "kind: \"class\"\12\0"
.LC74:
	.ascii "kind: \"attribute\"\12\0"
.LC75:
	.ascii "kind: \"parameter\"\12\0"
.LC76:
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
	movq	%r9, 40(%rbp)	 ; indent_has_next, indent_has_next
 ; D:/TC/src/output.c:365:     if (name == NULL) {
	cmpq	$0, 16(%rbp)	 ;, name
	jne	.L101	 ;,
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp95
	movq	32(%rbp), %rdx	 ; indent, tmp96
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp95,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp97,
	call	indention	 ;
 ; D:/TC/src/output.c:366:         ast_output(0, true, "Name: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rax, %r9	 ; tmp98,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rax	 ;, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	fwrite	 ;
 ; D:/TC/src/output.c:368:         return;
	jmp	.L100	 ;
.L101:
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp100
	movq	32(%rbp), %rdx	 ; indent, tmp101
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rcx, %r9	 ; tmp100,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp102,
	call	indention	 ;
 ; D:/TC/src/output.c:370:     ast_output(0, false, "name: \"%s\"\n", name->name);
	movq	16(%rbp), %rax	 ; name, tmp103
	movq	8(%rax), %rdx	 ; name_15(D)->name, _1
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movq	%rdx, %r8	 ; _1,
	leaq	.LC67(%rip), %rdx	 ;, tmp105
	movq	%rax, %rcx	 ; tmp104,
	call	fprintf	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp106
	movq	32(%rbp), %rdx	 ; indent, tmp107
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	indention	 ;
 ; D:/TC/src/output.c:371:     ast_output(0, false, "id: %zu\n", name->id);
	movq	16(%rbp), %rax	 ; name, tmp109
	movq	16(%rax), %rdx	 ; name_15(D)->id, _2
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rdx, %r8	 ; _2,
	leaq	.LC68(%rip), %rdx	 ;, tmp111
	movq	%rax, %rcx	 ; tmp110,
	call	fprintf	 ;
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	movq	16(%rbp), %rax	 ; name, tmp112
	movl	32(%rax), %eax	 ; name_15(D)->kind, _3
 ; D:/TC/src/output.c:372:     switch (name->kind) {
	cmpl	$6, %eax	 ;, _3
	ja	.L103	 ;,
	movl	%eax, %eax	 ; _3, tmp113
	leaq	0(,%rax,4), %rdx	 ;, tmp114
	leaq	.L105(%rip), %rax	 ;, tmp115
	movl	(%rdx,%rax), %eax	 ;, tmp116
	cltq
	leaq	.L105(%rip), %rdx	 ;, tmp119
	addq	%rdx, %rax	 ; tmp119, tmp118
	jmp	*%rax	 ; tmp118
	.section .rdata,"dr"
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
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp120
	movq	32(%rbp), %rdx	 ; indent, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rcx, %r9	 ; tmp120,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp122,
	call	indention	 ;
 ; D:/TC/src/output.c:374:             ast_output(0, true, "kind: \"type\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC69(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
 ; D:/TC/src/output.c:375:             break;
	jmp	.L100	 ;
.L108:
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp125
	movq	32(%rbp), %rdx	 ; indent, tmp126
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	indention	 ;
 ; D:/TC/src/output.c:377:             ast_output(0, false, "kind: \"variable\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rax, %r9	 ; tmp128,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC70(%rip), %rax	 ;, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	fwrite	 ;
 ; D:/TC/src/output.c:378:             ast_output(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp130
	movq	32(%rbp), %rdx	 ; indent, tmp131
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rcx, %r9	 ; tmp130,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp132,
	call	indention	 ;
 ; D:/TC/src/output.c:378:             ast_output(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rax, %r9	 ; tmp133,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	fwrite	 ;
 ; D:/TC/src/output.c:379:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %r8	 ;, _4
	movq	16(%rbp), %rax	 ; name, tmp136
	movq	(%rax), %rax	 ; name_15(D)->type, _5
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp137
	movq	24(%rbp), %rdx	 ; outfile, tmp138
	movq	%rcx, %r9	 ; tmp137,
	movq	%rax, %rcx	 ; _5,
	call	output_name	 ;
 ; D:/TC/src/output.c:380:             break;
	jmp	.L100	 ;
.L110:
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp139
	movq	32(%rbp), %rdx	 ; indent, tmp140
	movq	24(%rbp), %rax	 ; outfile, tmp141
	movq	%rcx, %r9	 ; tmp139,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp141,
	call	indention	 ;
 ; D:/TC/src/output.c:382:             ast_output(0, false, "kind: \"function\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movq	%rax, %r9	 ; tmp142,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rax	 ;, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	fwrite	 ;
 ; D:/TC/src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp144
	movq	32(%rbp), %rdx	 ; indent, tmp145
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rcx, %r9	 ; tmp144,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp146,
	call	indention	 ;
 ; D:/TC/src/output.c:383:             ast_output(0, true, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp147
	movq	%rax, %r9	 ; tmp147,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	fwrite	 ;
 ; D:/TC/src/output.c:384:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp149
	leaq	1(%rax), %r8	 ;, _6
	movq	16(%rbp), %rax	 ; name, tmp150
	movq	(%rax), %rax	 ; name_15(D)->type, _7
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp151
	movq	24(%rbp), %rdx	 ; outfile, tmp152
	movq	%rcx, %r9	 ; tmp151,
	movq	%rax, %rcx	 ; _7,
	call	output_name	 ;
 ; D:/TC/src/output.c:385:             break;
	jmp	.L100	 ;
.L109:
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp153
	movq	32(%rbp), %rdx	 ; indent, tmp154
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rcx, %r9	 ; tmp153,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp155,
	call	indention	 ;
 ; D:/TC/src/output.c:387:             ast_output(0, false, "kind: \"method\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp156
	movq	%rax, %r9	 ; tmp156,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	fwrite	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp158
	movq	32(%rbp), %rdx	 ; indent, tmp159
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rcx, %r9	 ; tmp158,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp160,
	call	indention	 ;
 ; D:/TC/src/output.c:388:             ast_output(0, true, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp161
	movq	%rax, %r9	 ; tmp161,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp162
	movq	%rax, %rcx	 ; tmp162,
	call	fwrite	 ;
 ; D:/TC/src/output.c:389:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp163
	leaq	1(%rax), %r8	 ;, _8
	movq	16(%rbp), %rax	 ; name, tmp164
	movq	(%rax), %rax	 ; name_15(D)->type, _9
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp165
	movq	24(%rbp), %rdx	 ; outfile, tmp166
	movq	%rcx, %r9	 ; tmp165,
	movq	%rax, %rcx	 ; _9,
	call	output_name	 ;
 ; D:/TC/src/output.c:390:             break;
	jmp	.L100	 ;
.L111:
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp167
	movq	32(%rbp), %rdx	 ; indent, tmp168
	movq	24(%rbp), %rax	 ; outfile, tmp169
	movq	%rcx, %r9	 ; tmp167,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp169,
	call	indention	 ;
 ; D:/TC/src/output.c:392:             ast_output(0, true, "kind: \"class\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp170
	movq	%rax, %r9	 ; tmp170,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rax	 ;, tmp171
	movq	%rax, %rcx	 ; tmp171,
	call	fwrite	 ;
 ; D:/TC/src/output.c:393:             break;
	jmp	.L100	 ;
.L106:
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp172
	movq	32(%rbp), %rdx	 ; indent, tmp173
	movq	24(%rbp), %rax	 ; outfile, tmp174
	movq	%rcx, %r9	 ; tmp172,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp174,
	call	indention	 ;
 ; D:/TC/src/output.c:395:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp175
	movq	%rax, %r9	 ; tmp175,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC74(%rip), %rax	 ;, tmp176
	movq	%rax, %rcx	 ; tmp176,
	call	fwrite	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp177
	movq	32(%rbp), %rdx	 ; indent, tmp178
	movq	24(%rbp), %rax	 ; outfile, tmp179
	movq	%rcx, %r9	 ; tmp177,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp179,
	call	indention	 ;
 ; D:/TC/src/output.c:396:             ast_output(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp180
	movq	%rax, %r9	 ; tmp180,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	fwrite	 ;
 ; D:/TC/src/output.c:397:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp182
	leaq	1(%rax), %r8	 ;, _10
	movq	16(%rbp), %rax	 ; name, tmp183
	movq	(%rax), %rax	 ; name_15(D)->type, _11
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp184
	movq	24(%rbp), %rdx	 ; outfile, tmp185
	movq	%rcx, %r9	 ; tmp184,
	movq	%rax, %rcx	 ; _11,
	call	output_name	 ;
 ; D:/TC/src/output.c:398:             break;
	jmp	.L100	 ;
.L107:
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp186
	movq	32(%rbp), %rdx	 ; indent, tmp187
	movq	24(%rbp), %rax	 ; outfile, tmp188
	movq	%rcx, %r9	 ; tmp186,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp188,
	call	indention	 ;
 ; D:/TC/src/output.c:400:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp189
	movq	%rax, %r9	 ; tmp189,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC75(%rip), %rax	 ;, tmp190
	movq	%rax, %rcx	 ; tmp190,
	call	fwrite	 ;
 ; D:/TC/src/output.c:401:             ast_output(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp191
	movq	32(%rbp), %rdx	 ; indent, tmp192
	movq	24(%rbp), %rax	 ; outfile, tmp193
	movq	%rcx, %r9	 ; tmp191,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp193,
	call	indention	 ;
 ; D:/TC/src/output.c:401:             ast_output(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp194
	movq	%rax, %r9	 ; tmp194,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp195
	movq	%rax, %rcx	 ; tmp195,
	call	fwrite	 ;
 ; D:/TC/src/output.c:402:             output_name(name->type, outfile, indent + 1, indent_has_next);
	movq	32(%rbp), %rax	 ; indent, tmp196
	leaq	1(%rax), %r8	 ;, _12
	movq	16(%rbp), %rax	 ; name, tmp197
	movq	(%rax), %rax	 ; name_15(D)->type, _13
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp198
	movq	24(%rbp), %rdx	 ; outfile, tmp199
	movq	%rcx, %r9	 ; tmp198,
	movq	%rax, %rcx	 ; _13,
	call	output_name	 ;
 ; D:/TC/src/output.c:403:             break;
	jmp	.L100	 ;
.L103:
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	40(%rbp), %rcx	 ; indent_has_next, tmp200
	movq	32(%rbp), %rdx	 ; indent, tmp201
	movq	24(%rbp), %rax	 ; outfile, tmp202
	movq	%rcx, %r9	 ; tmp200,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp202,
	call	indention	 ;
 ; D:/TC/src/output.c:405:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp203
	movq	%rax, %r9	 ; tmp203,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC76(%rip), %rax	 ;, tmp204
	movq	%rax, %rcx	 ; tmp204,
	call	fwrite	 ;
 ; D:/TC/src/output.c:406:             break;
	nop	
.L100:
 ; D:/TC/src/output.c:409: }
	leave	
	ret	
	.section .rdata,"dr"
.LC77:
	.ascii "TAC: \"NULL\"\12\0"
.LC78:
	.ascii "TAC {\12\0"
.LC79:
	.ascii "designs: []\12\0"
.LC80:
	.ascii "designs: [\12\0"
.LC81:
	.ascii "]\12\0"
.LC82:
	.ascii "entry_point: \"NULL\"\12\0"
.LC83:
	.ascii "entry_point: %s\12\0"
.LC84:
	.ascii "global: []\12\0"
.LC85:
	.ascii "global: [\12\0"
.LC86:
	.ascii "subroutines: []\12\0"
.LC87:
	.ascii "subroutines: [\12\0"
.LC88:
	.ascii "}\12\0"
	.text
	.globl	output_TAC
	.def	output_TAC;	.scl	2;	.type	32;	.endef
output_TAC:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; tac, tac
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:422:     if (tac == NULL) {
	cmpq	$0, 16(%rbp)	 ;, tac
	jne	.L113	 ;,
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp108
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:423:         tac_output(indent, "TAC: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rax, %r9	 ; tmp110,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC77(%rip), %rax	 ;, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	fwrite	 ;
 ; D:/TC/src/output.c:425:         return;
	jmp	.L112	 ;
.L113:
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	32(%rbp), %rdx	 ; indent, tmp112
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:427:     tac_output(indent, "TAC {\n");
	movq	24(%rbp), %rax	 ; outfile, tmp114
	movq	%rax, %r9	 ; tmp114,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC78(%rip), %rax	 ;, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	fwrite	 ;
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	movq	16(%rbp), %rax	 ; tac, tmp116
	movq	(%rax), %rax	 ; tac_35(D)->attribute_tables, _1
	movq	%rax, %rcx	 ; _1,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:428:     if (list_is_empty(tac->attribute_tables))
	testb	%al, %al	 ; _2
	je	.L115	 ;,
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	32(%rbp), %rax	 ; indent, tmp117
	leaq	1(%rax), %rdx	 ;, _3
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:429:         tac_output(indent + 1, "designs: []\n");
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC79(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
	jmp	.L116	 ;
.L115:
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	32(%rbp), %rax	 ; indent, tmp121
	leaq	1(%rax), %rdx	 ;, _4
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:431:         tac_output(indent + 1, "designs: [\n");
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC80(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	jmp	.L117	 ;
.L118:
 ; D:/TC/src/output.c:434:             output_attribute_table(attribute_table, outfile, indent + 2);
	movq	32(%rbp), %rax	 ; indent, tmp125
	leaq	2(%rax), %rcx	 ;, _5
	movq	24(%rbp), %rdx	 ; outfile, tmp126
	movq	-8(%rbp), %rax	 ; attribute_table, tmp127
	movq	%rcx, %r8	 ; _5,
	movq	%rax, %rcx	 ; tmp127,
	call	output_attribute_table	 ;
.L117:
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	movq	16(%rbp), %rax	 ; tac, tmp128
	movq	(%rax), %rax	 ; tac_35(D)->attribute_tables, _6
	movq	%rax, %rcx	 ; _6,
	call	list_pop	 ;
	movq	%rax, -8(%rbp)	 ; tmp129, attribute_table
 ; D:/TC/src/output.c:433:         while ((attribute_table = (AttributeTable*)list_pop(tac->attribute_tables)) != NULL)
	cmpq	$0, -8(%rbp)	 ;, attribute_table
	jne	.L118	 ;,
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	32(%rbp), %rax	 ; indent, tmp130
	leaq	1(%rax), %rdx	 ;, _7
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:435:         tac_output(indent + 1, "]\n");
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rax, %r9	 ; tmp132,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rax	 ;, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	fwrite	 ;
.L116:
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	movq	16(%rbp), %rax	 ; tac, tmp134
	movq	8(%rax), %rax	 ; tac_35(D)->entry_point, _8
 ; D:/TC/src/output.c:437:     if (tac->entry_point == NULL)
	testq	%rax, %rax	 ; _8
	jne	.L119	 ;,
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	32(%rbp), %rax	 ; indent, tmp135
	leaq	1(%rax), %rdx	 ;, _9
	movq	24(%rbp), %rax	 ; outfile, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:438:         tac_output(indent + 1, "entry_point: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rax, %r9	 ; tmp137,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC82(%rip), %rax	 ;, tmp138
	movq	%rax, %rcx	 ; tmp138,
	call	fwrite	 ;
	jmp	.L120	 ;
.L119:
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	32(%rbp), %rax	 ; indent, tmp139
	leaq	1(%rax), %rdx	 ;, _10
	movq	24(%rbp), %rax	 ; outfile, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:440:         tac_output(indent + 1, "entry_point: %s\n", tac->entry_point->name);
	movq	16(%rbp), %rax	 ; tac, tmp141
	movq	8(%rax), %rax	 ; tac_35(D)->entry_point, _11
	movq	8(%rax), %rdx	 ; _11->name, _12
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movq	%rdx, %r8	 ; _12,
	leaq	.LC83(%rip), %rdx	 ;, tmp143
	movq	%rax, %rcx	 ; tmp142,
	call	fprintf	 ;
.L120:
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	movq	16(%rbp), %rax	 ; tac, tmp144
	movq	16(%rax), %rax	 ; tac_35(D)->global_vars, _13
	movq	%rax, %rcx	 ; _13,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:441:     if (list_is_empty(tac->global_vars))
	testb	%al, %al	 ; _14
	je	.L121	 ;,
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	32(%rbp), %rax	 ; indent, tmp145
	leaq	1(%rax), %rdx	 ;, _15
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:442:         tac_output(indent + 1, "global: []\n");
	movq	24(%rbp), %rax	 ; outfile, tmp147
	movq	%rax, %r9	 ; tmp147,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC84(%rip), %rax	 ;, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	fwrite	 ;
	jmp	.L122	 ;
.L121:
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	32(%rbp), %rax	 ; indent, tmp149
	leaq	1(%rax), %rdx	 ;, _16
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:444:         tac_output(indent + 1, "global: [\n");
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rax, %r9	 ; tmp151,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC85(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	jmp	.L123	 ;
.L124:
 ; D:/TC/src/output.c:447:             output_var(var, outfile, indent + 2);
	movq	32(%rbp), %rax	 ; indent, tmp153
	leaq	2(%rax), %rcx	 ;, _17
	movq	24(%rbp), %rdx	 ; outfile, tmp154
	movq	-16(%rbp), %rax	 ; var, tmp155
	movq	%rcx, %r8	 ; _17,
	movq	%rax, %rcx	 ; tmp155,
	call	output_var	 ;
.L123:
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	movq	16(%rbp), %rax	 ; tac, tmp156
	movq	16(%rax), %rax	 ; tac_35(D)->global_vars, _18
	movq	%rax, %rcx	 ; _18,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp157, var
 ; D:/TC/src/output.c:446:         while ((var = (Var*)list_pop(tac->global_vars)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, var
	jne	.L124	 ;,
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	32(%rbp), %rax	 ; indent, tmp158
	leaq	1(%rax), %rdx	 ;, _19
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:448:         tac_output(indent + 1, "]\n");
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rax, %r9	 ; tmp160,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	fwrite	 ;
.L122:
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	movq	16(%rbp), %rax	 ; tac, tmp162
	movq	24(%rax), %rax	 ; tac_35(D)->subroutines, _20
	movq	%rax, %rcx	 ; _20,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:450:     if (list_is_empty(tac->subroutines))
	testb	%al, %al	 ; _21
	je	.L125	 ;,
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	32(%rbp), %rax	 ; indent, tmp163
	leaq	1(%rax), %rdx	 ;, _22
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:451:         tac_output(indent + 1, "subroutines: []\n");
	movq	24(%rbp), %rax	 ; outfile, tmp165
	movq	%rax, %r9	 ; tmp165,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC86(%rip), %rax	 ;, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	fwrite	 ;
	jmp	.L126	 ;
.L125:
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	32(%rbp), %rax	 ; indent, tmp167
	leaq	1(%rax), %rdx	 ;, _23
	movq	24(%rbp), %rax	 ; outfile, tmp168
	movq	%rax, %rcx	 ; tmp168,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:453:         tac_output(indent + 1, "subroutines: [\n");
	movq	24(%rbp), %rax	 ; outfile, tmp169
	movq	%rax, %r9	 ; tmp169,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC87(%rip), %rax	 ;, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	fwrite	 ;
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	jmp	.L127	 ;
.L128:
 ; D:/TC/src/output.c:456:             output_subroutine(subroutine, outfile, indent + 2);
	movq	32(%rbp), %rax	 ; indent, tmp171
	leaq	2(%rax), %rcx	 ;, _24
	movq	24(%rbp), %rdx	 ; outfile, tmp172
	movq	-24(%rbp), %rax	 ; subroutine, tmp173
	movq	%rcx, %r8	 ; _24,
	movq	%rax, %rcx	 ; tmp173,
	call	output_subroutine	 ;
.L127:
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	movq	16(%rbp), %rax	 ; tac, tmp174
	movq	24(%rax), %rax	 ; tac_35(D)->subroutines, _25
	movq	%rax, %rcx	 ; _25,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp175, subroutine
 ; D:/TC/src/output.c:455:         while ((subroutine = (Subroutine*)list_pop(tac->subroutines)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, subroutine
	jne	.L128	 ;,
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	32(%rbp), %rax	 ; indent, tmp176
	leaq	1(%rax), %rdx	 ;, _26
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:457:         tac_output(indent + 1, "]\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
.L126:
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	32(%rbp), %rdx	 ; indent, tmp180
	movq	24(%rbp), %rax	 ; outfile, tmp181
	movq	%rax, %rcx	 ; tmp181,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:459:     tac_output(indent, "}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp182
	movq	%rax, %r9	 ; tmp182,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC88(%rip), %rax	 ;, tmp183
	movq	%rax, %rcx	 ; tmp183,
	call	fwrite	 ;
.L112:
 ; D:/TC/src/output.c:461: }
	leave	
	ret	
	.section .rdata,"dr"
.LC89:
	.ascii "Subroutine: \"NULL\"\12\0"
.LC90:
	.ascii "NULL {\12\0"
.LC91:
	.ascii "%s {\12\0"
.LC92:
	.ascii "return_type: \"NULL\"\12\0"
.LC93:
	.ascii "return_type: %s\12\0"
.LC94:
	.ascii "parameters: []\12\0"
.LC95:
	.ascii "parameters: [\12\0"
.LC96:
	.ascii "local: []\12\0"
.LC97:
	.ascii "local: [\12\0"
.LC98:
	.ascii "instructions: []\12\0"
.LC99:
	.ascii "instructions: [\12\0"
	.text
	.def	output_subroutine;	.scl	3;	.type	32;	.endef
output_subroutine:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$64, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; subroutine, subroutine
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:464:     if (subroutine == NULL) {
	cmpq	$0, 16(%rbp)	 ;, subroutine
	jne	.L130	 ;,
 ; D:/TC/src/output.c:465:         tac_output(indent, "Subroutine: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp111
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:465:         tac_output(indent, "Subroutine: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rax, %r9	 ; tmp113,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC89(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	fwrite	 ;
 ; D:/TC/src/output.c:467:         return;
	jmp	.L129	 ;
.L130:
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	movq	16(%rbp), %rax	 ; subroutine, tmp115
	movq	(%rax), %rax	 ; subroutine_39(D)->name, _1
 ; D:/TC/src/output.c:469:     if (subroutine->name == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L132	 ;,
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	32(%rbp), %rdx	 ; indent, tmp116
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rax, %rcx	 ; tmp117,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:470:         tac_output(indent, "NULL {\n");
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rax, %r9	 ; tmp118,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC90(%rip), %rax	 ;, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	fwrite	 ;
	jmp	.L133	 ;
.L132:
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	32(%rbp), %rdx	 ; indent, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:472:         tac_output(indent, "%s {\n", subroutine->name->name);
	movq	16(%rbp), %rax	 ; subroutine, tmp122
	movq	(%rax), %rax	 ; subroutine_39(D)->name, _2
	movq	8(%rax), %rdx	 ; _2->name, _3
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rdx, %r8	 ; _3,
	leaq	.LC91(%rip), %rdx	 ;, tmp124
	movq	%rax, %rcx	 ; tmp123,
	call	fprintf	 ;
.L133:
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	movq	16(%rbp), %rax	 ; subroutine, tmp125
	movq	8(%rax), %rax	 ; subroutine_39(D)->return_type, _4
 ; D:/TC/src/output.c:473:     if (subroutine->return_type == NULL)
	testq	%rax, %rax	 ; _4
	jne	.L134	 ;,
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	32(%rbp), %rax	 ; indent, tmp126
	leaq	1(%rax), %rdx	 ;, _5
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:474:         tac_output(indent + 1, "return_type: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rax, %r9	 ; tmp128,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC92(%rip), %rax	 ;, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	fwrite	 ;
	jmp	.L135	 ;
.L134:
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	32(%rbp), %rax	 ; indent, tmp130
	leaq	1(%rax), %rdx	 ;, _6
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:476:         tac_output(indent + 1, "return_type: %s\n", subroutine->return_type->name);
	movq	16(%rbp), %rax	 ; subroutine, tmp132
	movq	8(%rax), %rax	 ; subroutine_39(D)->return_type, _7
	movq	8(%rax), %rdx	 ; _7->name, _8
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rdx, %r8	 ; _8,
	leaq	.LC93(%rip), %rdx	 ;, tmp134
	movq	%rax, %rcx	 ; tmp133,
	call	fprintf	 ;
.L135:
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	movq	16(%rbp), %rax	 ; subroutine, tmp135
	movq	16(%rax), %rax	 ; subroutine_39(D)->parameters, _9
	movq	%rax, %rcx	 ; _9,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:477:     if (list_is_empty(subroutine->parameters))
	testb	%al, %al	 ; _10
	je	.L136	 ;,
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	32(%rbp), %rax	 ; indent, tmp136
	leaq	1(%rax), %rdx	 ;, _11
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:478:         tac_output(indent + 1, "parameters: []\n");
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rax, %r9	 ; tmp138,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC94(%rip), %rax	 ;, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	fwrite	 ;
	jmp	.L137	 ;
.L136:
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	32(%rbp), %rax	 ; indent, tmp140
	leaq	1(%rax), %rdx	 ;, _12
	movq	24(%rbp), %rax	 ; outfile, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:480:         tac_output(indent + 1, "parameters: [\n");
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movq	%rax, %r9	 ; tmp142,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC95(%rip), %rax	 ;, tmp143
	movq	%rax, %rcx	 ; tmp143,
	call	fwrite	 ;
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	jmp	.L138	 ;
.L139:
 ; D:/TC/src/output.c:483:             output_var(parameter, outfile, indent + 2);
	movq	32(%rbp), %rax	 ; indent, tmp144
	leaq	2(%rax), %rcx	 ;, _13
	movq	24(%rbp), %rdx	 ; outfile, tmp145
	movq	-8(%rbp), %rax	 ; parameter, tmp146
	movq	%rcx, %r8	 ; _13,
	movq	%rax, %rcx	 ; tmp146,
	call	output_var	 ;
.L138:
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	movq	16(%rbp), %rax	 ; subroutine, tmp147
	movq	16(%rax), %rax	 ; subroutine_39(D)->parameters, _14
	movq	%rax, %rcx	 ; _14,
	call	list_pop	 ;
	movq	%rax, -8(%rbp)	 ; tmp148, parameter
 ; D:/TC/src/output.c:482:         while ((parameter = (Var*)list_pop(subroutine->parameters)) != NULL)
	cmpq	$0, -8(%rbp)	 ;, parameter
	jne	.L139	 ;,
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	32(%rbp), %rax	 ; indent, tmp149
	leaq	1(%rax), %rdx	 ;, _15
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:484:         tac_output(indent + 1, "]\n");
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rax, %r9	 ; tmp151,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
.L137:
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	movq	16(%rbp), %rax	 ; subroutine, tmp153
	movq	24(%rax), %rax	 ; subroutine_39(D)->local_vars, _16
	movq	%rax, %rcx	 ; _16,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:486:     if (list_is_empty(subroutine->local_vars))
	testb	%al, %al	 ; _17
	je	.L140	 ;,
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	32(%rbp), %rax	 ; indent, tmp154
	leaq	1(%rax), %rdx	 ;, _18
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rax, %rcx	 ; tmp155,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:487:         tac_output(indent + 1, "local: []\n");
	movq	24(%rbp), %rax	 ; outfile, tmp156
	movq	%rax, %r9	 ; tmp156,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC96(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	fwrite	 ;
	jmp	.L141	 ;
.L140:
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	32(%rbp), %rax	 ; indent, tmp158
	leaq	1(%rax), %rdx	 ;, _19
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rax, %rcx	 ; tmp159,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:489:         tac_output(indent + 1, "local: [\n");
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rax, %r9	 ; tmp160,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC97(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	fwrite	 ;
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	jmp	.L142	 ;
.L143:
 ; D:/TC/src/output.c:492:             output_var(var, outfile, indent + 2);
	movq	32(%rbp), %rax	 ; indent, tmp162
	leaq	2(%rax), %rcx	 ;, _20
	movq	24(%rbp), %rdx	 ; outfile, tmp163
	movq	-16(%rbp), %rax	 ; var, tmp164
	movq	%rcx, %r8	 ; _20,
	movq	%rax, %rcx	 ; tmp164,
	call	output_var	 ;
.L142:
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	movq	16(%rbp), %rax	 ; subroutine, tmp165
	movq	24(%rax), %rax	 ; subroutine_39(D)->local_vars, _21
	movq	%rax, %rcx	 ; _21,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp166, var
 ; D:/TC/src/output.c:491:         while ((var = (Var*)list_pop(subroutine->local_vars)) != NULL)
	cmpq	$0, -16(%rbp)	 ;, var
	jne	.L143	 ;,
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	32(%rbp), %rax	 ; indent, tmp167
	leaq	1(%rax), %rdx	 ;, _22
	movq	24(%rbp), %rax	 ; outfile, tmp168
	movq	%rax, %rcx	 ; tmp168,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:493:         tac_output(indent + 1, "]\n");
	movq	24(%rbp), %rax	 ; outfile, tmp169
	movq	%rax, %r9	 ; tmp169,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rax	 ;, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	fwrite	 ;
.L141:
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	movq	16(%rbp), %rax	 ; subroutine, tmp171
	movq	32(%rax), %rax	 ; subroutine_39(D)->blocks, _23
	movq	%rax, %rcx	 ; _23,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:495:     if (list_is_empty(subroutine->blocks))
	testb	%al, %al	 ; _24
	je	.L144	 ;,
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	32(%rbp), %rax	 ; indent, tmp172
	leaq	1(%rax), %rdx	 ;, _25
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:496:         tac_output(indent + 1, "instructions: []\n");
	movq	24(%rbp), %rax	 ; outfile, tmp174
	movq	%rax, %r9	 ; tmp174,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC98(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	fwrite	 ;
	jmp	.L145	 ;
.L144:
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	32(%rbp), %rax	 ; indent, tmp176
	leaq	1(%rax), %rdx	 ;, _26
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rax, %rcx	 ; tmp177,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:498:         tac_output(indent + 1, "instructions: [\n");
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %r9	 ; tmp178,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC99(%rip), %rax	 ;, tmp179
	movq	%rax, %rcx	 ; tmp179,
	call	fwrite	 ;
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	jmp	.L146	 ;
.L147:
 ; D:/TC/src/output.c:501:             output_block(block, outfile, indent + 2);
	movq	32(%rbp), %rax	 ; indent, tmp180
	leaq	2(%rax), %rcx	 ;, _27
	movq	24(%rbp), %rdx	 ; outfile, tmp181
	movq	-24(%rbp), %rax	 ; block, tmp182
	movq	%rcx, %r8	 ; _27,
	movq	%rax, %rcx	 ; tmp182,
	call	output_block	 ;
.L146:
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	movq	16(%rbp), %rax	 ; subroutine, tmp183
	movq	32(%rax), %rax	 ; subroutine_39(D)->blocks, _28
	movq	%rax, %rcx	 ; _28,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp184, block
 ; D:/TC/src/output.c:500:         while ((block = (Block*)list_pop(subroutine->blocks)) != NULL)
	cmpq	$0, -24(%rbp)	 ;, block
	jne	.L147	 ;,
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	32(%rbp), %rax	 ; indent, tmp185
	leaq	1(%rax), %rdx	 ;, _29
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rax, %rcx	 ; tmp186,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:502:         tac_output(indent + 1, "]\n");
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC81(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
.L145:
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	32(%rbp), %rdx	 ; indent, tmp189
	movq	24(%rbp), %rax	 ; outfile, tmp190
	movq	%rax, %rcx	 ; tmp190,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:504:     tac_output(indent, "}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp191
	movq	%rax, %r9	 ; tmp191,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC88(%rip), %rax	 ;, tmp192
	movq	%rax, %rcx	 ; tmp192,
	call	fwrite	 ;
.L129:
 ; D:/TC/src/output.c:506: }
	leave	
	ret	
	.section .rdata,"dr"
.LC100:
	.ascii "Var: \"NULL\"\12\0"
.LC101:
	.ascii "NULL\11%s\12\0"
.LC102:
	.ascii "%s\11%s\12\0"
	.text
	.def	output_var;	.scl	3;	.type	32;	.endef
output_var:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; var, var
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:509:     if (var == NULL) {
	cmpq	$0, 16(%rbp)	 ;, var
	jne	.L149	 ;,
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp87
	movq	24(%rbp), %rax	 ; outfile, tmp88
	movq	%rax, %rcx	 ; tmp88,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:510:         tac_output(indent, "Var: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rax, %r9	 ; tmp89,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC100(%rip), %rax	 ;, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	fwrite	 ;
 ; D:/TC/src/output.c:512:         return;
	jmp	.L148	 ;
.L149:
 ; D:/TC/src/output.c:514:     if (var->type == NULL)
	movq	16(%rbp), %rax	 ; var, tmp91
	movq	16(%rax), %rax	 ; var_7(D)->type, _1
 ; D:/TC/src/output.c:514:     if (var->type == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L151	 ;,
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	32(%rbp), %rdx	 ; indent, tmp92
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:515:         tac_output(indent, "NULL\t%s\n", var->name);
	movq	16(%rbp), %rax	 ; var, tmp94
	movq	8(%rax), %rdx	 ; var_7(D)->name, _2
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rdx, %r8	 ; _2,
	leaq	.LC101(%rip), %rdx	 ;, tmp96
	movq	%rax, %rcx	 ; tmp95,
	call	fprintf	 ;
	jmp	.L148	 ;
.L151:
 ; D:/TC/src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:517:         tac_output(indent, "%s\t%s\n", var->type->name, var->name);
	movq	16(%rbp), %rax	 ; var, tmp99
	movq	8(%rax), %rcx	 ; var_7(D)->name, _3
	movq	16(%rbp), %rax	 ; var, tmp100
	movq	16(%rax), %rax	 ; var_7(D)->type, _4
	movq	8(%rax), %rdx	 ; _4->name, _5
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rcx, %r9	 ; _3,
	movq	%rdx, %r8	 ; _5,
	leaq	.LC102(%rip), %rdx	 ;, tmp102
	movq	%rax, %rcx	 ; tmp101,
	call	fprintf	 ;
.L148:
 ; D:/TC/src/output.c:519: }
	leave	
	ret	
	.section .rdata,"dr"
.LC103:
	.ascii "Block: \"NULL\"\12\0"
.LC104:
	.ascii "NULL \0"
.LC105:
	.ascii "%s \0"
.LC106:
	.ascii "{}\12\0"
.LC107:
	.ascii "{\12\0"
	.text
	.def	output_block;	.scl	3;	.type	32;	.endef
output_block:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; block, block
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:522:     if (block == NULL) {
	cmpq	$0, 16(%rbp)	 ;, block
	jne	.L153	 ;,
 ; D:/TC/src/output.c:523:         tac_output(indent, "Block: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp89
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:523:         tac_output(indent, "Block: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %r9	 ; tmp91,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC103(%rip), %rax	 ;, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	fwrite	 ;
 ; D:/TC/src/output.c:525:         return;
	jmp	.L152	 ;
.L153:
 ; D:/TC/src/output.c:527:     if (block->label == NULL)
	movq	16(%rbp), %rax	 ; block, tmp93
	movq	(%rax), %rax	 ; block_11(D)->label, _1
 ; D:/TC/src/output.c:527:     if (block->label == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L155	 ;,
 ; D:/TC/src/output.c:528:         tac_output(indent, "NULL ");
	movq	32(%rbp), %rdx	 ; indent, tmp94
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:528:         tac_output(indent, "NULL ");
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rax, %r9	 ; tmp96,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC104(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
	jmp	.L156	 ;
.L155:
 ; D:/TC/src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:530:         tac_output(indent, "%s ", block->label->name);
	movq	16(%rbp), %rax	 ; block, tmp100
	movq	(%rax), %rax	 ; block_11(D)->label, _2
	movq	8(%rax), %rdx	 ; _2->name, _3
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rdx, %r8	 ; _3,
	leaq	.LC105(%rip), %rdx	 ;, tmp102
	movq	%rax, %rcx	 ; tmp101,
	call	fprintf	 ;
.L156:
 ; D:/TC/src/output.c:531:     if (list_is_empty(block->instructions))
	movq	16(%rbp), %rax	 ; block, tmp103
	movq	8(%rax), %rax	 ; block_11(D)->instructions, _4
	movq	%rax, %rcx	 ; _4,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:531:     if (list_is_empty(block->instructions))
	testb	%al, %al	 ; _5
	je	.L157	 ;,
 ; D:/TC/src/output.c:532:         tac_output(0, "{}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp104,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:532:         tac_output(0, "{}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp105
	movq	%rax, %r9	 ; tmp105,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC106(%rip), %rax	 ;, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	fwrite	 ;
	jmp	.L152	 ;
.L157:
 ; D:/TC/src/output.c:534:         tac_output(0, "{\n");
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:534:         tac_output(0, "{\n");
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rax, %r9	 ; tmp108,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC107(%rip), %rax	 ;, tmp109
	movq	%rax, %rcx	 ; tmp109,
	call	fwrite	 ;
 ; D:/TC/src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	jmp	.L158	 ;
.L159:
 ; D:/TC/src/output.c:537:             output_instruction(instruction, outfile, indent + 1);
	movq	32(%rbp), %rax	 ; indent, tmp110
	leaq	1(%rax), %rcx	 ;, _6
	movq	24(%rbp), %rdx	 ; outfile, tmp111
	movq	-8(%rbp), %rax	 ; instruction, tmp112
	movq	%rcx, %r8	 ; _6,
	movq	%rax, %rcx	 ; tmp112,
	call	output_instruction	 ;
.L158:
 ; D:/TC/src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	movq	16(%rbp), %rax	 ; block, tmp113
	movq	8(%rax), %rax	 ; block_11(D)->instructions, _7
	movq	%rax, %rcx	 ; _7,
	call	list_pop	 ;
	movq	%rax, -8(%rbp)	 ; tmp114, instruction
 ; D:/TC/src/output.c:536:         while ((instruction = (Instruction*)list_pop(block->instructions)) != NULL)
	cmpq	$0, -8(%rbp)	 ;, instruction
	jne	.L159	 ;,
 ; D:/TC/src/output.c:538:         tac_output(indent, "}\n");
	movq	32(%rbp), %rdx	 ; indent, tmp115
	movq	24(%rbp), %rax	 ; outfile, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:538:         tac_output(indent, "}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rax, %r9	 ; tmp117,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC88(%rip), %rax	 ;, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	fwrite	 ;
.L152:
 ; D:/TC/src/output.c:541: }
	leave	
	ret	
	.section .rdata,"dr"
.LC108:
	.ascii "\"NULL\"\0"
.LC109:
	.ascii "%lld\0"
.LC110:
	.ascii "%f\0"
.LC111:
	.ascii "true\0"
.LC112:
	.ascii "false\0"
.LC113:
	.ascii "void\0"
.LC114:
	.ascii "NONE\0"
.LC115:
	.ascii "unknown_ArgType: %u\0"
	.text
	.def	output_arg;	.scl	3;	.type	32;	.endef
output_arg:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; arg, arg
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
 ; D:/TC/src/output.c:544:     if (arg == NULL) {
	cmpq	$0, 16(%rbp)	 ;, arg
	jne	.L161	 ;,
 ; D:/TC/src/output.c:545:         tac_output(0, "\"NULL\"");
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp95,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:545:         tac_output(0, "\"NULL\"");
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rax, %r9	 ; tmp96,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC108(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
 ; D:/TC/src/output.c:547:         return;
	jmp	.L160	 ;
.L161:
 ; D:/TC/src/output.c:549:     switch (arg->kind) {
	movq	16(%rbp), %rax	 ; arg, tmp98
	movl	16(%rax), %eax	 ; arg_15(D)->kind, _1
 ; D:/TC/src/output.c:549:     switch (arg->kind) {
	cmpl	$8, %eax	 ;, _1
	ja	.L163	 ;,
	movl	%eax, %eax	 ; _1, tmp99
	leaq	0(,%rax,4), %rdx	 ;, tmp100
	leaq	.L165(%rip), %rax	 ;, tmp101
	movl	(%rdx,%rax), %eax	 ;, tmp102
	cltq
	leaq	.L165(%rip), %rdx	 ;, tmp105
	addq	%rdx, %rax	 ; tmp105, tmp104
	jmp	*%rax	 ; tmp104
	.section .rdata,"dr"
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
 ; D:/TC/src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp106,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	movq	16(%rbp), %rax	 ; arg, tmp107
	movq	(%rax), %rax	 ; arg_15(D)->value.variable, _2
	movq	8(%rax), %rax	 ; _2->name, _3
	movq	24(%rbp), %rdx	 ; outfile, tmp108
	movq	%rax, %rcx	 ; _3,
	call	fputs	 ;
 ; D:/TC/src/output.c:550:         case ARG_VARIABLE: tac_output(0, "%s", arg->value.variable->name); break;
	jmp	.L160	 ;
.L172:
 ; D:/TC/src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp109,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	movq	16(%rbp), %rax	 ; arg, tmp110
	movq	(%rax), %rdx	 ; arg_15(D)->value.int_value, _4
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rdx, %r8	 ; _4,
	leaq	.LC109(%rip), %rdx	 ;, tmp112
	movq	%rax, %rcx	 ; tmp111,
	call	fprintf	 ;
 ; D:/TC/src/output.c:551:         case ARG_INT: tac_output(0, "%lld", arg->value.int_value); break;
	jmp	.L160	 ;
.L171:
 ; D:/TC/src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp113,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	movq	16(%rbp), %rax	 ; arg, tmp114
	movsd	(%rax), %xmm0	 ; arg_15(D)->value.float_value, _5
	movq	%xmm0, %rax	 ; _5, tmp115
	movq	%rax, %rdx	 ; tmp115, tmp116
	movq	%rdx, %xmm0	 ; tmp116, tmp118
	movq	%rax, %rdx	 ; tmp117, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movapd	%xmm0, %xmm2	 ; tmp118,
	movq	%rdx, %r8	 ; tmp119,
	leaq	.LC110(%rip), %rdx	 ;, tmp121
	movq	%rax, %rcx	 ; tmp120,
	call	fprintf	 ;
 ; D:/TC/src/output.c:552:         case ARG_FLOAT: tac_output(0, "%f", arg->value.float_value); break;
	jmp	.L160	 ;
.L170:
 ; D:/TC/src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp122,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	movq	16(%rbp), %rax	 ; arg, tmp123
	movq	(%rax), %rax	 ; arg_15(D)->value.string_value, _6
	movq	24(%rbp), %rdx	 ; outfile, tmp124
	movq	%rax, %rcx	 ; _6,
	call	fputs	 ;
 ; D:/TC/src/output.c:553:         case ARG_STRING: tac_output(0, "%s", arg->value.string_value); break;
	jmp	.L160	 ;
.L169:
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp125
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp125,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	16(%rbp), %rax	 ; arg, tmp126
	movzbl	(%rax), %eax	 ; arg_15(D)->value.bool_value, _7
	testb	%al, %al	 ; _7
	je	.L174	 ;,
	leaq	.LC111(%rip), %rax	 ;, iftmp.2_13
	jmp	.L175	 ;
.L174:
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	leaq	.LC112(%rip), %rax	 ;, iftmp.2_13
.L175:
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	movq	24(%rbp), %rdx	 ; outfile, tmp127
	movq	%rax, %rcx	 ; iftmp.2_13,
	call	fputs	 ;
 ; D:/TC/src/output.c:554:         case ARG_BOOL: tac_output(0, "%s", arg->value.bool_value ? "true" : "false"); break;
	jmp	.L160	 ;
.L168:
 ; D:/TC/src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp128,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rax, %r9	 ; tmp129,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC113(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	fwrite	 ;
 ; D:/TC/src/output.c:555:         case ARG_VOID: tac_output(0, "void"); break;
	jmp	.L160	 ;
.L167:
 ; D:/TC/src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp131,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	movq	16(%rbp), %rax	 ; arg, tmp132
	movq	(%rax), %rax	 ; arg_15(D)->value.label, _8
	movq	8(%rax), %rax	 ; _8->name, _9
	movq	24(%rbp), %rdx	 ; outfile, tmp133
	movq	%rax, %rcx	 ; _9,
	call	fputs	 ;
 ; D:/TC/src/output.c:556:         case ARG_LABEL: tac_output(0, "%s", arg->value.label->name); break;
	jmp	.L160	 ;
.L166:
 ; D:/TC/src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp134,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	movq	16(%rbp), %rax	 ; arg, tmp135
	movq	(%rax), %rax	 ; arg_15(D)->value.subroutine, _10
	movq	8(%rax), %rax	 ; _10->name, _11
	movq	24(%rbp), %rdx	 ; outfile, tmp136
	movq	%rax, %rcx	 ; _11,
	call	fputs	 ;
 ; D:/TC/src/output.c:557:         case ARG_SUBROUTINE: tac_output(0, "%s", arg->value.subroutine->name); break;
	jmp	.L160	 ;
.L164:
 ; D:/TC/src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp137,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rax, %r9	 ; tmp138,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC114(%rip), %rax	 ;, tmp139
	movq	%rax, %rcx	 ; tmp139,
	call	fwrite	 ;
 ; D:/TC/src/output.c:558:         case ARG_NONE: tac_output(0, "NONE"); break;
	jmp	.L160	 ;
.L163:
 ; D:/TC/src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	24(%rbp), %rax	 ; outfile, tmp140
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp140,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	movq	16(%rbp), %rax	 ; arg, tmp141
	movl	16(%rax), %edx	 ; arg_15(D)->kind, _12
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movl	%edx, %r8d	 ; _12,
	leaq	.LC115(%rip), %rdx	 ;, tmp143
	movq	%rax, %rcx	 ; tmp142,
	call	fprintf	 ;
 ; D:/TC/src/output.c:559:         default: tac_output(0, "unknown_ArgType: %u", arg->kind); break;
	nop	
.L160:
 ; D:/TC/src/output.c:562: }
	leave	
	ret	
	.section .rdata,"dr"
.LC116:
	.ascii "Instruction: \"NULL\"\12\0"
.LC117:
	.ascii "add\11\0"
.LC118:
	.ascii "sub\11\0"
.LC119:
	.ascii "mul\11\0"
.LC120:
	.ascii "div\11\0"
.LC121:
	.ascii "mod\11\0"
.LC122:
	.ascii "eq \11\0"
.LC123:
	.ascii "ne \11\0"
.LC124:
	.ascii "lt \11\0"
.LC125:
	.ascii "gt \11\0"
.LC126:
	.ascii "le \11\0"
.LC127:
	.ascii "ge \11\0"
.LC128:
	.ascii "and\11\0"
.LC129:
	.ascii "or \11\0"
.LC130:
	.ascii "not\11\0"
.LC131:
	.ascii "assign\11\0"
.LC132:
	.ascii "get_attr\11\0"
.LC133:
	.ascii "get_elem\11\0"
.LC134:
	.ascii "param\11\0"
.LC135:
	.ascii "alloc\11\0"
.LC136:
	.ascii "jmp_c\11\0"
.LC137:
	.ascii "jmp\11\0"
.LC138:
	.ascii "ret\11\0"
.LC139:
	.ascii "call\11\0"
.LC140:
	.ascii "load\11\0"
.LC141:
	.ascii "store\11\0"
.LC142:
	.ascii "INST_NONE\12\0"
.LC143:
	.ascii "unknown_InstructionType: %u\12\0"
	.text
	.def	output_instruction;	.scl	3;	.type	32;	.endef
output_instruction:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; instruction, instruction
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:565:     if (instruction == NULL) {
	cmpq	$0, 16(%rbp)	 ;, instruction
	jne	.L177	 ;,
 ; D:/TC/src/output.c:566:         tac_output(indent, "Instruction: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:566:         tac_output(indent, "Instruction: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %r9	 ; tmp99,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC116(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:/TC/src/output.c:568:         return;
	jmp	.L176	 ;
.L177:
 ; D:/TC/src/output.c:570:     switch (instruction->type) {
	movq	16(%rbp), %rax	 ; instruction, tmp101
	movl	24(%rax), %eax	 ; instruction_11(D)->type, _1
 ; D:/TC/src/output.c:570:     switch (instruction->type) {
	cmpl	$25, %eax	 ;, _1
	ja	.L179	 ;,
	movl	%eax, %eax	 ; _1, tmp102
	leaq	0(,%rax,4), %rdx	 ;, tmp103
	leaq	.L181(%rip), %rax	 ;, tmp104
	movl	(%rdx,%rax), %eax	 ;, tmp105
	cltq
	leaq	.L181(%rip), %rdx	 ;, tmp108
	addq	%rdx, %rax	 ; tmp108, tmp107
	jmp	*%rax	 ; tmp107
	.section .rdata,"dr"
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
 ; D:/TC/src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rax, %r9	 ; tmp111,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC117(%rip), %rax	 ;, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	fwrite	 ;
 ; D:/TC/src/output.c:571:         case INST_ADD: tac_output(indent, "add\t"); break;
	jmp	.L207	 ;
.L205:
 ; D:/TC/src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp113
	movq	24(%rbp), %rax	 ; outfile, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp115
	movq	%rax, %r9	 ; tmp115,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC118(%rip), %rax	 ;, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	fwrite	 ;
 ; D:/TC/src/output.c:572:         case INST_SUB: tac_output(indent, "sub\t"); break;
	jmp	.L207	 ;
.L204:
 ; D:/TC/src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp117
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rax, %rcx	 ; tmp118,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC119(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
 ; D:/TC/src/output.c:573:         case INST_MUL: tac_output(indent, "mul\t"); break;
	jmp	.L207	 ;
.L203:
 ; D:/TC/src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rax, %r9	 ; tmp123,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC120(%rip), %rax	 ;, tmp124
	movq	%rax, %rcx	 ; tmp124,
	call	fwrite	 ;
 ; D:/TC/src/output.c:574:         case INST_DIV: tac_output(indent, "div\t"); break;
	jmp	.L207	 ;
.L202:
 ; D:/TC/src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp125
	movq	24(%rbp), %rax	 ; outfile, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rax, %r9	 ; tmp127,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC121(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	fwrite	 ;
 ; D:/TC/src/output.c:575:         case INST_MOD: tac_output(indent, "mod\t"); break;
	jmp	.L207	 ;
.L201:
 ; D:/TC/src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp129
	movq	24(%rbp), %rax	 ; outfile, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movq	%rax, %r9	 ; tmp131,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC122(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	fwrite	 ;
 ; D:/TC/src/output.c:576:         case INST_EQ: tac_output(indent, "eq \t"); break;
	jmp	.L207	 ;
.L200:
 ; D:/TC/src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp133
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp135
	movq	%rax, %r9	 ; tmp135,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC123(%rip), %rax	 ;, tmp136
	movq	%rax, %rcx	 ; tmp136,
	call	fwrite	 ;
 ; D:/TC/src/output.c:577:         case INST_NE: tac_output(indent, "ne \t"); break;
	jmp	.L207	 ;
.L199:
 ; D:/TC/src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp137
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rax, %rcx	 ; tmp138,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movq	%rax, %r9	 ; tmp139,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC124(%rip), %rax	 ;, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	fwrite	 ;
 ; D:/TC/src/output.c:578:         case INST_LT: tac_output(indent, "lt \t"); break;
	jmp	.L207	 ;
.L198:
 ; D:/TC/src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp141
	movq	24(%rbp), %rax	 ; outfile, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp143
	movq	%rax, %r9	 ; tmp143,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC125(%rip), %rax	 ;, tmp144
	movq	%rax, %rcx	 ; tmp144,
	call	fwrite	 ;
 ; D:/TC/src/output.c:579:         case INST_GT: tac_output(indent, "gt \t"); break;
	jmp	.L207	 ;
.L197:
 ; D:/TC/src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp145
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp147
	movq	%rax, %r9	 ; tmp147,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC126(%rip), %rax	 ;, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	fwrite	 ;
 ; D:/TC/src/output.c:580:         case INST_LE: tac_output(indent, "le \t"); break;
	jmp	.L207	 ;
.L196:
 ; D:/TC/src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp149
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rax, %r9	 ; tmp151,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC127(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
 ; D:/TC/src/output.c:581:         case INST_GE: tac_output(indent, "ge \t"); break;
	jmp	.L207	 ;
.L195:
 ; D:/TC/src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp153
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rax, %rcx	 ; tmp154,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rax, %r9	 ; tmp155,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC128(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	fwrite	 ;
 ; D:/TC/src/output.c:582:         case INST_AND: tac_output(indent, "and\t"); break;
	jmp	.L207	 ;
.L194:
 ; D:/TC/src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp157
	movq	24(%rbp), %rax	 ; outfile, tmp158
	movq	%rax, %rcx	 ; tmp158,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rax, %r9	 ; tmp159,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC129(%rip), %rax	 ;, tmp160
	movq	%rax, %rcx	 ; tmp160,
	call	fwrite	 ;
 ; D:/TC/src/output.c:583:         case INST_OR: tac_output(indent, "or \t"); break;
	jmp	.L207	 ;
.L193:
 ; D:/TC/src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp161
	movq	24(%rbp), %rax	 ; outfile, tmp162
	movq	%rax, %rcx	 ; tmp162,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp163
	movq	%rax, %r9	 ; tmp163,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC130(%rip), %rax	 ;, tmp164
	movq	%rax, %rcx	 ; tmp164,
	call	fwrite	 ;
 ; D:/TC/src/output.c:584:         case INST_NOT: tac_output(indent, "not\t"); break;
	jmp	.L207	 ;
.L192:
 ; D:/TC/src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp165
	movq	24(%rbp), %rax	 ; outfile, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp167
	movq	%rax, %r9	 ; tmp167,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC131(%rip), %rax	 ;, tmp168
	movq	%rax, %rcx	 ; tmp168,
	call	fwrite	 ;
 ; D:/TC/src/output.c:585:         case INST_ASSIGN: tac_output(indent, "assign\t"); break;
	jmp	.L207	 ;
.L191:
 ; D:/TC/src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp169
	movq	24(%rbp), %rax	 ; outfile, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp171
	movq	%rax, %r9	 ; tmp171,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC132(%rip), %rax	 ;, tmp172
	movq	%rax, %rcx	 ; tmp172,
	call	fwrite	 ;
 ; D:/TC/src/output.c:586:         case INST_GET_ATTR: tac_output(indent, "get_attr\t"); break;
	jmp	.L207	 ;
.L190:
 ; D:/TC/src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp173
	movq	24(%rbp), %rax	 ; outfile, tmp174
	movq	%rax, %rcx	 ; tmp174,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp175
	movq	%rax, %r9	 ; tmp175,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC133(%rip), %rax	 ;, tmp176
	movq	%rax, %rcx	 ; tmp176,
	call	fwrite	 ;
 ; D:/TC/src/output.c:587:         case INST_GET_ELEM: tac_output(indent, "get_elem\t"); break;
	jmp	.L207	 ;
.L189:
 ; D:/TC/src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp177
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rax, %rcx	 ; tmp178,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp179
	movq	%rax, %r9	 ; tmp179,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC134(%rip), %rax	 ;, tmp180
	movq	%rax, %rcx	 ; tmp180,
	call	fwrite	 ;
 ; D:/TC/src/output.c:588:         case INST_PARAM: tac_output(indent, "param\t"); break;
	jmp	.L207	 ;
.L188:
 ; D:/TC/src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp181
	movq	24(%rbp), %rax	 ; outfile, tmp182
	movq	%rax, %rcx	 ; tmp182,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp183
	movq	%rax, %r9	 ; tmp183,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC135(%rip), %rax	 ;, tmp184
	movq	%rax, %rcx	 ; tmp184,
	call	fwrite	 ;
 ; D:/TC/src/output.c:589:         case INST_ALLOC: tac_output(indent, "alloc\t"); break;
	jmp	.L207	 ;
.L187:
 ; D:/TC/src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp185
	movq	24(%rbp), %rax	 ; outfile, tmp186
	movq	%rax, %rcx	 ; tmp186,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rax, %r9	 ; tmp187,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC136(%rip), %rax	 ;, tmp188
	movq	%rax, %rcx	 ; tmp188,
	call	fwrite	 ;
 ; D:/TC/src/output.c:590:         case INST_JMP_C: tac_output(indent, "jmp_c\t"); break;
	jmp	.L207	 ;
.L186:
 ; D:/TC/src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp189
	movq	24(%rbp), %rax	 ; outfile, tmp190
	movq	%rax, %rcx	 ; tmp190,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp191
	movq	%rax, %r9	 ; tmp191,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC137(%rip), %rax	 ;, tmp192
	movq	%rax, %rcx	 ; tmp192,
	call	fwrite	 ;
 ; D:/TC/src/output.c:591:         case INST_JMP: tac_output(indent, "jmp\t"); break;
	jmp	.L207	 ;
.L185:
 ; D:/TC/src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp193
	movq	24(%rbp), %rax	 ; outfile, tmp194
	movq	%rax, %rcx	 ; tmp194,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp195
	movq	%rax, %r9	 ; tmp195,
	movl	$4, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC138(%rip), %rax	 ;, tmp196
	movq	%rax, %rcx	 ; tmp196,
	call	fwrite	 ;
 ; D:/TC/src/output.c:592:         case INST_RET: tac_output(indent, "ret\t"); break;
	jmp	.L207	 ;
.L184:
 ; D:/TC/src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp197
	movq	24(%rbp), %rax	 ; outfile, tmp198
	movq	%rax, %rcx	 ; tmp198,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp199
	movq	%rax, %r9	 ; tmp199,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC139(%rip), %rax	 ;, tmp200
	movq	%rax, %rcx	 ; tmp200,
	call	fwrite	 ;
 ; D:/TC/src/output.c:593:         case INST_CALL: tac_output(indent, "call\t"); break;
	jmp	.L207	 ;
.L183:
 ; D:/TC/src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp201
	movq	24(%rbp), %rax	 ; outfile, tmp202
	movq	%rax, %rcx	 ; tmp202,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp203
	movq	%rax, %r9	 ; tmp203,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC140(%rip), %rax	 ;, tmp204
	movq	%rax, %rcx	 ; tmp204,
	call	fwrite	 ;
 ; D:/TC/src/output.c:594:         case INST_LOAD: tac_output(indent, "load\t"); break;
	jmp	.L207	 ;
.L182:
 ; D:/TC/src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	32(%rbp), %rdx	 ; indent, tmp205
	movq	24(%rbp), %rax	 ; outfile, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	movq	24(%rbp), %rax	 ; outfile, tmp207
	movq	%rax, %r9	 ; tmp207,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC141(%rip), %rax	 ;, tmp208
	movq	%rax, %rcx	 ; tmp208,
	call	fwrite	 ;
 ; D:/TC/src/output.c:595:         case INST_STORE: tac_output(indent, "store\t"); break;
	jmp	.L207	 ;
.L180:
 ; D:/TC/src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	32(%rbp), %rdx	 ; indent, tmp209
	movq	24(%rbp), %rax	 ; outfile, tmp210
	movq	%rax, %rcx	 ; tmp210,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	movq	24(%rbp), %rax	 ; outfile, tmp211
	movq	%rax, %r9	 ; tmp211,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC142(%rip), %rax	 ;, tmp212
	movq	%rax, %rcx	 ; tmp212,
	call	fwrite	 ;
 ; D:/TC/src/output.c:596:         case INST_NONE: tac_output(indent, "INST_NONE\n"); return;
	jmp	.L176	 ;
.L179:
 ; D:/TC/src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	32(%rbp), %rdx	 ; indent, tmp213
	movq	24(%rbp), %rax	 ; outfile, tmp214
	movq	%rax, %rcx	 ; tmp214,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:598:             tac_output(indent, "unknown_InstructionType: %u\n", instruction->type);
	movq	16(%rbp), %rax	 ; instruction, tmp215
	movl	24(%rax), %edx	 ; instruction_11(D)->type, _2
	movq	24(%rbp), %rax	 ; outfile, tmp216
	movl	%edx, %r8d	 ; _2,
	leaq	.LC143(%rip), %rdx	 ;, tmp217
	movq	%rax, %rcx	 ; tmp216,
	call	fprintf	 ;
 ; D:/TC/src/output.c:600:             return;
	jmp	.L176	 ;
.L207:
 ; D:/TC/src/output.c:602:     output_arg(instruction->arg1, outfile);
	movq	16(%rbp), %rax	 ; instruction, tmp218
	movq	(%rax), %rax	 ; instruction_11(D)->arg1, _3
	movq	24(%rbp), %rdx	 ; outfile, tmp219
	movq	%rax, %rcx	 ; _3,
	call	output_arg	 ;
 ; D:/TC/src/output.c:603:     switch (instruction->type) {
	movq	16(%rbp), %rax	 ; instruction, tmp220
	movl	24(%rax), %eax	 ; instruction_11(D)->type, _4
	cmpl	$24, %eax	 ;, _4
	seta	%dl	 ;, _83
 ; D:/TC/src/output.c:603:     switch (instruction->type) {
	testb	%dl, %dl	 ; _83
	jne	.L213	 ;,
	movl	$1, %edx	 ;, tmp221
	movl	%eax, %ecx	 ; _4, tmp238
	salq	%cl, %rdx	 ; tmp238, tmp221
	movq	%rdx, %rax	 ; tmp221, _84
	movq	%rax, %rdx	 ; _84, _85
	andl	$4825087, %edx	 ;, _85
	testq	%rdx, %rdx	 ; _85
	setne	%dl	 ;, _86
	testb	%dl, %dl	 ; _86
	jne	.L209	 ;,
	movq	%rax, %rdx	 ; _84, _87
	andl	$25583616, %edx	 ;, _87
	testq	%rdx, %rdx	 ; _87
	setne	%dl	 ;, _88
	testb	%dl, %dl	 ; _88
	jne	.L210	 ;,
	andl	$3145728, %eax	 ;, _89
	testq	%rax, %rax	 ; _89
	setne	%al	 ;, _90
	testb	%al, %al	 ; _90
	jne	.L214	 ;,
 ; D:/TC/src/output.c:641:             return;
	jmp	.L213	 ;
.L209:
 ; D:/TC/src/output.c:621:             tac_output(0, " ");
	movq	24(%rbp), %rax	 ; outfile, tmp222
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp222,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:621:             tac_output(0, " ");
	movq	24(%rbp), %rax	 ; outfile, tmp223
	movq	%rax, %rdx	 ; tmp223,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:622:             output_arg(instruction->arg2, outfile);
	movq	16(%rbp), %rax	 ; instruction, tmp224
	movq	8(%rax), %rax	 ; instruction_11(D)->arg2, _5
	movq	24(%rbp), %rdx	 ; outfile, tmp225
	movq	%rax, %rcx	 ; _5,
	call	output_arg	 ;
 ; D:/TC/src/output.c:623:             tac_output(0, " ");
	movq	24(%rbp), %rax	 ; outfile, tmp226
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp226,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:623:             tac_output(0, " ");
	movq	24(%rbp), %rax	 ; outfile, tmp227
	movq	%rax, %rdx	 ; tmp227,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:624:             output_arg(instruction->arg3, outfile);
	movq	16(%rbp), %rax	 ; instruction, tmp228
	movq	16(%rax), %rax	 ; instruction_11(D)->arg3, _6
	movq	24(%rbp), %rdx	 ; outfile, tmp229
	movq	%rax, %rcx	 ; _6,
	call	output_arg	 ;
 ; D:/TC/src/output.c:625:             break;
	jmp	.L212	 ;
.L210:
 ; D:/TC/src/output.c:632:             tac_output(0, " ");
	movq	24(%rbp), %rax	 ; outfile, tmp230
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp230,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:632:             tac_output(0, " ");
	movq	24(%rbp), %rax	 ; outfile, tmp231
	movq	%rax, %rdx	 ; tmp231,
	movl	$32, %ecx	 ;,
	call	fputc	 ;
 ; D:/TC/src/output.c:633:             output_arg(instruction->arg2, outfile);
	movq	16(%rbp), %rax	 ; instruction, tmp232
	movq	8(%rax), %rax	 ; instruction_11(D)->arg2, _7
	movq	24(%rbp), %rdx	 ; outfile, tmp233
	movq	%rax, %rcx	 ; _7,
	call	output_arg	 ;
 ; D:/TC/src/output.c:634:             break;
	jmp	.L212	 ;
.L214:
 ; D:/TC/src/output.c:637:             break;
	nop	
.L212:
 ; D:/TC/src/output.c:643:     tac_output(0, "\n");
	movq	24(%rbp), %rax	 ; outfile, tmp234
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp234,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:643:     tac_output(0, "\n");
	movq	24(%rbp), %rax	 ; outfile, tmp235
	movq	%rax, %rdx	 ; tmp235,
	movl	$10, %ecx	 ;,
	call	fputc	 ;
	jmp	.L176	 ;
.L213:
 ; D:/TC/src/output.c:641:             return;
	nop	
.L176:
 ; D:/TC/src/output.c:645: }
	leave	
	ret	
	.section .rdata,"dr"
.LC144:
	.ascii "AttributeTable: \"NULL\"\12\0"
.LC145:
	.ascii "%zu \0"
	.text
	.def	output_attribute_table;	.scl	3;	.type	32;	.endef
output_attribute_table:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$48, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; attribute_table, attribute_table
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:648:     if (attribute_table == NULL) {
	cmpq	$0, 16(%rbp)	 ;, attribute_table
	jne	.L216	 ;,
 ; D:/TC/src/output.c:649:         tac_output(indent, "AttributeTable: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %rcx	 ; tmp91,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:649:         tac_output(indent, "AttributeTable: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$23, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC144(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:/TC/src/output.c:651:         return;
	jmp	.L215	 ;
.L216:
 ; D:/TC/src/output.c:653:     if (attribute_table->name == NULL)
	movq	16(%rbp), %rax	 ; attribute_table, tmp94
	movq	8(%rax), %rax	 ; attribute_table_12(D)->name, _1
 ; D:/TC/src/output.c:653:     if (attribute_table->name == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L218	 ;,
 ; D:/TC/src/output.c:654:         tac_output(indent, "NULL ");
	movq	32(%rbp), %rdx	 ; indent, tmp95
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:654:         tac_output(indent, "NULL ");
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rax, %r9	 ; tmp97,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC104(%rip), %rax	 ;, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	fwrite	 ;
	jmp	.L219	 ;
.L218:
 ; D:/TC/src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:656:         tac_output(indent, "%s ", attribute_table->name->name);
	movq	16(%rbp), %rax	 ; attribute_table, tmp101
	movq	8(%rax), %rax	 ; attribute_table_12(D)->name, _2
	movq	8(%rax), %rdx	 ; _2->name, _3
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rdx, %r8	 ; _3,
	leaq	.LC105(%rip), %rdx	 ;, tmp103
	movq	%rax, %rcx	 ; tmp102,
	call	fprintf	 ;
.L219:
 ; D:/TC/src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp104,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:657:     tac_output(0, "%zu ", attribute_table->size);
	movq	16(%rbp), %rax	 ; attribute_table, tmp105
	movq	16(%rax), %rdx	 ; attribute_table_12(D)->size, _4
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movq	%rdx, %r8	 ; _4,
	leaq	.LC145(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; tmp106,
	call	fprintf	 ;
 ; D:/TC/src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	movq	16(%rbp), %rax	 ; attribute_table, tmp108
	movq	(%rax), %rax	 ; attribute_table_12(D)->attributes, _5
	movq	%rax, %rcx	 ; _5,
	call	list_is_empty	 ;
 ; D:/TC/src/output.c:658:     if (list_is_empty(attribute_table->attributes))
	testb	%al, %al	 ; _6
	je	.L220	 ;,
 ; D:/TC/src/output.c:659:         tac_output(0, "{}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp109,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:659:         tac_output(0, "{}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rax, %r9	 ; tmp110,
	movl	$3, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC106(%rip), %rax	 ;, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	fwrite	 ;
	jmp	.L215	 ;
.L220:
 ; D:/TC/src/output.c:661:         tac_output(0, "{\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:661:         tac_output(0, "{\n");
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rax, %r9	 ; tmp113,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC107(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	fwrite	 ;
 ; D:/TC/src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	jmp	.L221	 ;
.L222:
 ; D:/TC/src/output.c:664:             output_attribute(attribute, outfile, indent + 1);
	movq	32(%rbp), %rax	 ; indent, tmp115
	leaq	1(%rax), %rcx	 ;, _7
	movq	24(%rbp), %rdx	 ; outfile, tmp116
	movq	-8(%rbp), %rax	 ; attribute, tmp117
	movq	%rcx, %r8	 ; _7,
	movq	%rax, %rcx	 ; tmp117,
	call	output_attribute	 ;
.L221:
 ; D:/TC/src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	movq	16(%rbp), %rax	 ; attribute_table, tmp118
	movq	(%rax), %rax	 ; attribute_table_12(D)->attributes, _8
	movq	%rax, %rcx	 ; _8,
	call	list_pop	 ;
	movq	%rax, -8(%rbp)	 ; tmp119, attribute
 ; D:/TC/src/output.c:663:         while ((attribute = (Attribute*)list_pop(attribute_table->attributes)) != NULL)
	cmpq	$0, -8(%rbp)	 ;, attribute
	jne	.L222	 ;,
 ; D:/TC/src/output.c:665:         tac_output(indent, "}\n");
	movq	32(%rbp), %rdx	 ; indent, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:665:         tac_output(indent, "}\n");
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rax, %r9	 ; tmp122,
	movl	$2, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC88(%rip), %rax	 ;, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	fwrite	 ;
.L215:
 ; D:/TC/src/output.c:668: }
	leave	
	ret	
	.section .rdata,"dr"
.LC146:
	.ascii "Attribute: \"NULL\"\12\0"
.LC147:
	.ascii "NULL\11\0"
.LC148:
	.ascii "%s\11\0"
.LC149:
	.ascii "%zu\12\0"
	.text
	.def	output_attribute;	.scl	3;	.type	32;	.endef
output_attribute:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	subq	$32, %rsp	 ;,
	movq	%rcx, 16(%rbp)	 ; attribute, attribute
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
 ; D:/TC/src/output.c:671:     if (attribute == NULL) {
	cmpq	$0, 16(%rbp)	 ;, attribute
	jne	.L224	 ;,
 ; D:/TC/src/output.c:672:         tac_output(indent, "Attribute: \"NULL\"\n");
	movq	32(%rbp), %rdx	 ; indent, tmp89
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:672:         tac_output(indent, "Attribute: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rax, %r9	 ; tmp91,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC146(%rip), %rax	 ;, tmp92
	movq	%rax, %rcx	 ; tmp92,
	call	fwrite	 ;
 ; D:/TC/src/output.c:674:         return;
	jmp	.L223	 ;
.L224:
 ; D:/TC/src/output.c:676:     if (attribute->type == NULL)
	movq	16(%rbp), %rax	 ; attribute, tmp93
	movq	8(%rax), %rax	 ; attribute_11(D)->type, _1
 ; D:/TC/src/output.c:676:     if (attribute->type == NULL)
	testq	%rax, %rax	 ; _1
	jne	.L226	 ;,
 ; D:/TC/src/output.c:677:         tac_output(indent, "NULL\t");
	movq	32(%rbp), %rdx	 ; indent, tmp94
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %rcx	 ; tmp95,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:677:         tac_output(indent, "NULL\t");
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rax, %r9	 ; tmp96,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC147(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
	jmp	.L227	 ;
.L226:
 ; D:/TC/src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:679:         tac_output(indent, "%s\t", attribute->type->name);
	movq	16(%rbp), %rax	 ; attribute, tmp100
	movq	8(%rax), %rax	 ; attribute_11(D)->type, _2
	movq	8(%rax), %rdx	 ; _2->name, _3
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rdx, %r8	 ; _3,
	leaq	.LC148(%rip), %rdx	 ;, tmp102
	movq	%rax, %rcx	 ; tmp101,
	call	fprintf	 ;
.L227:
 ; D:/TC/src/output.c:680:     if (attribute->var == NULL)
	movq	16(%rbp), %rax	 ; attribute, tmp103
	movq	(%rax), %rax	 ; attribute_11(D)->var, _4
 ; D:/TC/src/output.c:680:     if (attribute->var == NULL)
	testq	%rax, %rax	 ; _4
	jne	.L228	 ;,
 ; D:/TC/src/output.c:681:         tac_output(0, "NULL ");
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp104,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:681:         tac_output(0, "NULL ");
	movq	24(%rbp), %rax	 ; outfile, tmp105
	movq	%rax, %r9	 ; tmp105,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC104(%rip), %rax	 ;, tmp106
	movq	%rax, %rcx	 ; tmp106,
	call	fwrite	 ;
	jmp	.L229	 ;
.L228:
 ; D:/TC/src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:683:         tac_output(0, "%s ", attribute->var->name);
	movq	16(%rbp), %rax	 ; attribute, tmp108
	movq	(%rax), %rax	 ; attribute_11(D)->var, _5
	movq	8(%rax), %rdx	 ; _5->name, _6
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rdx, %r8	 ; _6,
	leaq	.LC105(%rip), %rdx	 ;, tmp110
	movq	%rax, %rcx	 ; tmp109,
	call	fprintf	 ;
.L229:
 ; D:/TC/src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movl	$0, %edx	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention_tac	 ;
 ; D:/TC/src/output.c:684:     tac_output(0, "%zu\n", attribute->offset);
	movq	16(%rbp), %rax	 ; attribute, tmp112
	movq	16(%rax), %rdx	 ; attribute_11(D)->offset, _7
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rdx, %r8	 ; _7,
	leaq	.LC149(%rip), %rdx	 ;, tmp114
	movq	%rax, %rcx	 ; tmp113,
	call	fprintf	 ;
.L223:
 ; D:/TC/src/output.c:686: }
	leave	
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	indention_tac;	.scl	2;	.type	32;	.endef
	.def	list_is_empty;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	fputc;	.scl	2;	.type	32;	.endef

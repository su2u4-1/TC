	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
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
	.seh_proc	output_code_member
output_code_member:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; code_member, code_member
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:24:     CodeMember* code_member_ptr = code_member;
	movq	16(%rbp), %rax	 ; code_member, tmp90
	movq	%rax, -8(%rbp)	 ; tmp90, code_member_ptr
 ; D:\TC\src\output.c:25:     switch (code_member_ptr->type) {
	movq	-8(%rbp), %rax	 ; code_member_ptr, tmp91
	movl	8(%rax), %eax	 ; code_member_ptr_11->type, _1
 ; D:\TC\src\output.c:25:     switch (code_member_ptr->type) {
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
 ; D:\TC\src\output.c:27:             OUT(0, false, "import\n");
	movq	40(%rbp), %rcx	 ; parser, tmp92
	movq	32(%rbp), %rdx	 ; indent, tmp93
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp92,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp94,
	call	indention	 ;
 ; D:\TC\src\output.c:27:             OUT(0, false, "import\n");
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %r9	 ; tmp95,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rax	 ;, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	fwrite	 ;
 ; D:\TC\src\output.c:28:             output_import(code_member_ptr->content.import, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp97
	leaq	1(%rax), %r8	 ;, _2
	movq	-8(%rbp), %rax	 ; code_member_ptr, tmp98
	movq	(%rax), %rax	 ; code_member_ptr_11->content.import, _3
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	24(%rbp), %rdx	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp99,
	movq	%rax, %rcx	 ; _3,
	call	output_import	 ;
 ; D:\TC\src\output.c:29:             break;
	jmp	.L6	 ;
.L5:
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	movq	40(%rbp), %rcx	 ; parser, tmp101
	movq	32(%rbp), %rdx	 ; indent, tmp102
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rcx, %r9	 ; tmp101,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp103,
	call	indention	 ;
 ; D:\TC\src\output.c:31:             OUT(0, false, "function\n");
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movq	%rax, %r9	 ; tmp104,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	fwrite	 ;
 ; D:\TC\src\output.c:32:             output_function(code_member_ptr->content.function, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp106
	leaq	1(%rax), %r8	 ;, _4
	movq	-8(%rbp), %rax	 ; code_member_ptr, tmp107
	movq	(%rax), %rax	 ; code_member_ptr_11->content.function, _5
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	24(%rbp), %rdx	 ; outfile, tmp109
	movq	%rcx, %r9	 ; tmp108,
	movq	%rax, %rcx	 ; _5,
	call	output_function	 ;
 ; D:\TC\src\output.c:33:             break;
	jmp	.L6	 ;
.L2:
 ; D:\TC\src\output.c:35:             OUT(0, false, "class\n");
	movq	40(%rbp), %rcx	 ; parser, tmp110
	movq	32(%rbp), %rdx	 ; indent, tmp111
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rcx, %r9	 ; tmp110,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	indention	 ;
 ; D:\TC\src\output.c:35:             OUT(0, false, "class\n");
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rax, %r9	 ; tmp113,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	fwrite	 ;
 ; D:\TC\src\output.c:36:             output_class(code_member_ptr->content.class_, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp115
	leaq	1(%rax), %r8	 ;, _6
	movq	-8(%rbp), %rax	 ; code_member_ptr, tmp116
	movq	(%rax), %rax	 ; code_member_ptr_11->content.class_, _7
	movq	40(%rbp), %rcx	 ; parser, tmp117
	movq	24(%rbp), %rdx	 ; outfile, tmp118
	movq	%rcx, %r9	 ; tmp117,
	movq	%rax, %rcx	 ; _7,
	call	output_class	 ;
 ; D:\TC\src\output.c:37:             break;
	jmp	.L6	 ;
.L3:
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	40(%rbp), %rcx	 ; parser, tmp119
	movq	32(%rbp), %rdx	 ; indent, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rcx, %r9	 ; tmp119,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp121,
	call	indention	 ;
 ; D:\TC\src\output.c:39:             OUT(0, false, "unknown_CodeMemberType: %u\n", code_member_ptr->type);
	movq	-8(%rbp), %rax	 ; code_member_ptr, tmp122
	movl	8(%rax), %edx	 ; code_member_ptr_11->type, _8
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movl	%edx, %r8d	 ; _8,
	leaq	.LC3(%rip), %rdx	 ;, tmp124
	movq	%rax, %rcx	 ; tmp123,
	call	fprintf	 ;
 ; D:\TC\src\output.c:40:             break;
	nop	
.L6:
 ; D:\TC\src\output.c:42: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
	.seh_proc	output_code
output_code:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; code, code
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:47:     list(CodeMember*) members = list_copy((code)->members);
	movq	16(%rbp), %rax	 ; code, tmp84
	movq	(%rax), %rax	 ; code_5(D)->members, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, members
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	jmp	.L8	 ;
.L9:
 ; D:\TC\src\output.c:50:         output_code_member(member, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp86
	leaq	1(%rax), %r8	 ;, _2
	movq	40(%rbp), %rcx	 ; parser, tmp87
	movq	24(%rbp), %rdx	 ; outfile, tmp88
	movq	-16(%rbp), %rax	 ; member, tmp89
	movq	%rcx, %r9	 ; tmp87,
	movq	%rax, %rcx	 ; tmp89,
	call	output_code_member	 ;
.L8:
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	movq	-8(%rbp), %rax	 ; members, tmp90
	movq	%rax, %rcx	 ; tmp90,
	call	list_pop	 ;
	movq	%rax, -16(%rbp)	 ; tmp91, member
 ; D:\TC\src\output.c:49:     while ((member = (CodeMember*)list_pop(members)) != 0)
	cmpq	$0, -16(%rbp)	 ;, member
	jne	.L9	 ;,
 ; D:\TC\src\output.c:51: }
	nop	
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "name\12\0"
.LC5:
	.ascii "NULL\0"
.LC6:
	.ascii "source: \"%s\"\12\0"
	.text
	.def	output_import;	.scl	3;	.type	32;	.endef
	.seh_proc	output_import
output_import:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; import, import
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:56:     Import* import_ptr = import;
	movq	16(%rbp), %rax	 ; import, tmp86
	movq	%rax, -8(%rbp)	 ; tmp86, import_ptr
 ; D:\TC\src\output.c:57:     OUT(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp87
	movq	32(%rbp), %rdx	 ; indent, tmp88
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rcx, %r9	 ; tmp87,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp89,
	call	indention	 ;
 ; D:\TC\src\output.c:57:     OUT(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rax, %r9	 ; tmp90,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp91
	movq	%rax, %rcx	 ; tmp91,
	call	fwrite	 ;
 ; D:\TC\src\output.c:58:     output_name(import_ptr->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp92
	leaq	1(%rax), %r8	 ;, _1
	movq	-8(%rbp), %rax	 ; import_ptr, tmp93
	movq	(%rax), %rax	 ; import_ptr_6->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp94
	movq	24(%rbp), %rdx	 ; outfile, tmp95
	movq	%rcx, %r9	 ; tmp94,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	indention	 ;
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	-8(%rbp), %rax	 ; import_ptr, tmp99
	movq	8(%rax), %rax	 ; import_ptr_6->source, _3
	testq	%rax, %rax	 ; _3
	je	.L11	 ;,
	movq	-8(%rbp), %rax	 ; import_ptr, tmp100
	movq	8(%rax), %rax	 ; import_ptr_6->source, iftmp.0_4
	jmp	.L12	 ;
.L11:
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	leaq	.LC5(%rip), %rax	 ;, iftmp.0_4
.L12:
 ; D:\TC\src\output.c:59:     OUT(0, true, "source: \"%s\"\n", import_ptr->source != 0 ? import_ptr->source : "NULL");
	movq	24(%rbp), %rcx	 ; outfile, tmp101
	movq	%rax, %r8	 ; iftmp.0_4,
	leaq	.LC6(%rip), %rax	 ;, tmp102
	movq	%rax, %rdx	 ; tmp102,
	call	fprintf	 ;
 ; D:\TC\src\output.c:60: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	output_function
output_function:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; function, function
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:65:     Function* function_ptr = function;
	movq	16(%rbp), %rax	 ; function, tmp91
	movq	%rax, -16(%rbp)	 ; tmp91, function_ptr
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp92
	movq	32(%rbp), %rdx	 ; indent, tmp93
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp92,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp94,
	call	indention	 ;
 ; D:\TC\src\output.c:66:     OUT(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %r9	 ; tmp95,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	fwrite	 ;
 ; D:\TC\src\output.c:67:     output_name(function_ptr->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp97
	leaq	1(%rax), %r8	 ;, _1
	movq	-16(%rbp), %rax	 ; function_ptr, tmp98
	movq	(%rax), %rax	 ; function_ptr_14->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	24(%rbp), %rdx	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp99,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:68:     OUT(0, false, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp101
	movq	32(%rbp), %rdx	 ; indent, tmp102
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rcx, %r9	 ; tmp101,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp103,
	call	indention	 ;
 ; D:\TC\src\output.c:68:     OUT(0, false, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movq	%rax, %r9	 ; tmp104,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	fwrite	 ;
 ; D:\TC\src\output.c:69:     output_name(function_ptr->return_type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp106
	leaq	1(%rax), %r8	 ;, _3
	movq	-16(%rbp), %rax	 ; function_ptr, tmp107
	movq	8(%rax), %rax	 ; function_ptr_14->return_type, _4
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	24(%rbp), %rdx	 ; outfile, tmp109
	movq	%rcx, %r9	 ; tmp108,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:\TC\src\output.c:70:     OUT(0, false, "parameters\n");
	movq	40(%rbp), %rcx	 ; parser, tmp110
	movq	32(%rbp), %rdx	 ; indent, tmp111
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rcx, %r9	 ; tmp110,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	indention	 ;
 ; D:\TC\src\output.c:70:     OUT(0, false, "parameters\n");
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rax, %r9	 ; tmp113,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	fwrite	 ;
 ; D:\TC\src\output.c:71:     list(Variable*) parameters = list_copy(function_ptr->parameters);
	movq	-16(%rbp), %rax	 ; function_ptr, tmp115
	movq	16(%rax), %rax	 ; function_ptr_14->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp116, parameters
 ; D:\TC\src\output.c:72:     list(Statement*) body = list_copy(function_ptr->body);
	movq	-16(%rbp), %rax	 ; function_ptr, tmp117
	movq	24(%rax), %rax	 ; function_ptr_14->body, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -32(%rbp)	 ; tmp118, body
 ; D:\TC\src\output.c:74:     int index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L14	 ;
.L15:
 ; D:\TC\src\output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp119
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rcx, %r9	 ; tmp120,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp121,
	call	indention	 ;
 ; D:\TC\src\output.c:76:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp122
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movl	%edx, %r8d	 ; tmp122,
	leaq	.LC9(%rip), %rdx	 ;, tmp124
	movq	%rax, %rcx	 ; tmp123,
	call	fprintf	 ;
 ; D:\TC\src\output.c:77:         output_variable(parameter, outfile, indent + 2, parser);
	movq	32(%rbp), %rax	 ; indent, tmp125
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp126
	movq	24(%rbp), %rdx	 ; outfile, tmp127
	movq	-40(%rbp), %rax	 ; parameter, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movq	%rax, %rcx	 ; tmp128,
	call	output_variable	 ;
.L14:
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	-24(%rbp), %rax	 ; parameters, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp130, parameter
 ; D:\TC\src\output.c:75:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	cmpq	$0, -40(%rbp)	 ;, parameter
	jne	.L15	 ;,
 ; D:\TC\src\output.c:79:     OUT(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp131
	movq	32(%rbp), %rdx	 ; indent, tmp132
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rcx, %r9	 ; tmp131,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp133,
	call	indention	 ;
 ; D:\TC\src\output.c:79:     OUT(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movq	%rax, %r9	 ; tmp134,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	fwrite	 ;
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L16	 ;
.L17:
 ; D:\TC\src\output.c:82:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp136
	leaq	1(%rax), %r8	 ;, _9
	movq	40(%rbp), %rcx	 ; parser, tmp137
	movq	24(%rbp), %rdx	 ; outfile, tmp138
	movq	-48(%rbp), %rax	 ; statement, tmp139
	movq	%rcx, %r9	 ; tmp137,
	movq	%rax, %rcx	 ; tmp139,
	call	output_statement	 ;
.L16:
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-32(%rbp), %rax	 ; body, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp141, statement
 ; D:\TC\src\output.c:81:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L17	 ;,
 ; D:\TC\src\output.c:83: }
	nop	
	nop	
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	output_method;	.scl	3;	.type	32;	.endef
	.seh_proc	output_method
output_method:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; method, method
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:88:     Method* method_ptr = method;
	movq	16(%rbp), %rax	 ; method, tmp91
	movq	%rax, -16(%rbp)	 ; tmp91, method_ptr
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp92
	movq	32(%rbp), %rdx	 ; indent, tmp93
	movq	24(%rbp), %rax	 ; outfile, tmp94
	movq	%rcx, %r9	 ; tmp92,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp94,
	call	indention	 ;
 ; D:\TC\src\output.c:89:     OUT(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rax, %r9	 ; tmp95,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp96
	movq	%rax, %rcx	 ; tmp96,
	call	fwrite	 ;
 ; D:\TC\src\output.c:90:     output_name(method_ptr->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp97
	leaq	1(%rax), %r8	 ;, _1
	movq	-16(%rbp), %rax	 ; method_ptr, tmp98
	movq	(%rax), %rax	 ; method_ptr_14->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	24(%rbp), %rdx	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp99,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:91:     OUT(0, false, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp101
	movq	32(%rbp), %rdx	 ; indent, tmp102
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rcx, %r9	 ; tmp101,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp103,
	call	indention	 ;
 ; D:\TC\src\output.c:91:     OUT(0, false, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movq	%rax, %r9	 ; tmp104,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	fwrite	 ;
 ; D:\TC\src\output.c:92:     output_name(method_ptr->return_type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp106
	leaq	1(%rax), %r8	 ;, _3
	movq	-16(%rbp), %rax	 ; method_ptr, tmp107
	movq	8(%rax), %rax	 ; method_ptr_14->return_type, _4
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	24(%rbp), %rdx	 ; outfile, tmp109
	movq	%rcx, %r9	 ; tmp108,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:\TC\src\output.c:93:     OUT(0, false, "parameters\n");
	movq	40(%rbp), %rcx	 ; parser, tmp110
	movq	32(%rbp), %rdx	 ; indent, tmp111
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rcx, %r9	 ; tmp110,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp112,
	call	indention	 ;
 ; D:\TC\src\output.c:93:     OUT(0, false, "parameters\n");
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rax, %r9	 ; tmp113,
	movl	$11, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC8(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	fwrite	 ;
 ; D:\TC\src\output.c:94:     list(Variable*) parameters = list_copy(method_ptr->parameters);
	movq	-16(%rbp), %rax	 ; method_ptr, tmp115
	movq	16(%rax), %rax	 ; method_ptr_14->parameters, _5
	movq	%rax, %rcx	 ; _5,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp116, parameters
 ; D:\TC\src\output.c:95:     list(Statement*) body = list_copy(method_ptr->body);
	movq	-16(%rbp), %rax	 ; method_ptr, tmp117
	movq	24(%rax), %rax	 ; method_ptr_14->body, _6
	movq	%rax, %rcx	 ; _6,
	call	list_copy	 ;
	movq	%rax, -32(%rbp)	 ; tmp118, body
 ; D:\TC\src\output.c:97:     int index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	jmp	.L19	 ;
.L20:
 ; D:\TC\src\output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp119
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rcx, %r9	 ; tmp120,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp121,
	call	indention	 ;
 ; D:\TC\src\output.c:99:         OUT(1, false, "parameters[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp122
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movl	%edx, %r8d	 ; tmp122,
	leaq	.LC9(%rip), %rdx	 ;, tmp124
	movq	%rax, %rcx	 ; tmp123,
	call	fprintf	 ;
 ; D:\TC\src\output.c:100:         output_variable(parameter, outfile, indent + 2, parser);
	movq	32(%rbp), %rax	 ; indent, tmp125
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp126
	movq	24(%rbp), %rdx	 ; outfile, tmp127
	movq	-40(%rbp), %rax	 ; parameter, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movq	%rax, %rcx	 ; tmp128,
	call	output_variable	 ;
.L19:
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	movq	-24(%rbp), %rax	 ; parameters, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp130, parameter
 ; D:\TC\src\output.c:98:     while ((parameter = (Variable*)list_pop(parameters)) != 0) {
	cmpq	$0, -40(%rbp)	 ;, parameter
	jne	.L20	 ;,
 ; D:\TC\src\output.c:102:     OUT(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp131
	movq	32(%rbp), %rdx	 ; indent, tmp132
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rcx, %r9	 ; tmp131,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp133,
	call	indention	 ;
 ; D:\TC\src\output.c:102:     OUT(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movq	%rax, %r9	 ; tmp134,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	fwrite	 ;
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L21	 ;
.L22:
 ; D:\TC\src\output.c:105:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp136
	leaq	1(%rax), %r8	 ;, _9
	movq	40(%rbp), %rcx	 ; parser, tmp137
	movq	24(%rbp), %rdx	 ; outfile, tmp138
	movq	-48(%rbp), %rax	 ; statement, tmp139
	movq	%rcx, %r9	 ; tmp137,
	movq	%rax, %rcx	 ; tmp139,
	call	output_statement	 ;
.L21:
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-32(%rbp), %rax	 ; body, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp141, statement
 ; D:\TC\src\output.c:104:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -48(%rbp)	 ;, statement
	jne	.L22	 ;,
 ; D:\TC\src\output.c:106: }
	nop	
	nop	
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC11:
	.ascii "method\12\0"
.LC12:
	.ascii "variable\12\0"
.LC13:
	.ascii "unknown_ClassMemberType: %u\12\0"
	.text
	.def	output_class_member;	.scl	3;	.type	32;	.endef
	.seh_proc	output_class_member
output_class_member:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; class_member, class_member
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:111:     ClassMember* class_member_ptr = class_member;
	movq	16(%rbp), %rax	 ; class_member, tmp88
	movq	%rax, -8(%rbp)	 ; tmp88, class_member_ptr
 ; D:\TC\src\output.c:112:     switch (class_member_ptr->type) {
	movq	-8(%rbp), %rax	 ; class_member_ptr, tmp89
	movl	8(%rax), %eax	 ; class_member_ptr_9->type, _1
 ; D:\TC\src\output.c:112:     switch (class_member_ptr->type) {
	testl	%eax, %eax	 ; _1
	je	.L24	 ;,
	cmpl	$1, %eax	 ;, _1
	je	.L25	 ;,
	jmp	.L28	 ;
.L24:
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movq	40(%rbp), %rcx	 ; parser, tmp90
	movq	32(%rbp), %rdx	 ; indent, tmp91
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rcx, %r9	 ; tmp90,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp92,
	call	indention	 ;
 ; D:\TC\src\output.c:114:             OUT(0, false, "method\n");
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rax, %r9	 ; tmp93,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC11(%rip), %rax	 ;, tmp94
	movq	%rax, %rcx	 ; tmp94,
	call	fwrite	 ;
 ; D:\TC\src\output.c:115:             output_method(class_member_ptr->content.method, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp95
	leaq	1(%rax), %r8	 ;, _2
	movq	-8(%rbp), %rax	 ; class_member_ptr, tmp96
	movq	(%rax), %rax	 ; class_member_ptr_9->content.method, _3
	movq	40(%rbp), %rcx	 ; parser, tmp97
	movq	24(%rbp), %rdx	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp97,
	movq	%rax, %rcx	 ; _3,
	call	output_method	 ;
 ; D:\TC\src\output.c:116:             break;
	jmp	.L27	 ;
.L25:
 ; D:\TC\src\output.c:118:             OUT(0, false, "variable\n");
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	32(%rbp), %rdx	 ; indent, tmp100
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rcx, %r9	 ; tmp99,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp101,
	call	indention	 ;
 ; D:\TC\src\output.c:118:             OUT(0, false, "variable\n");
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rax, %r9	 ; tmp102,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC12(%rip), %rax	 ;, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	fwrite	 ;
 ; D:\TC\src\output.c:119:             output_variable(class_member_ptr->content.variable, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp104
	leaq	1(%rax), %r8	 ;, _4
	movq	-8(%rbp), %rax	 ; class_member_ptr, tmp105
	movq	(%rax), %rax	 ; class_member_ptr_9->content.variable, _5
	movq	40(%rbp), %rcx	 ; parser, tmp106
	movq	24(%rbp), %rdx	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp106,
	movq	%rax, %rcx	 ; _5,
	call	output_variable	 ;
 ; D:\TC\src\output.c:120:             break;
	jmp	.L27	 ;
.L28:
 ; D:\TC\src\output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	40(%rbp), %rcx	 ; parser, tmp108
	movq	32(%rbp), %rdx	 ; indent, tmp109
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rcx, %r9	 ; tmp108,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp110,
	call	indention	 ;
 ; D:\TC\src\output.c:122:             OUT(0, false, "unknown_ClassMemberType: %u\n", class_member_ptr->type);
	movq	-8(%rbp), %rax	 ; class_member_ptr, tmp111
	movl	8(%rax), %edx	 ; class_member_ptr_9->type, _6
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movl	%edx, %r8d	 ; _6,
	leaq	.LC13(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; tmp112,
	call	fprintf	 ;
 ; D:\TC\src\output.c:123:             break;
	nop	
.L27:
 ; D:\TC\src\output.c:125: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC14:
	.ascii "members\12\0"
	.text
	.def	output_class;	.scl	3;	.type	32;	.endef
	.seh_proc	output_class
output_class:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; class, class
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:130:     Class* class_ptr = class;
	movq	16(%rbp), %rax	 ; class, tmp86
	movq	%rax, -8(%rbp)	 ; tmp86, class_ptr
 ; D:\TC\src\output.c:131:     OUT(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp87
	movq	32(%rbp), %rdx	 ; indent, tmp88
	movq	24(%rbp), %rax	 ; outfile, tmp89
	movq	%rcx, %r9	 ; tmp87,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp89,
	call	indention	 ;
 ; D:\TC\src\output.c:131:     OUT(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp90
	movq	%rax, %r9	 ; tmp90,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp91
	movq	%rax, %rcx	 ; tmp91,
	call	fwrite	 ;
 ; D:\TC\src\output.c:132:     output_name(class_ptr->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp92
	leaq	1(%rax), %r8	 ;, _1
	movq	-8(%rbp), %rax	 ; class_ptr, tmp93
	movq	(%rax), %rax	 ; class_ptr_7->name, _2
	movq	40(%rbp), %rcx	 ; parser, tmp94
	movq	24(%rbp), %rdx	 ; outfile, tmp95
	movq	%rcx, %r9	 ; tmp94,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:133:     OUT(0, true, "members\n");
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	32(%rbp), %rdx	 ; indent, tmp97
	movq	24(%rbp), %rax	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp96,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp98,
	call	indention	 ;
 ; D:\TC\src\output.c:133:     OUT(0, true, "members\n");
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rax, %r9	 ; tmp99,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC14(%rip), %rax	 ;, tmp100
	movq	%rax, %rcx	 ; tmp100,
	call	fwrite	 ;
 ; D:\TC\src\output.c:134:     list(ClassMember*) members = list_copy(class_ptr->members);
	movq	-8(%rbp), %rax	 ; class_ptr, tmp101
	movq	8(%rax), %rax	 ; class_ptr_7->members, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp102, members
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	jmp	.L30	 ;
.L31:
 ; D:\TC\src\output.c:137:         output_class_member(member, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	24(%rbp), %rdx	 ; outfile, tmp105
	movq	-24(%rbp), %rax	 ; member, tmp106
	movq	%rcx, %r9	 ; tmp104,
	movq	%rax, %rcx	 ; tmp106,
	call	output_class_member	 ;
.L30:
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	movq	-16(%rbp), %rax	 ; members, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, member
 ; D:\TC\src\output.c:136:     while ((member = (ClassMember*)list_pop(members)) != 0)
	cmpq	$0, -24(%rbp)	 ;, member
	jne	.L31	 ;,
 ; D:\TC\src\output.c:138: }
	nop	
	nop	
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC15:
	.ascii "type\12\0"
.LC16:
	.ascii "value\12\0"
.LC17:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
	.seh_proc	output_variable
output_variable:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; variable, variable
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:143:     Variable* variable_ptr = variable;
	movq	16(%rbp), %rax	 ; variable, tmp89
	movq	%rax, -8(%rbp)	 ; tmp89, variable_ptr
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp90
	movq	32(%rbp), %rdx	 ; indent, tmp91
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rcx, %r9	 ; tmp90,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp92,
	call	indention	 ;
 ; D:\TC\src\output.c:144:     OUT(0, false, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp93
	movq	%rax, %r9	 ; tmp93,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp94
	movq	%rax, %rcx	 ; tmp94,
	call	fwrite	 ;
 ; D:\TC\src\output.c:145:     output_name(variable_ptr->type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp95
	leaq	1(%rax), %r8	 ;, _1
	movq	-8(%rbp), %rax	 ; variable_ptr, tmp96
	movq	(%rax), %rax	 ; variable_ptr_10->type, _2
	movq	40(%rbp), %rcx	 ; parser, tmp97
	movq	24(%rbp), %rdx	 ; outfile, tmp98
	movq	%rcx, %r9	 ; tmp97,
	movq	%rax, %rcx	 ; _2,
	call	output_name	 ;
 ; D:\TC\src\output.c:146:     OUT(0, false, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	32(%rbp), %rdx	 ; indent, tmp100
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rcx, %r9	 ; tmp99,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp101,
	call	indention	 ;
 ; D:\TC\src\output.c:146:     OUT(0, false, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp102
	movq	%rax, %r9	 ; tmp102,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp103
	movq	%rax, %rcx	 ; tmp103,
	call	fwrite	 ;
 ; D:\TC\src\output.c:147:     output_name(variable_ptr->name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp104
	leaq	1(%rax), %r8	 ;, _3
	movq	-8(%rbp), %rax	 ; variable_ptr, tmp105
	movq	8(%rax), %rax	 ; variable_ptr_10->name, _4
	movq	40(%rbp), %rcx	 ; parser, tmp106
	movq	24(%rbp), %rdx	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp106,
	movq	%rax, %rcx	 ; _4,
	call	output_name	 ;
 ; D:\TC\src\output.c:148:     if (variable_ptr->value != 0) {
	movq	-8(%rbp), %rax	 ; variable_ptr, tmp108
	movq	16(%rax), %rax	 ; variable_ptr_10->value, _5
 ; D:\TC\src\output.c:148:     if (variable_ptr->value != 0) {
	testq	%rax, %rax	 ; _5
	je	.L33	 ;,
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:\TC\src\output.c:149:         OUT(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:\TC\src\output.c:150:         output_expression(variable_ptr->value, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp114
	leaq	1(%rax), %r8	 ;, _6
	movq	-8(%rbp), %rax	 ; variable_ptr, tmp115
	movq	16(%rax), %rax	 ; variable_ptr_10->value, _7
	movq	40(%rbp), %rcx	 ; parser, tmp116
	movq	24(%rbp), %rdx	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp116,
	movq	%rax, %rcx	 ; _7,
	call	output_expression	 ;
 ; D:\TC\src\output.c:153: }
	jmp	.L35	 ;
.L33:
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp118
	movq	32(%rbp), %rdx	 ; indent, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp118,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:\TC\src\output.c:152:         OUT(0, true, "value: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rax, %r9	 ; tmp121,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC17(%rip), %rax	 ;, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	fwrite	 ;
.L35:
 ; D:\TC\src\output.c:153: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	output_statement
output_statement:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; statement, statement
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:158:     Statement* statement_ptr = statement;
	movq	16(%rbp), %rax	 ; statement, tmp98
	movq	%rax, -8(%rbp)	 ; tmp98, statement_ptr
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp99
	movl	8(%rax), %eax	 ; statement_ptr_19->type, _1
 ; D:\TC\src\output.c:159:     switch (statement_ptr->type) {
	cmpl	$7, %eax	 ;, _1
	ja	.L37	 ;,
	movl	%eax, %eax	 ; _1, tmp100
	leaq	0(,%rax,4), %rdx	 ;, tmp101
	leaq	.L39(%rip), %rax	 ;, tmp102
	movl	(%rdx,%rax), %eax	 ;, tmp103
	cltq
	leaq	.L39(%rip), %rdx	 ;, tmp106
	addq	%rdx, %rax	 ; tmp106, tmp105
	jmp	*%rax	 ; tmp105
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
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp107
	movq	32(%rbp), %rdx	 ; indent, tmp108
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rcx, %r9	 ; tmp107,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp109,
	call	indention	 ;
 ; D:\TC\src\output.c:161:             OUT(0, false, "if_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp110
	movq	%rax, %r9	 ; tmp110,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC18(%rip), %rax	 ;, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	fwrite	 ;
 ; D:\TC\src\output.c:162:             output_if(statement_ptr->stmt.if_stmt, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp112
	leaq	1(%rax), %r8	 ;, _2
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp113
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.if_stmt, _3
	movq	40(%rbp), %rcx	 ; parser, tmp114
	movq	24(%rbp), %rdx	 ; outfile, tmp115
	movq	%rcx, %r9	 ; tmp114,
	movq	%rax, %rcx	 ; _3,
	call	output_if	 ;
 ; D:\TC\src\output.c:163:             break;
	jmp	.L36	 ;
.L42:
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp116
	movq	32(%rbp), %rdx	 ; indent, tmp117
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rcx, %r9	 ; tmp116,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp118,
	call	indention	 ;
 ; D:\TC\src\output.c:165:             OUT(0, false, "for_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rax, %r9	 ; tmp119,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC19(%rip), %rax	 ;, tmp120
	movq	%rax, %rcx	 ; tmp120,
	call	fwrite	 ;
 ; D:\TC\src\output.c:166:             output_for(statement_ptr->stmt.for_stmt, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp121
	leaq	1(%rax), %r8	 ;, _4
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp122
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.for_stmt, _5
	movq	40(%rbp), %rcx	 ; parser, tmp123
	movq	24(%rbp), %rdx	 ; outfile, tmp124
	movq	%rcx, %r9	 ; tmp123,
	movq	%rax, %rcx	 ; _5,
	call	output_for	 ;
 ; D:\TC\src\output.c:167:             break;
	jmp	.L36	 ;
.L43:
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp125
	movq	32(%rbp), %rdx	 ; indent, tmp126
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rcx, %r9	 ; tmp125,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp127,
	call	indention	 ;
 ; D:\TC\src\output.c:169:             OUT(0, false, "while_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rax, %r9	 ; tmp128,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC20(%rip), %rax	 ;, tmp129
	movq	%rax, %rcx	 ; tmp129,
	call	fwrite	 ;
 ; D:\TC\src\output.c:170:             output_while(statement_ptr->stmt.while_stmt, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp130
	leaq	1(%rax), %r8	 ;, _6
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp131
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.while_stmt, _7
	movq	40(%rbp), %rcx	 ; parser, tmp132
	movq	24(%rbp), %rdx	 ; outfile, tmp133
	movq	%rcx, %r9	 ; tmp132,
	movq	%rax, %rcx	 ; _7,
	call	output_while	 ;
 ; D:\TC\src\output.c:171:             break;
	jmp	.L36	 ;
.L45:
 ; D:\TC\src\output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp134
	movq	32(%rbp), %rdx	 ; indent, tmp135
	movq	24(%rbp), %rax	 ; outfile, tmp136
	movq	%rcx, %r9	 ; tmp134,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp136,
	call	indention	 ;
 ; D:\TC\src\output.c:173:             OUT(0, false, "variable_declaration_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp137
	movq	%rax, %r9	 ; tmp137,
	movl	$31, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC21(%rip), %rax	 ;, tmp138
	movq	%rax, %rcx	 ; tmp138,
	call	fwrite	 ;
 ; D:\TC\src\output.c:174:             output_variable(statement_ptr->stmt.var, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp139
	leaq	1(%rax), %r8	 ;, _8
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp140
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.var, _9
	movq	40(%rbp), %rcx	 ; parser, tmp141
	movq	24(%rbp), %rdx	 ; outfile, tmp142
	movq	%rcx, %r9	 ; tmp141,
	movq	%rax, %rcx	 ; _9,
	call	output_variable	 ;
 ; D:\TC\src\output.c:175:             break;
	jmp	.L36	 ;
.L41:
 ; D:\TC\src\output.c:177:             if (statement_ptr->stmt.expr == 0) {
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp143
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.expr, _10
 ; D:\TC\src\output.c:177:             if (statement_ptr->stmt.expr == 0) {
	testq	%rax, %rax	 ; _10
	jne	.L48	 ;,
 ; D:\TC\src\output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp144
	movq	32(%rbp), %rdx	 ; indent, tmp145
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rcx, %r9	 ; tmp144,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp146,
	call	indention	 ;
 ; D:\TC\src\output.c:178:                 OUT(0, false, "return_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp147
	movq	%rax, %r9	 ; tmp147,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC22(%rip), %rax	 ;, tmp148
	movq	%rax, %rcx	 ; tmp148,
	call	fwrite	 ;
 ; D:\TC\src\output.c:179:                 return;
	jmp	.L36	 ;
.L48:
 ; D:\TC\src\output.c:181:             OUT(0, false, "return_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp149
	movq	32(%rbp), %rdx	 ; indent, tmp150
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rcx, %r9	 ; tmp149,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp151,
	call	indention	 ;
 ; D:\TC\src\output.c:181:             OUT(0, false, "return_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp152
	movq	%rax, %r9	 ; tmp152,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC23(%rip), %rax	 ;, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	fwrite	 ;
 ; D:\TC\src\output.c:182:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp154
	leaq	1(%rax), %r8	 ;, _11
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp155
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.expr, _12
	movq	40(%rbp), %rcx	 ; parser, tmp156
	movq	24(%rbp), %rdx	 ; outfile, tmp157
	movq	%rcx, %r9	 ; tmp156,
	movq	%rax, %rcx	 ; _12,
	call	output_expression	 ;
 ; D:\TC\src\output.c:183:             break;
	jmp	.L36	 ;
.L40:
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp158
	movq	32(%rbp), %rdx	 ; indent, tmp159
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rcx, %r9	 ; tmp158,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp160,
	call	indention	 ;
 ; D:\TC\src\output.c:185:             OUT(0, false, "break_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp161
	movq	%rax, %r9	 ; tmp161,
	movl	$24, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC24(%rip), %rax	 ;, tmp162
	movq	%rax, %rcx	 ; tmp162,
	call	fwrite	 ;
 ; D:\TC\src\output.c:186:             return;
	jmp	.L36	 ;
.L38:
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp163
	movq	32(%rbp), %rdx	 ; indent, tmp164
	movq	24(%rbp), %rax	 ; outfile, tmp165
	movq	%rcx, %r9	 ; tmp163,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp165,
	call	indention	 ;
 ; D:\TC\src\output.c:188:             OUT(0, false, "continue_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp166
	movq	%rax, %r9	 ; tmp166,
	movl	$27, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC25(%rip), %rax	 ;, tmp167
	movq	%rax, %rcx	 ; tmp167,
	call	fwrite	 ;
 ; D:\TC\src\output.c:189:             return;
	jmp	.L36	 ;
.L46:
 ; D:\TC\src\output.c:191:             if (statement_ptr->stmt.expr == 0) {
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp168
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.expr, _13
 ; D:\TC\src\output.c:191:             if (statement_ptr->stmt.expr == 0) {
	testq	%rax, %rax	 ; _13
	jne	.L49	 ;,
 ; D:\TC\src\output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp169
	movq	32(%rbp), %rdx	 ; indent, tmp170
	movq	24(%rbp), %rax	 ; outfile, tmp171
	movq	%rcx, %r9	 ; tmp169,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp171,
	call	indention	 ;
 ; D:\TC\src\output.c:192:                 OUT(0, false, "expression_statement: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp172
	movq	%rax, %r9	 ; tmp172,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC26(%rip), %rax	 ;, tmp173
	movq	%rax, %rcx	 ; tmp173,
	call	fwrite	 ;
 ; D:\TC\src\output.c:193:                 return;
	jmp	.L36	 ;
.L49:
 ; D:\TC\src\output.c:195:             OUT(0, false, "expression_statement\n");
	movq	40(%rbp), %rcx	 ; parser, tmp174
	movq	32(%rbp), %rdx	 ; indent, tmp175
	movq	24(%rbp), %rax	 ; outfile, tmp176
	movq	%rcx, %r9	 ; tmp174,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp176,
	call	indention	 ;
 ; D:\TC\src\output.c:195:             OUT(0, false, "expression_statement\n");
	movq	24(%rbp), %rax	 ; outfile, tmp177
	movq	%rax, %r9	 ; tmp177,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC27(%rip), %rax	 ;, tmp178
	movq	%rax, %rcx	 ; tmp178,
	call	fwrite	 ;
 ; D:\TC\src\output.c:196:             output_expression(statement_ptr->stmt.expr, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp179
	leaq	1(%rax), %r8	 ;, _14
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp180
	movq	(%rax), %rax	 ; statement_ptr_19->stmt.expr, _15
	movq	40(%rbp), %rcx	 ; parser, tmp181
	movq	24(%rbp), %rdx	 ; outfile, tmp182
	movq	%rcx, %r9	 ; tmp181,
	movq	%rax, %rcx	 ; _15,
	call	output_expression	 ;
 ; D:\TC\src\output.c:197:             break;
	jmp	.L36	 ;
.L37:
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movq	40(%rbp), %rcx	 ; parser, tmp183
	movq	32(%rbp), %rdx	 ; indent, tmp184
	movq	24(%rbp), %rax	 ; outfile, tmp185
	movq	%rcx, %r9	 ; tmp183,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp185,
	call	indention	 ;
 ; D:\TC\src\output.c:199:             OUT(0, false, "unknown_StatementType: %u\n", statement_ptr->type);
	movq	-8(%rbp), %rax	 ; statement_ptr, tmp186
	movl	8(%rax), %edx	 ; statement_ptr_19->type, _16
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movl	%edx, %r8d	 ; _16,
	leaq	.LC28(%rip), %rdx	 ;, tmp188
	movq	%rax, %rcx	 ; tmp187,
	call	fprintf	 ;
 ; D:\TC\src\output.c:200:             return;
	nop	
.L36:
 ; D:\TC\src\output.c:202: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC29:
	.ascii "condition\12\0"
.LC30:
	.ascii "else_if\12\0"
.LC31:
	.ascii "else_body\12\0"
	.text
	.def	output_if;	.scl	3;	.type	32;	.endef
	.seh_proc	output_if
output_if:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; if_, if_
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:207:     If* if_ptr = if_;
	movq	16(%rbp), %rax	 ; if_, tmp90
	movq	%rax, -8(%rbp)	 ; tmp90, if_ptr
 ; D:\TC\src\output.c:208:     list(Statement*) body = list_copy(if_ptr->body);
	movq	-8(%rbp), %rax	 ; if_ptr, tmp91
	movq	8(%rax), %rax	 ; if_ptr_13->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp92, body
 ; D:\TC\src\output.c:209:     list(ElseIf*) else_if_list = list_copy(if_ptr->else_if);
	movq	-8(%rbp), %rax	 ; if_ptr, tmp93
	movq	16(%rax), %rax	 ; if_ptr_13->else_if, _2
	movq	%rax, %rcx	 ; _2,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp94, else_if_list
 ; D:\TC\src\output.c:210:     list(Statement*) else_body = list_copy(if_ptr->else_body);
	movq	-8(%rbp), %rax	 ; if_ptr, tmp95
	movq	24(%rax), %rax	 ; if_ptr_13->else_body, _3
	movq	%rax, %rcx	 ; _3,
	call	list_copy	 ;
	movq	%rax, -32(%rbp)	 ; tmp96, else_body
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp97
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp97,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	indention	 ;
 ; D:\TC\src\output.c:211:     OUT(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %r9	 ; tmp100,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	fwrite	 ;
 ; D:\TC\src\output.c:212:     output_expression(if_ptr->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _4
	movq	-8(%rbp), %rax	 ; if_ptr, tmp103
	movq	(%rax), %rax	 ; if_ptr_13->condition, _5
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	24(%rbp), %rdx	 ; outfile, tmp105
	movq	%rcx, %r9	 ; tmp104,
	movq	%rax, %rcx	 ; _5,
	call	output_expression	 ;
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp106
	movq	32(%rbp), %rdx	 ; indent, tmp107
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	indention	 ;
 ; D:\TC\src\output.c:213:     OUT(0, false, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	fwrite	 ;
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L51	 ;
.L52:
 ; D:\TC\src\output.c:216:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp111
	leaq	1(%rax), %r8	 ;, _6
	movq	40(%rbp), %rcx	 ; parser, tmp112
	movq	24(%rbp), %rdx	 ; outfile, tmp113
	movq	-40(%rbp), %rax	 ; statement, tmp114
	movq	%rcx, %r9	 ; tmp112,
	movq	%rax, %rcx	 ; tmp114,
	call	output_statement	 ;
.L51:
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	 ; body, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp116, statement
 ; D:\TC\src\output.c:215:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L52	 ;,
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	movq	40(%rbp), %rcx	 ; parser, tmp117
	movq	32(%rbp), %rdx	 ; indent, tmp118
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp117,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp119,
	call	indention	 ;
 ; D:\TC\src\output.c:217:     OUT(0, false, "else_if\n");
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC30(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	jmp	.L53	 ;
.L54:
 ; D:\TC\src\output.c:220:         output_else_if(else_if, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp122
	leaq	1(%rax), %r8	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp123
	movq	24(%rbp), %rdx	 ; outfile, tmp124
	movq	-48(%rbp), %rax	 ; else_if, tmp125
	movq	%rcx, %r9	 ; tmp123,
	movq	%rax, %rcx	 ; tmp125,
	call	output_else_if	 ;
.L53:
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	movq	-24(%rbp), %rax	 ; else_if_list, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	list_pop	 ;
	movq	%rax, -48(%rbp)	 ; tmp127, else_if
 ; D:\TC\src\output.c:219:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != 0)
	cmpq	$0, -48(%rbp)	 ;, else_if
	jne	.L54	 ;,
 ; D:\TC\src\output.c:221:     OUT(0, true, "else_body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp128
	movq	32(%rbp), %rdx	 ; indent, tmp129
	movq	24(%rbp), %rax	 ; outfile, tmp130
	movq	%rcx, %r9	 ; tmp128,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp130,
	call	indention	 ;
 ; D:\TC\src\output.c:221:     OUT(0, true, "else_body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movq	%rax, %r9	 ; tmp131,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC31(%rip), %rax	 ;, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	fwrite	 ;
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	jmp	.L55	 ;
.L56:
 ; D:\TC\src\output.c:223:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp133
	leaq	1(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp134
	movq	24(%rbp), %rdx	 ; outfile, tmp135
	movq	-40(%rbp), %rax	 ; statement, tmp136
	movq	%rcx, %r9	 ; tmp134,
	movq	%rax, %rcx	 ; tmp136,
	call	output_statement	 ;
.L55:
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	movq	-32(%rbp), %rax	 ; else_body, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	list_pop	 ;
	movq	%rax, -40(%rbp)	 ; tmp138, statement
 ; D:\TC\src\output.c:222:     while ((statement = (Statement*)list_pop(else_body)) != 0)
	cmpq	$0, -40(%rbp)	 ;, statement
	jne	.L56	 ;,
 ; D:\TC\src\output.c:224: }
	nop	
	nop	
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	output_else_if;	.scl	3;	.type	32;	.endef
	.seh_proc	output_else_if
output_else_if:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; else_if, else_if
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:229:     ElseIf* else_if_ptr = else_if;
	movq	16(%rbp), %rax	 ; else_if, tmp86
	movq	%rax, -8(%rbp)	 ; tmp86, else_if_ptr
 ; D:\TC\src\output.c:230:     list(Statement*) body = list_copy(else_if_ptr->body);
	movq	-8(%rbp), %rax	 ; else_if_ptr, tmp87
	movq	8(%rax), %rax	 ; else_if_ptr_7->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp88, body
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp89
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rcx, %r9	 ; tmp89,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	indention	 ;
 ; D:\TC\src\output.c:231:     OUT(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:\TC\src\output.c:232:     output_expression(else_if_ptr->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp94
	leaq	1(%rax), %r8	 ;, _2
	movq	-8(%rbp), %rax	 ; else_if_ptr, tmp95
	movq	(%rax), %rax	 ; else_if_ptr_7->condition, _3
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	24(%rbp), %rdx	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp96,
	movq	%rax, %rcx	 ; _3,
	call	output_expression	 ;
 ; D:\TC\src\output.c:233:     OUT(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:\TC\src\output.c:233:     OUT(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rax, %r9	 ; tmp101,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	fwrite	 ;
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L58	 ;
.L59:
 ; D:\TC\src\output.c:236:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	24(%rbp), %rdx	 ; outfile, tmp105
	movq	-24(%rbp), %rax	 ; statement, tmp106
	movq	%rcx, %r9	 ; tmp104,
	movq	%rax, %rcx	 ; tmp106,
	call	output_statement	 ;
.L58:
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	 ; body, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, statement
 ; D:\TC\src\output.c:235:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -24(%rbp)	 ;, statement
	jne	.L59	 ;,
 ; D:\TC\src\output.c:237: }
	nop	
	nop	
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	output_for
output_for:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; for_, for_
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:242:     For* for_ptr = for_;
	movq	16(%rbp), %rax	 ; for_, tmp93
	movq	%rax, -8(%rbp)	 ; tmp93, for_ptr
 ; D:\TC\src\output.c:243:     list(Statement*) body = list_copy(for_ptr->body);
	movq	-8(%rbp), %rax	 ; for_ptr, tmp94
	movq	24(%rax), %rax	 ; for_ptr_17->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp95, body
 ; D:\TC\src\output.c:244:     if (for_ptr->initializer != 0) {
	movq	-8(%rbp), %rax	 ; for_ptr, tmp96
	movq	(%rax), %rax	 ; for_ptr_17->initializer, _2
 ; D:\TC\src\output.c:244:     if (for_ptr->initializer != 0) {
	testq	%rax, %rax	 ; _2
	je	.L61	 ;,
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	movq	40(%rbp), %rcx	 ; parser, tmp97
	movq	32(%rbp), %rdx	 ; indent, tmp98
	movq	24(%rbp), %rax	 ; outfile, tmp99
	movq	%rcx, %r9	 ; tmp97,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp99,
	call	indention	 ;
 ; D:\TC\src\output.c:245:         OUT(0, false, "initializer\n");
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rax, %r9	 ; tmp100,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC32(%rip), %rax	 ;, tmp101
	movq	%rax, %rcx	 ; tmp101,
	call	fwrite	 ;
 ; D:\TC\src\output.c:246:         output_variable(for_ptr->initializer, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp102
	leaq	1(%rax), %r8	 ;, _3
	movq	-8(%rbp), %rax	 ; for_ptr, tmp103
	movq	(%rax), %rax	 ; for_ptr_17->initializer, _4
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	24(%rbp), %rdx	 ; outfile, tmp105
	movq	%rcx, %r9	 ; tmp104,
	movq	%rax, %rcx	 ; _4,
	call	output_variable	 ;
	jmp	.L62	 ;
.L61:
 ; D:\TC\src\output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp106
	movq	32(%rbp), %rdx	 ; indent, tmp107
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	indention	 ;
 ; D:\TC\src\output.c:248:         OUT(0, false, "initializer: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$20, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC33(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	fwrite	 ;
.L62:
 ; D:\TC\src\output.c:249:     if (for_ptr->condition != 0) {
	movq	-8(%rbp), %rax	 ; for_ptr, tmp111
	movq	8(%rax), %rax	 ; for_ptr_17->condition, _5
 ; D:\TC\src\output.c:249:     if (for_ptr->condition != 0) {
	testq	%rax, %rax	 ; _5
	je	.L63	 ;,
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp112
	movq	32(%rbp), %rdx	 ; indent, tmp113
	movq	24(%rbp), %rax	 ; outfile, tmp114
	movq	%rcx, %r9	 ; tmp112,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp114,
	call	indention	 ;
 ; D:\TC\src\output.c:250:         OUT(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp115
	movq	%rax, %r9	 ; tmp115,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	fwrite	 ;
 ; D:\TC\src\output.c:251:         output_expression(for_ptr->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp117
	leaq	1(%rax), %r8	 ;, _6
	movq	-8(%rbp), %rax	 ; for_ptr, tmp118
	movq	8(%rax), %rax	 ; for_ptr_17->condition, _7
	movq	40(%rbp), %rcx	 ; parser, tmp119
	movq	24(%rbp), %rdx	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp119,
	movq	%rax, %rcx	 ; _7,
	call	output_expression	 ;
	jmp	.L64	 ;
.L63:
 ; D:\TC\src\output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp121
	movq	32(%rbp), %rdx	 ; indent, tmp122
	movq	24(%rbp), %rax	 ; outfile, tmp123
	movq	%rcx, %r9	 ; tmp121,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp123,
	call	indention	 ;
 ; D:\TC\src\output.c:253:         OUT(0, false, "condition: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp124
	movq	%rax, %r9	 ; tmp124,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC34(%rip), %rax	 ;, tmp125
	movq	%rax, %rcx	 ; tmp125,
	call	fwrite	 ;
.L64:
 ; D:\TC\src\output.c:254:     if (for_ptr->increment != 0) {
	movq	-8(%rbp), %rax	 ; for_ptr, tmp126
	movq	16(%rax), %rax	 ; for_ptr_17->increment, _8
 ; D:\TC\src\output.c:254:     if (for_ptr->increment != 0) {
	testq	%rax, %rax	 ; _8
	je	.L65	 ;,
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
	movq	40(%rbp), %rcx	 ; parser, tmp127
	movq	32(%rbp), %rdx	 ; indent, tmp128
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rcx, %r9	 ; tmp127,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp129,
	call	indention	 ;
 ; D:\TC\src\output.c:255:         OUT(0, false, "increment\n");
	movq	24(%rbp), %rax	 ; outfile, tmp130
	movq	%rax, %r9	 ; tmp130,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC35(%rip), %rax	 ;, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	fwrite	 ;
 ; D:\TC\src\output.c:256:         output_expression(for_ptr->increment, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp132
	leaq	1(%rax), %r8	 ;, _9
	movq	-8(%rbp), %rax	 ; for_ptr, tmp133
	movq	16(%rax), %rax	 ; for_ptr_17->increment, _10
	movq	40(%rbp), %rcx	 ; parser, tmp134
	movq	24(%rbp), %rdx	 ; outfile, tmp135
	movq	%rcx, %r9	 ; tmp134,
	movq	%rax, %rcx	 ; _10,
	call	output_expression	 ;
	jmp	.L66	 ;
.L65:
 ; D:\TC\src\output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp136
	movq	32(%rbp), %rdx	 ; indent, tmp137
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rcx, %r9	 ; tmp136,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp138,
	call	indention	 ;
 ; D:\TC\src\output.c:258:         OUT(0, false, "increment: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movq	%rax, %r9	 ; tmp139,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC36(%rip), %rax	 ;, tmp140
	movq	%rax, %rcx	 ; tmp140,
	call	fwrite	 ;
.L66:
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp141
	movq	32(%rbp), %rdx	 ; indent, tmp142
	movq	24(%rbp), %rax	 ; outfile, tmp143
	movq	%rcx, %r9	 ; tmp141,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp143,
	call	indention	 ;
 ; D:\TC\src\output.c:259:     OUT(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp144
	movq	%rax, %r9	 ; tmp144,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	fwrite	 ;
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L67	 ;
.L68:
 ; D:\TC\src\output.c:262:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp146
	leaq	1(%rax), %r8	 ;, _11
	movq	40(%rbp), %rcx	 ; parser, tmp147
	movq	24(%rbp), %rdx	 ; outfile, tmp148
	movq	-24(%rbp), %rax	 ; statement, tmp149
	movq	%rcx, %r9	 ; tmp147,
	movq	%rax, %rcx	 ; tmp149,
	call	output_statement	 ;
.L67:
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	 ; body, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp151, statement
 ; D:\TC\src\output.c:261:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -24(%rbp)	 ;, statement
	jne	.L68	 ;,
 ; D:\TC\src\output.c:263: }
	nop	
	nop	
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.def	output_while;	.scl	3;	.type	32;	.endef
	.seh_proc	output_while
output_while:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; while_, while_
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:268:     While* while_ptr = while_;
	movq	16(%rbp), %rax	 ; while_, tmp86
	movq	%rax, -8(%rbp)	 ; tmp86, while_ptr
 ; D:\TC\src\output.c:269:     list(Statement*) body = list_copy(while_ptr->body);
	movq	-8(%rbp), %rax	 ; while_ptr, tmp87
	movq	8(%rax), %rax	 ; while_ptr_7->body, _1
	movq	%rax, %rcx	 ; _1,
	call	list_copy	 ;
	movq	%rax, -16(%rbp)	 ; tmp88, body
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	movq	40(%rbp), %rcx	 ; parser, tmp89
	movq	32(%rbp), %rdx	 ; indent, tmp90
	movq	24(%rbp), %rax	 ; outfile, tmp91
	movq	%rcx, %r9	 ; tmp89,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp91,
	call	indention	 ;
 ; D:\TC\src\output.c:270:     OUT(0, false, "condition\n");
	movq	24(%rbp), %rax	 ; outfile, tmp92
	movq	%rax, %r9	 ; tmp92,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC29(%rip), %rax	 ;, tmp93
	movq	%rax, %rcx	 ; tmp93,
	call	fwrite	 ;
 ; D:\TC\src\output.c:271:     output_expression(while_ptr->condition, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp94
	leaq	1(%rax), %r8	 ;, _2
	movq	-8(%rbp), %rax	 ; while_ptr, tmp95
	movq	(%rax), %rax	 ; while_ptr_7->condition, _3
	movq	40(%rbp), %rcx	 ; parser, tmp96
	movq	24(%rbp), %rdx	 ; outfile, tmp97
	movq	%rcx, %r9	 ; tmp96,
	movq	%rax, %rcx	 ; _3,
	call	output_expression	 ;
 ; D:\TC\src\output.c:272:     OUT(0, true, "body\n");
	movq	40(%rbp), %rcx	 ; parser, tmp98
	movq	32(%rbp), %rdx	 ; indent, tmp99
	movq	24(%rbp), %rax	 ; outfile, tmp100
	movq	%rcx, %r9	 ; tmp98,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp100,
	call	indention	 ;
 ; D:\TC\src\output.c:272:     OUT(0, true, "body\n");
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rax, %r9	 ; tmp101,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC10(%rip), %rax	 ;, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	fwrite	 ;
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	jmp	.L70	 ;
.L71:
 ; D:\TC\src\output.c:275:         output_statement(statement, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp103
	leaq	1(%rax), %r8	 ;, _4
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	24(%rbp), %rdx	 ; outfile, tmp105
	movq	-24(%rbp), %rax	 ; statement, tmp106
	movq	%rcx, %r9	 ; tmp104,
	movq	%rax, %rcx	 ; tmp106,
	call	output_statement	 ;
.L70:
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	movq	-16(%rbp), %rax	 ; body, tmp107
	movq	%rax, %rcx	 ; tmp107,
	call	list_pop	 ;
	movq	%rax, -24(%rbp)	 ; tmp108, statement
 ; D:\TC\src\output.c:274:     while ((statement = (Statement*)list_pop(body)) != 0)
	cmpq	$0, -24(%rbp)	 ;, statement
	jne	.L71	 ;,
 ; D:\TC\src\output.c:276: }
	nop	
	nop	
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	output_expression
output_expression:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; expression, expression
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:281:     Expression* expression_ptr = expression;
	movq	16(%rbp), %rax	 ; expression, tmp91
	movq	%rax, -8(%rbp)	 ; tmp91, expression_ptr
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	movq	-8(%rbp), %rax	 ; expression_ptr, tmp92
	movl	24(%rax), %eax	 ; expression_ptr_12->operator, _1
 ; D:\TC\src\output.c:282:     if (expression_ptr->operator == OP_NONE) {
	cmpl	$19, %eax	 ;, _1
	jne	.L73	 ;,
 ; D:\TC\src\output.c:283:         OUT(0, true, "primary\n");
	movq	40(%rbp), %rcx	 ; parser, tmp93
	movq	32(%rbp), %rdx	 ; indent, tmp94
	movq	24(%rbp), %rax	 ; outfile, tmp95
	movq	%rcx, %r9	 ; tmp93,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp95,
	call	indention	 ;
 ; D:\TC\src\output.c:283:         OUT(0, true, "primary\n");
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rax, %r9	 ; tmp96,
	movl	$8, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC37(%rip), %rax	 ;, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	fwrite	 ;
 ; D:\TC\src\output.c:284:         output_primary(expression_ptr->prim_left, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp98
	leaq	1(%rax), %r8	 ;, _2
	movq	-8(%rbp), %rax	 ; expression_ptr, tmp99
	movq	8(%rax), %rax	 ; expression_ptr_12->prim_left, _3
	movq	40(%rbp), %rcx	 ; parser, tmp100
	movq	24(%rbp), %rdx	 ; outfile, tmp101
	movq	%rcx, %r9	 ; tmp100,
	movq	%rax, %rcx	 ; _3,
	call	output_primary	 ;
 ; D:\TC\src\output.c:293: }
	jmp	.L77	 ;
.L73:
 ; D:\TC\src\output.c:286:         string op_str = operator_to_string(expression_ptr->operator);
	movq	-8(%rbp), %rax	 ; expression_ptr, tmp102
	movl	24(%rax), %eax	 ; expression_ptr_12->operator, _4
	movl	%eax, %ecx	 ; _4,
	call	operator_to_string	 ;
	movq	%rax, -16(%rbp)	 ; tmp103, op_str
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	32(%rbp), %rdx	 ; indent, tmp105
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp104,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp106,
	call	indention	 ;
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	cmpq	$0, -16(%rbp)	 ;, op_str
	je	.L75	 ;,
	movq	-16(%rbp), %rax	 ; op_str, iftmp.1_9
	jmp	.L76	 ;
.L75:
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	leaq	.LC38(%rip), %rax	 ;, iftmp.1_9
.L76:
 ; D:\TC\src\output.c:287:         OUT(0, false, "operator: \"%s\"\n", op_str ? (op_str) : "UNKNOWN_OPERATOR");
	movq	24(%rbp), %rcx	 ; outfile, tmp107
	movq	%rax, %r8	 ; iftmp.1_9,
	leaq	.LC39(%rip), %rax	 ;, tmp108
	movq	%rax, %rdx	 ; tmp108,
	call	fprintf	 ;
 ; D:\TC\src\output.c:288:         OUT(0, false, "left\n");
	movq	40(%rbp), %rcx	 ; parser, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:\TC\src\output.c:288:         OUT(0, false, "left\n");
	movq	24(%rbp), %rax	 ; outfile, tmp112
	movq	%rax, %r9	 ; tmp112,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC40(%rip), %rax	 ;, tmp113
	movq	%rax, %rcx	 ; tmp113,
	call	fwrite	 ;
 ; D:\TC\src\output.c:289:         output_expression(expression_ptr->expr_left, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp114
	leaq	1(%rax), %r8	 ;, _5
	movq	-8(%rbp), %rax	 ; expression_ptr, tmp115
	movq	(%rax), %rax	 ; expression_ptr_12->expr_left, _6
	movq	40(%rbp), %rcx	 ; parser, tmp116
	movq	24(%rbp), %rdx	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp116,
	movq	%rax, %rcx	 ; _6,
	call	output_expression	 ;
 ; D:\TC\src\output.c:290:         OUT(0, true, "right\n");
	movq	40(%rbp), %rcx	 ; parser, tmp118
	movq	32(%rbp), %rdx	 ; indent, tmp119
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rcx, %r9	 ; tmp118,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp120,
	call	indention	 ;
 ; D:\TC\src\output.c:290:         OUT(0, true, "right\n");
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rax, %r9	 ; tmp121,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC41(%rip), %rax	 ;, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	fwrite	 ;
 ; D:\TC\src\output.c:291:         output_expression(expression_ptr->right, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp123
	leaq	1(%rax), %r8	 ;, _7
	movq	-8(%rbp), %rax	 ; expression_ptr, tmp124
	movq	16(%rax), %rax	 ; expression_ptr_12->right, _8
	movq	40(%rbp), %rcx	 ; parser, tmp125
	movq	24(%rbp), %rdx	 ; outfile, tmp126
	movq	%rcx, %r9	 ; tmp125,
	movq	%rax, %rcx	 ; _8,
	call	output_expression	 ;
.L77:
 ; D:\TC\src\output.c:293: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	output_primary
output_primary:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; primary, primary
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:298:     Primary* primary_ptr = primary;
	movq	16(%rbp), %rax	 ; primary, tmp95
	movq	%rax, -8(%rbp)	 ; tmp95, primary_ptr
 ; D:\TC\src\output.c:299:     switch (primary_ptr->type) {
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp96
	movl	8(%rax), %eax	 ; primary_ptr_16->type, _1
 ; D:\TC\src\output.c:299:     switch (primary_ptr->type) {
	cmpl	$8, %eax	 ;, _1
	ja	.L79	 ;,
	movl	%eax, %eax	 ; _1, tmp97
	leaq	0(,%rax,4), %rdx	 ;, tmp98
	leaq	.L81(%rip), %rax	 ;, tmp99
	movl	(%rdx,%rax), %eax	 ;, tmp100
	cltq
	leaq	.L81(%rip), %rdx	 ;, tmp103
	addq	%rdx, %rax	 ; tmp103, tmp102
	jmp	*%rax	 ; tmp102
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
 ; D:\TC\src\output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp104
	movq	32(%rbp), %rdx	 ; indent, tmp105
	movq	24(%rbp), %rax	 ; outfile, tmp106
	movq	%rcx, %r9	 ; tmp104,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp106,
	call	indention	 ;
 ; D:\TC\src\output.c:301:             OUT(0, false, "type: \"integer\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rax, %r9	 ; tmp107,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC42(%rip), %rax	 ;, tmp108
	movq	%rax, %rcx	 ; tmp108,
	call	fwrite	 ;
 ; D:\TC\src\output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	40(%rbp), %rcx	 ; parser, tmp109
	movq	32(%rbp), %rdx	 ; indent, tmp110
	movq	24(%rbp), %rax	 ; outfile, tmp111
	movq	%rcx, %r9	 ; tmp109,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp111,
	call	indention	 ;
 ; D:\TC\src\output.c:302:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp112
	movq	(%rax), %rdx	 ; primary_ptr_16->value.literal_value, _2
	movq	24(%rbp), %rax	 ; outfile, tmp113
	movq	%rdx, %r8	 ; _2,
	leaq	.LC43(%rip), %rdx	 ;, tmp114
	movq	%rax, %rcx	 ; tmp113,
	call	fprintf	 ;
 ; D:\TC\src\output.c:303:             break;
	jmp	.L90	 ;
.L88:
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp115
	movq	32(%rbp), %rdx	 ; indent, tmp116
	movq	24(%rbp), %rax	 ; outfile, tmp117
	movq	%rcx, %r9	 ; tmp115,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp117,
	call	indention	 ;
 ; D:\TC\src\output.c:305:             OUT(0, false, "type: \"float\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp118
	movq	%rax, %r9	 ; tmp118,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC44(%rip), %rax	 ;, tmp119
	movq	%rax, %rcx	 ; tmp119,
	call	fwrite	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	40(%rbp), %rcx	 ; parser, tmp120
	movq	32(%rbp), %rdx	 ; indent, tmp121
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rcx, %r9	 ; tmp120,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp122,
	call	indention	 ;
 ; D:\TC\src\output.c:306:             OUT(0, true, "value: %s\n", (primary_ptr->value.literal_value));
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp123
	movq	(%rax), %rdx	 ; primary_ptr_16->value.literal_value, _3
	movq	24(%rbp), %rax	 ; outfile, tmp124
	movq	%rdx, %r8	 ; _3,
	leaq	.LC43(%rip), %rdx	 ;, tmp125
	movq	%rax, %rcx	 ; tmp124,
	call	fprintf	 ;
 ; D:\TC\src\output.c:307:             break;
	jmp	.L90	 ;
.L87:
 ; D:\TC\src\output.c:309:             OUT(0, false, "type: \"string\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp126
	movq	32(%rbp), %rdx	 ; indent, tmp127
	movq	24(%rbp), %rax	 ; outfile, tmp128
	movq	%rcx, %r9	 ; tmp126,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp128,
	call	indention	 ;
 ; D:\TC\src\output.c:309:             OUT(0, false, "type: \"string\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp129
	movq	%rax, %r9	 ; tmp129,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC45(%rip), %rax	 ;, tmp130
	movq	%rax, %rcx	 ; tmp130,
	call	fwrite	 ;
 ; D:\TC\src\output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	40(%rbp), %rcx	 ; parser, tmp131
	movq	32(%rbp), %rdx	 ; indent, tmp132
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rcx, %r9	 ; tmp131,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp133,
	call	indention	 ;
 ; D:\TC\src\output.c:310:             OUT(0, true, "value: \"%s\"\n", (primary_ptr->value.literal_value));
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp134
	movq	(%rax), %rdx	 ; primary_ptr_16->value.literal_value, _4
	movq	24(%rbp), %rax	 ; outfile, tmp135
	movq	%rdx, %r8	 ; _4,
	leaq	.LC46(%rip), %rdx	 ;, tmp136
	movq	%rax, %rcx	 ; tmp135,
	call	fprintf	 ;
 ; D:\TC\src\output.c:311:             break;
	jmp	.L90	 ;
.L86:
 ; D:\TC\src\output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp137
	movq	32(%rbp), %rdx	 ; indent, tmp138
	movq	24(%rbp), %rax	 ; outfile, tmp139
	movq	%rcx, %r9	 ; tmp137,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp139,
	call	indention	 ;
 ; D:\TC\src\output.c:313:             OUT(0, false, "type: \"boolean\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp140
	movq	%rax, %r9	 ; tmp140,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rax	 ;, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	fwrite	 ;
 ; D:\TC\src\output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp142
	movq	32(%rbp), %rdx	 ; indent, tmp143
	movq	24(%rbp), %rax	 ; outfile, tmp144
	movq	%rcx, %r9	 ; tmp142,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp144,
	call	indention	 ;
 ; D:\TC\src\output.c:314:             OUT(0, true, "value: \"true\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp145
	movq	%rax, %r9	 ; tmp145,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC48(%rip), %rax	 ;, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	fwrite	 ;
 ; D:\TC\src\output.c:315:             break;
	jmp	.L90	 ;
.L85:
 ; D:\TC\src\output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp147
	movq	32(%rbp), %rdx	 ; indent, tmp148
	movq	24(%rbp), %rax	 ; outfile, tmp149
	movq	%rcx, %r9	 ; tmp147,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp149,
	call	indention	 ;
 ; D:\TC\src\output.c:317:             OUT(0, false, "type: \"boolean\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rax, %r9	 ; tmp150,
	movl	$16, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC47(%rip), %rax	 ;, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	fwrite	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp152
	movq	32(%rbp), %rdx	 ; indent, tmp153
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rcx, %r9	 ; tmp152,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp154,
	call	indention	 ;
 ; D:\TC\src\output.c:318:             OUT(0, true, "value: \"false\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rax, %r9	 ; tmp155,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC49(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	fwrite	 ;
 ; D:\TC\src\output.c:319:             break;
	jmp	.L90	 ;
.L84:
 ; D:\TC\src\output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp157
	movq	32(%rbp), %rdx	 ; indent, tmp158
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rcx, %r9	 ; tmp157,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp159,
	call	indention	 ;
 ; D:\TC\src\output.c:321:             OUT(0, false, "type: \"expression\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rax, %r9	 ; tmp160,
	movl	$19, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC50(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	fwrite	 ;
 ; D:\TC\src\output.c:322:             OUT(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp162
	movq	32(%rbp), %rdx	 ; indent, tmp163
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rcx, %r9	 ; tmp162,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp164,
	call	indention	 ;
 ; D:\TC\src\output.c:322:             OUT(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp165
	movq	%rax, %r9	 ; tmp165,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	fwrite	 ;
 ; D:\TC\src\output.c:323:             output_expression(primary_ptr->value.expr, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp167
	leaq	1(%rax), %r8	 ;, _5
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp168
	movq	(%rax), %rax	 ; primary_ptr_16->value.expr, _6
	movq	40(%rbp), %rcx	 ; parser, tmp169
	movq	24(%rbp), %rdx	 ; outfile, tmp170
	movq	%rcx, %r9	 ; tmp169,
	movq	%rax, %rcx	 ; _6,
	call	output_expression	 ;
 ; D:\TC\src\output.c:324:             break;
	jmp	.L90	 ;
.L83:
 ; D:\TC\src\output.c:326:             OUT(0, false, "type: \"!\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp171
	movq	32(%rbp), %rdx	 ; indent, tmp172
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rcx, %r9	 ; tmp171,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp173,
	call	indention	 ;
 ; D:\TC\src\output.c:326:             OUT(0, false, "type: \"!\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp174
	movq	%rax, %r9	 ; tmp174,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC51(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	fwrite	 ;
 ; D:\TC\src\output.c:327:             OUT(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp176
	movq	32(%rbp), %rdx	 ; indent, tmp177
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rcx, %r9	 ; tmp176,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	indention	 ;
 ; D:\TC\src\output.c:327:             OUT(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp179
	movq	%rax, %r9	 ; tmp179,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp180
	movq	%rax, %rcx	 ; tmp180,
	call	fwrite	 ;
 ; D:\TC\src\output.c:328:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp181
	leaq	1(%rax), %r8	 ;, _7
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp182
	movq	(%rax), %rax	 ; primary_ptr_16->value.operand, _8
	movq	40(%rbp), %rcx	 ; parser, tmp183
	movq	24(%rbp), %rdx	 ; outfile, tmp184
	movq	%rcx, %r9	 ; tmp183,
	movq	%rax, %rcx	 ; _8,
	call	output_primary	 ;
 ; D:\TC\src\output.c:329:             break;
	jmp	.L90	 ;
.L82:
 ; D:\TC\src\output.c:331:             OUT(0, false, "type: \"-\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp185
	movq	32(%rbp), %rdx	 ; indent, tmp186
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rcx, %r9	 ; tmp185,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp187,
	call	indention	 ;
 ; D:\TC\src\output.c:331:             OUT(0, false, "type: \"-\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp188
	movq	%rax, %r9	 ; tmp188,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC52(%rip), %rax	 ;, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	fwrite	 ;
 ; D:\TC\src\output.c:332:             OUT(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp190
	movq	32(%rbp), %rdx	 ; indent, tmp191
	movq	24(%rbp), %rax	 ; outfile, tmp192
	movq	%rcx, %r9	 ; tmp190,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp192,
	call	indention	 ;
 ; D:\TC\src\output.c:332:             OUT(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp193
	movq	%rax, %r9	 ; tmp193,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp194
	movq	%rax, %rcx	 ; tmp194,
	call	fwrite	 ;
 ; D:\TC\src\output.c:333:             output_primary(primary_ptr->value.operand, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp195
	leaq	1(%rax), %r8	 ;, _9
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp196
	movq	(%rax), %rax	 ; primary_ptr_16->value.operand, _10
	movq	40(%rbp), %rcx	 ; parser, tmp197
	movq	24(%rbp), %rdx	 ; outfile, tmp198
	movq	%rcx, %r9	 ; tmp197,
	movq	%rax, %rcx	 ; _10,
	call	output_primary	 ;
 ; D:\TC\src\output.c:334:             break;
	jmp	.L90	 ;
.L80:
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp199
	movq	32(%rbp), %rdx	 ; indent, tmp200
	movq	24(%rbp), %rax	 ; outfile, tmp201
	movq	%rcx, %r9	 ; tmp199,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp201,
	call	indention	 ;
 ; D:\TC\src\output.c:336:             OUT(0, false, "type: \"variable\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp202
	movq	%rax, %r9	 ; tmp202,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC53(%rip), %rax	 ;, tmp203
	movq	%rax, %rcx	 ; tmp203,
	call	fwrite	 ;
 ; D:\TC\src\output.c:337:             OUT(0, true, "value\n");
	movq	40(%rbp), %rcx	 ; parser, tmp204
	movq	32(%rbp), %rdx	 ; indent, tmp205
	movq	24(%rbp), %rax	 ; outfile, tmp206
	movq	%rcx, %r9	 ; tmp204,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp206,
	call	indention	 ;
 ; D:\TC\src\output.c:337:             OUT(0, true, "value\n");
	movq	24(%rbp), %rax	 ; outfile, tmp207
	movq	%rax, %r9	 ; tmp207,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC16(%rip), %rax	 ;, tmp208
	movq	%rax, %rcx	 ; tmp208,
	call	fwrite	 ;
 ; D:\TC\src\output.c:338:             output_variable_access(primary_ptr->value.var, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp209
	leaq	1(%rax), %r8	 ;, _11
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp210
	movq	(%rax), %rax	 ; primary_ptr_16->value.var, _12
	movq	40(%rbp), %rcx	 ; parser, tmp211
	movq	24(%rbp), %rdx	 ; outfile, tmp212
	movq	%rcx, %r9	 ; tmp211,
	movq	%rax, %rcx	 ; _12,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:339:             break;
	jmp	.L90	 ;
.L79:
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movq	40(%rbp), %rcx	 ; parser, tmp213
	movq	32(%rbp), %rdx	 ; indent, tmp214
	movq	24(%rbp), %rax	 ; outfile, tmp215
	movq	%rcx, %r9	 ; tmp213,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp215,
	call	indention	 ;
 ; D:\TC\src\output.c:341:             OUT(0, true, "unknown_PrimaryType: %u\n", primary_ptr->type);
	movq	-8(%rbp), %rax	 ; primary_ptr, tmp216
	movl	8(%rax), %edx	 ; primary_ptr_16->type, _13
	movq	24(%rbp), %rax	 ; outfile, tmp217
	movl	%edx, %r8d	 ; _13,
	leaq	.LC54(%rip), %rdx	 ;, tmp218
	movq	%rax, %rcx	 ; tmp217,
	call	fprintf	 ;
 ; D:\TC\src\output.c:342:             break;
	nop	
.L90:
 ; D:\TC\src\output.c:344: }
	nop	
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.seh_proc	output_variable_access
output_variable_access:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; variable_access, variable_access
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:349:     VariableAccess* var_access_ptr = variable_access;
	movq	16(%rbp), %rax	 ; variable_access, tmp99
	movq	%rax, -16(%rbp)	 ; tmp99, var_access_ptr
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp100
	movl	16(%rax), %eax	 ; var_access_ptr_22->type, _1
 ; D:\TC\src\output.c:352:     switch (var_access_ptr->type) {
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
 ; D:\TC\src\output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp101
	movq	32(%rbp), %rdx	 ; indent, tmp102
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rcx, %r9	 ; tmp101,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp103,
	call	indention	 ;
 ; D:\TC\src\output.c:354:             OUT(0, false, "type: \"name\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp104
	movq	%rax, %r9	 ; tmp104,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC55(%rip), %rax	 ;, tmp105
	movq	%rax, %rcx	 ; tmp105,
	call	fwrite	 ;
 ; D:\TC\src\output.c:355:             OUT(0, true, "name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp106
	movq	32(%rbp), %rdx	 ; indent, tmp107
	movq	24(%rbp), %rax	 ; outfile, tmp108
	movq	%rcx, %r9	 ; tmp106,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp108,
	call	indention	 ;
 ; D:\TC\src\output.c:355:             OUT(0, true, "name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rax, %r9	 ; tmp109,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rax	 ;, tmp110
	movq	%rax, %rcx	 ; tmp110,
	call	fwrite	 ;
 ; D:\TC\src\output.c:356:             output_name(var_access_ptr->content.name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp111
	leaq	1(%rax), %r8	 ;, _2
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp112
	movq	8(%rax), %rax	 ; var_access_ptr_22->content.name, _3
	movq	40(%rbp), %rcx	 ; parser, tmp113
	movq	24(%rbp), %rdx	 ; outfile, tmp114
	movq	%rcx, %r9	 ; tmp113,
	movq	%rax, %rcx	 ; _3,
	call	output_name	 ;
 ; D:\TC\src\output.c:357:             break;
	jmp	.L97	 ;
.L96:
 ; D:\TC\src\output.c:359:             args = list_copy(var_access_ptr->content.args);
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp115
	movq	8(%rax), %rax	 ; var_access_ptr_22->content.args, _4
	movq	%rax, %rcx	 ; _4,
	call	list_copy	 ;
	movq	%rax, -24(%rbp)	 ; tmp116, args
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp117
	movq	32(%rbp), %rdx	 ; indent, tmp118
	movq	24(%rbp), %rax	 ; outfile, tmp119
	movq	%rcx, %r9	 ; tmp117,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp119,
	call	indention	 ;
 ; D:\TC\src\output.c:360:             OUT(0, false, "type: \"function_call\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp120
	movq	%rax, %r9	 ; tmp120,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC56(%rip), %rax	 ;, tmp121
	movq	%rax, %rcx	 ; tmp121,
	call	fwrite	 ;
 ; D:\TC\src\output.c:361:             OUT(0, false, "function\n");
	movq	40(%rbp), %rcx	 ; parser, tmp122
	movq	32(%rbp), %rdx	 ; indent, tmp123
	movq	24(%rbp), %rax	 ; outfile, tmp124
	movq	%rcx, %r9	 ; tmp122,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp124,
	call	indention	 ;
 ; D:\TC\src\output.c:361:             OUT(0, false, "function\n");
	movq	24(%rbp), %rax	 ; outfile, tmp125
	movq	%rax, %r9	 ; tmp125,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC1(%rip), %rax	 ;, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	fwrite	 ;
 ; D:\TC\src\output.c:362:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp127
	leaq	1(%rax), %r8	 ;, _5
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp128
	movq	(%rax), %rax	 ; var_access_ptr_22->base, _6
	movq	40(%rbp), %rcx	 ; parser, tmp129
	movq	24(%rbp), %rdx	 ; outfile, tmp130
	movq	%rcx, %r9	 ; tmp129,
	movq	%rax, %rcx	 ; _6,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	movq	40(%rbp), %rcx	 ; parser, tmp131
	movq	32(%rbp), %rdx	 ; indent, tmp132
	movq	24(%rbp), %rax	 ; outfile, tmp133
	movq	%rcx, %r9	 ; tmp131,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp133,
	call	indention	 ;
 ; D:\TC\src\output.c:363:             OUT(0, true, "arguments\n");
	movq	24(%rbp), %rax	 ; outfile, tmp134
	movq	%rax, %r9	 ; tmp134,
	movl	$10, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC57(%rip), %rax	 ;, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	fwrite	 ;
 ; D:\TC\src\output.c:365:             index = -1;
	movl	$-1, -4(%rbp)	 ;, index
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	jmp	.L98	 ;
.L99:
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	movq	32(%rbp), %rax	 ; indent, tmp136
	leaq	1(%rax), %rdx	 ;, _7
	movq	40(%rbp), %rcx	 ; parser, tmp137
	movq	24(%rbp), %rax	 ; outfile, tmp138
	movq	%rcx, %r9	 ; tmp137,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp138,
	call	indention	 ;
 ; D:\TC\src\output.c:367:                 OUT(1, false, "arguments[%d]\n", ++index);
	addl	$1, -4(%rbp)	 ;, index
	movl	-4(%rbp), %edx	 ; index, tmp139
	movq	24(%rbp), %rax	 ; outfile, tmp140
	movl	%edx, %r8d	 ; tmp139,
	leaq	.LC58(%rip), %rdx	 ;, tmp141
	movq	%rax, %rcx	 ; tmp140,
	call	fprintf	 ;
 ; D:\TC\src\output.c:368:                 output_expression(arg, outfile, indent + 2, parser);
	movq	32(%rbp), %rax	 ; indent, tmp142
	leaq	2(%rax), %r8	 ;, _8
	movq	40(%rbp), %rcx	 ; parser, tmp143
	movq	24(%rbp), %rdx	 ; outfile, tmp144
	movq	-32(%rbp), %rax	 ; arg, tmp145
	movq	%rcx, %r9	 ; tmp143,
	movq	%rax, %rcx	 ; tmp145,
	call	output_expression	 ;
.L98:
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	movq	-24(%rbp), %rax	 ; args, tmp146
	movq	%rax, %rcx	 ; tmp146,
	call	list_pop	 ;
	movq	%rax, -32(%rbp)	 ; tmp147, arg
 ; D:\TC\src\output.c:366:             while ((arg = (Expression*)list_pop(args)) != 0) {
	cmpq	$0, -32(%rbp)	 ;, arg
	jne	.L99	 ;,
 ; D:\TC\src\output.c:370:             break;
	jmp	.L97	 ;
.L92:
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp148
	movq	32(%rbp), %rdx	 ; indent, tmp149
	movq	24(%rbp), %rax	 ; outfile, tmp150
	movq	%rcx, %r9	 ; tmp148,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp150,
	call	indention	 ;
 ; D:\TC\src\output.c:372:             OUT(0, false, "type: \"get sequence_element\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp151
	movq	%rax, %r9	 ; tmp151,
	movl	$29, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC59(%rip), %rax	 ;, tmp152
	movq	%rax, %rcx	 ; tmp152,
	call	fwrite	 ;
 ; D:\TC\src\output.c:373:             OUT(0, false, "sequence\n");
	movq	40(%rbp), %rcx	 ; parser, tmp153
	movq	32(%rbp), %rdx	 ; indent, tmp154
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rcx, %r9	 ; tmp153,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp155,
	call	indention	 ;
 ; D:\TC\src\output.c:373:             OUT(0, false, "sequence\n");
	movq	24(%rbp), %rax	 ; outfile, tmp156
	movq	%rax, %r9	 ; tmp156,
	movl	$9, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC60(%rip), %rax	 ;, tmp157
	movq	%rax, %rcx	 ; tmp157,
	call	fwrite	 ;
 ; D:\TC\src\output.c:374:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp158
	leaq	1(%rax), %r8	 ;, _9
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp159
	movq	(%rax), %rax	 ; var_access_ptr_22->base, _10
	movq	40(%rbp), %rcx	 ; parser, tmp160
	movq	24(%rbp), %rdx	 ; outfile, tmp161
	movq	%rcx, %r9	 ; tmp160,
	movq	%rax, %rcx	 ; _10,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:375:             OUT(0, true, "index\n");
	movq	40(%rbp), %rcx	 ; parser, tmp162
	movq	32(%rbp), %rdx	 ; indent, tmp163
	movq	24(%rbp), %rax	 ; outfile, tmp164
	movq	%rcx, %r9	 ; tmp162,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp164,
	call	indention	 ;
 ; D:\TC\src\output.c:375:             OUT(0, true, "index\n");
	movq	24(%rbp), %rax	 ; outfile, tmp165
	movq	%rax, %r9	 ; tmp165,
	movl	$6, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC61(%rip), %rax	 ;, tmp166
	movq	%rax, %rcx	 ; tmp166,
	call	fwrite	 ;
 ; D:\TC\src\output.c:376:             output_expression(var_access_ptr->content.index, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp167
	leaq	1(%rax), %r8	 ;, _11
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp168
	movq	8(%rax), %rax	 ; var_access_ptr_22->content.index, _12
	movq	40(%rbp), %rcx	 ; parser, tmp169
	movq	24(%rbp), %rdx	 ; outfile, tmp170
	movq	%rcx, %r9	 ; tmp169,
	movq	%rax, %rcx	 ; _12,
	call	output_expression	 ;
 ; D:\TC\src\output.c:377:             break;
	jmp	.L97	 ;
.L94:
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp171
	movq	32(%rbp), %rdx	 ; indent, tmp172
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rcx, %r9	 ; tmp171,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp173,
	call	indention	 ;
 ; D:\TC\src\output.c:379:             OUT(0, false, "type: \"get_attribute\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp174
	movq	%rax, %r9	 ; tmp174,
	movl	$22, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC62(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	fwrite	 ;
 ; D:\TC\src\output.c:380:             OUT(0, false, "object\n");
	movq	40(%rbp), %rcx	 ; parser, tmp176
	movq	32(%rbp), %rdx	 ; indent, tmp177
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rcx, %r9	 ; tmp176,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	indention	 ;
 ; D:\TC\src\output.c:380:             OUT(0, false, "object\n");
	movq	24(%rbp), %rax	 ; outfile, tmp179
	movq	%rax, %r9	 ; tmp179,
	movl	$7, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC63(%rip), %rax	 ;, tmp180
	movq	%rax, %rcx	 ; tmp180,
	call	fwrite	 ;
 ; D:\TC\src\output.c:381:             output_variable_access(var_access_ptr->base, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp181
	leaq	1(%rax), %r8	 ;, _13
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp182
	movq	(%rax), %rax	 ; var_access_ptr_22->base, _14
	movq	40(%rbp), %rcx	 ; parser, tmp183
	movq	24(%rbp), %rdx	 ; outfile, tmp184
	movq	%rcx, %r9	 ; tmp183,
	movq	%rax, %rcx	 ; _14,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:382:             OUT(0, true, "attribute_name\n");
	movq	40(%rbp), %rcx	 ; parser, tmp185
	movq	32(%rbp), %rdx	 ; indent, tmp186
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rcx, %r9	 ; tmp185,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp187,
	call	indention	 ;
 ; D:\TC\src\output.c:382:             OUT(0, true, "attribute_name\n");
	movq	24(%rbp), %rax	 ; outfile, tmp188
	movq	%rax, %r9	 ; tmp188,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC64(%rip), %rax	 ;, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	fwrite	 ;
 ; D:\TC\src\output.c:383:             output_name(var_access_ptr->content.attr_name, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp190
	leaq	1(%rax), %r8	 ;, _15
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp191
	movq	8(%rax), %rax	 ; var_access_ptr_22->content.attr_name, _16
	movq	40(%rbp), %rcx	 ; parser, tmp192
	movq	24(%rbp), %rdx	 ; outfile, tmp193
	movq	%rcx, %r9	 ; tmp192,
	movq	%rax, %rcx	 ; _16,
	call	output_name	 ;
 ; D:\TC\src\output.c:384:             break;
	jmp	.L97	 ;
.L93:
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movq	40(%rbp), %rcx	 ; parser, tmp194
	movq	32(%rbp), %rdx	 ; indent, tmp195
	movq	24(%rbp), %rax	 ; outfile, tmp196
	movq	%rcx, %r9	 ; tmp194,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp196,
	call	indention	 ;
 ; D:\TC\src\output.c:386:             OUT(0, true, "unknown_VariableAccessType: %u\n", var_access_ptr->type);
	movq	-16(%rbp), %rax	 ; var_access_ptr, tmp197
	movl	16(%rax), %edx	 ; var_access_ptr_22->type, _17
	movq	24(%rbp), %rax	 ; outfile, tmp198
	movl	%edx, %r8d	 ; _17,
	leaq	.LC65(%rip), %rdx	 ;, tmp199
	movq	%rax, %rcx	 ; tmp198,
	call	fprintf	 ;
 ; D:\TC\src\output.c:387:             break;
	nop	
.L97:
 ; D:\TC\src\output.c:389: }
	nop	
	addq	$64, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.ascii "kind: \"function\"\12\0"
.LC72:
	.ascii "kind: \"method\"\12\0"
.LC73:
	.ascii "kind: \"class\"\12\0"
.LC74:
	.ascii "kind: \"attribute\"\12\0"
.LC75:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
	.seh_proc	output_name
output_name:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; name, name
	movq	%rdx, 24(%rbp)	 ; outfile, outfile
	movq	%r8, 32(%rbp)	 ; indent, indent
	movq	%r9, 40(%rbp)	 ; parser, parser
 ; D:\TC\src\output.c:394:     Name* name_ptr = name;
	movq	16(%rbp), %rax	 ; name, tmp93
	movq	%rax, -8(%rbp)	 ; tmp93, name_ptr
 ; D:\TC\src\output.c:395:     if (name_ptr == NULL) {
	cmpq	$0, -8(%rbp)	 ;, name_ptr
	jne	.L101	 ;,
 ; D:\TC\src\output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp94
	movq	32(%rbp), %rdx	 ; indent, tmp95
	movq	24(%rbp), %rax	 ; outfile, tmp96
	movq	%rcx, %r9	 ; tmp94,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp96,
	call	indention	 ;
 ; D:\TC\src\output.c:396:         OUT(0, true, "Name pointer: \"NULL\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp97
	movq	%rax, %r9	 ; tmp97,
	movl	$21, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC66(%rip), %rax	 ;, tmp98
	movq	%rax, %rcx	 ; tmp98,
	call	fwrite	 ;
 ; D:\TC\src\output.c:397:         return;
	jmp	.L100	 ;
.L101:
 ; D:\TC\src\output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	40(%rbp), %rcx	 ; parser, tmp99
	movq	32(%rbp), %rdx	 ; indent, tmp100
	movq	24(%rbp), %rax	 ; outfile, tmp101
	movq	%rcx, %r9	 ; tmp99,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp101,
	call	indention	 ;
 ; D:\TC\src\output.c:399:     OUT(0, false, "name: \"%s\"\n", (name_ptr->name));
	movq	-8(%rbp), %rax	 ; name_ptr, tmp102
	movq	(%rax), %rdx	 ; name_ptr_14->name, _1
	movq	24(%rbp), %rax	 ; outfile, tmp103
	movq	%rdx, %r8	 ; _1,
	leaq	.LC67(%rip), %rdx	 ;, tmp104
	movq	%rax, %rcx	 ; tmp103,
	call	fprintf	 ;
 ; D:\TC\src\output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	40(%rbp), %rcx	 ; parser, tmp105
	movq	32(%rbp), %rdx	 ; indent, tmp106
	movq	24(%rbp), %rax	 ; outfile, tmp107
	movq	%rcx, %r9	 ; tmp105,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp107,
	call	indention	 ;
 ; D:\TC\src\output.c:400:     OUT(0, false, "id: %zu\n", name_ptr->id);
	movq	-8(%rbp), %rax	 ; name_ptr, tmp108
	movq	8(%rax), %rdx	 ; name_ptr_14->id, _2
	movq	24(%rbp), %rax	 ; outfile, tmp109
	movq	%rdx, %r8	 ; _2,
	leaq	.LC68(%rip), %rdx	 ;, tmp110
	movq	%rax, %rcx	 ; tmp109,
	call	fprintf	 ;
 ; D:\TC\src\output.c:401:     switch (name_ptr->kind) {
	movq	-8(%rbp), %rax	 ; name_ptr, tmp111
	movl	24(%rax), %eax	 ; name_ptr_14->kind, _3
 ; D:\TC\src\output.c:401:     switch (name_ptr->kind) {
	cmpl	$5, %eax	 ;, _3
	ja	.L103	 ;,
	movl	%eax, %eax	 ; _3, tmp112
	leaq	0(,%rax,4), %rdx	 ;, tmp113
	leaq	.L105(%rip), %rax	 ;, tmp114
	movl	(%rdx,%rax), %eax	 ;, tmp115
	cltq
	leaq	.L105(%rip), %rdx	 ;, tmp118
	addq	%rdx, %rax	 ; tmp118, tmp117
	jmp	*%rax	 ; tmp117
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
.L110:
 ; D:\TC\src\output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp119
	movq	32(%rbp), %rdx	 ; indent, tmp120
	movq	24(%rbp), %rax	 ; outfile, tmp121
	movq	%rcx, %r9	 ; tmp119,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp121,
	call	indention	 ;
 ; D:\TC\src\output.c:403:             OUT(0, true, "kind: \"type\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp122
	movq	%rax, %r9	 ; tmp122,
	movl	$13, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC69(%rip), %rax	 ;, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	fwrite	 ;
 ; D:\TC\src\output.c:404:             break;
	jmp	.L100	 ;
.L109:
 ; D:\TC\src\output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp124
	movq	32(%rbp), %rdx	 ; indent, tmp125
	movq	24(%rbp), %rax	 ; outfile, tmp126
	movq	%rcx, %r9	 ; tmp124,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp126,
	call	indention	 ;
 ; D:\TC\src\output.c:406:             OUT(0, false, "kind: \"variable\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp127
	movq	%rax, %r9	 ; tmp127,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC70(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	fwrite	 ;
 ; D:\TC\src\output.c:407:             OUT(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp129
	movq	32(%rbp), %rdx	 ; indent, tmp130
	movq	24(%rbp), %rax	 ; outfile, tmp131
	movq	%rcx, %r9	 ; tmp129,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp131,
	call	indention	 ;
 ; D:\TC\src\output.c:407:             OUT(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp132
	movq	%rax, %r9	 ; tmp132,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp133
	movq	%rax, %rcx	 ; tmp133,
	call	fwrite	 ;
 ; D:\TC\src\output.c:408:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp134
	leaq	1(%rax), %r8	 ;, _4
	movq	-8(%rbp), %rax	 ; name_ptr, tmp135
	movq	16(%rax), %rax	 ; name_ptr_14->info.type, _5
	movq	40(%rbp), %rcx	 ; parser, tmp136
	movq	24(%rbp), %rdx	 ; outfile, tmp137
	movq	%rcx, %r9	 ; tmp136,
	movq	%rax, %rcx	 ; _5,
	call	output_name	 ;
 ; D:\TC\src\output.c:409:             break;
	jmp	.L100	 ;
.L108:
 ; D:\TC\src\output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp138
	movq	32(%rbp), %rdx	 ; indent, tmp139
	movq	24(%rbp), %rax	 ; outfile, tmp140
	movq	%rcx, %r9	 ; tmp138,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp140,
	call	indention	 ;
 ; D:\TC\src\output.c:411:             OUT(0, false, "kind: \"function\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp141
	movq	%rax, %r9	 ; tmp141,
	movl	$17, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC71(%rip), %rax	 ;, tmp142
	movq	%rax, %rcx	 ; tmp142,
	call	fwrite	 ;
 ; D:\TC\src\output.c:412:             OUT(0, true, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp143
	movq	32(%rbp), %rdx	 ; indent, tmp144
	movq	24(%rbp), %rax	 ; outfile, tmp145
	movq	%rcx, %r9	 ; tmp143,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp145,
	call	indention	 ;
 ; D:\TC\src\output.c:412:             OUT(0, true, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp146
	movq	%rax, %r9	 ; tmp146,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp147
	movq	%rax, %rcx	 ; tmp147,
	call	fwrite	 ;
 ; D:\TC\src\output.c:413:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp148
	leaq	1(%rax), %r8	 ;, _6
	movq	-8(%rbp), %rax	 ; name_ptr, tmp149
	movq	16(%rax), %rax	 ; name_ptr_14->info.type, _7
	movq	40(%rbp), %rcx	 ; parser, tmp150
	movq	24(%rbp), %rdx	 ; outfile, tmp151
	movq	%rcx, %r9	 ; tmp150,
	movq	%rax, %rcx	 ; _7,
	call	output_name	 ;
 ; D:\TC\src\output.c:414:             break;
	jmp	.L100	 ;
.L107:
 ; D:\TC\src\output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp152
	movq	32(%rbp), %rdx	 ; indent, tmp153
	movq	24(%rbp), %rax	 ; outfile, tmp154
	movq	%rcx, %r9	 ; tmp152,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp154,
	call	indention	 ;
 ; D:\TC\src\output.c:416:             OUT(0, false, "kind: \"method\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp155
	movq	%rax, %r9	 ; tmp155,
	movl	$15, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC72(%rip), %rax	 ;, tmp156
	movq	%rax, %rcx	 ; tmp156,
	call	fwrite	 ;
 ; D:\TC\src\output.c:417:             OUT(0, true, "return_type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp157
	movq	32(%rbp), %rdx	 ; indent, tmp158
	movq	24(%rbp), %rax	 ; outfile, tmp159
	movq	%rcx, %r9	 ; tmp157,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp159,
	call	indention	 ;
 ; D:\TC\src\output.c:417:             OUT(0, true, "return_type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp160
	movq	%rax, %r9	 ; tmp160,
	movl	$12, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp161
	movq	%rax, %rcx	 ; tmp161,
	call	fwrite	 ;
 ; D:\TC\src\output.c:418:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp162
	leaq	1(%rax), %r8	 ;, _8
	movq	-8(%rbp), %rax	 ; name_ptr, tmp163
	movq	16(%rax), %rax	 ; name_ptr_14->info.type, _9
	movq	40(%rbp), %rcx	 ; parser, tmp164
	movq	24(%rbp), %rdx	 ; outfile, tmp165
	movq	%rcx, %r9	 ; tmp164,
	movq	%rax, %rcx	 ; _9,
	call	output_name	 ;
 ; D:\TC\src\output.c:419:             break;
	jmp	.L100	 ;
.L106:
 ; D:\TC\src\output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp166
	movq	32(%rbp), %rdx	 ; indent, tmp167
	movq	24(%rbp), %rax	 ; outfile, tmp168
	movq	%rcx, %r9	 ; tmp166,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp168,
	call	indention	 ;
 ; D:\TC\src\output.c:421:             OUT(0, true, "kind: \"class\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp169
	movq	%rax, %r9	 ; tmp169,
	movl	$14, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC73(%rip), %rax	 ;, tmp170
	movq	%rax, %rcx	 ; tmp170,
	call	fwrite	 ;
 ; D:\TC\src\output.c:422:             break;
	jmp	.L100	 ;
.L104:
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp171
	movq	32(%rbp), %rdx	 ; indent, tmp172
	movq	24(%rbp), %rax	 ; outfile, tmp173
	movq	%rcx, %r9	 ; tmp171,
	movl	$0, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp173,
	call	indention	 ;
 ; D:\TC\src\output.c:424:             OUT(0, false, "kind: \"attribute\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp174
	movq	%rax, %r9	 ; tmp174,
	movl	$18, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC74(%rip), %rax	 ;, tmp175
	movq	%rax, %rcx	 ; tmp175,
	call	fwrite	 ;
 ; D:\TC\src\output.c:425:             OUT(0, true, "type\n");
	movq	40(%rbp), %rcx	 ; parser, tmp176
	movq	32(%rbp), %rdx	 ; indent, tmp177
	movq	24(%rbp), %rax	 ; outfile, tmp178
	movq	%rcx, %r9	 ; tmp176,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp178,
	call	indention	 ;
 ; D:\TC\src\output.c:425:             OUT(0, true, "type\n");
	movq	24(%rbp), %rax	 ; outfile, tmp179
	movq	%rax, %r9	 ; tmp179,
	movl	$5, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC15(%rip), %rax	 ;, tmp180
	movq	%rax, %rcx	 ; tmp180,
	call	fwrite	 ;
 ; D:\TC\src\output.c:426:             output_name(name_ptr->info.type, outfile, indent + 1, parser);
	movq	32(%rbp), %rax	 ; indent, tmp181
	leaq	1(%rax), %r8	 ;, _10
	movq	-8(%rbp), %rax	 ; name_ptr, tmp182
	movq	16(%rax), %rax	 ; name_ptr_14->info.type, _11
	movq	40(%rbp), %rcx	 ; parser, tmp183
	movq	24(%rbp), %rdx	 ; outfile, tmp184
	movq	%rcx, %r9	 ; tmp183,
	movq	%rax, %rcx	 ; _11,
	call	output_name	 ;
 ; D:\TC\src\output.c:427:             break;
	jmp	.L100	 ;
.L103:
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	40(%rbp), %rcx	 ; parser, tmp185
	movq	32(%rbp), %rdx	 ; indent, tmp186
	movq	24(%rbp), %rax	 ; outfile, tmp187
	movq	%rcx, %r9	 ; tmp185,
	movl	$1, %r8d	 ;,
	movq	%rax, %rcx	 ; tmp187,
	call	indention	 ;
 ; D:\TC\src\output.c:429:             OUT(0, true, "kind: \"unknown_NameType\"\n");
	movq	24(%rbp), %rax	 ; outfile, tmp188
	movq	%rax, %r9	 ; tmp188,
	movl	$25, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC75(%rip), %rax	 ;, tmp189
	movq	%rax, %rcx	 ; tmp189,
	call	fwrite	 ;
 ; D:\TC\src\output.c:430:             break;
	nop	
.L100:
 ; D:\TC\src\output.c:432: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef

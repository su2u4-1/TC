	.file	"D:\\TC\\src\\output.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Name pointer: \"NULL\"\12\0"
.LC1:
	.ascii "name: \"%s\"\12\0"
.LC2:
	.ascii "id: %zu\12\0"
.LC3:
	.ascii "kind: \"type\"\12\0"
.LC4:
	.ascii "kind: \"variable\"\12\0"
.LC5:
	.ascii "type\12\0"
.LC6:
	.ascii "kind: \"subroutine\"\12\0"
.LC7:
	.ascii "return_type\12\0"
.LC8:
	.ascii "kind: \"class\"\12\0"
.LC9:
	.ascii "kind: \"attribute\"\12\0"
.LC10:
	.ascii "kind: \"parameter\"\12\0"
.LC11:
	.ascii "kind: \"unknown_NameType\"\12\0"
	.text
	.def	output_name;	.scl	3;	.type	32;	.endef
output_name:
	pushq	%r15	 ;
 ; D:\TC\src\output.c:333:     ast_output(0, false, "id: %zu\n", name->id);
	leaq	.LC2(%rip), %r15	 ;, tmp114
 ; D:\TC\src\output.c:327: void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r14	 ;
 ; D:\TC\src\output.c:332:     ast_output(0, false, "name: \"%s\"\n", name->original_name);
	leaq	.LC1(%rip), %r14	 ;, tmp113
 ; D:\TC\src\output.c:327: void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r13	 ;
 ; D:\TC\src\output.c:334:     switch (name->kind) {
	leaq	.L6(%rip), %r13	 ;, tmp115
 ; D:\TC\src\output.c:327: void output_name(Symbol* name, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r12	 ;
	leaq	1(%r8), %r12	 ;, ivtmp.24
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp116, name
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp119, parser
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp117, outfile
	subq	$40, %rsp	 ;,
.L2:
	leaq	-1(%r12), %rbp	 ;, indent
 ; D:\TC\src\output.c:329:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\output.c:328:     if (name == NULL) {
	testq	%rdi, %rdi	 ; name
	jne	.L3	 ;,
 ; D:\TC\src\output.c:329:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:329:         ast_output(0, true, "Name pointer: \"NULL\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC0(%rip), %rcx	 ;, tmp91
	jmp	.L16	 ;
.L3:
 ; D:\TC\src\output.c:332:     ast_output(0, false, "name: \"%s\"\n", name->original_name);
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:332:     ast_output(0, false, "name: \"%s\"\n", name->original_name);
	movq	16(%rdi), %r8	 ; name_13->original_name,
	movq	%r14, %rdx	 ; tmp113,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:333:     ast_output(0, false, "id: %zu\n", name->id);
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:333:     ast_output(0, false, "id: %zu\n", name->id);
	movq	24(%rdi), %r8	 ; name_13->id,
	movq	%r15, %rdx	 ; tmp114,
	movq	%rbx, %rcx	 ; outfile,
	call	fprintf	 ;
 ; D:\TC\src\output.c:334:     switch (name->kind) {
	cmpl	$5, 32(%rdi)	 ;, name_13->kind
	ja	.L4	 ;,
	movl	32(%rdi), %eax	 ; name_13->kind, name_13->kind
 ; D:\TC\src\output.c:336:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rsi, %r9	 ; parser,
 ; D:\TC\src\output.c:334:     switch (name->kind) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp99
	addq	%r13, %rax	 ; tmp115, tmp100
	jmp	*%rax	 ; tmp100
	.section .rdata,"dr"
	.align 4
.L6:
	.long	.L11-.L6
	.long	.L10-.L6
	.long	.L9-.L6
	.long	.L8-.L6
	.long	.L7-.L6
	.long	.L5-.L6
	.text
.L5:
 ; D:\TC\src\output.c:336:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:336:             ast_output(0, true, "kind: \"type\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC3(%rip), %rcx	 ;, tmp102
	jmp	.L16	 ;
.L9:
 ; D:\TC\src\output.c:339:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:339:             ast_output(0, false, "kind: \"variable\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC4(%rip), %rcx	 ;, tmp103
	jmp	.L15	 ;
.L10:
 ; D:\TC\src\output.c:344:             ast_output(0, false, "kind: \"subroutine\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:344:             ast_output(0, false, "kind: \"subroutine\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC6(%rip), %rcx	 ;, tmp105
	call	fputs	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "return_type\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:345:             ast_output(0, true, "return_type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC7(%rip), %rcx	 ;, tmp106
	jmp	.L14	 ;
.L11:
 ; D:\TC\src\output.c:349:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:349:             ast_output(0, true, "kind: \"class\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC8(%rip), %rcx	 ;, tmp107
	jmp	.L16	 ;
.L7:
 ; D:\TC\src\output.c:352:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:352:             ast_output(0, false, "kind: \"attribute\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC9(%rip), %rcx	 ;, tmp108
.L15:
	call	fputs	 ;
 ; D:\TC\src\output.c:353:             ast_output(0, true, "type\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:353:             ast_output(0, true, "type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC5(%rip), %rcx	 ;, tmp109
.L14:
	call	fputs	 ;
	incq	%r12	 ; ivtmp.24
 ; D:\TC\src\output.c:354:             output_name(name->type, outfile, indent + 1, parser);
	movq	(%rdi), %rdi	 ; name_13->type, name
	jmp	.L2	 ;
.L8:
 ; D:\TC\src\output.c:357:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:357:             ast_output(0, false, "kind: \"parameter\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC10(%rip), %rcx	 ;, tmp110
	jmp	.L15	 ;
.L4:
 ; D:\TC\src\output.c:362:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:362:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC11(%rip), %rcx	 ;, tmp112
.L16:
 ; D:\TC\src\output.c:365: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:362:             ast_output(0, true, "kind: \"unknown_NameType\"\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC12:
	.ascii "UNKNOWN_OPERATOR\0"
.LC13:
	.ascii "primary\12\0"
.LC14:
	.ascii "type: \"integer\"\12\0"
.LC15:
	.ascii "value: %s\12\0"
.LC16:
	.ascii "type: \"float\"\12\0"
.LC17:
	.ascii "type: \"string\"\12\0"
.LC18:
	.ascii "value: \"%s\"\12\0"
.LC19:
	.ascii "type: \"boolean\"\12\0"
.LC20:
	.ascii "value: \"true\"\12\0"
.LC21:
	.ascii "value: \"false\"\12\0"
.LC22:
	.ascii "type: \"expression\"\12\0"
.LC23:
	.ascii "value\12\0"
.LC24:
	.ascii "type: \"!\"\12\0"
.LC25:
	.ascii "type: \"-\"\12\0"
.LC26:
	.ascii "type: \"variable\"\12\0"
.LC27:
	.ascii "unknown_PrimaryType: %u\12\0"
.LC28:
	.ascii "operator: \"%s\"\12\0"
.LC29:
	.ascii "left\12\0"
.LC30:
	.ascii "right\12\0"
	.text
	.def	output_expression;	.scl	3;	.type	32;	.endef
output_expression:
	pushq	%r14	 ;
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC12(%rip), %r14	 ;, op_str
 ; D:\TC\src\output.c:226: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r13	 ;
 ; D:\TC\src\output.c:240:     switch (primary->type) {
	leaq	.L23(%rip), %r13	 ;, tmp131
 ; D:\TC\src\output.c:226: void output_expression(Expression* expression, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp137, indent
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp135, expression
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp138, parser
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp136, outfile
	subq	$32, %rsp	 ;,
.L35:
 ; D:\TC\src\output.c:227:     if (expression->operator == OP_NONE) {
	movl	24(%rdi), %ecx	 ; expression_11->operator, _1
 ; D:\TC\src\output.c:227:     if (expression->operator == OP_NONE) {
	cmpl	$19, %ecx	 ;, _1
	jne	.L19	 ;,
 ; D:\TC\src\output.c:228:         ast_output(0, true, "primary\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:228:         ast_output(0, true, "primary\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC13(%rip), %rcx	 ;, tmp98
	addq	$2, %rbp	 ;, indent
	call	fputs	 ;
 ; D:\TC\src\output.c:229:         output_primary(expression->prim_left, outfile, indent + 1, parser);
	movq	8(%rdi), %r12	 ; expression_11->prim_left, primary
.L20:
 ; D:\TC\src\output.c:240:     switch (primary->type) {
	cmpl	$8, 8(%r12)	 ;, primary_28->type
	leaq	-1(%rbp), %rdi	 ;, indent
	ja	.L21	 ;,
	movl	8(%r12), %eax	 ; primary_28->type, primary_28->type
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:240:     switch (primary->type) {
	movslq	0(%r13,%rax,4), %rax	 ;, tmp102
	addq	%r13, %rax	 ; tmp131, tmp103
	jmp	*%rax	 ; tmp103
	.section .rdata,"dr"
	.align 4
.L23:
	.long	.L31-.L23
	.long	.L30-.L23
	.long	.L29-.L23
	.long	.L28-.L23
	.long	.L27-.L23
	.long	.L26-.L23
	.long	.L25-.L23
	.long	.L24-.L23
	.long	.L22-.L23
	.text
.L31:
 ; D:\TC\src\output.c:242:             ast_output(0, false, "type: \"integer\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:242:             ast_output(0, false, "type: \"integer\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC14(%rip), %rcx	 ;, tmp105
	jmp	.L39	 ;
.L30:
 ; D:\TC\src\output.c:246:             ast_output(0, false, "type: \"float\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:246:             ast_output(0, false, "type: \"float\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC16(%rip), %rcx	 ;, tmp107
.L39:
	call	fputs	 ;
 ; D:\TC\src\output.c:247:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:247:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	(%r12), %r8	 ; primary_28->value.literal_value,
	leaq	.LC15(%rip), %rdx	 ;, tmp108
.L40:
 ; D:\TC\src\output.c:238: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:247:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:238: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\output.c:247:             ast_output(0, true, "value: %s\n", primary->value.literal_value);
	jmp	fprintf	 ;
.L29:
 ; D:\TC\src\output.c:250:             ast_output(0, false, "type: \"string\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:250:             ast_output(0, false, "type: \"string\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC17(%rip), %rcx	 ;, tmp109
	call	fputs	 ;
 ; D:\TC\src\output.c:251:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:251:             ast_output(0, true, "value: \"%s\"\n", primary->value.literal_value);
	movq	(%r12), %r8	 ; primary_28->value.literal_value,
	leaq	.LC18(%rip), %rdx	 ;, tmp110
	jmp	.L40	 ;
.L28:
 ; D:\TC\src\output.c:254:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:254:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC19(%rip), %rcx	 ;, tmp111
	call	fputs	 ;
 ; D:\TC\src\output.c:255:             ast_output(0, true, "value: \"true\"\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:255:             ast_output(0, true, "value: \"true\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC20(%rip), %rcx	 ;, tmp112
	jmp	.L41	 ;
.L27:
 ; D:\TC\src\output.c:258:             ast_output(0, false, "type: \"boolean\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:258:             ast_output(0, false, "type: \"boolean\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC19(%rip), %rcx	 ;, tmp113
	call	fputs	 ;
 ; D:\TC\src\output.c:259:             ast_output(0, true, "value: \"false\"\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:259:             ast_output(0, true, "value: \"false\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC21(%rip), %rcx	 ;, tmp114
.L41:
 ; D:\TC\src\output.c:238: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\output.c:259:             ast_output(0, true, "value: \"false\"\n");
	jmp	fputs	 ;
.L26:
 ; D:\TC\src\output.c:262:             ast_output(0, false, "type: \"expression\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:262:             ast_output(0, false, "type: \"expression\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC22(%rip), %rcx	 ;, tmp115
	call	fputs	 ;
 ; D:\TC\src\output.c:263:             ast_output(0, true, "value\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:263:             ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC23(%rip), %rcx	 ;, tmp116
	call	fputs	 ;
 ; D:\TC\src\output.c:264:             output_expression(primary->value.expr, outfile, indent + 1, parser);
	movq	(%r12), %rdi	 ; primary_28->value.expr, expression
 ; D:\TC\src\output.c:265:             break;
	jmp	.L35	 ;
.L25:
 ; D:\TC\src\output.c:267:             ast_output(0, false, "type: \"!\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:267:             ast_output(0, false, "type: \"!\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC24(%rip), %rcx	 ;, tmp117
	jmp	.L38	 ;
.L24:
 ; D:\TC\src\output.c:272:             ast_output(0, false, "type: \"-\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:272:             ast_output(0, false, "type: \"-\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC25(%rip), %rcx	 ;, tmp119
.L38:
	call	fputs	 ;
 ; D:\TC\src\output.c:273:             ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	incq	%rbp	 ; indent
	call	indention	 ;
 ; D:\TC\src\output.c:273:             ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC23(%rip), %rcx	 ;, tmp120
	call	fputs	 ;
 ; D:\TC\src\output.c:274:             output_primary(primary->value.operand, outfile, indent + 1, parser);
	movq	(%r12), %r12	 ; primary_28->value.operand, primary
	jmp	.L20	 ;
.L22:
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"variable\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:277:             ast_output(0, false, "type: \"variable\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC26(%rip), %rcx	 ;, tmp121
	call	fputs	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:278:             ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC23(%rip), %rcx	 ;, tmp122
	call	fputs	 ;
 ; D:\TC\src\output.c:279:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	(%r12), %rcx	 ; primary_28->value.var,
 ; D:\TC\src\output.c:238: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:279:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rbp, %r8	 ; indent,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:238: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\output.c:279:             output_variable_access(primary->value.var, outfile, indent + 1, parser);
	jmp	output_variable_access	 ;
.L21:
 ; D:\TC\src\output.c:282:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movq	%rsi, %r9	 ; parser,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movl	8(%r12), %r8d	 ; primary_28->type,
 ; D:\TC\src\output.c:238: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:282:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC27(%rip), %rdx	 ;, tmp124
 ; D:\TC\src\output.c:238: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
 ; D:\TC\src\output.c:282:             ast_output(0, true, "unknown_PrimaryType: %u\n", primary->type);
	jmp	fprintf	 ;
.L19:
 ; D:\TC\src\output.c:231:         string op_str = operator_to_string(expression->operator);
	call	operator_to_string	 ;
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
 ; D:\TC\src\output.c:231:         string op_str = operator_to_string(expression->operator);
	movq	%rax, %r12	 ; tmp139, op_str
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	testq	%r12, %r12	 ; op_str
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	leaq	.LC28(%rip), %rdx	 ;, tmp125
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	cmove	%r14, %r12	 ; op_str,, op_str, op_str
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	movq	%r12, %r8	 ; op_str,
 ; D:\TC\src\output.c:234:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	leaq	1(%rbp), %r12	 ;, _5
 ; D:\TC\src\output.c:232:         ast_output(0, false, "operator: \"%s\"\n", op_str ? op_str : "UNKNOWN_OPERATOR");
	call	fprintf	 ;
 ; D:\TC\src\output.c:233:         ast_output(0, false, "left\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:233:         ast_output(0, false, "left\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC29(%rip), %rcx	 ;, tmp126
	call	fputs	 ;
 ; D:\TC\src\output.c:234:         output_expression(expression->expr_left, outfile, indent + 1, parser);
	movq	(%rdi), %rcx	 ; expression_11->expr_left,
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
	call	output_expression	 ;
 ; D:\TC\src\output.c:235:         ast_output(0, true, "right\n");
	movq	%rbp, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:\TC\src\output.c:236:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	%r12, %rbp	 ; _5, indent
 ; D:\TC\src\output.c:235:         ast_output(0, true, "right\n");
	call	indention	 ;
 ; D:\TC\src\output.c:235:         ast_output(0, true, "right\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC30(%rip), %rcx	 ;, tmp127
	call	fputs	 ;
 ; D:\TC\src\output.c:236:         output_expression(expression->right, outfile, indent + 1, parser);
	movq	16(%rdi), %rdi	 ; expression_11->right, expression
	jmp	.L35	 ;
	.section .rdata,"dr"
.LC31:
	.ascii "name\12\0"
.LC32:
	.ascii "value: \"NULL\"\12\0"
	.text
	.def	output_variable;	.scl	3;	.type	32;	.endef
output_variable:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp97, variable
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp99, indent
 ; D:\TC\src\output.c:113:     ast_output(0, false, "type\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:112: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp100, parser
 ; D:\TC\src\output.c:114:     output_name(variable->type, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _1
 ; D:\TC\src\output.c:112: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp98, outfile
 ; D:\TC\src\output.c:113:     ast_output(0, false, "type\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:112: void output_variable(Variable* variable, FILE* outfile, size_t indent, Parser* parser) {
	subq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:113:     ast_output(0, false, "type\n");
	call	indention	 ;
 ; D:\TC\src\output.c:113:     ast_output(0, false, "type\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC5(%rip), %rcx	 ;, tmp91
	call	fputs	 ;
 ; D:\TC\src\output.c:114:     output_name(variable->type, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; variable_13(D)->type,
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:115:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:115:     ast_output(0, false, "name\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC31(%rip), %rcx	 ;, tmp92
	call	fputs	 ;
 ; D:\TC\src\output.c:116:     output_name(variable->name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_13(D)->name, variable_13(D)->name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:117:     if (variable->value != NULL) {
	cmpq	$0, 16(%rbp)	 ;, variable_13(D)->value
 ; D:\TC\src\output.c:118:         ast_output(0, true, "value\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movl	$1, %r8d	 ;,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:117:     if (variable->value != NULL) {
	je	.L43	 ;,
 ; D:\TC\src\output.c:118:         ast_output(0, true, "value\n");
	call	indention	 ;
 ; D:\TC\src\output.c:118:         ast_output(0, true, "value\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC23(%rip), %rcx	 ;, tmp94
	call	fputs	 ;
 ; D:\TC\src\output.c:119:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	16(%rbp), %rcx	 ; variable_13(D)->value, variable_13(D)->value
 ; D:\TC\src\output.c:122: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:119:         output_expression(variable->value, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _1,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:122: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\output.c:119:         output_expression(variable->value, outfile, indent + 1, parser);
	jmp	output_expression	 ;
.L43:
 ; D:\TC\src\output.c:121:         ast_output(0, true, "value: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:122: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\output.c:121:         ast_output(0, true, "value: \"NULL\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC32(%rip), %rcx	 ;, tmp96
 ; D:\TC\src\output.c:122: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\output.c:121:         ast_output(0, true, "value: \"NULL\"\n");
	jmp	fputs	 ;
	.section .rdata,"dr"
.LC33:
	.ascii "type: \"name\"\12\0"
.LC34:
	.ascii "type: \"function_call\"\12\0"
.LC35:
	.ascii "function\12\0"
.LC36:
	.ascii "arguments\12\0"
.LC37:
	.ascii "arguments[%d]\12\0"
.LC38:
	.ascii "type: \"get sequence_element\"\12\0"
.LC39:
	.ascii "sequence\12\0"
.LC40:
	.ascii "index\12\0"
.LC41:
	.ascii "type: \"get_attribute\"\12\0"
.LC42:
	.ascii "object\12\0"
.LC43:
	.ascii "attribute_name\12\0"
.LC44:
	.ascii "unknown_VariableAccessType: %u\12\0"
	.text
	.def	output_variable_access;	.scl	3;	.type	32;	.endef
output_variable_access:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp126, variable_access
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp128, indent
	pushq	%rsi	 ;
	movq	%r9, %rsi	 ; tmp129, parser
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp127, outfile
	subq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:289:     switch (variable_access->type) {
	movl	16(%rcx), %eax	 ; variable_access_19(D)->type, _1
 ; D:\TC\src\output.c:289:     switch (variable_access->type) {
	cmpl	$2, %eax	 ;, _1
	je	.L46	 ;,
	ja	.L47	 ;,
	testl	%eax, %eax	 ; _1
	leaq	1(%r8), %r13	 ;, _5
	jne	.L55	 ;,
 ; D:\TC\src\output.c:291:             ast_output(0, false, "type: \"name\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:291:             ast_output(0, false, "type: \"name\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC33(%rip), %rcx	 ;, tmp103
	call	fputs	 ;
 ; D:\TC\src\output.c:292:             ast_output(0, true, "name\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:292:             ast_output(0, true, "name\n");
	leaq	.LC31(%rip), %rcx	 ;, tmp104
	movq	%rbx, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:\TC\src\output.c:293:             output_name(variable_access->content.name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.name, variable_access_19(D)->content.name
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _5,
	jmp	.L59	 ;
.L47:
 ; D:\TC\src\output.c:289:     switch (variable_access->type) {
	cmpl	$3, %eax	 ;, _1
	jne	.L60	 ;,
 ; D:\TC\src\output.c:309:             ast_output(0, false, "type: \"get sequence_element\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
 ; D:\TC\src\output.c:311:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _8
 ; D:\TC\src\output.c:309:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:309:             ast_output(0, false, "type: \"get sequence_element\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC38(%rip), %rcx	 ;, tmp113
	call	fputs	 ;
 ; D:\TC\src\output.c:310:             ast_output(0, false, "sequence\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:310:             ast_output(0, false, "sequence\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC39(%rip), %rcx	 ;, tmp114
	call	fputs	 ;
 ; D:\TC\src\output.c:311:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:312:             ast_output(0, true, "index\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:312:             ast_output(0, true, "index\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC40(%rip), %rcx	 ;, tmp115
	call	fputs	 ;
 ; D:\TC\src\output.c:313:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.index, variable_access_19(D)->content.index
 ; D:\TC\src\output.c:326: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:313:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _8,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:326: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:313:             output_expression(variable_access->content.index, outfile, indent + 1, parser);
	jmp	output_expression	 ;
.L55:
 ; D:\TC\src\output.c:296:             args = list_copy(variable_access->content.args);
	movq	8(%rcx), %rcx	 ; variable_access_19(D)->content.args, variable_access_19(D)->content.args
 ; D:\TC\src\output.c:304:                 ast_output(1, false, "arguments[%d]\n", ++index);
	leaq	.LC37(%rip), %r14	 ;, tmp124
 ; D:\TC\src\output.c:296:             args = list_copy(variable_access->content.args);
	call	list_copy	 ;
 ; D:\TC\src\output.c:297:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
 ; D:\TC\src\output.c:296:             args = list_copy(variable_access->content.args);
	movq	%rax, %r12	 ; tmp130, args
 ; D:\TC\src\output.c:297:             ast_output(0, false, "type: \"function_call\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:297:             ast_output(0, false, "type: \"function_call\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC34(%rip), %rcx	 ;, tmp108
	call	fputs	 ;
 ; D:\TC\src\output.c:298:             ast_output(0, false, "function\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:298:             ast_output(0, false, "function\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC35(%rip), %rcx	 ;, tmp109
	call	fputs	 ;
 ; D:\TC\src\output.c:299:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; parser,
	movq	%r13, %r8	 ; _5,
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:302:             index = -1;
	orl	$-1, %ebp	 ;, index
 ; D:\TC\src\output.c:299:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:300:             ast_output(0, true, "arguments\n");
	movq	%rdi, %rdx	 ; indent,
	movq	%rsi, %r9	 ; parser,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
 ; D:\TC\src\output.c:305:                 output_expression(arg, outfile, indent + 2, parser);
	addq	$2, %rdi	 ;, tmp125
 ; D:\TC\src\output.c:300:             ast_output(0, true, "arguments\n");
	call	indention	 ;
 ; D:\TC\src\output.c:300:             ast_output(0, true, "arguments\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC36(%rip), %rcx	 ;, tmp110
	call	fputs	 ;
.L52:
 ; D:\TC\src\output.c:303:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	movq	%r12, %rcx	 ; args,
	call	list_pop	 ;
	movq	%rax, %r15	 ; tmp131, arg
 ; D:\TC\src\output.c:303:             while ((arg = (Expression*)list_pop(args)) != NULL) {
	testq	%rax, %rax	 ; arg
	je	.L61	 ;,
 ; D:\TC\src\output.c:304:                 ast_output(1, false, "arguments[%d]\n", ++index);
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rdx	 ; _5,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:304:                 ast_output(1, false, "arguments[%d]\n", ++index);
	incl	%ebp	 ; index
	movq	%r14, %rdx	 ; tmp124,
	movq	%rbx, %rcx	 ; outfile,
	movl	%ebp, %r8d	 ; index,
	call	fprintf	 ;
 ; D:\TC\src\output.c:305:                 output_expression(arg, outfile, indent + 2, parser);
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %r8	 ; tmp125,
	movq	%rbx, %rdx	 ; outfile,
	movq	%r15, %rcx	 ; arg,
	call	output_expression	 ;
	jmp	.L52	 ;
.L46:
 ; D:\TC\src\output.c:316:             ast_output(0, false, "type: \"get_attribute\"\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
 ; D:\TC\src\output.c:318:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	leaq	1(%rdi), %r12	 ;, _11
 ; D:\TC\src\output.c:316:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:316:             ast_output(0, false, "type: \"get_attribute\"\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC41(%rip), %rcx	 ;, tmp117
	call	fputs	 ;
 ; D:\TC\src\output.c:317:             ast_output(0, false, "object\n");
	movq	%rsi, %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:317:             ast_output(0, false, "object\n");
	movq	%rbx, %rdx	 ; outfile,
	leaq	.LC42(%rip), %rcx	 ;, tmp118
	call	fputs	 ;
 ; D:\TC\src\output.c:318:             output_variable_access(variable_access->base, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; variable_access_19(D)->base,
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
	movq	%rbx, %rdx	 ; outfile,
	call	output_variable_access	 ;
 ; D:\TC\src\output.c:319:             ast_output(0, true, "attribute_name\n");
	movq	%rsi, %r9	 ; parser,
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:319:             ast_output(0, true, "attribute_name\n");
	leaq	.LC43(%rip), %rcx	 ;, tmp119
	movq	%rbx, %rdx	 ; outfile,
	call	fputs	 ;
 ; D:\TC\src\output.c:320:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; variable_access_19(D)->content.attr_name, variable_access_19(D)->content.attr_name
	movq	%rsi, %r9	 ; parser,
	movq	%r12, %r8	 ; _11,
.L59:
 ; D:\TC\src\output.c:326: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:320:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	movq	%rbx, %rdx	 ; outfile,
 ; D:\TC\src\output.c:326: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:320:             output_name(variable_access->content.attr_name, outfile, indent + 1, parser);
	jmp	output_name	 ;
.L60:
 ; D:\TC\src\output.c:323:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rdi, %rdx	 ; indent,
	movq	%rbx, %rcx	 ; outfile,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:323:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movl	16(%rbp), %r8d	 ; variable_access_19(D)->type,
 ; D:\TC\src\output.c:326: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\output.c:323:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	movq	%rbx, %rcx	 ; outfile,
	leaq	.LC44(%rip), %rdx	 ;, tmp122
 ; D:\TC\src\output.c:326: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:323:             ast_output(0, true, "unknown_VariableAccessType: %u\n", variable_access->type);
	jmp	fprintf	 ;
.L61:
 ; D:\TC\src\output.c:326: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.section .rdata,"dr"
.LC45:
	.ascii "if_statement\12\0"
.LC46:
	.ascii "condition\12\0"
.LC47:
	.ascii "body\12\0"
.LC48:
	.ascii "else_if\12\0"
.LC49:
	.ascii "else_body\12\0"
.LC50:
	.ascii "for_statement\12\0"
.LC51:
	.ascii "initializer\12\0"
.LC52:
	.ascii "initializer: \"NULL\"\12\0"
.LC53:
	.ascii "condition: \"NULL\"\12\0"
.LC54:
	.ascii "increment\12\0"
.LC55:
	.ascii "increment: \"NULL\"\12\0"
.LC56:
	.ascii "while_statement\12\0"
.LC57:
	.ascii "variable_declaration_statement\12\0"
.LC58:
	.ascii "return_statement: \"NULL\"\12\0"
.LC59:
	.ascii "return_statement\12\0"
.LC60:
	.ascii "break_statement: \"NULL\"\12\0"
.LC61:
	.ascii "continue_statement: \"NULL\"\12\0"
.LC62:
	.ascii "expression_statement: \"NULL\"\12\0"
.LC63:
	.ascii "expression_statement\12\0"
.LC64:
	.ascii "unknown_StatementType: %u\12\0"
	.text
	.def	output_statement;	.scl	3;	.type	32;	.endef
output_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp188, statement
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp190, indent
	subq	$72, %rsp	 ;,
 ; D:\TC\src\output.c:124:     switch (statement->type) {
	cmpl	$7, 8(%rcx)	 ;, statement_19(D)->type
 ; D:\TC\src\output.c:123: void output_statement(Statement* statement, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rdx, 40(%rsp)	 ; tmp189, %sfp
	movq	%r9, 48(%rsp)	 ; tmp191, %sfp
 ; D:\TC\src\output.c:124:     switch (statement->type) {
	ja	.L63	 ;,
	movl	8(%rcx), %eax	 ; statement_19(D)->type, statement_19(D)->type
	leaq	.L65(%rip), %rdx	 ;, tmp137
 ; D:\TC\src\output.c:153:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:124:     switch (statement->type) {
	movslq	(%rdx,%rax,4), %rax	 ;, tmp139
	addq	%rdx, %rax	 ; tmp137, tmp140
 ; D:\TC\src\output.c:153:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	%rbx, %rdx	 ; indent,
 ; D:\TC\src\output.c:124:     switch (statement->type) {
	jmp	*%rax	 ; tmp140
	.section .rdata,"dr"
	.align 4
.L65:
	.long	.L72-.L65
	.long	.L71-.L65
	.long	.L70-.L65
	.long	.L69-.L65
	.long	.L68-.L65
	.long	.L67-.L65
	.long	.L66-.L65
	.long	.L64-.L65
	.text
.L70:
 ; D:\TC\src\output.c:126:             ast_output(0, false, "if_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:126:             ast_output(0, false, "if_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:\TC\src\output.c:127:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rdi	 ;, _2
 ; D:\TC\src\output.c:126:             ast_output(0, false, "if_statement\n");
	leaq	.LC45(%rip), %rcx	 ;, tmp142
 ; D:\TC\src\output.c:172:     ast_output(0, false, "condition\n");
	leaq	.LC46(%rip), %r14	 ;, tmp146
 ; D:\TC\src\output.c:126:             ast_output(0, false, "if_statement\n");
	call	fputs	 ;
 ; D:\TC\src\output.c:127:             output_if(statement->stmt.if_stmt, outfile, indent + 1, parser);
	movq	(%rsi), %r15	 ; statement_19(D)->stmt.if_stmt, _3
 ; D:\TC\src\output.c:173:     output_expression(if_->condition, outfile, indent + 1, parser);
	leaq	2(%rbx), %rsi	 ;, _57
 ; D:\TC\src\output.c:169:     list(Statement*) body = list_copy(if_->body);
	movq	8(%r15), %rcx	 ; _3->body, _3->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:170:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	16(%r15), %rcx	 ; _3->else_if, _3->else_if
 ; D:\TC\src\output.c:169:     list(Statement*) body = list_copy(if_->body);
	movq	%rax, %r13	 ; tmp192, body
 ; D:\TC\src\output.c:170:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	call	list_copy	 ;
 ; D:\TC\src\output.c:171:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	24(%r15), %rcx	 ; _3->else_body, _3->else_body
 ; D:\TC\src\output.c:170:     list(ElseIf*) else_if_list = list_copy(if_->else_if);
	movq	%rax, %r12	 ; tmp193, else_if_list
 ; D:\TC\src\output.c:171:     list(Statement*) else_body = list_copy(if_->else_body);
	call	list_copy	 ;
 ; D:\TC\src\output.c:172:     ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _2,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:171:     list(Statement*) else_body = list_copy(if_->else_body);
	movq	%rax, %rbp	 ; tmp194, else_body
 ; D:\TC\src\output.c:172:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:172:     ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; tmp146,
	call	fputs	 ;
 ; D:\TC\src\output.c:173:     output_expression(if_->condition, outfile, indent + 1, parser);
	movq	(%r15), %rcx	 ; _3->condition,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:\TC\src\output.c:174:     ast_output(0, false, "body\n");
	leaq	.LC47(%rip), %r15	 ;, tmp147
 ; D:\TC\src\output.c:173:     output_expression(if_->condition, outfile, indent + 1, parser);
	call	output_expression	 ;
 ; D:\TC\src\output.c:174:     ast_output(0, false, "body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _2,
	xorl	%r8d, %r8d	 ;
	movq	48(%rsp), %r9	 ; %sfp,
	call	indention	 ;
 ; D:\TC\src\output.c:174:     ast_output(0, false, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp147,
	call	fputs	 ;
.L73:
 ; D:\TC\src\output.c:176:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%r13, %rcx	 ; body,
	call	list_pop	 ;
 ; D:\TC\src\output.c:177:         output_statement(statement, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
 ; D:\TC\src\output.c:176:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:\TC\src\output.c:176:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L98	 ;,
 ; D:\TC\src\output.c:177:         output_statement(statement, outfile, indent + 1, parser);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	call	output_statement	 ;
	jmp	.L73	 ;
.L98:
 ; D:\TC\src\output.c:178:     ast_output(0, false, "else_if\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _2,
	call	indention	 ;
 ; D:\TC\src\output.c:178:     ast_output(0, false, "else_if\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC48(%rip), %rcx	 ;, tmp148
	call	fputs	 ;
 ; D:\TC\src\output.c:189:     output_expression(else_if->condition, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	 ;, _64
	movq	%rax, 56(%rsp)	 ; _64, %sfp
.L75:
 ; D:\TC\src\output.c:180:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	movq	%r12, %rcx	 ; else_if_list,
	call	list_pop	 ;
	movq	%rax, %r13	 ; tmp198, else_if
 ; D:\TC\src\output.c:180:     while ((else_if = (ElseIf*)list_pop(else_if_list)) != NULL)
	testq	%rax, %rax	 ; else_if
	je	.L99	 ;,
 ; D:\TC\src\output.c:187:     list(Statement*) body = list_copy(else_if->body);
	movq	8(%r13), %rcx	 ; else_if_60->body, else_if_60->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:188:     ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _57,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:187:     list(Statement*) body = list_copy(else_if->body);
	movq	%rax, %rbx	 ; tmp196, body
 ; D:\TC\src\output.c:188:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:188:     ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; tmp146,
	call	fputs	 ;
 ; D:\TC\src\output.c:189:     output_expression(else_if->condition, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	0(%r13), %rcx	 ; else_if_60->condition,
	call	output_expression	 ;
 ; D:\TC\src\output.c:190:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rsi, %rdx	 ; _57,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:190:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%r15, %rcx	 ; tmp147,
	call	fputs	 ;
.L76:
 ; D:\TC\src\output.c:192:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbx, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp197, statement
 ; D:\TC\src\output.c:192:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L75	 ;,
 ; D:\TC\src\output.c:193:         output_statement(statement, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_statement	 ;
	jmp	.L76	 ;
.L99:
 ; D:\TC\src\output.c:182:     ast_output(0, true, "else_body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _2,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:182:     ast_output(0, true, "else_body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC49(%rip), %rcx	 ;, tmp152
	call	fputs	 ;
.L79:
 ; D:\TC\src\output.c:183:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	movq	%rbp, %rcx	 ; else_body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp199, statement
 ; D:\TC\src\output.c:183:     while ((statement = (Statement*)list_pop(else_body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L62	 ;,
 ; D:\TC\src\output.c:184:         output_statement(statement, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; _57,
	call	output_statement	 ;
	jmp	.L79	 ;
.L68:
 ; D:\TC\src\output.c:130:             ast_output(0, false, "for_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:130:             ast_output(0, false, "for_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC50(%rip), %rcx	 ;, tmp153
 ; D:\TC\src\output.c:131:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rdi	 ;, _4
 ; D:\TC\src\output.c:130:             ast_output(0, false, "for_statement\n");
	call	fputs	 ;
 ; D:\TC\src\output.c:131:             output_for(statement->stmt.for_stmt, outfile, indent + 1, parser);
	movq	(%rsi), %rsi	 ; statement_19(D)->stmt.for_stmt, _5
 ; D:\TC\src\output.c:196:     list(Statement*) body = list_copy(for_->body);
	movq	24(%rsi), %rcx	 ; _5->body, _5->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:198:         ast_output(0, false, "initializer\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:197:     if (for_->initializer != NULL) {
	cmpq	$0, (%rsi)	 ;, _5->initializer
 ; D:\TC\src\output.c:198:         ast_output(0, false, "initializer\n");
	movq	%rdi, %rdx	 ; _4,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:196:     list(Statement*) body = list_copy(for_->body);
	movq	%rax, %rbp	 ; tmp200, body
 ; D:\TC\src\output.c:197:     if (for_->initializer != NULL) {
	je	.L82	 ;,
 ; D:\TC\src\output.c:198:         ast_output(0, false, "initializer\n");
	call	indention	 ;
 ; D:\TC\src\output.c:198:         ast_output(0, false, "initializer\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC51(%rip), %rcx	 ;, tmp155
	call	fputs	 ;
 ; D:\TC\src\output.c:199:         output_variable(for_->initializer, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	(%rsi), %rcx	 ; _5->initializer,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_variable	 ;
	jmp	.L83	 ;
.L82:
 ; D:\TC\src\output.c:201:         ast_output(0, false, "initializer: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:201:         ast_output(0, false, "initializer: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC52(%rip), %rcx	 ;, tmp157
	call	fputs	 ;
.L83:
 ; D:\TC\src\output.c:203:         ast_output(0, false, "condition\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:202:     if (for_->condition != NULL) {
	cmpq	$0, 8(%rsi)	 ;, _5->condition
 ; D:\TC\src\output.c:203:         ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:202:     if (for_->condition != NULL) {
	je	.L84	 ;,
 ; D:\TC\src\output.c:203:         ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:203:         ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC46(%rip), %rcx	 ;, tmp158
	call	fputs	 ;
 ; D:\TC\src\output.c:204:         output_expression(for_->condition, outfile, indent + 1, parser);
	movq	8(%rsi), %rcx	 ; _5->condition, _5->condition
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_expression	 ;
	jmp	.L85	 ;
.L84:
 ; D:\TC\src\output.c:206:         ast_output(0, false, "condition: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:206:         ast_output(0, false, "condition: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC53(%rip), %rcx	 ;, tmp161
	call	fputs	 ;
.L85:
 ; D:\TC\src\output.c:208:         ast_output(0, false, "increment\n");
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:207:     if (for_->increment != NULL) {
	cmpq	$0, 16(%rsi)	 ;, _5->increment
 ; D:\TC\src\output.c:208:         ast_output(0, false, "increment\n");
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:207:     if (for_->increment != NULL) {
	je	.L86	 ;,
 ; D:\TC\src\output.c:208:         ast_output(0, false, "increment\n");
	call	indention	 ;
 ; D:\TC\src\output.c:208:         ast_output(0, false, "increment\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC54(%rip), %rcx	 ;, tmp162
	call	fputs	 ;
 ; D:\TC\src\output.c:209:         output_expression(for_->increment, outfile, indent + 1, parser);
	movq	16(%rsi), %rcx	 ; _5->increment, _5->increment
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	2(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
	call	output_expression	 ;
	jmp	.L87	 ;
.L86:
 ; D:\TC\src\output.c:211:         ast_output(0, false, "increment: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:211:         ast_output(0, false, "increment: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC55(%rip), %rcx	 ;, tmp165
	call	fputs	 ;
.L87:
 ; D:\TC\src\output.c:212:     ast_output(0, true, "body\n");
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%rdi, %rdx	 ; _4,
 ; D:\TC\src\output.c:215:         output_statement(statement, outfile, indent + 1, parser);
	addq	$2, %rbx	 ;, tmp187
 ; D:\TC\src\output.c:212:     ast_output(0, true, "body\n");
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:212:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC47(%rip), %rcx	 ;, tmp166
	call	fputs	 ;
.L88:
 ; D:\TC\src\output.c:214:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp201, statement
 ; D:\TC\src\output.c:214:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L62	 ;,
 ; D:\TC\src\output.c:215:         output_statement(statement, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; tmp187,
	call	output_statement	 ;
	jmp	.L88	 ;
.L69:
 ; D:\TC\src\output.c:134:             ast_output(0, false, "while_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:134:             ast_output(0, false, "while_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC56(%rip), %rcx	 ;, tmp168
 ; D:\TC\src\output.c:135:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	leaq	1(%rbx), %rdi	 ;, _6
 ; D:\TC\src\output.c:220:     output_expression(while_->condition, outfile, indent + 1, parser);
	addq	$2, %rbx	 ;, _82
 ; D:\TC\src\output.c:134:             ast_output(0, false, "while_statement\n");
	call	fputs	 ;
 ; D:\TC\src\output.c:135:             output_while(statement->stmt.while_stmt, outfile, indent + 1, parser);
	movq	(%rsi), %rbp	 ; statement_19(D)->stmt.while_stmt, _7
 ; D:\TC\src\output.c:218:     list(Statement*) body = list_copy(while_->body);
	movq	8(%rbp), %rcx	 ; _7->body, _7->body
	call	list_copy	 ;
 ; D:\TC\src\output.c:219:     ast_output(0, false, "condition\n");
	movq	48(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _6,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:218:     list(Statement*) body = list_copy(while_->body);
	movq	%rax, %rsi	 ; tmp202, body
 ; D:\TC\src\output.c:219:     ast_output(0, false, "condition\n");
	call	indention	 ;
 ; D:\TC\src\output.c:219:     ast_output(0, false, "condition\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC46(%rip), %rcx	 ;, tmp170
	call	fputs	 ;
 ; D:\TC\src\output.c:220:     output_expression(while_->condition, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; _82,
	movq	0(%rbp), %rcx	 ; _7->condition,
	call	output_expression	 ;
 ; D:\TC\src\output.c:221:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rdx	 ; _6,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:221:     ast_output(0, true, "body\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC47(%rip), %rcx	 ;, tmp171
	call	fputs	 ;
.L91:
 ; D:\TC\src\output.c:223:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rsi, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp203, statement
 ; D:\TC\src\output.c:223:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L62	 ;,
 ; D:\TC\src\output.c:224:         output_statement(statement, outfile, indent + 1, parser);
	movq	48(%rsp), %r9	 ; %sfp,
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	%rbx, %r8	 ; _82,
	call	output_statement	 ;
	jmp	.L91	 ;
.L71:
 ; D:\TC\src\output.c:138:             ast_output(0, false, "variable_declaration_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:138:             ast_output(0, false, "variable_declaration_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp172
	call	fputs	 ;
 ; D:\TC\src\output.c:139:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; statement_19(D)->stmt.var,
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	1(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:\TC\src\output.c:167: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:139:             output_variable(statement->stmt.var, outfile, indent + 1, parser);
	jmp	output_variable	 ;
.L67:
 ; D:\TC\src\output.c:142:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rsi)	 ;, statement_19(D)->stmt.expr
	jne	.L93	 ;,
 ; D:\TC\src\output.c:143:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:143:                 ast_output(0, false, "return_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC58(%rip), %rcx	 ;, tmp174
	jmp	.L96	 ;
.L93:
 ; D:\TC\src\output.c:146:             ast_output(0, false, "return_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:146:             ast_output(0, false, "return_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC59(%rip), %rcx	 ;, tmp175
	jmp	.L97	 ;
.L66:
 ; D:\TC\src\output.c:150:             ast_output(0, false, "break_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:150:             ast_output(0, false, "break_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC60(%rip), %rcx	 ;, tmp177
.L96:
 ; D:\TC\src\output.c:167: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:150:             ast_output(0, false, "break_statement: \"NULL\"\n");
	jmp	fputs	 ;
.L64:
 ; D:\TC\src\output.c:153:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:153:             ast_output(0, false, "continue_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC61(%rip), %rcx	 ;, tmp178
	jmp	.L96	 ;
.L72:
 ; D:\TC\src\output.c:156:             if (statement->stmt.expr == NULL) {
	cmpq	$0, (%rsi)	 ;, statement_19(D)->stmt.expr
	jne	.L94	 ;,
 ; D:\TC\src\output.c:157:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	call	indention	 ;
 ; D:\TC\src\output.c:157:                 ast_output(0, false, "expression_statement: \"NULL\"\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC62(%rip), %rcx	 ;, tmp179
	jmp	.L96	 ;
.L94:
 ; D:\TC\src\output.c:160:             ast_output(0, false, "expression_statement\n");
	call	indention	 ;
 ; D:\TC\src\output.c:160:             ast_output(0, false, "expression_statement\n");
	movq	40(%rsp), %rdx	 ; %sfp,
	leaq	.LC63(%rip), %rcx	 ;, tmp180
.L97:
	call	fputs	 ;
 ; D:\TC\src\output.c:161:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	movq	(%rsi), %rcx	 ; statement_19(D)->stmt.expr,
	movq	48(%rsp), %r9	 ; %sfp,
	leaq	1(%rbx), %r8	 ;,
	movq	40(%rsp), %rdx	 ; %sfp,
 ; D:\TC\src\output.c:167: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:161:             output_expression(statement->stmt.expr, outfile, indent + 1, parser);
	jmp	output_expression	 ;
.L63:
 ; D:\TC\src\output.c:164:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	48(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; indent,
	xorl	%r8d, %r8d	 ;
	call	indention	 ;
 ; D:\TC\src\output.c:164:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	movl	8(%rsi), %r8d	 ; statement_19(D)->type,
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\output.c:167: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
 ; D:\TC\src\output.c:164:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	leaq	.LC64(%rip), %rdx	 ;, tmp183
 ; D:\TC\src\output.c:167: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\output.c:164:             ast_output(0, false, "unknown_StatementType: %u\n", statement->type);
	jmp	fprintf	 ;
.L62:
 ; D:\TC\src\output.c:167: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.section .rdata,"dr"
.LC65:
	.ascii "NULL\0"
.LC66:
	.ascii "import\12\0"
.LC67:
	.ascii "source: \"%s\"\12\0"
.LC68:
	.ascii "parameters\12\0"
.LC69:
	.ascii "parameters[%d]\12\0"
.LC70:
	.ascii "class\12\0"
.LC71:
	.ascii "members\12\0"
.LC72:
	.ascii "method\12\0"
.LC73:
	.ascii "variable\12\0"
.LC74:
	.ascii "unknown_ClassMemberType: %u\12\0"
.LC75:
	.ascii "unknown_CodeMemberType: %u\12\0"
	.text
	.globl	output_code
	.def	output_code;	.scl	2;	.type	32;	.endef
output_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%r8, %rbx	 ; tmp184, indent
	subq	$72, %rsp	 ;,
 ; D:\TC\src\output.c:40:     list(CodeMember*) members = list_copy(code->members);
	movq	(%rcx), %rcx	 ; code_5(D)->members,
 ; D:\TC\src\output.c:39: void output_code(Code* code, FILE* outfile, size_t indent, Parser* parser) {
	movq	%rdx, 152(%rsp)	 ; tmp183, outfile
	movq	%r9, 168(%rsp)	 ; tmp185, parser
 ; D:\TC\src\output.c:40:     list(CodeMember*) members = list_copy(code->members);
	call	list_copy	 ;
	movq	%rax, 48(%rsp)	 ; tmp186, %sfp
.L101:
 ; D:\TC\src\output.c:42:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	movq	48(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp197, member
 ; D:\TC\src\output.c:42:     while ((member = (CodeMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L125	 ;,
 ; D:\TC\src\output.c:21:     switch (code_member->type) {
	movl	8(%rsi), %eax	 ; member_9->type, _14
 ; D:\TC\src\output.c:35:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movq	168(%rsp), %r9	 ; parser,
 ; D:\TC\src\output.c:43:         output_code_member(member, outfile, indent + 1, parser);
	leaq	1(%rbx), %rdx	 ;, _2
 ; D:\TC\src\output.c:35:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	xorl	%r8d, %r8d	 ;
	movq	152(%rsp), %rcx	 ; outfile,
 ; D:\TC\src\output.c:21:     switch (code_member->type) {
	cmpl	$1, %eax	 ;, _14
	je	.L102	 ;,
	cmpl	$2, %eax	 ;, _14
	je	.L103	 ;,
	testl	%eax, %eax	 ; _14
	jne	.L104	 ;,
 ; D:\TC\src\output.c:23:             ast_output(0, false, "import\n");
	call	indention	 ;
 ; D:\TC\src\output.c:23:             ast_output(0, false, "import\n");
	leaq	.LC66(%rip), %rcx	 ;, tmp134
 ; D:\TC\src\output.c:24:             output_import(code_member->content.import, outfile, indent + 1, parser);
	leaq	2(%rbx), %rdi	 ;, _15
 ; D:\TC\src\output.c:23:             ast_output(0, false, "import\n");
	movq	152(%rsp), %rdx	 ; outfile,
	call	fputs	 ;
 ; D:\TC\src\output.c:46:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _15,
 ; D:\TC\src\output.c:24:             output_import(code_member->content.import, outfile, indent + 1, parser);
	movq	(%rsi), %rsi	 ; member_9->content.import, _16
 ; D:\TC\src\output.c:46:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:46:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC31(%rip), %rcx	 ;, tmp135
	call	fputs	 ;
 ; D:\TC\src\output.c:47:     output_name(import->name, outfile, indent + 1, parser);
	movq	168(%rsp), %r9	 ; parser,
	movq	(%rsi), %rcx	 ; _16->name,
	leaq	3(%rbx), %r8	 ;,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _15,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	8(%rsi), %r8	 ; _16->source, _24
	testq	%r8, %r8	 ; _24
	jne	.L105	 ;,
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	leaq	.LC65(%rip), %r8	 ;, _24
.L105:
 ; D:\TC\src\output.c:48:     ast_output(0, true, "source: \"%s\"\n", import->source != NULL ? import->source : "NULL");
	movq	152(%rsp), %rcx	 ; outfile,
	leaq	.LC67(%rip), %rdx	 ;, tmp137
	call	fprintf	 ;
 ; D:\TC\src\output.c:49: }
	jmp	.L101	 ;
.L102:
 ; D:\TC\src\output.c:27:             ast_output(0, false, "function\n");
	call	indention	 ;
 ; D:\TC\src\output.c:28:             output_function(code_member->content.function, outfile, indent + 1, parser);
	leaq	2(%rbx), %rdi	 ;, _17
 ; D:\TC\src\output.c:59:     int index = -1;
	orl	$-1, %r13d	 ;, index
 ; D:\TC\src\output.c:62:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	4(%rbx), %r14	 ;, tmp178
 ; D:\TC\src\output.c:27:             ast_output(0, false, "function\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC35(%rip), %rcx	 ;, tmp138
	call	fputs	 ;
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
 ; D:\TC\src\output.c:28:             output_function(code_member->content.function, outfile, indent + 1, parser);
	movq	(%rsi), %rbp	 ; member_9->content.function, _18
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
 ; D:\TC\src\output.c:52:     output_name(function->name, outfile, indent + 1, parser);
	leaq	3(%rbx), %rsi	 ;, _26
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	call	indention	 ;
 ; D:\TC\src\output.c:51:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC31(%rip), %rcx	 ;, tmp139
	call	fputs	 ;
 ; D:\TC\src\output.c:52:     output_name(function->name, outfile, indent + 1, parser);
	movq	0(%rbp), %rcx	 ; _18->name,
	movq	168(%rsp), %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, false, "return_type\n");
	movq	168(%rsp), %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:53:     ast_output(0, false, "return_type\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC7(%rip), %rcx	 ;, tmp140
	call	fputs	 ;
 ; D:\TC\src\output.c:54:     output_name(function->return_type, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; _18->return_type, _18->return_type
	movq	168(%rsp), %r9	 ; parser,
	movq	%rsi, %r8	 ; _26,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:55:     ast_output(0, false, "parameters\n");
	movq	168(%rsp), %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _17,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:55:     ast_output(0, false, "parameters\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC68(%rip), %rcx	 ;, tmp142
	call	fputs	 ;
 ; D:\TC\src\output.c:56:     list(Variable*) parameters = list_copy(function->parameters);
	movq	16(%rbp), %rcx	 ; _18->parameters, _18->parameters
	call	list_copy	 ;
 ; D:\TC\src\output.c:57:     list(Statement*) body = list_copy(function->body);
	movq	24(%rbp), %rcx	 ; _18->body, _18->body
 ; D:\TC\src\output.c:56:     list(Variable*) parameters = list_copy(function->parameters);
	movq	%rax, %r12	 ; tmp187, parameters
 ; D:\TC\src\output.c:57:     list(Statement*) body = list_copy(function->body);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp188, body
.L107:
 ; D:\TC\src\output.c:60:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	168(%rsp), %r9	 ; parser,
 ; D:\TC\src\output.c:60:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %r15	 ; tmp189, parameter
 ; D:\TC\src\output.c:60:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L126	 ;,
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	152(%rsp), %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; _26,
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r13d	 ; index
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	call	indention	 ;
 ; D:\TC\src\output.c:61:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	152(%rsp), %rcx	 ; outfile,
	movl	%r13d, %r8d	 ; index,
	leaq	.LC69(%rip), %rdx	 ;,
	call	fprintf	 ;
 ; D:\TC\src\output.c:62:         output_variable(parameter, outfile, indent + 2, parser);
	movq	168(%rsp), %r9	 ; parser,
	movq	%r14, %r8	 ; tmp178,
	movq	%r15, %rcx	 ; parameter,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_variable	 ;
	jmp	.L107	 ;
.L126:
 ; D:\TC\src\output.c:64:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _17,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:64:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC47(%rip), %rcx	 ;, tmp147
	call	fputs	 ;
.L109:
 ; D:\TC\src\output.c:66:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp190, statement
 ; D:\TC\src\output.c:66:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L101	 ;,
 ; D:\TC\src\output.c:67:         output_statement(statement, outfile, indent + 1, parser);
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%rsi, %r8	 ; _26,
	call	output_statement	 ;
	jmp	.L109	 ;
.L103:
 ; D:\TC\src\output.c:31:             ast_output(0, false, "class\n");
	call	indention	 ;
 ; D:\TC\src\output.c:31:             ast_output(0, false, "class\n");
	leaq	.LC70(%rip), %rcx	 ;, tmp148
 ; D:\TC\src\output.c:32:             output_class(code_member->content.class_, outfile, indent + 1, parser);
	leaq	2(%rbx), %rdi	 ;, _19
 ; D:\TC\src\output.c:31:             ast_output(0, false, "class\n");
	movq	152(%rsp), %rdx	 ; outfile,
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	leaq	.LC72(%rip), %r14	 ;, tmp174
 ; D:\TC\src\output.c:31:             ast_output(0, false, "class\n");
	call	fputs	 ;
 ; D:\TC\src\output.c:104:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _19,
 ; D:\TC\src\output.c:32:             output_class(code_member->content.class_, outfile, indent + 1, parser);
	movq	(%rsi), %rsi	 ; member_9->content.class_, _20
 ; D:\TC\src\output.c:104:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:104:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC31(%rip), %rcx	 ;,
	call	fputs	 ;
 ; D:\TC\src\output.c:105:     output_name(class->name, outfile, indent + 1, parser);
	leaq	3(%rbx), %rax	 ;, _38
	movq	168(%rsp), %r9	 ; parser,
	movq	(%rsi), %rcx	 ; _20->name,
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%rax, %r8	 ; _38,
	movq	%rax, 32(%rsp)	 ; _38, %sfp
	call	output_name	 ;
 ; D:\TC\src\output.c:106:     ast_output(0, true, "members\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _19,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:106:     ast_output(0, true, "members\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC71(%rip), %rcx	 ;, tmp150
	call	fputs	 ;
 ; D:\TC\src\output.c:107:     list(ClassMember*) members = list_copy(class->members);
	movq	8(%rsi), %rcx	 ; _20->members, _20->members
	call	list_copy	 ;
	movq	%rax, 56(%rsp)	 ; tmp191, %sfp
.L111:
 ; D:\TC\src\output.c:109:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_pop	 ;
	movq	%rax, %rsi	 ; tmp196, member
 ; D:\TC\src\output.c:109:     while ((member = (ClassMember*)list_pop(members)) != NULL)
	testq	%rax, %rax	 ; member
	je	.L101	 ;,
 ; D:\TC\src\output.c:89:     switch (class_member->type) {
	movl	8(%rsi), %eax	 ; member_42->type, _43
 ; D:\TC\src\output.c:89:     switch (class_member->type) {
	testl	%eax, %eax	 ; _43
	je	.L112	 ;,
	decl	%eax	 ; _43
	jne	.L127	 ;,
 ; D:\TC\src\output.c:95:             ast_output(0, false, "variable\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:95:             ast_output(0, false, "variable\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC73(%rip), %rcx	 ;, tmp162
	call	fputs	 ;
 ; D:\TC\src\output.c:96:             output_variable(class_member->content.variable, outfile, indent + 1, parser);
	movq	168(%rsp), %r9	 ; parser,
	movq	(%rsi), %rcx	 ; member_42->content.variable,
	leaq	4(%rbx), %r8	 ;,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_variable	 ;
 ; D:\TC\src\output.c:97:             break;
	jmp	.L111	 ;
.L112:
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	movq	32(%rsp), %rdx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:92:             output_method(class_member->content.method, outfile, indent + 1, parser);
	leaq	4(%rbx), %rdi	 ;, _44
 ; D:\TC\src\output.c:78:     int index = -1;
	orl	$-1, %r13d	 ;, index
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
 ; D:\TC\src\output.c:81:         output_variable(parameter, outfile, indent + 2, parser);
	leaq	6(%rbx), %r15	 ;, tmp173
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	call	indention	 ;
 ; D:\TC\src\output.c:91:             ast_output(0, false, "method\n");
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%r14, %rcx	 ; tmp174,
	call	fputs	 ;
 ; D:\TC\src\output.c:70:     ast_output(0, false, "name\n");
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
 ; D:\TC\src\output.c:92:             output_method(class_member->content.method, outfile, indent + 1, parser);
	movq	(%rsi), %rbp	 ; member_42->content.method, _45
 ; D:\TC\src\output.c:70:     ast_output(0, false, "name\n");
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:70:     ast_output(0, false, "name\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC31(%rip), %rcx	 ;,
	call	fputs	 ;
 ; D:\TC\src\output.c:71:     output_name(method->name, outfile, indent + 1, parser);
	leaq	5(%rbx), %rax	 ;, _49
	movq	0(%rbp), %rcx	 ; _45->name,
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rdx	 ; outfile,
	movq	%rax, %r8	 ; _49,
	movq	%rax, 40(%rsp)	 ; _49, %sfp
	call	output_name	 ;
 ; D:\TC\src\output.c:72:     ast_output(0, false, "return_type\n");
	movq	168(%rsp), %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:72:     ast_output(0, false, "return_type\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC7(%rip), %rcx	 ;, tmp154
	call	fputs	 ;
 ; D:\TC\src\output.c:73:     output_name(method->return_type, outfile, indent + 1, parser);
	movq	8(%rbp), %rcx	 ; _45->return_type, _45->return_type
	leaq	5(%rbx), %r8	 ;,
	movq	168(%rsp), %r9	 ; parser,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_name	 ;
 ; D:\TC\src\output.c:74:     ast_output(0, false, "parameters\n");
	movq	168(%rsp), %r9	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %rdx	 ; _44,
	movq	152(%rsp), %rcx	 ; outfile,
	call	indention	 ;
 ; D:\TC\src\output.c:74:     ast_output(0, false, "parameters\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC68(%rip), %rcx	 ;, tmp156
	call	fputs	 ;
 ; D:\TC\src\output.c:75:     list(Variable*) parameters = list_copy(method->parameters);
	movq	16(%rbp), %rcx	 ; _45->parameters, _45->parameters
	call	list_copy	 ;
 ; D:\TC\src\output.c:76:     list(Statement*) body = list_copy(method->body);
	movq	24(%rbp), %rcx	 ; _45->body, _45->body
 ; D:\TC\src\output.c:75:     list(Variable*) parameters = list_copy(method->parameters);
	movq	%rax, %r12	 ; tmp192, parameters
 ; D:\TC\src\output.c:76:     list(Statement*) body = list_copy(method->body);
	call	list_copy	 ;
	movq	%rax, %rbp	 ; tmp193, body
.L115:
 ; D:\TC\src\output.c:79:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%r12, %rcx	 ; parameters,
	call	list_pop	 ;
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	168(%rsp), %r9	 ; parser,
 ; D:\TC\src\output.c:79:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	movq	%rax, %rsi	 ; tmp194, parameter
 ; D:\TC\src\output.c:79:     while ((parameter = (Variable*)list_pop(parameters)) != NULL) {
	testq	%rax, %rax	 ; parameter
	je	.L128	 ;,
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	152(%rsp), %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	incl	%r13d	 ; index
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	call	indention	 ;
 ; D:\TC\src\output.c:80:         ast_output(1, false, "parameters[%d]\n", ++index);
	movq	152(%rsp), %rcx	 ; outfile,
	movl	%r13d, %r8d	 ; index,
	leaq	.LC69(%rip), %rdx	 ;,
	call	fprintf	 ;
 ; D:\TC\src\output.c:81:         output_variable(parameter, outfile, indent + 2, parser);
	movq	168(%rsp), %r9	 ; parser,
	movq	%r15, %r8	 ; tmp173,
	movq	%rsi, %rcx	 ; parameter,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_variable	 ;
	jmp	.L115	 ;
.L128:
 ; D:\TC\src\output.c:83:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rcx	 ; outfile,
	movq	%rdi, %rdx	 ; _44,
	movl	$1, %r8d	 ;,
	call	indention	 ;
 ; D:\TC\src\output.c:83:     ast_output(0, true, "body\n");
	movq	152(%rsp), %rdx	 ; outfile,
	leaq	.LC47(%rip), %rcx	 ;, tmp161
	call	fputs	 ;
.L117:
 ; D:\TC\src\output.c:85:     while ((statement = (Statement*)list_pop(body)) != NULL)
	movq	%rbp, %rcx	 ; body,
	call	list_pop	 ;
	movq	%rax, %rcx	 ; tmp195, statement
 ; D:\TC\src\output.c:85:     while ((statement = (Statement*)list_pop(body)) != NULL)
	testq	%rax, %rax	 ; statement
	je	.L111	 ;,
 ; D:\TC\src\output.c:86:         output_statement(statement, outfile, indent + 1, parser);
	movq	168(%rsp), %r9	 ; parser,
	movq	40(%rsp), %r8	 ; %sfp,
	movq	152(%rsp), %rdx	 ; outfile,
	call	output_statement	 ;
	jmp	.L117	 ;
.L127:
 ; D:\TC\src\output.c:99:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movq	32(%rsp), %rdx	 ; %sfp,
	movq	152(%rsp), %rcx	 ; outfile,
	xorl	%r8d, %r8d	 ;
	movq	168(%rsp), %r9	 ; parser,
	call	indention	 ;
 ; D:\TC\src\output.c:99:             ast_output(0, false, "unknown_ClassMemberType: %u\n", class_member->type);
	movl	8(%rsi), %r8d	 ; member_42->type,
	movq	152(%rsp), %rcx	 ; outfile,
	leaq	.LC74(%rip), %rdx	 ;, tmp165
	call	fprintf	 ;
 ; D:\TC\src\output.c:100:             break;
	jmp	.L111	 ;
.L104:
 ; D:\TC\src\output.c:35:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	call	indention	 ;
 ; D:\TC\src\output.c:35:             ast_output(0, false, "unknown_CodeMemberType: %u\n", code_member->type);
	movl	8(%rsi), %r8d	 ; member_9->type,
	movq	152(%rsp), %rcx	 ; outfile,
	leaq	.LC75(%rip), %rdx	 ;, tmp167
	call	fprintf	 ;
 ; D:\TC\src\output.c:36:             break;
	jmp	.L101	 ;
.L125:
 ; D:\TC\src\output.c:44: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	indention;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	fputs;	.scl	2;	.type	32;	.endef
	.def	operator_to_string;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef

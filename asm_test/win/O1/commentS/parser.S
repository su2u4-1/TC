	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rdi	 ; tmp119, lexer
	movq	%rdx, %r13	 ; tmp120, expr_left
	movl	%r8d, %r15d	 ; tmp121, min_prec
	movq	%r9, %r14	 ; tmp122, now_scope
 ; D:\TC\src\parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_24->type
	je	.L7	 ;,
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L2	 ;
.L15:
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp112
	call	parser_error	 ;
 ; D:\TC\src\parser.c:661:             return NULL;
	jmp	.L1	 ;
.L13:
 ; D:\TC\src\parser.c:674:             token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_49->type
	jne	.L5	 ;,
.L6:
 ; D:\TC\src\parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_66->lexeme, token_ptr_66->lexeme
	call	string_to_operator	 ;
	movl	%eax, %ebx	 ; tmp130, next_op
 ; D:\TC\src\parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %ebx	 ;, next_op
	je	.L5	 ;,
	cmpl	%eax, %ebp	 ; next_prec, op_prec
	jge	.L5	 ;,
 ; D:\TC\src\parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp137
	movq	%rdx, 32(%rsp)	 ; tmp137,
	movq	%r14, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rsi, %rdx	 ; <retval>,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rsi	 ; tmp132, <retval>
 ; D:\TC\src\parser.c:672:             if (right == 0)
	testq	%rax, %rax	 ; <retval>
	jne	.L13	 ;,
	jmp	.L1	 ;
.L5:
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rsi, %r9	 ; <retval>,
	movl	$0, %r8d	 ;,
	movq	%r13, %rdx	 ; expr_left,
	movl	%r12d, %ecx	 ; op,
	call	create_expression	 ;
	movq	%rax, %r13	 ; tmp134, expr_left
 ; D:\TC\src\parser.c:678:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_53->type
	jne	.L14	 ;,
.L7:
 ; D:\TC\src\parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_67->lexeme, token_ptr_67->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r12d	 ; tmp124, op
 ; D:\TC\src\parser.c:651:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
	call	operator_precedence	 ;
	movl	%eax, %ebp	 ; tmp125, op_prec
 ; D:\TC\src\parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	 ;, op
	je	.L9	 ;,
	cmpl	%r15d, %eax	 ; min_prec, op_prec
	jl	.L9	 ;,
 ; D:\TC\src\parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:656:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp126, token
 ; D:\TC\src\parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rdi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp127, <retval>
 ; D:\TC\src\parser.c:659:         if (right_primary == 0) {
	testq	%rax, %rax	 ; <retval>
	je	.L15	 ;,
 ; D:\TC\src\parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rsi	 ; tmp128, <retval>
 ; D:\TC\src\parser.c:664:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_41->type
	je	.L6	 ;,
	jmp	.L5	 ;
.L14:
	movq	%r13, %rsi	 ; expr_left, <retval>
	jmp	.L2	 ;
.L9:
	movq	%r13, %rsi	 ; expr_left, <retval>
.L2:
 ; D:\TC\src\parser.c:681:     token = peek_current_token(lexer);
	movq	%rdi, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L1:
 ; D:\TC\src\parser.c:684: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$56, %rsp	 ;,
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
	.align 8
.LC1:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp90, lexer
	movq	%rdx, %rdi	 ; tmp91, now_scope
	movq	%r8, %rbp	 ; tmp92, parser
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp93, <retval>
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; <retval>
	je	.L20	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; <retval>,
	movl	$0, %edx	 ;,
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdx	 ; tmp95, _2
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	movl	$0, %r8d	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp96, <retval>
.L16:
 ; D:\TC\src\parser.c:695: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L20:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdx	 ; tmp94, _1
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC1(%rip), %rcx	 ;, tmp88
	call	parser_error	 ;
 ; D:\TC\src\parser.c:692:         return NULL;
	jmp	.L16	 ;
	.section .rdata,"dr"
.LC2:
	.ascii "Expected variable type\0"
	.align 8
.LC3:
	.ascii "Expected a type for variable declaration\0"
.LC4:
	.ascii "Unknown variable type\0"
.LC5:
	.ascii "Expected variable name\0"
	.align 8
.LC6:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp119, lexer
	movq	%rdx, %rbp	 ; tmp120, now_scope
	movq	%r8, %r12	 ; tmp121, parser
 ; D:\TC\src\parser.c:323:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp122, token
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_25->type, _1
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L22	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rbx), %rcx	 ; token_25->lexeme, token_25->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp123
	je	.L23	 ;,
.L22:
 ; D:\TC\src\parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rdx	 ; token_25->lexeme, token_25->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search	 ;
	movq	%rax, %rdi	 ; tmp124, type
 ; D:\TC\src\parser.c:330:     if (type != 0) {
	testq	%rax, %rax	 ; type
	je	.L25	 ;,
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	 ;, type_30->kind
	jne	.L32	 ;,
.L26:
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp125, token
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_35->type
	jne	.L33	 ;,
.L27:
 ; D:\TC\src\parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	(%rbx), %rcx	 ; token_35->lexeme, token_35->lexeme
	movq	%rbp, 32(%rsp)	 ; now_scope,
	movl	$0, %r9d	 ;,
	movq	%rdi, %r8	 ; type,
	movl	$1, %edx	 ;,
	call	create_name	 ;
	movq	%rax, %rbx	 ; tmp126, name
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:341:     Expression* value = 0;
	movl	$0, %r13d	 ;, value
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_40->type
	je	.L34	 ;,
.L28:
 ; D:\TC\src\parser.c:353:     return create_variable(type, name, value);
	movq	%r13, %r8	 ; value,
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
	call	create_variable	 ;
.L21:
 ; D:\TC\src\parser.c:354: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L23:
 ; D:\TC\src\parser.c:326:         parser_error("Expected variable type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp106
	call	parser_error	 ;
 ; D:\TC\src\parser.c:327:         return NULL;
	movl	$0, %eax	 ;, <retval>
	jmp	.L21	 ;
.L32:
 ; D:\TC\src\parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp110
	call	parser_error	 ;
	jmp	.L26	 ;
.L25:
 ; D:\TC\src\parser.c:335:         parser_error("Unknown variable type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp111
	call	parser_error	 ;
	jmp	.L26	 ;
.L33:
 ; D:\TC\src\parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp112
	call	parser_error	 ;
	jmp	.L27	 ;
.L34:
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp114
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	movq	(%rax), %rcx	 ; token_40->lexeme, token_40->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp128
	je	.L28	 ;,
 ; D:\TC\src\parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp129, token
 ; D:\TC\src\parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp130, value
 ; D:\TC\src\parser.c:350:         if (value == 0)
	testq	%rax, %rax	 ; value
	jne	.L28	 ;,
 ; D:\TC\src\parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	%r14, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp117
	call	parser_error	 ;
	jmp	.L28	 ;
	.section .rdata,"dr"
	.align 8
.LC7:
	.ascii "Failed to parse parenthesized expression\0"
.LC8:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC9:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC10:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC11:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC12:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC13:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC14:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC15:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC16:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC17:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC18:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC19:
	.ascii "Expected attribute name after '.'\0"
.LC20:
	.ascii "Unknown attribute name\0"
	.align 8
.LC21:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC22:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp263, lexer
	movq	%rdx, %r14	 ; tmp264, now_scope
	movq	%r8, 160(%rsp)	 ; tmp265, parser
 ; D:\TC\src\parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp266, token
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_49->type, _1
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L88	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L89	 ;,
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L90	 ;,
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L91	 ;,
.L40:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_49->type
	je	.L92	 ;,
.L48:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rdi), %eax	 ; token_49->type, _25
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, _25
	je	.L49	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	 ;, _25
	jne	.L50	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp204
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rdi), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; tmp280
	je	.L50	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	160(%rsp), %rax	 ; parser, tmp327
	cmpb	$0, 1(%rax)	 ;, parser_58(D)->in_method
	je	.L50	 ;,
.L49:
 ; D:\TC\src\parser.c:774:     Token* token = peek_current_token(lexer);
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp281, token
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_88->type, _89
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _89
	je	.L51	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _89
	jne	.L52	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp207
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rbx), %rcx	 ; token_88->lexeme, token_88->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp282
	je	.L52	 ;,
.L51:
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rdx	 ; token_88->lexeme, token_88->lexeme
	movq	%r14, %rcx	 ; now_scope,
	call	search	 ;
	movq	%rax, %r15	 ; tmp283, base_name
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rbp	 ; tmp284, variable_value
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %r13	 ; tmp285, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_96->type
	jne	.L54	 ;,
 ; D:\TC\src\parser.c:780:     Name* current_type = 0;
	movl	$0, %r12d	 ;, current_type
 ; D:\TC\src\parser.c:782:     Scope* var_scope = 0;
	movl	$0, %ebx	 ;, var_scope
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	%rbp, 56(%rsp)	 ; variable_value, %sfp
	jmp	.L76	 ;
.L88:
 ; D:\TC\src\parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%rdi), %rdx	 ; token_49->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:710:         type = PRIM_INTEGER;
	movl	$0, %edi	 ;, type
.L37:
 ; D:\TC\src\parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbp, 32(%rsp)	 ; variable_value,
	movq	%rsi, %r9	 ; prim_value,
	movq	%rbx, %r8	 ; <retval>,
	movl	%edi, %ecx	 ; type,
	call	create_primary	 ;
	movq	%rax, %rbx	 ; tmp308, <retval>
.L35:
 ; D:\TC\src\parser.c:769: }
	movq	%rbx, %rax	 ; <retval>,
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
.L89:
 ; D:\TC\src\parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%rdi), %rdx	 ; token_49->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %edi	 ;, type
	jmp	.L37	 ;
.L90:
 ; D:\TC\src\parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%rdi), %rdx	 ; token_49->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:716:         type = PRIM_STRING;
	movl	$2, %edi	 ;, type
	jmp	.L37	 ;
.L91:
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp182
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	movq	(%rdi), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp267
	je	.L41	 ;,
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%rdi), %rdx	 ; token_49->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:719:         type = PRIM_TRUE;
	movl	$3, %edi	 ;, type
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L37	 ;
.L41:
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rdi)	 ;, token_49->type
	jne	.L40	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp185
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	movq	(%rdi), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp268
	je	.L40	 ;,
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%rdi), %rdx	 ; token_49->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:722:         type = PRIM_FALSE;
	movl	$4, %edi	 ;, type
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L37	 ;
.L92:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp188
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp269
	jne	.L93	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_49->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp196
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	movq	(%rdi), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp274
	jne	.L94	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_49->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp200
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	movq	(%rdi), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp277
	je	.L48	 ;,
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp278, token
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp279, prim_value
 ; D:\TC\src\parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L95	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %edi	 ;, type
	jmp	.L37	 ;
.L93:
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp270, token
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbx	 ; tmp271, <retval>
 ; D:\TC\src\parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; <retval>
	je	.L96	 ;,
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp272, token
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %edi	 ; token_62->type, type
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %edi	 ;, type
	jne	.L46	 ;,
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp192
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_62->lexeme, token_62->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp273
	je	.L46	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
	jmp	.L37	 ;
.L96:
 ; D:\TC\src\parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp191
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	jmp	.L35	 ;
.L46:
 ; D:\TC\src\parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp195
	call	parser_error	 ;
 ; D:\TC\src\parser.c:737:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L35	 ;
.L94:
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp275, token
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rsi	 ; tmp276, prim_value
 ; D:\TC\src\parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L97	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	movl	$0, %ebp	 ;, variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %edi	 ;, type
	jmp	.L37	 ;
.L97:
 ; D:\TC\src\parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp199
	call	parser_error	 ;
 ; D:\TC\src\parser.c:746:             return NULL;
	movq	%rsi, %rbx	 ; prim_value, <retval>
	jmp	.L35	 ;
.L95:
 ; D:\TC\src\parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp203
	call	parser_error	 ;
 ; D:\TC\src\parser.c:755:             return NULL;
	movq	%rsi, %rbx	 ; prim_value, <retval>
	jmp	.L35	 ;
.L52:
 ; D:\TC\src\parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp210
	call	parser_error	 ;
 ; D:\TC\src\parser.c:778:         return NULL;
	jmp	.L77	 ;
.L84:
 ; D:\TC\src\parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%r15), %r12	 ; base_name_234->info.type, current_type
.L55:
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%rbx, %rbx	 ; var_scope
	jne	.L58	 ;,
	testq	%r12, %r12	 ; current_type
	je	.L58	 ;,
 ; D:\TC\src\parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%r12)	 ;, current_type_108->kind
	je	.L98	 ;,
.L58:
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp328
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	0(%r13), %rcx	 ; token_ptr_236->lexeme, token_ptr_236->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp286
	jne	.L99	 ;,
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp332
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	movq	0(%r13), %rcx	 ; token_ptr_236->lexeme, token_ptr_236->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp297
	je	.L69	 ;,
 ; D:\TC\src\parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp298, token
 ; D:\TC\src\parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp299, index
 ; D:\TC\src\parser.c:837:             if (index == 0)
	testq	%rax, %rax	 ; index
	je	.L100	 ;,
.L70:
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp300, token
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_146->type
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp244
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	movq	0(%r13), %rcx	 ; token_146->lexeme, token_146->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp301
	je	.L71	 ;,
 ; D:\TC\src\parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	$0, 32(%rsp)	 ;,
	movq	%rbp, %r9	 ; index,
	movl	$0, %r8d	 ;,
	movq	56(%rsp), %rdx	 ; %sfp,
	movl	$3, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp302, %sfp
.L68:
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %r13	 ; tmp307, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_161->type
	jne	.L101	 ;,
.L76:
 ; D:\TC\src\parser.c:789:         if (base_name != 0) {
	testq	%r15, %r15	 ; base_name
	je	.L55	 ;,
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%r15), %eax	 ; base_name_234->kind, _98
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %edx	 ;, tmp212
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %edx	 ;, tmp212
	jbe	.L84	 ;,
	cmpl	$5, %eax	 ;, _98
	je	.L84	 ;,
 ; D:\TC\src\parser.c:794:                 current_type = base_name;
	testl	$-5, %eax	 ;, _98
	cmove	%r15, %r12	 ; current_type,, base_name, current_type
	jmp	.L55	 ;
.L98:
 ; D:\TC\src\parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%r12), %rbx	 ; current_type_108->info.scope, var_scope
	jmp	.L58	 ;
.L99:
 ; D:\TC\src\parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp287, token
 ; D:\TC\src\parser.c:804:             if (base_name == 0)
	testq	%r15, %r15	 ; base_name
	je	.L102	 ;,
.L60:
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movl	24(%r15), %eax	 ; base_name_234->kind, tmp329
	subl	$2, %eax	 ;, tmp226
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %eax	 ;, tmp226
	ja	.L103	 ;,
.L61:
 ; D:\TC\src\parser.c:809:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp288, token
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp289, args
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13	 ;, tmp260
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L62	 ;
.L102:
 ; D:\TC\src\parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp225
	call	parser_error	 ;
	jmp	.L60	 ;
.L103:
 ; D:\TC\src\parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp228
	call	parser_error	 ;
	jmp	.L61	 ;
.L106:
 ; D:\TC\src\parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp229
	call	parser_error	 ;
	jmp	.L63	 ;
.L107:
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp330
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_124->lexeme, token_124->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp292
	jne	.L104	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_124->type
	jne	.L64	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_124->lexeme, token_124->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp294
	je	.L64	 ;,
.L62:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_123->type
	je	.L105	 ;,
.L67:
 ; D:\TC\src\parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r14, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp290, arg
 ; D:\TC\src\parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	 ; arg
	je	.L106	 ;,
.L63:
 ; D:\TC\src\parser.c:816:                 list_append(args, (pointer)arg);
	movq	%rbp, %rdx	 ; arg,
	movq	%r12, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp291, token
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_124->type
	je	.L107	 ;,
.L64:
 ; D:\TC\src\parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp236
	call	parser_error	 ;
.L77:
 ; D:\TC\src\parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp255
	call	parser_error	 ;
 ; D:\TC\src\parser.c:762:             return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L35	 ;
.L104:
 ; D:\TC\src\parser.c:820:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp293, token
 ; D:\TC\src\parser.c:821:                     token_ptr = token;
	jmp	.L62	 ;
.L105:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp331
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_123->lexeme, token_123->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp295
	je	.L67	 ;,
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r12, 32(%rsp)	 ; args,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movq	56(%rsp), %rdx	 ; %sfp,
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp296, %sfp
 ; D:\TC\src\parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%r15), %r15	 ; base_name_234->info.type, base_name
 ; D:\TC\src\parser.c:830:             var_scope = 0;
	movl	$0, %ebx	 ;, var_scope
 ; D:\TC\src\parser.c:829:             current_type = 0;
	movl	$0, %r12d	 ;, current_type
	jmp	.L68	 ;
.L100:
 ; D:\TC\src\parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp243
	call	parser_error	 ;
	jmp	.L70	 ;
.L71:
 ; D:\TC\src\parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp247
	call	parser_error	 ;
 ; D:\TC\src\parser.c:843:                 return NULL;
	jmp	.L77	 ;
.L69:
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp333
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	movq	0(%r13), %rcx	 ; token_ptr_236->lexeme, token_ptr_236->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp303
	je	.L86	 ;,
 ; D:\TC\src\parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:849:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp304, token
 ; D:\TC\src\parser.c:851:             if (var_scope == 0) {
	testq	%rbx, %rbx	 ; var_scope
	je	.L108	 ;,
 ; D:\TC\src\parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_155->type
	jne	.L109	 ;,
 ; D:\TC\src\parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rdx	 ; token_155->lexeme, token_155->lexeme
	movq	%rbx, %rcx	 ; var_scope,
	call	search	 ;
	movq	%rax, %r15	 ; tmp305, base_name
 ; D:\TC\src\parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	 ; base_name
	je	.L110	 ;,
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movq	%rax, %r8	 ; base_name,
	movq	56(%rsp), %rdx	 ; %sfp,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp306, %sfp
 ; D:\TC\src\parser.c:866:             var_scope = 0;
	movl	$0, %ebx	 ;, var_scope
 ; D:\TC\src\parser.c:865:             current_type = 0;
	movl	$0, %r12d	 ;, current_type
	jmp	.L68	 ;
.L108:
 ; D:\TC\src\parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp251
	call	parser_error	 ;
 ; D:\TC\src\parser.c:853:                 return NULL;
	jmp	.L77	 ;
.L109:
 ; D:\TC\src\parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp252
	call	parser_error	 ;
 ; D:\TC\src\parser.c:857:                 return NULL;
	jmp	.L77	 ;
.L110:
 ; D:\TC\src\parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp254
	call	parser_error	 ;
 ; D:\TC\src\parser.c:862:                 return NULL;
	jmp	.L77	 ;
.L101:
	movq	56(%rsp), %rbp	 ; %sfp, variable_value
.L54:
 ; D:\TC\src\parser.c:760:         if (variable_value == 0) {
	testq	%rbp, %rbp	 ; variable_value
	je	.L77	 ;,
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %esi	 ;, prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	 ;, <retval>
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	movl	$0, %edx	 ;, str_value
 ; D:\TC\src\parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %edi	 ;, type
	jmp	.L37	 ;
.L86:
	movq	56(%rsp), %rbp	 ; %sfp, variable_value
	jmp	.L54	 ;
.L50:
 ; D:\TC\src\parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp256
	call	parser_error	 ;
 ; D:\TC\src\parser.c:766:         return NULL;
	movl	$0, %ebx	 ;, <retval>
	jmp	.L35	 ;
	.section .rdata,"dr"
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
	.align 8
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
	.align 8
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
	.align 8
.LC29:
	.ascii "Failed to parse else-if condition\0"
	.align 8
.LC30:
	.ascii "Expected ')' after else-if condition\0"
	.align 8
.LC31:
	.ascii "Expected '{' to start else-if body\0"
	.align 8
.LC32:
	.ascii "Failed to parse else-if body statement\0"
	.align 8
.LC33:
	.ascii "Expected '{' to start else body\0"
	.align 8
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
	.align 8
.LC36:
	.ascii "Failed to parse for loop initializer\0"
	.align 8
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
	.align 8
.LC38:
	.ascii "Failed to parse for loop condition\0"
	.align 8
.LC39:
	.ascii "Expected ';' after for loop condition\0"
	.align 8
.LC40:
	.ascii "Failed to parse for loop increment\0"
	.align 8
.LC41:
	.ascii "Expected ')' after for loop increment\0"
	.align 8
.LC42:
	.ascii "Expected '{' to start for loop body\0"
	.align 8
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
	.align 8
.LC45:
	.ascii "Failed to parse while condition\0"
	.align 8
.LC46:
	.ascii "Expected ')' after while condition\0"
	.align 8
.LC47:
	.ascii "Expected '{' to start while body\0"
	.align 8
.LC48:
	.ascii "Failed to parse while body statement\0"
	.align 8
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
	.align 8
.LC50:
	.ascii "Cannot use 'continue' outside of a loop\0"
.LC51:
	.ascii "Failed to parse statement\0"
.LC52:
	.ascii "Expected ';' after statement\0"
	.text
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$104, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp407, lexer
	movq	%rdx, %rbp	 ; tmp408, now_scope
	movq	%r8, %rdi	 ; tmp409, parser
 ; D:\TC\src\parser.c:361:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_45->type
	je	.L195	 ;,
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp508,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp509, <retval>
.L181:
 ; D:\TC\src\parser.c:398:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:399:     if (statement == 0)
	testq	%rsi, %rsi	 ; <retval>
	je	.L196	 ;,
.L187:
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp511, token
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_88->type
	je	.L197	 ;,
.L188:
 ; D:\TC\src\parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp393
	call	parser_error	 ;
.L111:
 ; D:\TC\src\parser.c:406: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$104, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
.L195:
	movq	%rax, %rsi	 ; tmp410, token
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp267
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp411
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp316
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp453
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp355
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp480
	jne	.L200	 ;,
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp375
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp496
	je	.L180	 ;,
 ; D:\TC\src\parser.c:372:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, 40(%rsp)	 ; tmp497,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp498, <retval>
	jmp	.L181	 ;
.L198:
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp412, token
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_91->type
	jne	.L114	 ;,
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp270
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_91->lexeme, token_91->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp413
	je	.L114	 ;,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp414, token
 ; D:\TC\src\parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 72(%rsp)	 ; condition, %sfp
 ; D:\TC\src\parser.c:422:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L201	 ;,
.L117:
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp416, token
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_98->type
	jne	.L118	 ;,
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp275
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_98->lexeme, token_98->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp417
	je	.L118	 ;,
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp418, token
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_103->type
	jne	.L120	 ;,
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp279
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_103->lexeme, token_103->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp419
	je	.L120	 ;,
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r15	 ; tmp420, body
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp421, token
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp401
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	leaq	.LC27(%rip), %r14	 ;, tmp402
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L122	 ;
.L114:
 ; D:\TC\src\parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp273
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:         return NULL;
	movl	$0, %edx	 ;, _170
.L116:
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$2, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp452, <retval>
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L111	 ;
.L201:
 ; D:\TC\src\parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp274
	call	parser_error	 ;
	jmp	.L117	 ;
.L118:
 ; D:\TC\src\parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp278
	call	parser_error	 ;
 ; D:\TC\src\parser.c:428:         return NULL;
	movl	$0, %edx	 ;, _170
	jmp	.L116	 ;
.L120:
 ; D:\TC\src\parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp282
	call	parser_error	 ;
 ; D:\TC\src\parser.c:434:         return NULL;
	movl	$0, %edx	 ;, _170
	jmp	.L116	 ;
.L124:
 ; D:\TC\src\parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rsi	 ; tmp422, statement
 ; D:\TC\src\parser.c:441:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L202	 ;,
.L123:
 ; D:\TC\src\parser.c:443:         list_append(body, (pointer)statement);
	movq	%rsi, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp423, token
.L122:
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_111->type
	jne	.L124	 ;,
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_111->lexeme, token_111->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp424
	je	.L124	 ;,
 ; D:\TC\src\parser.c:447:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp425, %sfp
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list	 ;
	movq	%rax, 80(%rsp)	 ; tmp426, %sfp
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp427, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_119->type
	jne	.L126	 ;,
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp399
	movq	%r15, 88(%rsp)	 ; body, %sfp
	jmp	.L125	 ;
.L202:
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r12, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp402,
	call	parser_error	 ;
	jmp	.L123	 ;
.L127:
 ; D:\TC\src\parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp290
	call	parser_error	 ;
 ; D:\TC\src\parser.c:458:             return NULL;
	movl	$0, %edx	 ;, _170
	jmp	.L116	 ;
.L205:
 ; D:\TC\src\parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp291
	call	parser_error	 ;
	jmp	.L129	 ;
.L130:
 ; D:\TC\src\parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp295
	call	parser_error	 ;
 ; D:\TC\src\parser.c:469:             return NULL;
	movl	$0, %edx	 ;, _170
	jmp	.L116	 ;
.L132:
 ; D:\TC\src\parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp299
	call	parser_error	 ;
 ; D:\TC\src\parser.c:475:             return NULL;
	movl	$0, %edx	 ;, _170
	jmp	.L116	 ;
.L136:
 ; D:\TC\src\parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp438, statement
 ; D:\TC\src\parser.c:482:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L203	 ;,
.L135:
 ; D:\TC\src\parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:485:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp439, token
.L134:
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_140->type
	jne	.L136	 ;,
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_140->lexeme, token_140->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp440
	je	.L136	 ;,
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r13, %rdx	 ; elif_body,
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_else_if	 ;
	movq	%rax, %rdx	 ; tmp441, _146
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
	movq	%rax, %rsi	 ; tmp442, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_147->type
	jne	.L193	 ;,
.L125:
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp552
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	movq	(%rsi), %rcx	 ; token_ptr_9->lexeme, token_ptr_9->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp443
	je	.L204	 ;,
 ; D:\TC\src\parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:454:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp428, token
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_120->type
	jne	.L127	 ;,
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp287
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_120->lexeme, token_120->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp429
	je	.L127	 ;,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp430, token
 ; D:\TC\src\parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; elif_condition, %sfp
 ; D:\TC\src\parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	 ; elif_condition
	je	.L205	 ;,
.L129:
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp432, token
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_127->type
	jne	.L130	 ;,
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp292
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_127->lexeme, token_127->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp433
	je	.L130	 ;,
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp434, token
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
	jne	.L132	 ;,
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp296
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_132->lexeme, token_132->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp435
	je	.L132	 ;,
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp436, elif_body
 ; D:\TC\src\parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp437, token
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	leaq	.LC32(%rip), %r15	 ;, tmp398
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L134	 ;
.L203:
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%rsi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp398,
	call	parser_error	 ;
	jmp	.L135	 ;
.L204:
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	88(%rsp), %r15	 ; %sfp, body
	cmpl	$6, 24(%rsi)	 ;, token_ptr_9->type
	jne	.L126	 ;,
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp307
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	movq	(%rsi), %rcx	 ; token_ptr_9->lexeme, token_ptr_9->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp444
	je	.L126	 ;,
 ; D:\TC\src\parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp445, token
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_157->type
	jne	.L138	 ;,
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp310
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_157->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp446
	je	.L138	 ;,
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp447, token
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp395
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %r13	 ;, tmp396
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L140	 ;
.L138:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp311
	call	parser_error	 ;
 ; D:\TC\src\parser.c:499:             return NULL;
	movl	$0, %edx	 ;, _170
	jmp	.L116	 ;
.L142:
 ; D:\TC\src\parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp448, statement
 ; D:\TC\src\parser.c:505:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L206	 ;,
.L141:
 ; D:\TC\src\parser.c:507:             list_append(else_body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:508:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp449, token
.L140:
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_164->type
	jne	.L142	 ;,
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_164->lexeme, token_164->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp450
	je	.L142	 ;,
	jmp	.L126	 ;
.L206:
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp396,
	call	parser_error	 ;
	jmp	.L141	 ;
.L193:
	movq	88(%rsp), %r15	 ; %sfp, body
.L126:
 ; D:\TC\src\parser.c:512:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp451, _170
	jmp	.L116	 ;
.L199:
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp454, token
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_172->type
	jne	.L145	 ;,
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp319
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_172->lexeme, token_172->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp455
	je	.L145	 ;,
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp456, token
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_177->type
	je	.L207	 ;,
.L148:
 ; D:\TC\src\parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r13	 ; tmp458, initializer
 ; D:\TC\src\parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	 ; initializer
	je	.L208	 ;,
.L150:
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp459, token
.L149:
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rsi)	 ;, token_184->type
	jne	.L151	 ;,
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp327
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rsi), %rcx	 ; token_184->lexeme, token_184->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp460
	je	.L151	 ;,
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp461, token
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_189->type
	je	.L209	 ;,
.L153:
 ; D:\TC\src\parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp463, condition
 ; D:\TC\src\parser.c:549:         if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L210	 ;,
.L155:
 ; D:\TC\src\parser.c:551:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp464, token
.L154:
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%r12)	 ;, token_196->type
	jne	.L156	 ;,
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp335
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%r12), %rcx	 ; token_196->lexeme, token_196->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp465
	je	.L156	 ;,
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp466, token
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_201->type
	je	.L211	 ;,
.L158:
 ; D:\TC\src\parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:565:         if (increment == 0)
	testq	%rax, %rax	 ; increment
	je	.L212	 ;,
.L160:
 ; D:\TC\src\parser.c:567:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp469, token
.L159:
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%r12)	 ;, token_208->type
	jne	.L161	 ;,
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp343
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r12), %rcx	 ; token_208->lexeme, token_208->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	 ; tmp470
	je	.L161	 ;,
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp471, token
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_213->type
	jne	.L163	 ;,
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp347
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_213->lexeme, token_213->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp472
	je	.L163	 ;,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp473, body
 ; D:\TC\src\parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%rdi)	 ;, parser_47(D)->in_loop
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp474, token
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15	 ;, tmp403
	movq	%r13, 64(%rsp)	 ; initializer, %sfp
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L165	 ;
.L145:
 ; D:\TC\src\parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp322
	call	parser_error	 ;
 ; D:\TC\src\parser.c:526:         return NULL;
	movl	$0, %r9d	 ;, _230
.L147:
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$4, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp479, <retval>
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L111	 ;
.L207:
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp323
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rsi), %rcx	 ; token_177->lexeme, token_177->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:530:     Variable* initializer = 0;
	movl	$0, %r13d	 ;, initializer
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp457
	jne	.L149	 ;,
	jmp	.L148	 ;
.L208:
 ; D:\TC\src\parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp326
	call	parser_error	 ;
	jmp	.L150	 ;
.L151:
 ; D:\TC\src\parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp330
	call	parser_error	 ;
 ; D:\TC\src\parser.c:542:         return NULL;
	movl	$0, %r9d	 ;, _230
	jmp	.L147	 ;
.L209:
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp331
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%r12), %rcx	 ; token_189->lexeme, token_189->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:546:     Expression* condition = 0;
	movl	$0, %esi	 ;, condition
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp462
	jne	.L154	 ;,
	jmp	.L153	 ;
.L210:
 ; D:\TC\src\parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp334
	call	parser_error	 ;
	jmp	.L155	 ;
.L156:
 ; D:\TC\src\parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp338
	call	parser_error	 ;
 ; D:\TC\src\parser.c:558:         return NULL;
	movl	$0, %r9d	 ;, _230
	jmp	.L147	 ;
.L211:
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp339
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r12), %rcx	 ; token_201->lexeme, token_201->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:562:     Expression* increment = 0;
	movq	$0, 56(%rsp)	 ;, %sfp
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp467
	jne	.L159	 ;,
	jmp	.L158	 ;
.L212:
 ; D:\TC\src\parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp342
	call	parser_error	 ;
	jmp	.L160	 ;
.L161:
 ; D:\TC\src\parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp346
	call	parser_error	 ;
 ; D:\TC\src\parser.c:574:         return NULL;
	movl	$0, %r9d	 ;, _230
	jmp	.L147	 ;
.L163:
 ; D:\TC\src\parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp350
	call	parser_error	 ;
 ; D:\TC\src\parser.c:580:         return NULL;
	movl	$0, %r9d	 ;, _230
	jmp	.L147	 ;
.L167:
 ; D:\TC\src\parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp475, statement
 ; D:\TC\src\parser.c:588:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L213	 ;,
.L166:
 ; D:\TC\src\parser.c:590:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:591:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp476, token
.L165:
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_221->type
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_221->lexeme, token_221->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp477
	je	.L167	 ;,
 ; D:\TC\src\parser.c:594:     ((parser))->in_loop = false;
	movq	64(%rsp), %r13	 ; %sfp, initializer
	movb	$0, 2(%rdi)	 ;, parser_47(D)->in_loop
 ; D:\TC\src\parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	%r14, %r9	 ; body,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; condition,
	movq	%r13, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp478, _230
	jmp	.L147	 ;
.L213:
 ; D:\TC\src\parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L166	 ;
.L200:
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp481, token
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_232->type
	jne	.L169	 ;,
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp358
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_232->lexeme, token_232->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp482
	je	.L169	 ;,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp483, token
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp484, condition
 ; D:\TC\src\parser.c:612:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L214	 ;,
.L172:
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp485, token
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_239->type
	jne	.L173	 ;,
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp363
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_239->lexeme, token_239->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp486
	je	.L173	 ;,
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp487, token
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_244->type
	jne	.L175	 ;,
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp367
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_244->lexeme, token_244->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	je	.L175	 ;,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp489, body
 ; D:\TC\src\parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%rdi)	 ;, parser_47(D)->in_loop
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp490, token
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r15	 ;, tmp405
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L177	 ;
.L169:
 ; D:\TC\src\parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp361
	call	parser_error	 ;
 ; D:\TC\src\parser.c:607:         return NULL;
	movl	$0, %r8d	 ;, _258
.L171:
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$3, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp495, <retval>
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L111	 ;
.L214:
 ; D:\TC\src\parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp362
	call	parser_error	 ;
	jmp	.L172	 ;
.L173:
 ; D:\TC\src\parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp366
	call	parser_error	 ;
 ; D:\TC\src\parser.c:618:         return NULL;
	movl	$0, %r8d	 ;, _258
	jmp	.L171	 ;
.L175:
 ; D:\TC\src\parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp370
	call	parser_error	 ;
 ; D:\TC\src\parser.c:624:         return NULL;
	movl	$0, %r8d	 ;, _258
	jmp	.L171	 ;
.L179:
 ; D:\TC\src\parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rsi	 ; tmp491, statement
 ; D:\TC\src\parser.c:632:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L215	 ;,
.L178:
 ; D:\TC\src\parser.c:634:         list_append(body, (pointer)statement);
	movq	%rsi, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:635:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp492, token
.L177:
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_252->type
	jne	.L179	 ;,
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r12), %rcx	 ; token_252->lexeme, token_252->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp493
	je	.L179	 ;,
 ; D:\TC\src\parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%rdi)	 ;, parser_47(D)->in_loop
 ; D:\TC\src\parser.c:639:     return create_while(condition, body);
	movq	%r13, %rdx	 ; body,
	movq	%r14, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp494, _258
	jmp	.L171	 ;
.L215:
 ; D:\TC\src\parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L178	 ;
.L180:
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp378
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp499
	je	.L182	 ;,
 ; D:\TC\src\parser.c:375:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp500,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp501, <retval>
	jmp	.L181	 ;
.L182:
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp381
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp502
	je	.L183	 ;,
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rdi)	 ;, parser_47(D)->in_loop
	je	.L216	 ;,
 ; D:\TC\src\parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$6, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp503, <retval>
	jmp	.L181	 ;
.L216:
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp384
	call	parser_error	 ;
 ; D:\TC\src\parser.c:383:                 return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L111	 ;
.L183:
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp385
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	movq	(%rsi), %rcx	 ; token_45->lexeme, token_45->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp504
	je	.L185	 ;,
 ; D:\TC\src\parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rdi)	 ;, parser_47(D)->in_loop
	je	.L217	 ;,
 ; D:\TC\src\parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$7, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp505, <retval>
	jmp	.L181	 ;
.L217:
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp388
	call	parser_error	 ;
 ; D:\TC\src\parser.c:391:                 return NULL;
	movl	$0, %esi	 ;, <retval>
	jmp	.L111	 ;
.L185:
 ; D:\TC\src\parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp506,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp507, <retval>
	jmp	.L181	 ;
.L196:
 ; D:\TC\src\parser.c:400:         parser_error("Failed to parse statement", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp389
	call	parser_error	 ;
	jmp	.L187	 ;
.L197:
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp390
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_88->lexeme, token_88->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp512
	jne	.L111	 ;,
	jmp	.L188	 ;
	.section .rdata,"dr"
	.align 8
.LC53:
	.ascii "Expected identifier after 'import'\0"
	.align 8
.LC54:
	.ascii "Expected string literal after 'from'\0"
	.align 8
.LC55:
	.ascii "Expected ';' at end of import statement\0"
	.align 8
.LC56:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC57:
	.ascii "Expected function return type after 'func'\0"
.LC58:
	.ascii "Unknown function return type\0"
	.align 8
.LC59:
	.ascii "Expected function name after return type\0"
	.align 8
.LC60:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC61:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC62:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC63:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC64:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC65:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC66:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC67:
	.ascii "Function missing return statement\0"
	.align 8
.LC68:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC69:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC70:
	.ascii "Expected '{' to start class body\0"
	.align 8
.LC71:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC72:
	.ascii "Unknown return type for method\0"
	.align 8
.LC73:
	.ascii "Expected method name after return type\0"
	.align 8
.LC74:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC75:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC76:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC77:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC78:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC79:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC80:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC81:
	.ascii "Method missing return statement\0"
.LC82:
	.ascii "Failed to parse class method\0"
	.align 8
.LC83:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC84:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC85:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC86:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$152, %rsp	 ;,
	movq	%rcx, %r15	 ; tmp447, lexer
	movq	%rdx, %rbx	 ; tmp448, now_scope
	movq	%r8, 240(%rsp)	 ; tmp449, parser
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp276
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, (%rax)	 ;, builtin_scope
	je	.L314	 ;,
.L219:
 ; D:\TC\src\parser.c:31:     if (now_scope == 0)
	testq	%rbx, %rbx	 ; now_scope
	je	.L315	 ;,
.L220:
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 56(%rsp)	 ; tmp456, %sfp
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
	call	create_scope	 ;
	movq	%rax, 48(%rsp)	 ; tmp457, %sfp
 ; D:\TC\src\parser.c:37:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r15, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L222	 ;,
	movq	%rax, %r12	 ; token, token
	movq	%r15, %rbp	 ; lexer, lexer
	jmp	.L221	 ;
.L314:
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	movl	$0, %ecx	 ;,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp277
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rdx	 ;, tmp278
	movq	(%rdx), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	movq	%rax, 32(%rsp)	 ; _2,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp280
	movq	%rax, (%rdx)	 ; tmp451, name_void
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp281
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp285
	movq	%rax, (%rdx)	 ; tmp452, name_int
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp286
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp290
	movq	%rax, (%rdx)	 ; tmp453, name_float
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp291
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp295
	movq	%rax, (%rdx)	 ; tmp454, name_string
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp296
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp300
	movq	%rax, (%rdx)	 ; tmp455, name_bool
	jmp	.L219	 ;
.L315:
 ; D:\TC\src\parser.c:32:         now_scope = builtin_scope;
	movq	.refptr.builtin_scope(%rip), %rax	 ;, tmp301
	movq	(%rax), %rbx	 ; builtin_scope, now_scope
	jmp	.L220	 ;
.L332:
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp576
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	movq	(%r12), %rcx	 ; token_368->lexeme, token_368->lexeme
	call	string_equal	 ;
	movl	%eax, %esi	 ; tmp459, have_return
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	jne	.L316	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r12)	 ;, token_368->type
	jne	.L259	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp578
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	movq	(%r12), %rcx	 ; token_368->lexeme, token_368->lexeme
	call	string_equal	 ;
	movb	%al, 95(%rsp)	 ; _24, %sfp
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; _24
	jne	.L317	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r12)	 ;, token_368->type
	jne	.L259	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp585
	movq	(%rax), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	(%r12), %rcx	 ; token_368->lexeme, token_368->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp496
	je	.L259	 ;,
 ; D:\TC\src\parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	48(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
	movq	%rax, 64(%rsp)	 ; tmp497, %sfp
 ; D:\TC\src\parser.c:277:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_170->type
	jne	.L318	 ;,
 ; D:\TC\src\parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	(%rax), %rcx	 ; token_170->lexeme, token_170->lexeme
	movq	48(%rsp), %rax	 ; %sfp, global_scope
	movq	%rax, 32(%rsp)	 ; global_scope,
	movq	64(%rsp), %r9	 ; %sfp,
	movl	$0, %r8d	 ;,
	movl	$4, %edx	 ;,
	call	create_name	 ;
	movq	%rax, 80(%rsp)	 ; tmp499, %sfp
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp500, token
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_174->type
	jne	.L262	 ;,
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp359
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_174->lexeme, token_174->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp501
	je	.L262	 ;,
 ; D:\TC\src\parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 72(%rsp)	 ; tmp502, %sfp
 ; D:\TC\src\parser.c:291:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r13	 ;, tmp441
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %r15	 ;, tmp442
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %r14	 ;, tmp443
	movq	%r12, 112(%rsp)	 ; token, %sfp
	movq	%rax, %rbx	 ; token, token
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L264	 ;
.L316:
 ; D:\TC\src\parser.c:68:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_89->type
	jne	.L319	 ;,
 ; D:\TC\src\parser.c:74:     string import_name = token_ptr->lexeme;
	movq	(%rax), %rdi	 ; token_89->lexeme, import_name
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp461, token
 ; D:\TC\src\parser.c:75:     string source = 0;
	movl	$0, %esi	 ;, source
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_92->type
	je	.L320	 ;,
.L227:
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_101->type
	jne	.L229	 ;,
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp310
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_101->lexeme, token_101->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp465
	je	.L229	 ;,
 ; D:\TC\src\parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	48(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
	movq	%rax, %rcx	 ; tmp466, name
 ; D:\TC\src\parser.c:95:     if (name == 0)
	testq	%rax, %rax	 ; name
	je	.L321	 ;,
.L231:
 ; D:\TC\src\parser.c:97:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp468, _111
 ; D:\TC\src\parser.c:42:             if (import == 0)
	testq	%rax, %rax	 ; _111
	je	.L301	 ;,
.L232:
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp469, _20
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jmp	.L233	 ;
.L319:
 ; D:\TC\src\parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp305
	call	parser_error	 ;
 ; D:\TC\src\parser.c:72:         return NULL;
	jmp	.L301	 ;
.L320:
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp306
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	movq	(%rbx), %rcx	 ; token_92->lexeme, token_92->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp462
	je	.L227	 ;,
 ; D:\TC\src\parser.c:79:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_97->type
	jne	.L322	 ;,
 ; D:\TC\src\parser.c:85:         source = token_ptr->lexeme;
	movq	(%rax), %rsi	 ; token_97->lexeme, source
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp464, token
	jmp	.L227	 ;
.L322:
 ; D:\TC\src\parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp309
	call	parser_error	 ;
 ; D:\TC\src\parser.c:83:             return NULL;
	jmp	.L301	 ;
.L229:
 ; D:\TC\src\parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp313
	call	parser_error	 ;
.L301:
 ; D:\TC\src\parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC56(%rip), %rcx	 ;, tmp316
	call	parser_error	 ;
	movl	$0, %edx	 ;, _111
	jmp	.L232	 ;
.L321:
 ; D:\TC\src\parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp314
	movq	(%rax), %r8	 ; name_void, name_void
	movq	48(%rsp), %rax	 ; %sfp, global_scope
	movq	%rax, 32(%rsp)	 ; global_scope,
	movl	$0, %r9d	 ;,
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; import_name,
	call	create_name	 ;
	movq	%rax, %rcx	 ; tmp467, name
	jmp	.L231	 ;
.L317:
 ; D:\TC\src\parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	48(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
	movq	%rax, %rdi	 ; tmp471, function_scope
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp472, token
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_114->type, _115
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _115
	je	.L235	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _115
	jne	.L236	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rbx), %rcx	 ; token_114->lexeme, token_114->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp473
	je	.L236	 ;,
.L235:
 ; D:\TC\src\parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rdx	 ; token_114->lexeme, token_114->lexeme
	movq	48(%rsp), %rcx	 ; %sfp,
	call	search	 ;
	movq	%rax, %r15	 ; tmp474, return_type
 ; D:\TC\src\parser.c:113:     if (return_type == 0)
	testq	%rax, %rax	 ; return_type
	je	.L323	 ;,
 ; D:\TC\src\parser.c:119:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_120->type
	jne	.L324	 ;,
 ; D:\TC\src\parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	(%rax), %rcx	 ; token_120->lexeme, token_120->lexeme
	movq	48(%rsp), %rax	 ; %sfp, global_scope
	movq	%rax, 32(%rsp)	 ; global_scope,
	movl	$0, %r9d	 ;,
	movq	%r15, %r8	 ; return_type,
	movl	$2, %edx	 ;,
	call	create_name	 ;
	movq	%rax, 72(%rsp)	 ; tmp476, %sfp
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp477, token
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_124->type
	jne	.L240	 ;,
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp326
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_124->lexeme, token_124->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp478
	je	.L240	 ;,
 ; D:\TC\src\parser.c:132:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp479, token
 ; D:\TC\src\parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp480, %sfp
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r14	 ;, tmp432
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	%r14, %r13	 ; tmp432, tmp434
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L242	 ;
.L236:
 ; D:\TC\src\parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp321
	call	parser_error	 ;
.L302:
 ; D:\TC\src\parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp353
	call	parser_error	 ;
	movl	$0, %r8d	 ;, _165
	jmp	.L258	 ;
.L323:
 ; D:\TC\src\parser.c:116:         parser_error("Unknown function return type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp323
	call	parser_error	 ;
 ; D:\TC\src\parser.c:117:         return NULL;
	jmp	.L302	 ;
.L324:
 ; D:\TC\src\parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp324
	call	parser_error	 ;
 ; D:\TC\src\parser.c:123:         return NULL;
	jmp	.L302	 ;
.L240:
 ; D:\TC\src\parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp329
	call	parser_error	 ;
 ; D:\TC\src\parser.c:130:         return NULL;
	jmp	.L302	 ;
.L327:
 ; D:\TC\src\parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp330
	call	parser_error	 ;
	jmp	.L244	 ;
.L245:
 ; D:\TC\src\parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	64(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L244	 ;
.L328:
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp581
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_134->lexeme, token_134->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp483
	jne	.L325	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_134->type
	jne	.L246	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_134->lexeme, token_134->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp485
	je	.L246	 ;,
.L242:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_132->type
	je	.L326	 ;,
.L249:
 ; D:\TC\src\parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	240(%rsp), %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	je	.L327	 ;,
 ; D:\TC\src\parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_131->value
	je	.L245	 ;,
 ; D:\TC\src\parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp331
	call	parser_error	 ;
.L244:
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp482, token
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_134->type
	je	.L328	 ;,
.L246:
 ; D:\TC\src\parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp338
	call	parser_error	 ;
 ; D:\TC\src\parser.c:150:             return NULL;
	jmp	.L302	 ;
.L325:
 ; D:\TC\src\parser.c:146:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp484, token
 ; D:\TC\src\parser.c:147:             token_ptr = token;
	jmp	.L242	 ;
.L326:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_132->lexeme, token_132->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp486
	je	.L249	 ;,
 ; D:\TC\src\parser.c:153:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp487, token
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_148->type
	jne	.L250	 ;,
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp342
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_148->lexeme, token_148->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	je	.L250	 ;,
 ; D:\TC\src\parser.c:159:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, %r14	 ; tmp489, body
 ; D:\TC\src\parser.c:160:     parser->in_function = true;
	movq	240(%rsp), %rax	 ; parser, tmp582
	movb	$1, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:162:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp490, token
	movq	%r12, 80(%rsp)	 ; token, %sfp
	movq	240(%rsp), %r12	 ; parser, parser
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L252	 ;
.L250:
 ; D:\TC\src\parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp345
	call	parser_error	 ;
 ; D:\TC\src\parser.c:157:         return NULL;
	jmp	.L302	 ;
.L256:
 ; D:\TC\src\parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp491, statement
 ; D:\TC\src\parser.c:166:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L329	 ;,
 ; D:\TC\src\parser.c:168:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	jne	.L330	 ;,
.L254:
 ; D:\TC\src\parser.c:171:             have_return = true;
	cmpl	$5, 8(%rbx)	 ;, statement_155->type
	movl	$1, %eax	 ;, tmp424
	cmove	%eax, %esi	 ; have_return,, tmp424, have_return
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:173:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp492, token
.L252:
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_156->type
	jne	.L256	 ;,
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp583
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_156->lexeme, token_156->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp493
	je	.L256	 ;,
 ; D:\TC\src\parser.c:176:     ((parser))->in_function = false;
	movq	80(%rsp), %r12	 ; %sfp, token
	movq	240(%rsp), %rax	 ; parser, tmp584
	movb	$0, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L257	 ;,
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp351
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %r15	 ; name_void, return_type
	je	.L257	 ;,
 ; D:\TC\src\parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;, tmp352
	call	parser_error	 ;
.L257:
 ; D:\TC\src\parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rdi, 32(%rsp)	 ; function_scope,
	movq	%r14, %r9	 ; body,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; return_type,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_function	 ;
	movq	%rax, %r8	 ; tmp494, _165
 ; D:\TC\src\parser.c:47:             if (function == 0)
	testq	%rax, %rax	 ; _165
	je	.L302	 ;,
.L258:
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movl	$0, %r9d	 ;,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp495, _25
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	jmp	.L233	 ;
.L329:
 ; D:\TC\src\parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L254	 ;
.L330:
 ; D:\TC\src\parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L254	 ;
.L318:
 ; D:\TC\src\parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp357
	call	parser_error	 ;
 ; D:\TC\src\parser.c:281:         return NULL;
	jmp	.L303	 ;
.L262:
 ; D:\TC\src\parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp362
	call	parser_error	 ;
.L303:
 ; D:\TC\src\parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp418
	call	parser_error	 ;
	movl	$0, %r9d	 ;, _205
	jmp	.L299	 ;
.L298:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_181->type
	je	.L331	 ;,
.L265:
 ; D:\TC\src\parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp414
	call	parser_error	 ;
.L295:
 ; D:\TC\src\parser.c:312:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp540, token
.L264:
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_181->type
	jne	.L298	 ;,
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_181->lexeme, token_181->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp541
	je	.L298	 ;,
 ; D:\TC\src\parser.c:315:     return create_class(name, members, class_scope);
	movq	112(%rsp), %r12	 ; %sfp, token
	movq	64(%rsp), %r8	 ; %sfp,
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_class	 ;
	movq	%rax, %r9	 ; tmp542, _205
 ; D:\TC\src\parser.c:52:             if (class_ == 0)
	testq	%rax, %rax	 ; _205
	je	.L303	 ;,
.L299:
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movl	$0, %r8d	 ;,
	movl	$0, %edx	 ;,
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
	movq	%rax, %rdx	 ; tmp543, _30
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L233:
 ; D:\TC\src\parser.c:57:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp544, token
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L222	 ;,
.L221:
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movl	24(%r12), %eax	 ; token_368->type, _31
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _31
	je	.L222	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _31
	je	.L332	 ;,
.L259:
 ; D:\TC\src\parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp419
	call	parser_error	 ;
	jmp	.L233	 ;
.L331:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	(%r15), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	movq	(%rbx), %rcx	 ; token_181->lexeme, token_181->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp504
	jne	.L333	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_181->type
	jne	.L265	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	(%r14), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	(%rbx), %rcx	 ; token_181->lexeme, token_181->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp534
	je	.L265	 ;,
 ; D:\TC\src\parser.c:300:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp535, token
 ; D:\TC\src\parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	240(%rsp), %r8	 ; parser,
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %rbx	 ; tmp536, variable
 ; D:\TC\src\parser.c:303:             if (variable == 0)
	testq	%rax, %rax	 ; variable
	je	.L334	 ;,
.L296:
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rbx, %r8	 ; variable,
	movl	$0, %edx	 ;,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp537, _194
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:306:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp538, token
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_195->type
	je	.L335	 ;,
.L297:
 ; D:\TC\src\parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp413
	call	parser_error	 ;
	jmp	.L295	 ;
.L333:
 ; D:\TC\src\parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
	movq	%rax, %r12	 ; tmp505, method_scope
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp366
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r12, 32(%rsp)	 ; method_scope,
	movl	$0, %r9d	 ;,
	movq	80(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
	call	create_name	 ;
	movq	%rax, %rdi	 ; tmp506, self
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp507, token
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_210->type, _211
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _211
	je	.L267	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _211
	jne	.L268	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rsi), %rcx	 ; token_210->lexeme, token_210->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp508
	je	.L268	 ;,
.L267:
 ; D:\TC\src\parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%rsi), %rdx	 ; token_210->lexeme, token_210->lexeme
	movq	64(%rsp), %rcx	 ; %sfp,
	call	search	 ;
	movq	%rax, 104(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:196:     if (return_type == 0) {
	testq	%rax, %rax	 ; return_type
	je	.L336	 ;,
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_216->type
	jne	.L337	 ;,
 ; D:\TC\src\parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	(%rax), %rcx	 ; token_216->lexeme, token_216->lexeme
	movq	64(%rsp), %rax	 ; %sfp, class_scope
	movq	%rax, 32(%rsp)	 ; class_scope,
	movl	$0, %r9d	 ;,
	movq	104(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	call	create_name	 ;
	movq	%rax, 128(%rsp)	 ; tmp511, %sfp
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp512, token
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_220->type
	jne	.L272	 ;,
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp374
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_220->lexeme, token_220->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp513
	je	.L272	 ;,
 ; D:\TC\src\parser.c:213:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp514, token
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_225->type
	je	.L338	 ;,
.L274:
 ; D:\TC\src\parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp381
	call	parser_error	 ;
.L275:
 ; D:\TC\src\parser.c:217:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp516, token
 ; D:\TC\src\parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 120(%rsp)	 ; tmp517, %sfp
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movl	$0, %r8d	 ;,
	movq	%rdi, %rdx	 ; self,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_variable	 ;
	movq	%rax, %rdx	 ; tmp518, _232
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	120(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rdi	 ;, tmp439
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L276	 ;
.L268:
 ; D:\TC\src\parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp369
	call	parser_error	 ;
.L304:
 ; D:\TC\src\parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp405
	call	parser_error	 ;
	movl	$0, %edx	 ;, _267
	jmp	.L294	 ;
.L336:
 ; D:\TC\src\parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp371
	call	parser_error	 ;
 ; D:\TC\src\parser.c:198:         return NULL;
	jmp	.L304	 ;
.L337:
 ; D:\TC\src\parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp372
	call	parser_error	 ;
 ; D:\TC\src\parser.c:204:         return NULL;
	jmp	.L304	 ;
.L272:
 ; D:\TC\src\parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp377
	call	parser_error	 ;
 ; D:\TC\src\parser.c:211:         return NULL;
	jmp	.L304	 ;
.L338:
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp378
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rsi), %rcx	 ; token_225->lexeme, token_225->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp515
	jne	.L275	 ;,
	jmp	.L274	 ;
.L278:
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rsi)	 ;, token_233->type
	jne	.L281	 ;,
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp385
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_233->lexeme, token_233->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp522
	je	.L281	 ;,
.L282:
 ; D:\TC\src\parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp525, token
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_250->type
	jne	.L286	 ;,
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_250->lexeme, token_250->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp526
	je	.L286	 ;,
 ; D:\TC\src\parser.c:246:     list(Statement*) body = create_list();
	call	create_list	 ;
	movq	%rax, 96(%rsp)	 ; tmp527, %sfp
 ; D:\TC\src\parser.c:247:     ((parser))->in_function = true;
	movq	240(%rsp), %rax	 ; parser, tmp590
	movb	$1, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:248:     ((parser))->in_method = true;
	movb	$1, 1(%rax)	 ;, parser_72(D)->in_method
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:249:     bool have_return = false;
	movzbl	95(%rsp), %edi	 ; %sfp, have_return
	movq	%rbx, 136(%rsp)	 ; token, %sfp
	movq	%rax, %rsi	 ; token, token
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L288	 ;
.L339:
 ; D:\TC\src\parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp389
	call	parser_error	 ;
	jmp	.L283	 ;
.L284:
 ; D:\TC\src\parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rdx	 ; parameter,
	movq	120(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
	jmp	.L283	 ;
.L340:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp589
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_233->lexeme, token_233->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp524
	jne	.L282	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_233->type
	jne	.L281	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%rdi), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rsi), %rcx	 ; token_233->lexeme, token_233->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp519
	je	.L278	 ;,
 ; D:\TC\src\parser.c:223:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp520, token
 ; D:\TC\src\parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	240(%rsp), %r8	 ; parser,
	movq	%r12, %rdx	 ; method_scope,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:231:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	je	.L339	 ;,
 ; D:\TC\src\parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_239->value
	je	.L284	 ;,
 ; D:\TC\src\parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;,
	call	parser_error	 ;
.L283:
 ; D:\TC\src\parser.c:237:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp523, token
.L276:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_233->type
	je	.L340	 ;,
.L281:
 ; D:\TC\src\parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp388
	call	parser_error	 ;
 ; D:\TC\src\parser.c:228:             return NULL;
	jmp	.L304	 ;
.L286:
 ; D:\TC\src\parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;, tmp397
	call	parser_error	 ;
 ; D:\TC\src\parser.c:244:         return NULL;
	jmp	.L304	 ;
.L292:
 ; D:\TC\src\parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	240(%rsp), %r8	 ; parser,
	movq	%r12, %rdx	 ; method_scope,
	movq	%rbp, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbx	 ; tmp529, statement
 ; D:\TC\src\parser.c:254:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L341	 ;,
 ; D:\TC\src\parser.c:256:         else if (have_return)
	testb	%dil, %dil	 ; have_return
	jne	.L342	 ;,
.L290:
 ; D:\TC\src\parser.c:259:             have_return = true;
	cmpl	$5, 8(%rbx)	 ;, statement_257->type
	movl	$1, %eax	 ;, tmp428
	cmove	%eax, %edi	 ; have_return,, tmp428, have_return
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	movq	%rbx, %rdx	 ; statement,
	movq	96(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:261:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbp, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp530, token
.L288:
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_258->type
	jne	.L292	 ;,
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp592
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rsi), %rcx	 ; token_258->lexeme, token_258->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp531
	je	.L292	 ;,
 ; D:\TC\src\parser.c:264:     ((parser))->in_function = false;
	movq	136(%rsp), %rbx	 ; %sfp, token
	movq	240(%rsp), %rax	 ; parser, tmp593
	movb	$0, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:265:     ((parser))->in_method = false;
	movb	$0, 1(%rax)	 ;, parser_72(D)->in_method
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	testb	%dil, %dil	 ; have_return
	jne	.L293	 ;,
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp403
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	104(%rsp), %rdi	 ; %sfp, return_type
	cmpq	(%rax), %rdi	 ; name_void, return_type
	je	.L293	 ;,
 ; D:\TC\src\parser.c:267:         parser_error("Method missing return statement", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;, tmp404
	call	parser_error	 ;
.L293:
 ; D:\TC\src\parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%r12, 32(%rsp)	 ; method_scope,
	movq	96(%rsp), %r9	 ; %sfp,
	movq	120(%rsp), %r8	 ; %sfp,
	movq	104(%rsp), %rdx	 ; %sfp,
	movq	128(%rsp), %rcx	 ; %sfp,
	call	create_method	 ;
	movq	%rax, %rdx	 ; tmp532, _267
 ; D:\TC\src\parser.c:296:             if (method == 0)
	testq	%rax, %rax	 ; _267
	je	.L304	 ;,
.L294:
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %r8d	 ;,
	movl	$0, %ecx	 ;,
	call	create_class_member	 ;
	movq	%rax, %rdx	 ; tmp533, _187
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L295	 ;
.L341:
 ; D:\TC\src\parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L290	 ;
.L342:
 ; D:\TC\src\parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L290	 ;
.L334:
 ; D:\TC\src\parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp409
	call	parser_error	 ;
	jmp	.L296	 ;
.L335:
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp410
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rbx), %rcx	 ; token_195->lexeme, token_195->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp539
	jne	.L295	 ;,
	jmp	.L297	 ;
.L222:
 ; D:\TC\src\parser.c:60:     return create_code(members, global_scope);
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_code	 ;
 ; D:\TC\src\parser.c:61: }
	addq	$152, %rsp	 ;,
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
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.METHOD_KEYWORD, "dr"
	.globl	.refptr.METHOD_KEYWORD
	.linkonce	discard
.refptr.METHOD_KEYWORD:
	.quad	METHOD_KEYWORD
	.section	.rdata$.refptr.CLASS_KEYWORD, "dr"
	.globl	.refptr.CLASS_KEYWORD
	.linkonce	discard
.refptr.CLASS_KEYWORD:
	.quad	CLASS_KEYWORD
	.section	.rdata$.refptr.FUNC_KEYWORD, "dr"
	.globl	.refptr.FUNC_KEYWORD
	.linkonce	discard
.refptr.FUNC_KEYWORD:
	.quad	FUNC_KEYWORD
	.section	.rdata$.refptr.FROM_KEYWORD, "dr"
	.globl	.refptr.FROM_KEYWORD
	.linkonce	discard
.refptr.FROM_KEYWORD:
	.quad	FROM_KEYWORD
	.section	.rdata$.refptr.IMPORT_KEYWORD, "dr"
	.globl	.refptr.IMPORT_KEYWORD
	.linkonce	discard
.refptr.IMPORT_KEYWORD:
	.quad	IMPORT_KEYWORD
	.section	.rdata$.refptr.name_bool, "dr"
	.globl	.refptr.name_bool
	.linkonce	discard
.refptr.name_bool:
	.quad	name_bool
	.section	.rdata$.refptr.BOOL_KEYWORD, "dr"
	.globl	.refptr.BOOL_KEYWORD
	.linkonce	discard
.refptr.BOOL_KEYWORD:
	.quad	BOOL_KEYWORD
	.section	.rdata$.refptr.name_string, "dr"
	.globl	.refptr.name_string
	.linkonce	discard
.refptr.name_string:
	.quad	name_string
	.section	.rdata$.refptr.STRING_KEYWORD, "dr"
	.globl	.refptr.STRING_KEYWORD
	.linkonce	discard
.refptr.STRING_KEYWORD:
	.quad	STRING_KEYWORD
	.section	.rdata$.refptr.name_float, "dr"
	.globl	.refptr.name_float
	.linkonce	discard
.refptr.name_float:
	.quad	name_float
	.section	.rdata$.refptr.FLOAT_KEYWORD, "dr"
	.globl	.refptr.FLOAT_KEYWORD
	.linkonce	discard
.refptr.FLOAT_KEYWORD:
	.quad	FLOAT_KEYWORD
	.section	.rdata$.refptr.name_int, "dr"
	.globl	.refptr.name_int
	.linkonce	discard
.refptr.name_int:
	.quad	name_int
	.section	.rdata$.refptr.INT_KEYWORD, "dr"
	.globl	.refptr.INT_KEYWORD
	.linkonce	discard
.refptr.INT_KEYWORD:
	.quad	INT_KEYWORD
	.section	.rdata$.refptr.name_void, "dr"
	.globl	.refptr.name_void
	.linkonce	discard
.refptr.name_void:
	.quad	name_void
	.section	.rdata$.refptr.VOID_KEYWORD, "dr"
	.globl	.refptr.VOID_KEYWORD
	.linkonce	discard
.refptr.VOID_KEYWORD:
	.quad	VOID_KEYWORD
	.section	.rdata$.refptr.builtin_scope, "dr"
	.globl	.refptr.builtin_scope
	.linkonce	discard
.refptr.builtin_scope:
	.quad	builtin_scope
	.section	.rdata$.refptr.CONTINUE_KEYWORD, "dr"
	.globl	.refptr.CONTINUE_KEYWORD
	.linkonce	discard
.refptr.CONTINUE_KEYWORD:
	.quad	CONTINUE_KEYWORD
	.section	.rdata$.refptr.BREAK_KEYWORD, "dr"
	.globl	.refptr.BREAK_KEYWORD
	.linkonce	discard
.refptr.BREAK_KEYWORD:
	.quad	BREAK_KEYWORD
	.section	.rdata$.refptr.RETURN_KEYWORD, "dr"
	.globl	.refptr.RETURN_KEYWORD
	.linkonce	discard
.refptr.RETURN_KEYWORD:
	.quad	RETURN_KEYWORD
	.section	.rdata$.refptr.VAR_KEYWORD, "dr"
	.globl	.refptr.VAR_KEYWORD
	.linkonce	discard
.refptr.VAR_KEYWORD:
	.quad	VAR_KEYWORD
	.section	.rdata$.refptr.WHILE_KEYWORD, "dr"
	.globl	.refptr.WHILE_KEYWORD
	.linkonce	discard
.refptr.WHILE_KEYWORD:
	.quad	WHILE_KEYWORD
	.section	.rdata$.refptr.SEMICOLON_SYMBOL, "dr"
	.globl	.refptr.SEMICOLON_SYMBOL
	.linkonce	discard
.refptr.SEMICOLON_SYMBOL:
	.quad	SEMICOLON_SYMBOL
	.section	.rdata$.refptr.FOR_KEYWORD, "dr"
	.globl	.refptr.FOR_KEYWORD
	.linkonce	discard
.refptr.FOR_KEYWORD:
	.quad	FOR_KEYWORD
	.section	.rdata$.refptr.ELSE_KEYWORD, "dr"
	.globl	.refptr.ELSE_KEYWORD
	.linkonce	discard
.refptr.ELSE_KEYWORD:
	.quad	ELSE_KEYWORD
	.section	.rdata$.refptr.ELIF_KEYWORD, "dr"
	.globl	.refptr.ELIF_KEYWORD
	.linkonce	discard
.refptr.ELIF_KEYWORD:
	.quad	ELIF_KEYWORD
	.section	.rdata$.refptr.R_BRACE_SYMBOL, "dr"
	.globl	.refptr.R_BRACE_SYMBOL
	.linkonce	discard
.refptr.R_BRACE_SYMBOL:
	.quad	R_BRACE_SYMBOL
	.section	.rdata$.refptr.L_BRACE_SYMBOL, "dr"
	.globl	.refptr.L_BRACE_SYMBOL
	.linkonce	discard
.refptr.L_BRACE_SYMBOL:
	.quad	L_BRACE_SYMBOL
	.section	.rdata$.refptr.IF_KEYWORD, "dr"
	.globl	.refptr.IF_KEYWORD
	.linkonce	discard
.refptr.IF_KEYWORD:
	.quad	IF_KEYWORD
	.section	.rdata$.refptr.DOT_SYMBOL, "dr"
	.globl	.refptr.DOT_SYMBOL
	.linkonce	discard
.refptr.DOT_SYMBOL:
	.quad	DOT_SYMBOL
	.section	.rdata$.refptr.R_BRACKET_SYMBOL, "dr"
	.globl	.refptr.R_BRACKET_SYMBOL
	.linkonce	discard
.refptr.R_BRACKET_SYMBOL:
	.quad	R_BRACKET_SYMBOL
	.section	.rdata$.refptr.L_BRACKET_SYMBOL, "dr"
	.globl	.refptr.L_BRACKET_SYMBOL
	.linkonce	discard
.refptr.L_BRACKET_SYMBOL:
	.quad	L_BRACKET_SYMBOL
	.section	.rdata$.refptr.COMMA_SYMBOL, "dr"
	.globl	.refptr.COMMA_SYMBOL
	.linkonce	discard
.refptr.COMMA_SYMBOL:
	.quad	COMMA_SYMBOL
	.section	.rdata$.refptr.SELF_KEYWORD, "dr"
	.globl	.refptr.SELF_KEYWORD
	.linkonce	discard
.refptr.SELF_KEYWORD:
	.quad	SELF_KEYWORD
	.section	.rdata$.refptr.SUB_SYMBOL, "dr"
	.globl	.refptr.SUB_SYMBOL
	.linkonce	discard
.refptr.SUB_SYMBOL:
	.quad	SUB_SYMBOL
	.section	.rdata$.refptr.NOT_SYMBOL, "dr"
	.globl	.refptr.NOT_SYMBOL
	.linkonce	discard
.refptr.NOT_SYMBOL:
	.quad	NOT_SYMBOL
	.section	.rdata$.refptr.R_PAREN_SYMBOL, "dr"
	.globl	.refptr.R_PAREN_SYMBOL
	.linkonce	discard
.refptr.R_PAREN_SYMBOL:
	.quad	R_PAREN_SYMBOL
	.section	.rdata$.refptr.L_PAREN_SYMBOL, "dr"
	.globl	.refptr.L_PAREN_SYMBOL
	.linkonce	discard
.refptr.L_PAREN_SYMBOL:
	.quad	L_PAREN_SYMBOL
	.section	.rdata$.refptr.FALSE_KEYWORD, "dr"
	.globl	.refptr.FALSE_KEYWORD
	.linkonce	discard
.refptr.FALSE_KEYWORD:
	.quad	FALSE_KEYWORD
	.section	.rdata$.refptr.TRUE_KEYWORD, "dr"
	.globl	.refptr.TRUE_KEYWORD
	.linkonce	discard
.refptr.TRUE_KEYWORD:
	.quad	TRUE_KEYWORD
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL

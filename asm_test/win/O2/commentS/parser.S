	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse expression primary\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp92, parser
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp91, now_scope
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp90, lexer
	subq	$64, %rsp	 ;,
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp93, <retval>
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; <retval>
	je	.L6	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp95, _1
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r8	 ; tmp96, <retval>
.L1:
 ; D:\TC\src\parser.c:695: }
	addq	$64, %rsp	 ;,
	movq	%r8, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L6:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	movq	%rax, 56(%rsp)	 ; <retval>, %sfp
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC0(%rip), %rcx	 ;, tmp88
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp94, _15
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
	movq	56(%rsp), %r8	 ; %sfp, <retval>
	jmp	.L1	 ;
	.section .rdata,"dr"
.LC1:
	.ascii "Expected variable type\0"
	.align 8
.LC2:
	.ascii "Expected a type for variable declaration\0"
.LC3:
	.ascii "Unknown variable type\0"
.LC4:
	.ascii "Expected variable name\0"
	.align 8
.LC5:
	.ascii "Failed to parse variable initializer\0"
	.text
	.p2align 4
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp121, parser
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp120, now_scope
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp119, lexer
	pushq	%rbx	 ;
	subq	$72, %rsp	 ;,
 ; D:\TC\src\parser.c:323:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp122, token
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_26->type, _1
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L8	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L11	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rbx), %rcx	 ; token_26->lexeme, token_26->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp123
	je	.L11	 ;,
.L8:
 ; D:\TC\src\parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rdx	 ; token_26->lexeme, token_26->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search	 ;
	movq	%rax, %rdi	 ; tmp124, type
 ; D:\TC\src\parser.c:330:     if (type != 0) {
	testq	%rax, %rax	 ; type
	je	.L12	 ;,
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	 ;, type_31->kind
	jne	.L33	 ;,
.L13:
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_36->type
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp125, token
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	jne	.L34	 ;,
.L14:
 ; D:\TC\src\parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	(%rbx), %rcx	 ; token_36->lexeme, token_36->lexeme
	movq	%rbp, 32(%rsp)	 ; now_scope,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; type,
	movl	$1, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	%rax, %rbx	 ; tmp126, name
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_41->type
	je	.L15	 ;,
.L17:
 ; D:\TC\src\parser.c:341:     Expression* value = 0;
	xorl	%r8d, %r8d	 ; value
.L16:
 ; D:\TC\src\parser.c:354: }
	addq	$72, %rsp	 ;,
 ; D:\TC\src\parser.c:353:     return create_variable(type, name, value);
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
 ; D:\TC\src\parser.c:354: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:\TC\src\parser.c:353:     return create_variable(type, name, value);
	jmp	create_variable	 ;
	.p2align 4,,10
	.p2align 3
.L34:
 ; D:\TC\src\parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp112
	call	parser_error	 ;
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L11:
 ; D:\TC\src\parser.c:326:         parser_error("Expected variable type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC1(%rip), %rcx	 ;, tmp105
	call	parser_error	 ;
 ; D:\TC\src\parser.c:354: }
	addq	$72, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L33:
 ; D:\TC\src\parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp110
	call	parser_error	 ;
	jmp	.L13	 ;
	.p2align 4,,10
	.p2align 3
.L15:
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp114
	movq	(%rax), %rcx	 ; token_41->lexeme, token_41->lexeme
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp128
	je	.L17	 ;,
 ; D:\TC\src\parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp129, token
 ; D:\TC\src\parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r8	 ; tmp130, value
 ; D:\TC\src\parser.c:350:         if (value == 0)
	testq	%rax, %rax	 ; value
	jne	.L16	 ;,
 ; D:\TC\src\parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp117
	movq	%rax, 56(%rsp)	 ; value, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r8	 ; %sfp, value
	jmp	.L16	 ;
	.p2align 4,,10
	.p2align 3
.L12:
 ; D:\TC\src\parser.c:335:         parser_error("Unknown variable type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp111
	call	parser_error	 ;
	jmp	.L13	 ;
	.section .rdata,"dr"
	.align 8
.LC6:
	.ascii "Failed to parse parenthesized expression\0"
.LC7:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC8:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC9:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC10:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC11:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC12:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC13:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC14:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC15:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC16:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC17:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC18:
	.ascii "Expected attribute name after '.'\0"
.LC19:
	.ascii "Unknown attribute name\0"
	.align 8
.LC20:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC21:
	.ascii "Unexpected token in primary expression\0"
	.text
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp264, now_scope
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp265, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp263, lexer
	subq	$88, %rsp	 ;,
 ; D:\TC\src\parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %r14	 ; tmp266, token
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_50->type, _1
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L144	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L145	 ;,
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L146	 ;,
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L147	 ;,
.L40:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	je	.L44	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L46	 ;,
.L47:
 ; D:\TC\src\parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%r14, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp254
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
	.p2align 4,,10
	.p2align 3
.L145:
 ; D:\TC\src\parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%r14), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L37:
 ; D:\TC\src\parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r10, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
.L35:
 ; D:\TC\src\parser.c:769: }
	addq	$88, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L144:
 ; D:\TC\src\parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%r14), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:710:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L146:
 ; D:\TC\src\parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%r14), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:716:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp180
	movq	(%r14), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp267
	jne	.L148	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movl	24(%r14), %eax	 ; token_50->type, _6
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _6
	jne	.L40	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp183
	movq	(%r14), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp268
	jne	.L43	 ;,
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%r14), %eax	 ; token_50->type, pretmp_41
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_41
	jne	.L55	 ;,
	.p2align 4,,10
	.p2align 3
.L44:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r8	 ;, tmp256
	movq	(%r14), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%r8), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp269
	jne	.L149	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movl	24(%r14), %eax	 ; token_50->type, pretmp_41
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_41
	jne	.L55	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp194
	movq	(%r14), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp274
	jne	.L150	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movl	24(%r14), %eax	 ; token_50->type, pretmp_41
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_41
	jne	.L55	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp198
	movq	(%r14), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp277
	jne	.L56	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%r14), %eax	 ; token_50->type, pretmp_41
.L55:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, pretmp_41
	je	.L46	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	 ;, pretmp_41
	jne	.L47	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp202
	movq	(%r14), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; tmp281
	je	.L47	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%rsi)	 ;, parser_59(D)->in_method
	je	.L47	 ;,
.L46:
 ; D:\TC\src\parser.c:774:     Token* token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp280, token
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_89->type, _90
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _90
	je	.L59	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _90
	jne	.L62	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp206
	movq	0(%rbp), %rcx	 ; token_89->lexeme, token_89->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp282
	je	.L62	 ;,
.L59:
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	0(%rbp), %rdx	 ; token_89->lexeme, token_89->lexeme
	movq	%rdi, %rcx	 ; now_scope,
	call	search	 ;
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rbp	 ; tmp283, base_name
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	%rax, 56(%rsp)	 ; variable_value, %sfp
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	movq	56(%rsp), %r10	 ; %sfp, variable_value
	cmpl	$5, 24(%rax)	 ;, token_97->type
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp285, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	jne	.L63	 ;,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r8	 ;, tmp256
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	%rsi, 176(%rsp)	 ; parser, parser
 ; D:\TC\src\parser.c:780:     Name* current_type = 0;
	xorl	%r13d, %r13d	 ; current_type
 ; D:\TC\src\parser.c:782:     Scope* var_scope = 0;
	xorl	%r12d, %r12d	 ; var_scope
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r8, 64(%rsp)	 ; tmp256, %sfp
.L86:
 ; D:\TC\src\parser.c:789:         if (base_name != 0) {
	testq	%rbp, %rbp	 ; base_name
	je	.L64	 ;,
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%rbp), %eax	 ; base_name_234->kind, _99
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %edx	 ;, tmp210
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %edx	 ;, tmp210
	jbe	.L92	 ;,
	cmpl	$5, %eax	 ;, _99
	jne	.L65	 ;,
.L92:
 ; D:\TC\src\parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%rbp), %r13	 ; base_name_234->info.type, current_type
.L64:
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%r12, %r12	 ; var_scope
	jne	.L67	 ;,
	testq	%r13, %r13	 ; current_type
	je	.L67	 ;,
 ; D:\TC\src\parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%r13)	 ;, current_type_109->kind
	jne	.L67	 ;,
 ; D:\TC\src\parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%r13), %r12	 ; current_type_109->info.scope, var_scope
.L67:
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %rax	 ; %sfp, tmp256
	movq	(%r15), %rcx	 ; token_ptr_236->lexeme, token_ptr_236->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp286
	jne	.L151	 ;,
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp331
	movq	(%r15), %rcx	 ; token_ptr_236->lexeme, token_ptr_236->lexeme
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp297
	je	.L79	 ;,
 ; D:\TC\src\parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp298, token
 ; D:\TC\src\parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp299, index
 ; D:\TC\src\parser.c:837:             if (index == 0)
	testq	%rax, %rax	 ; index
	je	.L152	 ;,
.L80:
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_148->type
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp300, token
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L82	 ;,
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp332
	movq	(%r15), %rcx	 ; token_148->lexeme, token_148->lexeme
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp301
	je	.L82	 ;,
 ; D:\TC\src\parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp302, %sfp
.L78:
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_167->type
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp307, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	je	.L86	 ;,
.L139:
	movq	56(%rsp), %r10	 ; %sfp, variable_value
.L63:
 ; D:\TC\src\parser.c:760:         if (variable_value == 0) {
	testq	%r10, %r10	 ; variable_value
	je	.L61	 ;,
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp333
	movq	(%r15), %rcx	 ; token_ptr_236->lexeme, token_ptr_236->lexeme
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp303
	je	.L139	 ;,
 ; D:\TC\src\parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:849:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp304, token
 ; D:\TC\src\parser.c:851:             if (var_scope == 0) {
	testq	%r12, %r12	 ; var_scope
	je	.L153	 ;,
 ; D:\TC\src\parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_158->type
	jne	.L154	 ;,
 ; D:\TC\src\parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rdx	 ; token_158->lexeme, token_158->lexeme
	movq	%r12, %rcx	 ; var_scope,
	call	search	 ;
	movq	%rax, %rbp	 ; tmp305, base_name
 ; D:\TC\src\parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	 ; base_name
	je	.L155	 ;,
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:866:             var_scope = 0;
	xorl	%r12d, %r12d	 ; var_scope
 ; D:\TC\src\parser.c:865:             current_type = 0;
	xorl	%r13d, %r13d	 ; current_type
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp306, %sfp
	jmp	.L78	 ;
	.p2align 4,,10
	.p2align 3
.L151:
 ; D:\TC\src\parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp287, token
 ; D:\TC\src\parser.c:804:             if (base_name == 0)
	testq	%rbp, %rbp	 ; base_name
	je	.L156	 ;,
.L69:
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movl	24(%rbp), %eax	 ; base_name_234->kind, tmp330
	leal	-2(%rax), %ecx	 ;, tmp224
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %ecx	 ;, tmp224
	ja	.L157	 ;,
.L70:
 ; D:\TC\src\parser.c:809:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp288, token
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rsi	 ;, tmp257
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp258
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	movq	%rax, %r12	 ; tmp289, args
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_124->type
	je	.L158	 ;,
.L77:
 ; D:\TC\src\parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	176(%rsp), %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	 ; arg
	je	.L159	 ;,
.L72:
 ; D:\TC\src\parser.c:816:                 list_append(args, (pointer)arg);
	movq	%rax, %rdx	 ; arg,
	movq	%r12, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp291, token
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L73	 ;,
.L76:
 ; D:\TC\src\parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp228
	call	parser_error	 ;
.L61:
 ; D:\TC\src\parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%r14, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp253
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
	.p2align 4,,10
	.p2align 3
.L158:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rsi), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_124->lexeme, token_124->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp295
	je	.L77	 ;,
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r12, 32(%rsp)	 ; args,
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
 ; D:\TC\src\parser.c:830:             var_scope = 0;
	xorl	%r12d, %r12d	 ; var_scope
 ; D:\TC\src\parser.c:829:             current_type = 0;
	xorl	%r13d, %r13d	 ; current_type
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%rbp), %rbp	 ; base_name_234->info.type, base_name
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, 56(%rsp)	 ; tmp296, %sfp
	jmp	.L78	 ;
	.p2align 4,,10
	.p2align 3
.L73:
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_125->lexeme, token_125->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp292
	jne	.L160	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_125->type
	jne	.L76	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rsi), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_125->lexeme, token_125->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp294
	jne	.L71	 ;,
	jmp	.L76	 ;
	.p2align 4,,10
	.p2align 3
.L159:
 ; D:\TC\src\parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp227
	movq	%rax, 72(%rsp)	 ; arg, %sfp
	call	parser_error	 ;
	movq	72(%rsp), %rax	 ; %sfp, arg
	jmp	.L72	 ;
	.p2align 4,,10
	.p2align 3
.L160:
 ; D:\TC\src\parser.c:820:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp293, token
 ; D:\TC\src\parser.c:821:                     token_ptr = token;
	jmp	.L71	 ;
	.p2align 4,,10
	.p2align 3
.L148:
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%r14), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:719:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L157:
 ; D:\TC\src\parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp226
	call	parser_error	 ;
	jmp	.L70	 ;
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%r14), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:722:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L65:
 ; D:\TC\src\parser.c:794:                 current_type = base_name;
	andl	$-5, %eax	 ;, _99
	cmove	%rbp, %r13	 ; current_type,, base_name, current_type
	jmp	.L64	 ;
	.p2align 4,,10
	.p2align 3
.L62:
 ; D:\TC\src\parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp205
	call	parser_error	 ;
	jmp	.L61	 ;
	.p2align 4,,10
	.p2align 3
.L152:
 ; D:\TC\src\parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp241
	call	parser_error	 ;
	jmp	.L80	 ;
	.p2align 4,,10
	.p2align 3
.L149:
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp270, token
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L161	 ;,
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_63->type, type
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp272, token
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L53	 ;,
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp191
	movq	(%rsi), %rcx	 ; token_63->lexeme, token_63->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp273
	je	.L53	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L150:
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp275, token
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp276, prim_value
 ; D:\TC\src\parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L162	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp278, token
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp279, prim_value
 ; D:\TC\src\parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L163	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L156:
 ; D:\TC\src\parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp223
	call	parser_error	 ;
	jmp	.L69	 ;
.L53:
 ; D:\TC\src\parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp190
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
.L82:
 ; D:\TC\src\parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp242
	call	parser_error	 ;
	jmp	.L61	 ;
.L155:
 ; D:\TC\src\parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp252
	call	parser_error	 ;
	jmp	.L61	 ;
.L154:
 ; D:\TC\src\parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp250
	call	parser_error	 ;
	jmp	.L61	 ;
.L153:
 ; D:\TC\src\parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp249
	call	parser_error	 ;
	jmp	.L61	 ;
.L161:
 ; D:\TC\src\parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp189
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
.L163:
 ; D:\TC\src\parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp201
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
.L162:
 ; D:\TC\src\parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp197
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L35	 ;
	.section .rdata,"dr"
.LC22:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movl	%r8d, %r14d	 ; tmp123, min_prec
	pushq	%r13	 ;
	movq	%r9, %r13	 ; tmp124, now_scope
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp122, expr_left
 ; D:\TC\src\parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:641: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp121, lexer
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:647:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L165	 ;,
.L172:
 ; D:\TC\src\parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_67->lexeme, token_ptr_67->lexeme
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:651:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movl	%eax, %edi	 ; tmp126, op
 ; D:\TC\src\parser.c:651:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %esi	 ; tmp127, op_prec
 ; D:\TC\src\parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L165	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jl	.L165	 ;,
 ; D:\TC\src\parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:656:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r13, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:656:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp128, token
 ; D:\TC\src\parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp129, right_primary
 ; D:\TC\src\parser.c:659:         if (right_primary == 0) {
	testq	%rax, %rax	 ; right_primary
	je	.L179	 ;,
 ; D:\TC\src\parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp130, right
.L178:
 ; D:\TC\src\parser.c:664:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L168	 ;,
 ; D:\TC\src\parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_66->lexeme, token_ptr_66->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r15d	 ; tmp132, next_op
 ; D:\TC\src\parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r15d	 ;, next_op
	je	.L168	 ;,
	cmpl	%eax, %esi	 ; next_prec, op_prec
	jge	.L168	 ;,
 ; D:\TC\src\parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp139
	movq	%r13, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rbx, %rcx	 ; lexer,
	movq	%rdx, 32(%rsp)	 ; tmp139,
	movq	%rbp, %rdx	 ; right,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp134, right
 ; D:\TC\src\parser.c:672:             if (right == 0)
	testq	%rax, %rax	 ; right
	jne	.L178	 ;,
 ; D:\TC\src\parser.c:661:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L164	 ;
	.p2align 4,,10
	.p2align 3
.L168:
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; expr_left,
	movq	%rbp, %r9	 ; right,
	movl	%edi, %ecx	 ; op,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:678:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %r12	 ; tmp136, expr_left
 ; D:\TC\src\parser.c:678:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	je	.L172	 ;,
.L165:
 ; D:\TC\src\parser.c:681:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L164:
 ; D:\TC\src\parser.c:684: }
	addq	$56, %rsp	 ;,
	movq	%r12, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L179:
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp114
 ; D:\TC\src\parser.c:661:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	call	parser_error	 ;
	jmp	.L164	 ;
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
	.p2align 4
	.def	parse_statement;	.scl	3;	.type	32;	.endef
parse_statement:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp410, now_scope
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp411, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp409, lexer
	subq	$104, %rsp	 ;,
 ; D:\TC\src\parser.c:361:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_47->type
	je	.L348	 ;,
.L181:
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	movq	%rax, 32(%rsp)	 ; tmp510,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp511, <retval>
.L259:
 ; D:\TC\src\parser.c:398:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:399:     if (statement == 0)
	testq	%rsi, %rsi	 ; <retval>
	je	.L349	 ;,
.L266:
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_90->type
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp513, token
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L267	 ;,
.L269:
 ; D:\TC\src\parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp390
	call	parser_error	 ;
.L180:
 ; D:\TC\src\parser.c:406: }
	addq	$104, %rsp	 ;,
	movq	%rsi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L267:
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp391
	movq	(%rbx), %rcx	 ; token_90->lexeme, token_90->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp514
	je	.L269	 ;,
	jmp	.L180	 ;
	.p2align 4,,10
	.p2align 3
.L348:
	movq	%rax, %rbp	 ; tmp412, token
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp267
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp413
	jne	.L350	 ;,
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp316
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp455
	jne	.L351	 ;,
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp355
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp482
	jne	.L352	 ;,
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp375
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp498
	jne	.L353	 ;,
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp378
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp501
	je	.L260	 ;,
 ; D:\TC\src\parser.c:375:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp502,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp503, <retval>
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L351:
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_178->type
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp456, token
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L217	 ;,
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp320
	movq	0(%rbp), %rcx	 ; token_178->lexeme, token_178->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp457
	je	.L217	 ;,
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_183->type
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp458, token
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L218	 ;,
.L221:
 ; D:\TC\src\parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp459, initializer
 ; D:\TC\src\parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	 ; initializer
	je	.L354	 ;,
.L220:
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp461, token
.L222:
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_190->type
	jne	.L225	 ;,
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14	 ;, tmp400
	movq	0(%rbp), %rcx	 ; token_190->lexeme, token_190->lexeme
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp462
	je	.L225	 ;,
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_195->type
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp463, token
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L226	 ;,
.L229:
 ; D:\TC\src\parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp464, condition
 ; D:\TC\src\parser.c:549:         if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L355	 ;,
.L228:
 ; D:\TC\src\parser.c:551:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp466, token
.L230:
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_202->type
	jne	.L232	 ;,
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	0(%rbp), %rcx	 ; token_202->lexeme, token_202->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp467
	je	.L232	 ;,
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_207->type
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp468, token
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L233	 ;,
.L236:
 ; D:\TC\src\parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
	movq	%rax, 64(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:565:         if (increment == 0)
	testq	%rax, %rax	 ; increment
	je	.L356	 ;,
.L235:
 ; D:\TC\src\parser.c:567:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp471, token
.L237:
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_214->type
	jne	.L239	 ;,
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp344
	movq	0(%rbp), %rcx	 ; token_214->lexeme, token_214->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	 ; tmp472
	je	.L239	 ;,
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_219->type
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp473, token
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L241	 ;,
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp348
	movq	0(%rbp), %rcx	 ; token_219->lexeme, token_219->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp474
	je	.L241	 ;,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%rsi)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movq	%r13, %r15	 ; condition, condition
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	movq	%rax, %r14	 ; tmp475, body
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp399
	movq	%rax, %rdx	 ; token, token
	movq	%rbp, %rax	 ; tmp399, tmp399
	movq	%rdx, %r13	 ; token, token
	movq	%rsi, %rbp	 ; parser, parser
	movq	%rbx, %rsi	 ; lexer, lexer
	movq	%r12, %rbx	 ; initializer, initializer
	movq	%rax, %r12	 ; tmp399, tmp399
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L242	 ;
	.p2align 4,,10
	.p2align 3
.L243:
 ; D:\TC\src\parser.c:590:         list_append(body, (pointer)statement);
	movq	%rax, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:591:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp478, token
.L242:
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_227->type
	jne	.L244	 ;,
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_227->lexeme, token_227->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp479
	jne	.L357	 ;,
.L244:
 ; D:\TC\src\parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:588:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L243	 ;,
 ; D:\TC\src\parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
	movq	%rax, 56(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %rax	 ; %sfp, statement
	jmp	.L243	 ;
	.p2align 4,,10
	.p2align 3
.L349:
 ; D:\TC\src\parser.c:400:         parser_error("Failed to parse statement", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp389
	call	parser_error	 ;
	jmp	.L266	 ;
	.p2align 4,,10
	.p2align 3
.L350:
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_93->type
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp414, token
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L185	 ;,
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r15	 ;, tmp397
	movq	(%rax), %rcx	 ; token_93->lexeme, token_93->lexeme
	movq	(%r15), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp415
	je	.L185	 ;,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp416, token
 ; D:\TC\src\parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp417, condition
 ; D:\TC\src\parser.c:422:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L358	 ;,
.L186:
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_100->type
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp418, token
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L188	 ;,
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp564
	movq	0(%rbp), %rcx	 ; token_100->lexeme, token_100->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp419
	je	.L188	 ;,
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_105->type
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp420, token
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L190	 ;,
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp565
	movq	0(%rbp), %rcx	 ; token_105->lexeme, token_105->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp421
	je	.L190	 ;,
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	movq	%rax, %r14	 ; tmp422, body
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r13, 56(%rsp)	 ; condition, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp399
	movq	%rax, %r13	 ; token, token
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L191	 ;
	.p2align 4,,10
	.p2align 3
.L192:
 ; D:\TC\src\parser.c:443:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp425, token
.L191:
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_113->type
	jne	.L193	 ;,
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_113->lexeme, token_113->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp426
	jne	.L359	 ;,
.L193:
 ; D:\TC\src\parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp424, statement
 ; D:\TC\src\parser.c:441:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L192	 ;,
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC27(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L192	 ;
	.p2align 4,,10
	.p2align 3
.L185:
 ; D:\TC\src\parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp270
	call	parser_error	 ;
.L184:
 ; D:\TC\src\parser.c:417:         return NULL;
	xorl	%edx, %edx	 ; _176
.L195:
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp454, <retval>
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L180	 ;
	.p2align 4,,10
	.p2align 3
.L352:
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_238->type
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp483, token
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L248	 ;,
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp359
	movq	0(%rbp), %rcx	 ; token_238->lexeme, token_238->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp484
	je	.L248	 ;,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp485, token
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp486, condition
 ; D:\TC\src\parser.c:612:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L360	 ;,
.L249:
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_245->type
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp487, token
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L252	 ;,
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp364
	movq	0(%rbp), %rcx	 ; token_245->lexeme, token_245->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	je	.L252	 ;,
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_250->type
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp489, token
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L254	 ;,
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp368
	movq	0(%rbp), %rcx	 ; token_250->lexeme, token_250->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp490
	je	.L254	 ;,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%rsi)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	movq	%rax, %r13	 ; tmp491, body
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp399
	movq	%rax, %r15	 ; tmp492, token
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L255	 ;
	.p2align 4,,10
	.p2align 3
.L256:
 ; D:\TC\src\parser.c:634:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:635:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp494, token
.L255:
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_258->type
	jne	.L257	 ;,
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r15), %rcx	 ; token_258->lexeme, token_258->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp495
	jne	.L361	 ;,
.L257:
 ; D:\TC\src\parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp493, statement
 ; D:\TC\src\parser.c:632:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L256	 ;,
 ; D:\TC\src\parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L256	 ;
	.p2align 4,,10
	.p2align 3
.L353:
 ; D:\TC\src\parser.c:372:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 40(%rsp)	 ; tmp499,
	movl	$1, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp500, <retval>
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L188:
 ; D:\TC\src\parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp275
	call	parser_error	 ;
 ; D:\TC\src\parser.c:428:         return NULL;
	jmp	.L184	 ;
	.p2align 4,,10
	.p2align 3
.L217:
 ; D:\TC\src\parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp319
	call	parser_error	 ;
.L216:
 ; D:\TC\src\parser.c:526:         return NULL;
	xorl	%r9d, %r9d	 ; _236
.L224:
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp481, <retval>
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L180	 ;
	.p2align 4,,10
	.p2align 3
.L248:
 ; D:\TC\src\parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp358
	call	parser_error	 ;
.L247:
 ; D:\TC\src\parser.c:607:         return NULL;
	xorl	%r8d, %r8d	 ; _264
.L251:
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp497, <retval>
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L180	 ;
.L358:
 ; D:\TC\src\parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp274
	call	parser_error	 ;
	jmp	.L186	 ;
	.p2align 4,,10
	.p2align 3
.L260:
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp381
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp504
	je	.L261	 ;,
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rsi)	 ;, parser_49(D)->in_loop
	je	.L362	 ;,
 ; D:\TC\src\parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp505, <retval>
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L225:
 ; D:\TC\src\parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp327
	call	parser_error	 ;
 ; D:\TC\src\parser.c:542:         return NULL;
	jmp	.L216	 ;
.L190:
 ; D:\TC\src\parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp279
	call	parser_error	 ;
 ; D:\TC\src\parser.c:434:         return NULL;
	jmp	.L184	 ;
.L359:
 ; D:\TC\src\parser.c:447:     list(ElseIf*) else_if = create_list();
	movq	56(%rsp), %r13	 ; %sfp, condition
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp427, %sfp
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	movq	%rax, 72(%rsp)	 ; tmp428, %sfp
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_121->type
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp429, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	jne	.L206	 ;,
	movq	%r13, 80(%rsp)	 ; condition, %sfp
	movq	%r14, 88(%rsp)	 ; body, %sfp
	.p2align 4,,10
	.p2align 3
.L194:
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp568
	movq	(%r12), %rcx	 ; token_ptr_41->lexeme, token_ptr_41->lexeme
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp446
	je	.L363	 ;,
 ; D:\TC\src\parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:454:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_122->type
 ; D:\TC\src\parser.c:454:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp431, token
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L197	 ;,
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r15), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rax), %rcx	 ; token_122->lexeme, token_122->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp432
	je	.L197	 ;,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp433, token
 ; D:\TC\src\parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r13	 ; tmp434, elif_condition
 ; D:\TC\src\parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	 ; elif_condition
	je	.L364	 ;,
.L198:
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_130->type
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp435, token
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L200	 ;,
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp566
	movq	(%r12), %rcx	 ; token_130->lexeme, token_130->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp436
	je	.L200	 ;,
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_136->type
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp437, token
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L202	 ;,
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp567
	movq	(%r12), %rcx	 ; token_136->lexeme, token_136->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp438
	je	.L202	 ;,
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	movq	%rax, %r12	 ; tmp439, elif_body
 ; D:\TC\src\parser.c:478:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r13, 56(%rsp)	 ; elif_condition, %sfp
	movq	%rax, %r13	 ; token, token
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L203	 ;
	.p2align 4,,10
	.p2align 3
.L204:
 ; D:\TC\src\parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%r12, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:485:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp442, token
.L203:
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_145->type
	jne	.L205	 ;,
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_145->lexeme, token_145->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp443
	jne	.L365	 ;,
.L205:
 ; D:\TC\src\parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp441, statement
 ; D:\TC\src\parser.c:482:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L204	 ;,
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC32(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L204	 ;
	.p2align 4,,10
	.p2align 3
.L365:
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %r13	 ; %sfp, elif_condition
	movq	%r12, %rdx	 ; elif_body,
	movq	%r13, %rcx	 ; elif_condition,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp444, _151
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp445, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	je	.L194	 ;,
	movq	80(%rsp), %r13	 ; %sfp, condition
	movq	88(%rsp), %r14	 ; %sfp, body
.L206:
 ; D:\TC\src\parser.c:512:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%r14, %rdx	 ; body,
	movq	%r13, %rcx	 ; condition,
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp430, _176
	jmp	.L195	 ;
	.p2align 4,,10
	.p2align 3
.L364:
 ; D:\TC\src\parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L198	 ;
.L218:
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp323
	movq	0(%rbp), %rcx	 ; token_183->lexeme, token_183->lexeme
 ; D:\TC\src\parser.c:530:     Variable* initializer = 0;
	xorl	%r12d, %r12d	 ; initializer
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp460
	jne	.L222	 ;,
	jmp	.L221	 ;
.L252:
 ; D:\TC\src\parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp363
	call	parser_error	 ;
 ; D:\TC\src\parser.c:618:         return NULL;
	jmp	.L247	 ;
.L232:
 ; D:\TC\src\parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp335
	call	parser_error	 ;
 ; D:\TC\src\parser.c:558:         return NULL;
	jmp	.L216	 ;
.L261:
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp385
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp506
	je	.L181	 ;,
 ; D:\TC\src\parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rsi)	 ;, parser_49(D)->in_loop
	je	.L366	 ;,
 ; D:\TC\src\parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$7, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp507, <retval>
	jmp	.L259	 ;
.L226:
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_195->lexeme, token_195->lexeme
 ; D:\TC\src\parser.c:546:     Expression* condition = 0;
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp465
	jne	.L230	 ;,
	jmp	.L229	 ;
.L254:
 ; D:\TC\src\parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp367
	call	parser_error	 ;
 ; D:\TC\src\parser.c:624:         return NULL;
	jmp	.L247	 ;
.L361:
 ; D:\TC\src\parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%rsi)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:639:     return create_while(condition, body);
	movq	%r13, %rdx	 ; body,
	movq	%r14, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp496, _264
	jmp	.L251	 ;
.L354:
 ; D:\TC\src\parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp326
	call	parser_error	 ;
	jmp	.L220	 ;
.L239:
 ; D:\TC\src\parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp343
	call	parser_error	 ;
 ; D:\TC\src\parser.c:574:         return NULL;
	jmp	.L216	 ;
.L360:
 ; D:\TC\src\parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp362
	call	parser_error	 ;
	jmp	.L249	 ;
.L197:
 ; D:\TC\src\parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp287
	call	parser_error	 ;
 ; D:\TC\src\parser.c:458:             return NULL;
	jmp	.L184	 ;
.L200:
 ; D:\TC\src\parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp292
	call	parser_error	 ;
 ; D:\TC\src\parser.c:469:             return NULL;
	jmp	.L184	 ;
.L202:
 ; D:\TC\src\parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp296
	call	parser_error	 ;
 ; D:\TC\src\parser.c:475:             return NULL;
	jmp	.L184	 ;
.L233:
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp339
	movq	0(%rbp), %rcx	 ; token_207->lexeme, token_207->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp470
	je	.L236	 ;,
 ; D:\TC\src\parser.c:562:     Expression* increment = 0;
	movq	$0, 64(%rsp)	 ;, %sfp
	jmp	.L237	 ;
.L362:
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp384
 ; D:\TC\src\parser.c:383:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	call	parser_error	 ;
	jmp	.L180	 ;
.L355:
 ; D:\TC\src\parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp334
	call	parser_error	 ;
	jmp	.L228	 ;
.L241:
 ; D:\TC\src\parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp347
	call	parser_error	 ;
 ; D:\TC\src\parser.c:580:         return NULL;
	jmp	.L216	 ;
.L357:
 ; D:\TC\src\parser.c:594:     ((parser))->in_loop = false;
	movb	$0, 2(%rbp)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r14, %r9	 ; body,
	movq	%r15, %rdx	 ; condition,
	movq	%rbx, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp480, _236
	jmp	.L224	 ;
.L363:
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%r12)	 ;, token_ptr_41->type
	movq	80(%rsp), %r13	 ; %sfp, condition
	movq	88(%rsp), %r14	 ; %sfp, body
	jne	.L206	 ;,
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp307
	movq	(%r12), %rcx	 ; token_ptr_41->lexeme, token_ptr_41->lexeme
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp447
	je	.L206	 ;,
 ; D:\TC\src\parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_163->type
 ; D:\TC\src\parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp448, token
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L209	 ;,
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp569
	movq	(%r12), %rcx	 ; token_163->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp449
	je	.L209	 ;,
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %r12	 ;, tmp401
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp450, token
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L210	 ;
	.p2align 4,,10
	.p2align 3
.L211:
 ; D:\TC\src\parser.c:507:             list_append(else_body, (pointer)statement);
	movq	72(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:508:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp452, token
.L210:
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_170->type
	jne	.L212	 ;,
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r15), %rcx	 ; token_170->lexeme, token_170->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp453
	jne	.L206	 ;,
.L212:
 ; D:\TC\src\parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:505:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L211	 ;,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%r15, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp401,
	movq	%rax, 56(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %rax	 ; %sfp, statement
	jmp	.L211	 ;
.L356:
 ; D:\TC\src\parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp342
	call	parser_error	 ;
	jmp	.L235	 ;
.L366:
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp388
 ; D:\TC\src\parser.c:383:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	call	parser_error	 ;
	jmp	.L180	 ;
.L209:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp310
	call	parser_error	 ;
 ; D:\TC\src\parser.c:499:             return NULL;
	jmp	.L184	 ;
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
.LC81:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC82:
	.ascii "Method missing return statement\0"
.LC83:
	.ascii "Failed to parse class method\0"
	.align 8
.LC84:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC85:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC86:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC87:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC88:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp450, lexer
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp451, now_scope
	subq	$168, %rsp	 ;,
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp421
 ; D:\TC\src\parser.c:19: Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%r8, 72(%rsp)	 ; tmp452, %sfp
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	je	.L533	 ;,
.L368:
 ; D:\TC\src\parser.c:31:     if (now_scope == 0)
	testq	%rbx, %rbx	 ; now_scope
	je	.L534	 ;,
.L369:
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp459, %sfp
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	call	create_scope	 ;
 ; D:\TC\src\parser.c:37:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rax, 64(%rsp)	 ; tmp460, %sfp
 ; D:\TC\src\parser.c:37:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L456	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %r13	 ;, tmp449
	movq	%rax, %r11	 ; token, token
	movq	%rdi, %r14	 ; lexer, lexer
	jmp	.L370	 ;
	.p2align 4,,10
	.p2align 3
.L410:
 ; D:\TC\src\parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC88(%rip), %rcx	 ;, tmp419
	call	parser_error	 ;
.L382:
 ; D:\TC\src\parser.c:57:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r11	 ; tmp547, token
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L456	 ;,
.L370:
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movl	24(%r11), %eax	 ; token_379->type, _31
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _31
	je	.L456	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _31
	jne	.L410	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp583
	movq	(%r11), %rcx	 ; token_379->lexeme, token_379->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; have_return
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movl	%eax, %ebx	 ; tmp462, have_return
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jne	.L535	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_379->type
	jne	.L410	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp585
	movq	(%r11), %rcx	 ; token_379->lexeme, token_379->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp473
	jne	.L536	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_379->type
	jne	.L410	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	(%r11), %rcx	 ; token_379->lexeme, token_379->lexeme
	movq	0(%r13), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp499
	je	.L410	 ;,
 ; D:\TC\src\parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:277:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	%rax, 88(%rsp)	 ; tmp500, %sfp
 ; D:\TC\src\parser.c:277:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_173->type
	jne	.L537	 ;,
 ; D:\TC\src\parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	(%rax), %rcx	 ; token_173->lexeme, token_173->lexeme
	movq	64(%rsp), %rax	 ; %sfp, global_scope
	xorl	%r8d, %r8d	 ;
	movl	$4, %edx	 ;,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	%rax, 32(%rsp)	 ; global_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	%rax, 104(%rsp)	 ; tmp502, %sfp
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_177->type
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp503, token
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L414	 ;,
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp590
	movq	(%rbx), %rcx	 ; token_177->lexeme, token_177->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp504
	je	.L414	 ;,
 ; D:\TC\src\parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:291:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:290:     list(ClassMember*) members = create_list();
	movq	%rax, 96(%rsp)	 ; tmp505, %sfp
 ; D:\TC\src\parser.c:291:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp423
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rdi	 ;, tmp445
 ; D:\TC\src\parser.c:291:     token = get_next_token(lexer, true);
	movq	%rax, %r10	 ; tmp506, token
	movq	%r11, 112(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L415	 ;
	.p2align 4,,10
	.p2align 3
.L453:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_165
	je	.L538	 ;,
.L416:
 ; D:\TC\src\parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%r10, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp414
	call	parser_error	 ;
.L449:
 ; D:\TC\src\parser.c:312:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r10	 ; tmp543, token
.L415:
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	 ; token_184->type, prephitmp_165
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_165
	jne	.L453	 ;,
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r10), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp544
	jne	.L454	 ;,
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	movl	24(%r10), %eax	 ; token_184->type, prephitmp_165
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_165
	jne	.L416	 ;,
.L538:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp591
	movq	(%r10), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp507
	jne	.L539	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	 ;, token_184->type
	jne	.L416	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	(%r10), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	(%rdi), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp537
	je	.L416	 ;,
 ; D:\TC\src\parser.c:300:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	72(%rsp), %r8	 ; %sfp,
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:300:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp538, token
 ; D:\TC\src\parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %r8	 ; tmp539, variable
 ; D:\TC\src\parser.c:303:             if (variable == 0)
	testq	%rax, %rax	 ; variable
	je	.L540	 ;,
.L450:
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rdx	 ; tmp540, _197
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	list_append	 ;
 ; D:\TC\src\parser.c:306:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_198->type
 ; D:\TC\src\parser.c:306:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp541, token
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L451	 ;,
.L452:
 ; D:\TC\src\parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp410
	call	parser_error	 ;
	jmp	.L449	 ;
	.p2align 4,,10
	.p2align 3
.L456:
 ; D:\TC\src\parser.c:60:     return create_code(members, global_scope);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:61: }
	addq	$168, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\parser.c:60:     return create_code(members, global_scope);
	jmp	create_code	 ;
	.p2align 4,,10
	.p2align 3
.L535:
 ; D:\TC\src\parser.c:68:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_89->type
	jne	.L541	 ;,
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:74:     string import_name = token_ptr->lexeme;
	movq	(%rax), %rdi	 ; token_89->lexeme, import_name
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:75:     string source = 0;
	xorl	%esi, %esi	 ; source
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp464, token
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	 ; token_92->type, _93
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _93
	je	.L542	 ;,
.L375:
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _93
	jne	.L379	 ;,
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp309
	movq	(%rbx), %rcx	 ; token_101->lexeme, token_101->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp468
	je	.L379	 ;,
 ; D:\TC\src\parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movq	%rsi, %rdx	 ; source,
	call	parse_import_file	 ;
 ; D:\TC\src\parser.c:95:     if (name == 0)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; name
 ; D:\TC\src\parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	%rax, %rcx	 ; tmp469, name
 ; D:\TC\src\parser.c:95:     if (name == 0)
	je	.L543	 ;,
.L380:
 ; D:\TC\src\parser.c:97:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_import	 ;
 ; D:\TC\src\parser.c:42:             if (import == 0)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _111
 ; D:\TC\src\parser.c:97:     return create_import(name, source);
	movq	%rax, %rdx	 ; tmp471, _111
 ; D:\TC\src\parser.c:42:             if (import == 0)
	je	.L374	 ;,
.L381:
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rdx	 ; tmp472, _20
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jmp	.L382	 ;
	.p2align 4,,10
	.p2align 3
.L536:
 ; D:\TC\src\parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	%rax, %rsi	 ; tmp474, function_scope
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp475, token
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_114->type, _115
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _115
	je	.L384	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _115
	jne	.L387	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%rbp), %rcx	 ; token_114->lexeme, token_114->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp476
	je	.L387	 ;,
.L384:
 ; D:\TC\src\parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	0(%rbp), %rdx	 ; token_114->lexeme, token_114->lexeme
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	search	 ;
 ; D:\TC\src\parser.c:113:     if (return_type == 0)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rdi	 ; tmp477, return_type
 ; D:\TC\src\parser.c:113:     if (return_type == 0)
	je	.L544	 ;,
 ; D:\TC\src\parser.c:119:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_120->type
	jne	.L545	 ;,
 ; D:\TC\src\parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	(%rax), %rcx	 ; token_120->lexeme, token_120->lexeme
	movq	64(%rsp), %rax	 ; %sfp, global_scope
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; return_type,
	movl	$2, %edx	 ;,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	%rax, 32(%rsp)	 ; global_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	%rax, 88(%rsp)	 ; tmp479, %sfp
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_124->type
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp480, token
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L391	 ;,
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp325
	movq	0(%rbp), %rcx	 ; token_124->lexeme, token_124->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp481
	je	.L391	 ;,
 ; D:\TC\src\parser.c:132:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 96(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp482, token
 ; D:\TC\src\parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rdi, 104(%rsp)	 ; return_type, %sfp
	movq	%rbp, %rdi	 ; token, token
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12	 ;, tmp435
 ; D:\TC\src\parser.c:134:     list(Variable*) parameters = create_list();
	movq	%rax, 56(%rsp)	 ; tmp483, %sfp
	movl	%ebx, %ebp	 ; have_return, have_return
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r15	 ;, tmp436
	movq	96(%rsp), %rbx	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L392:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_132->type
	je	.L546	 ;,
.L400:
 ; D:\TC\src\parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	je	.L547	 ;,
 ; D:\TC\src\parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_131->value
	je	.L395	 ;,
 ; D:\TC\src\parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp329
	call	parser_error	 ;
.L394:
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_134->type
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp485, token
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L396	 ;,
.L399:
 ; D:\TC\src\parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp330
	movq	%rbx, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L386:
 ; D:\TC\src\parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp351
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _168
.L409:
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rdx	 ; tmp498, _25
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	jmp	.L382	 ;
	.p2align 4,,10
	.p2align 3
.L414:
 ; D:\TC\src\parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp357
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L412:
 ; D:\TC\src\parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp418
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _208
.L455:
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%edx, %edx	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rdx	 ; tmp546, _30
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	list_append	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	jmp	.L382	 ;
	.p2align 4,,10
	.p2align 3
.L539:
 ; D:\TC\src\parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	104(%rsp), %r8	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	%rax, %rsi	 ; tmp508, method_scope
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp592
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%rsi, 32(%rsp)	 ; method_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	%rax, %rbp	 ; tmp509, self
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp510, token
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_213->type, _214
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _214
	je	.L418	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _214
	jne	.L421	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%r15), %rcx	 ; token_213->lexeme, token_213->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp511
	je	.L421	 ;,
.L418:
 ; D:\TC\src\parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%r15), %rdx	 ; token_213->lexeme, token_213->lexeme
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	search	 ;
 ; D:\TC\src\parser.c:196:     if (return_type == 0) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rbx	 ; tmp512, return_type
 ; D:\TC\src\parser.c:196:     if (return_type == 0) {
	je	.L548	 ;,
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_219->type
	jne	.L549	 ;,
 ; D:\TC\src\parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	(%rax), %rcx	 ; token_219->lexeme, token_219->lexeme
	movq	88(%rsp), %rax	 ; %sfp, class_scope
	xorl	%r9d, %r9d	 ;
	movq	%rbx, %r8	 ; return_type,
	movl	$3, %edx	 ;,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	%rax, 32(%rsp)	 ; class_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	%rax, 136(%rsp)	 ; tmp514, %sfp
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp515, token
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L425	 ;,
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp373
	movq	(%r15), %rcx	 ; token_223->lexeme, token_223->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp516
	je	.L425	 ;,
 ; D:\TC\src\parser.c:213:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_228->type
 ; D:\TC\src\parser.c:213:     token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp517, token
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	je	.L426	 ;,
.L428:
 ; D:\TC\src\parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp376
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L427:
 ; D:\TC\src\parser.c:217:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp519, token
 ; D:\TC\src\parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	104(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:219:     list(Variable*) parameters = create_list();
	movq	%rax, 120(%rsp)	 ; tmp520, %sfp
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	120(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	%rax, %rdx	 ; tmp521, _235
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	list_append	 ;
	movq	%rbx, 128(%rsp)	 ; return_type, %sfp
	movq	%r15, %rbx	 ; token, token
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp	 ;, tmp442
	movq	%r12, %r15	 ; tmp423, tmp423
	movq	56(%rsp), %r12	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L429:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_236->type
	je	.L550	 ;,
.L531:
	movq	%r12, %r10	 ; token, token
	movq	%r15, %r12	 ; tmp423, tmp423
	movq	%rbx, %r15	 ; token, token
.L433:
 ; D:\TC\src\parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp383
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L534:
 ; D:\TC\src\parser.c:32:         now_scope = builtin_scope;
	movq	(%rsi), %rbx	 ; builtin_scope, now_scope
	jmp	.L369	 ;
	.p2align 4,,10
	.p2align 3
.L454:
 ; D:\TC\src\parser.c:315:     return create_class(name, members, class_scope);
	movq	112(%rsp), %r11	 ; %sfp, token
	movq	88(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	104(%rsp), %rcx	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_class	 ;
 ; D:\TC\src\parser.c:52:             if (class_ == 0)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _208
 ; D:\TC\src\parser.c:315:     return create_class(name, members, class_scope);
	movq	%rax, %r9	 ; tmp545, _208
 ; D:\TC\src\parser.c:52:             if (class_ == 0)
	jne	.L455	 ;,
	jmp	.L412	 ;
	.p2align 4,,10
	.p2align 3
.L451:
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp411
	movq	(%rbx), %rcx	 ; token_198->lexeme, token_198->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp542
	je	.L452	 ;,
	jmp	.L449	 ;
	.p2align 4,,10
	.p2align 3
.L537:
 ; D:\TC\src\parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp355
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L412	 ;
	.p2align 4,,10
	.p2align 3
.L541:
 ; D:\TC\src\parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp303
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L374:
 ; D:\TC\src\parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC56(%rip), %rcx	 ;, tmp314
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _111
	jmp	.L381	 ;
	.p2align 4,,10
	.p2align 3
.L379:
 ; D:\TC\src\parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp308
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L374	 ;
	.p2align 4,,10
	.p2align 3
.L391:
 ; D:\TC\src\parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp324
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L386	 ;
	.p2align 4,,10
	.p2align 3
.L425:
 ; D:\TC\src\parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp372
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L420:
 ; D:\TC\src\parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%r10, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp405
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _273
.L448:
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp536, _190
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L449	 ;
	.p2align 4,,10
	.p2align 3
.L546:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_132->lexeme, token_132->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp489
	je	.L400	 ;,
 ; D:\TC\src\parser.c:153:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%rbx, 96(%rsp)	 ; token, %sfp
	movq	104(%rsp), %rdi	 ; %sfp, return_type
	call	get_next_token	 ;
	movl	%ebp, %ebx	 ; have_return, have_return
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_149->type
 ; D:\TC\src\parser.c:153:     token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp490, token
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L402	 ;,
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp341
	movq	(%r12), %rcx	 ; token_149->lexeme, token_149->lexeme
	movq	%r11, 96(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp491
	je	.L402	 ;,
 ; D:\TC\src\parser.c:159:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:162:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:171:             have_return = true;
	movl	$1, %ebp	 ;, tmp434
 ; D:\TC\src\parser.c:159:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp492, body
 ; D:\TC\src\parser.c:160:     parser->in_function = true;
	movq	72(%rsp), %rax	 ; %sfp, parser
	movb	$1, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:162:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	96(%rsp), %r11	 ; %sfp, token
	movq	%rdi, 112(%rsp)	 ; return_type, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp423
	movq	%rax, %rdi	 ; token, token
	movq	%r11, 104(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L403	 ;
	.p2align 4,,10
	.p2align 3
.L405:
 ; D:\TC\src\parser.c:171:             have_return = true;
	cmpl	$5, 8(%rax)	 ;, statement_156->type
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	movq	%rax, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
 ; D:\TC\src\parser.c:171:             have_return = true;
	cmove	%ebp, %ebx	 ; have_return,, tmp434, have_return
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	call	list_append	 ;
 ; D:\TC\src\parser.c:173:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp495, token
.L403:
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_157->type
	jne	.L407	 ;,
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rdi), %rcx	 ; token_157->lexeme, token_157->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp496
	jne	.L551	 ;,
.L407:
 ; D:\TC\src\parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:166:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L552	 ;,
 ; D:\TC\src\parser.c:168:         else if (have_return)
	testb	%bl, %bl	 ; have_return
	je	.L405	 ;,
 ; D:\TC\src\parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	movq	%rax, 96(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	96(%rsp), %rax	 ; %sfp, statement
	jmp	.L405	 ;
	.p2align 4,,10
	.p2align 3
.L395:
 ; D:\TC\src\parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L394	 ;
	.p2align 4,,10
	.p2align 3
.L396:
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%r15), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_134->lexeme, token_134->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp486
	jne	.L553	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_134->type
	jne	.L399	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_134->lexeme, token_134->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	jne	.L392	 ;,
	jmp	.L399	 ;
	.p2align 4,,10
	.p2align 3
.L550:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp596
	movq	(%rbx), %rcx	 ; token_236->lexeme, token_236->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp528
	jne	.L554	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_236->type
	jne	.L531	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_236->lexeme, token_236->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp522
	je	.L555	 ;,
 ; D:\TC\src\parser.c:223:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:223:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp523, token
 ; D:\TC\src\parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:231:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	je	.L556	 ;,
 ; D:\TC\src\parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_242->value
	je	.L439	 ;,
 ; D:\TC\src\parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;,
	call	parser_error	 ;
.L438:
 ; D:\TC\src\parser.c:237:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp527, token
	jmp	.L429	 ;
	.p2align 4,,10
	.p2align 3
.L439:
 ; D:\TC\src\parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	120(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L438	 ;
	.p2align 4,,10
	.p2align 3
.L547:
 ; D:\TC\src\parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp328
	call	parser_error	 ;
	jmp	.L394	 ;
	.p2align 4,,10
	.p2align 3
.L556:
 ; D:\TC\src\parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp387
	call	parser_error	 ;
	jmp	.L438	 ;
	.p2align 4,,10
	.p2align 3
.L533:
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	xorl	%ecx, %ecx	 ;
	call	create_scope	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rdx	 ;, tmp276
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	(%rdx), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	movq	%rax, 32(%rsp)	 ; _2,
	xorl	%edx, %edx	 ;
	call	create_name	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp278
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp454, name_void
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp279
	xorl	%edx, %edx	 ;
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp283
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp455, name_int
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp284
	xorl	%edx, %edx	 ;
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp288
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp456, name_float
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp289
	xorl	%edx, %edx	 ;
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp293
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp457, name_string
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp294
	xorl	%edx, %edx	 ;
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	movq	(%rsi), %rax	 ; builtin_scope, builtin_scope
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	call	create_name	 ;
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp298
	movq	%rax, (%rdx)	 ; tmp458, name_bool
	jmp	.L368	 ;
	.p2align 4,,10
	.p2align 3
.L387:
 ; D:\TC\src\parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp318
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L386	 ;
	.p2align 4,,10
	.p2align 3
.L421:
 ; D:\TC\src\parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp366
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L540:
 ; D:\TC\src\parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp409
	movq	%rax, 56(%rsp)	 ; variable, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r8	 ; %sfp, variable
	jmp	.L450	 ;
	.p2align 4,,10
	.p2align 3
.L553:
 ; D:\TC\src\parser.c:146:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp487, token
 ; D:\TC\src\parser.c:147:             token_ptr = token;
	jmp	.L392	 ;
.L545:
 ; D:\TC\src\parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp322
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L386	 ;
.L549:
 ; D:\TC\src\parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp370
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L420	 ;
.L542:
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp304
	movq	(%rbx), %rcx	 ; token_92->lexeme, token_92->lexeme
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp465
	jne	.L376	 ;,
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_92->type, _93
	jmp	.L375	 ;
.L555:
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	%r12, %r10	 ; token, token
	movq	%r15, %r12	 ; tmp423, tmp423
	movq	%rbx, %r15	 ; token, token
	movq	128(%rsp), %rbx	 ; %sfp, return_type
	cmpl	$5, 24(%r15)	 ;, token_236->type
	jne	.L433	 ;,
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp595
	movq	(%r15), %rcx	 ; token_236->lexeme, token_236->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp525
	je	.L433	 ;,
.L441:
 ; D:\TC\src\parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_254->type
 ; D:\TC\src\parser.c:240:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp526, token
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L436	 ;,
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp597
	movq	0(%rbp), %rcx	 ; token_254->lexeme, token_254->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp529
	je	.L436	 ;,
	movq	%r10, 128(%rsp)	 ; token, %sfp
	movq	%r12, %r15	 ; tmp423, tmp423
 ; D:\TC\src\parser.c:249:     bool have_return = false;
	xorl	%ebp, %ebp	 ; have_return
 ; D:\TC\src\parser.c:246:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:247:     ((parser))->in_function = true;
	movl	$257, %ecx	 ;,
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:246:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	 ; tmp530, %sfp
 ; D:\TC\src\parser.c:247:     ((parser))->in_function = true;
	movq	72(%rsp), %rax	 ; %sfp, parser
	movw	%cx, (%rax)	 ;, MEM <vector(2) char> [(char *)parser_72(D)]
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
	movq	72(%rsp), %r12	 ; %sfp, parser
	movq	%rbx, 152(%rsp)	 ; return_type, %sfp
	movq	%rax, %rbx	 ; token, token
	movq	%r10, 144(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L442	 ;
	.p2align 4,,10
	.p2align 3
.L444:
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:259:             have_return = true;
	cmpl	$5, 8(%rax)	 ;, statement_261->type
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	movq	%rax, %rdx	 ; statement,
 ; D:\TC\src\parser.c:259:             have_return = true;
	movl	$1, %ebx	 ;, tmp599
	cmove	%ebx, %ebp	 ; have_return,, tmp599, have_return
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	call	list_append	 ;
 ; D:\TC\src\parser.c:261:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp533, token
.L442:
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_262->type
	jne	.L446	 ;,
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_262->lexeme, token_262->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp534
	jne	.L557	 ;,
.L446:
 ; D:\TC\src\parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rsi, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:254:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L558	 ;,
 ; D:\TC\src\parser.c:256:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	je	.L444	 ;,
 ; D:\TC\src\parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	movq	%rax, 128(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	128(%rsp), %rax	 ; %sfp, statement
	jmp	.L444	 ;
.L436:
 ; D:\TC\src\parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;, tmp392
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L558:
 ; D:\TC\src\parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
	movq	%rax, 128(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	128(%rsp), %rax	 ; %sfp, statement
	jmp	.L444	 ;
.L426:
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp594
	movq	(%r15), %rcx	 ; token_228->lexeme, token_228->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp518
	je	.L428	 ;,
	jmp	.L427	 ;
.L543:
 ; D:\TC\src\parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp312
	movq	%rdi, %rcx	 ; import_name,
	xorl	%r9d, %r9d	 ;
	movl	$1, %edx	 ;,
	movq	(%rax), %r8	 ; name_void, name_void
	movq	64(%rsp), %rax	 ; %sfp, global_scope
	movq	%rax, 32(%rsp)	 ; global_scope,
	call	create_name	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	movq	%rax, %rcx	 ; tmp470, name
	jmp	.L380	 ;
.L557:
 ; D:\TC\src\parser.c:264:     ((parser))->in_function = false;
	movq	72(%rsp), %rax	 ; %sfp, parser
	xorl	%edx, %edx	 ;
	movq	%r15, %r12	 ; tmp423, tmp423
	movq	144(%rsp), %r10	 ; %sfp, token
	movq	%rbx, %r15	 ; token, token
	movq	152(%rsp), %rbx	 ; %sfp, return_type
	movw	%dx, (%rax)	 ;, MEM <vector(2) char> [(char *)parser_72(D)]
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	 ; have_return
	jne	.L447	 ;,
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp403
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rbx	 ; name_void, return_type
	je	.L447	 ;,
 ; D:\TC\src\parser.c:267:         parser_error("Method missing return statement", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp404
	movq	%r10, 128(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
.L447:
 ; D:\TC\src\parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%rsi, 32(%rsp)	 ; method_scope,
	movq	56(%rsp), %r9	 ; %sfp,
	movq	%rbx, %rdx	 ; return_type,
	movq	120(%rsp), %r8	 ; %sfp,
	movq	136(%rsp), %rcx	 ; %sfp,
	movq	%r10, 128(%rsp)	 ; token, %sfp
	call	create_method	 ;
 ; D:\TC\src\parser.c:296:             if (method == 0)
	movq	128(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; _273
 ; D:\TC\src\parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%rax, %rdx	 ; tmp535, _273
 ; D:\TC\src\parser.c:296:             if (method == 0)
	jne	.L448	 ;,
	jmp	.L420	 ;
	.p2align 4,,10
	.p2align 3
.L544:
 ; D:\TC\src\parser.c:116:         parser_error("Unknown function return type", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp321
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L386	 ;
.L548:
 ; D:\TC\src\parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp369
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L420	 ;
.L552:
 ; D:\TC\src\parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;,
	movq	%rax, 96(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	96(%rsp), %rax	 ; %sfp, statement
	jmp	.L405	 ;
.L376:
 ; D:\TC\src\parser.c:79:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$4, 24(%rax)	 ;, token_97->type
	jne	.L559	 ;,
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:85:         source = token_ptr->lexeme;
	movq	(%rax), %rsi	 ; token_97->lexeme, source
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp467, token
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rax), %eax	 ; token_100->type, _93
	jmp	.L375	 ;
.L554:
	movq	%r12, %r10	 ; token, token
	movq	128(%rsp), %rbx	 ; %sfp, return_type
	movq	%r15, %r12	 ; tmp423, tmp423
	jmp	.L441	 ;
.L402:
 ; D:\TC\src\parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp340
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L386	 ;
.L551:
 ; D:\TC\src\parser.c:176:     ((parser))->in_function = false;
	movq	72(%rsp), %rax	 ; %sfp, parser
	movq	%rdi, %r9	 ; token, token
	movq	104(%rsp), %r11	 ; %sfp, token
	movq	112(%rsp), %rdi	 ; %sfp, return_type
	movb	$0, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	 ; have_return
	jne	.L408	 ;,
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp349
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rdi	 ; name_void, return_type
	je	.L408	 ;,
 ; D:\TC\src\parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r9, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;, tmp350
	movq	%r11, 96(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	96(%rsp), %r11	 ; %sfp, token
.L408:
 ; D:\TC\src\parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rsi, 32(%rsp)	 ; function_scope,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%r15, %r9	 ; body,
	movq	%rdi, %rdx	 ; return_type,
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r11, 96(%rsp)	 ; token, %sfp
	call	create_function	 ;
 ; D:\TC\src\parser.c:47:             if (function == 0)
	movq	96(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _168
 ; D:\TC\src\parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rax, %r8	 ; tmp497, _168
 ; D:\TC\src\parser.c:47:             if (function == 0)
	jne	.L409	 ;,
	jmp	.L386	 ;
	.p2align 4,,10
	.p2align 3
.L559:
 ; D:\TC\src\parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp307
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L374	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
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

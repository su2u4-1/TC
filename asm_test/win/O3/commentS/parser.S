	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse parenthesized expression\0"
.LC1:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC2:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC3:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC4:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC5:
	.ascii "Unexpected token in primary expression\0"
	.align 8
.LC6:
	.ascii "Failed to parse expression primary\0"
	.text
	.p2align 4
	.def	parse_expression;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expression
parse_expression:
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$64, %rsp	 ;,
	.seh_stackalloc	64
	.seh_endprologue
 ; D:\TC\src\parser.c:685: Expression* parse_expression(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, %rsi	 ; tmp153, lexer
	movq	%rdx, %rbp	 ; tmp154, now_scope
	movq	%r8, %rdi	 ; tmp155, parser
 ; D:\TC\src\parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp156, token
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_15->type, _16
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	 ;, _16
	je	.L53	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	 ;, _16
	je	.L54	 ;,
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	 ;, _16
	je	.L55	 ;,
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _16
	je	.L56	 ;,
.L6:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _16
	je	.L10	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, _16
	je	.L12	 ;,
.L13:
 ; D:\TC\src\parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp150
	call	parser_error	 ;
.L16:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp151
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp173, _65
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L54:
 ; D:\TC\src\parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_15->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L3:
 ; D:\TC\src\parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rax, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
	movq	%rax, %r8	 ; tmp172, _63
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; _63
	je	.L16	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp174, _1
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
.L1:
 ; D:\TC\src\parser.c:695: }
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:\TC\src\parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_15->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:710:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L55:
 ; D:\TC\src\parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_15->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:716:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp124
	movq	(%rbx), %rcx	 ; token_15->lexeme, token_15->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp157
	jne	.L57	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movl	24(%rbx), %eax	 ; token_15->type, _24
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _24
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp127
	movq	(%rbx), %rcx	 ; token_15->lexeme, token_15->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp158
	jne	.L9	 ;,
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_15->type, prephitmp_64
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_64
	jne	.L20	 ;,
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp130
	movq	(%rbx), %rcx	 ; token_15->lexeme, token_15->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp159
	jne	.L58	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_15->type, prephitmp_64
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_64
	jne	.L20	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp138
	movq	(%rbx), %rcx	 ; token_15->lexeme, token_15->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp164
	jne	.L59	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_15->type, prephitmp_64
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_64
	jne	.L20	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp142
	movq	(%rbx), %rcx	 ; token_15->lexeme, token_15->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp167
	jne	.L21	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rbx), %eax	 ; token_15->type, prephitmp_64
.L20:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, prephitmp_64
	je	.L12	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	 ;, prephitmp_64
	jne	.L13	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp146
	movq	(%rbx), %rcx	 ; token_15->lexeme, token_15->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; tmp171
	je	.L13	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%rdi)	 ;, parser_6(D)->in_method
	je	.L13	 ;,
.L12:
 ; D:\TC\src\parser.c:759:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_variable_access	 ;
 ; D:\TC\src\parser.c:760:         if (variable_value == 0) {
	testq	%rax, %rax	 ; variable_value
	je	.L23	 ;,
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L57:
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_15->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:719:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_15->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:722:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L58:
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp160, token
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L60	 ;,
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_35->type, type
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp162, token
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L18	 ;,
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp135
	movq	(%r12), %rcx	 ; token_35->lexeme, token_35->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp163
	je	.L18	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L59:
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp165, token
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp166, prim_value
 ; D:\TC\src\parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L61	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp168, token
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp169, prim_value
 ; D:\TC\src\parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L62	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L3	 ;
.L18:
 ; D:\TC\src\parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC1(%rip), %rcx	 ;, tmp134
	call	parser_error	 ;
	jmp	.L16	 ;
.L23:
 ; D:\TC\src\parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp149
	call	parser_error	 ;
	jmp	.L16	 ;
.L60:
 ; D:\TC\src\parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp133
	call	parser_error	 ;
	jmp	.L16	 ;
.L61:
 ; D:\TC\src\parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp141
	call	parser_error	 ;
	jmp	.L16	 ;
.L62:
 ; D:\TC\src\parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp145
	call	parser_error	 ;
	jmp	.L16	 ;
	.seh_endproc
	.p2align 4
	.def	parse_primary;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_primary
parse_primary:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$72, %rsp	 ;,
	.seh_stackalloc	72
	.seh_endprologue
 ; D:\TC\src\parser.c:696: Primary* parse_primary(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, %rsi	 ; tmp149, lexer
	movq	%rdx, %rbp	 ; tmp150, now_scope
	movq	%r8, %rdi	 ; tmp151, parser
 ; D:\TC\src\parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp152, token
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_50->type, _1
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L113	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L114	 ;,
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L115	 ;,
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L116	 ;,
.L68:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	je	.L72	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L74	 ;,
.L75:
 ; D:\TC\src\parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp147
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L63	 ;
	.p2align 4,,10
	.p2align 3
.L114:
 ; D:\TC\src\parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L65:
 ; D:\TC\src\parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rax, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
.L63:
 ; D:\TC\src\parser.c:769: }
	addq	$72, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L113:
 ; D:\TC\src\parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:710:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L115:
 ; D:\TC\src\parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:716:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L116:
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp121
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp153
	jne	.L117	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movl	24(%rbx), %eax	 ; token_50->type, _6
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _6
	jne	.L68	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp124
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp154
	jne	.L71	 ;,
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_50->type, prephitmp_89
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_89
	jne	.L83	 ;,
	.p2align 4,,10
	.p2align 3
.L72:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp127
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp155
	jne	.L118	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_50->type, prephitmp_89
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_89
	jne	.L83	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp135
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp160
	jne	.L119	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_50->type, prephitmp_89
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_89
	jne	.L83	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp139
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp163
	jne	.L84	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rbx), %eax	 ; token_50->type, prephitmp_89
.L83:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, prephitmp_89
	je	.L74	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	 ;, prephitmp_89
	jne	.L75	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp143
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; tmp167
	je	.L75	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%rdi)	 ;, parser_59(D)->in_method
	je	.L75	 ;,
.L74:
 ; D:\TC\src\parser.c:759:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_variable_access	 ;
 ; D:\TC\src\parser.c:760:         if (variable_value == 0) {
	testq	%rax, %rax	 ; variable_value
	je	.L86	 ;,
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L117:
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:719:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:722:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L118:
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp156, token
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L120	 ;,
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	%rsi, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_63->type, type
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp158, token
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp132
	movq	(%rsi), %rcx	 ; token_63->lexeme, token_63->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp159
	je	.L81	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L119:
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp161, token
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp162, prim_value
 ; D:\TC\src\parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L121	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L84:
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp164, token
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp165, prim_value
 ; D:\TC\src\parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L122	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%eax, %eax	 ; variable_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L65	 ;
.L81:
 ; D:\TC\src\parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC1(%rip), %rcx	 ;, tmp131
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L63	 ;
.L86:
 ; D:\TC\src\parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp146
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L63	 ;
.L120:
 ; D:\TC\src\parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC0(%rip), %rcx	 ;, tmp130
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L63	 ;
.L121:
 ; D:\TC\src\parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp138
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L63	 ;
.L122:
 ; D:\TC\src\parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp142
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L63	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC7:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_expr_prec
parse_expr_prec:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp121, lexer
	movq	%rdx, %r12	 ; tmp122, expr_left
	movl	%r8d, %r14d	 ; tmp123, min_prec
	movq	%r9, %r13	 ; tmp124, now_scope
.L136:
 ; D:\TC\src\parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L124	 ;,
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
	je	.L124	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jl	.L124	 ;,
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
	je	.L138	 ;,
 ; D:\TC\src\parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp130, right
.L137:
 ; D:\TC\src\parser.c:664:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L127	 ;,
 ; D:\TC\src\parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_66->lexeme, token_ptr_66->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r15d	 ; tmp132, next_op
 ; D:\TC\src\parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r15d	 ;, next_op
	je	.L127	 ;,
	cmpl	%eax, %esi	 ; next_prec, op_prec
	jge	.L127	 ;,
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
	jne	.L137	 ;,
 ; D:\TC\src\parser.c:661:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L123	 ;
	.p2align 4,,10
	.p2align 3
.L127:
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%r12, %rdx	 ; expr_left,
	movq	%rbp, %r9	 ; right,
	xorl	%r8d, %r8d	 ;
	movl	%edi, %ecx	 ; op,
	call	create_expression	 ;
	movq	%rax, %r12	 ; tmp136, expr_left
	jmp	.L136	 ;
	.p2align 4,,10
	.p2align 3
.L124:
 ; D:\TC\src\parser.c:681:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L123:
 ; D:\TC\src\parser.c:684: }
	movq	%r12, %rax	 ; <retval>,
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
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp114
 ; D:\TC\src\parser.c:661:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	call	parser_error	 ;
	jmp	.L123	 ;
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC8:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC9:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC10:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC11:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC12:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC13:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC14:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC15:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC16:
	.ascii "Expected attribute name after '.'\0"
.LC17:
	.ascii "Unknown attribute name\0"
	.text
	.p2align 4
	.def	parse_variable_access;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_variable_access
parse_variable_access:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$72, %rsp	 ;,
	.seh_stackalloc	72
	.seh_endprologue
 ; D:\TC\src\parser.c:770: VariableAccess* parse_variable_access(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, %rbx	 ; tmp209, lexer
	movq	%rdx, %rsi	 ; tmp210, now_scope
	movq	%r8, %rdi	 ; tmp211, parser
 ; D:\TC\src\parser.c:774:     Token* token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp212, token
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_80->type, _1
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _1
	je	.L140	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L143	 ;,
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp152
	movq	0(%rbp), %rcx	 ; token_80->lexeme, token_80->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp213
	je	.L143	 ;,
.L140:
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	0(%rbp), %rdx	 ; token_80->lexeme, token_80->lexeme
	movq	%rsi, %rcx	 ; now_scope,
	call	search	 ;
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rbp	 ; tmp214, base_name
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	%rax, 56(%rsp)	 ; <retval>, %sfp
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	movq	56(%rsp), %r9	 ; %sfp, <retval>
	cmpl	$5, 24(%rax)	 ;, token_91->type
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp216, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	jne	.L139	 ;,
 ; D:\TC\src\parser.c:782:     Scope* var_scope = 0;
	xorl	%r12d, %r12d	 ; var_scope
 ; D:\TC\src\parser.c:780:     Name* current_type = 0;
	xorl	%r13d, %r13d	 ; current_type
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r12, %r15	 ; var_scope, var_scope
	movq	%r9, %r12	 ; <retval>, <retval>
.L171:
 ; D:\TC\src\parser.c:789:         if (base_name != 0) {
	testq	%rbp, %rbp	 ; base_name
	je	.L145	 ;,
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%rbp), %eax	 ; base_name_136->kind, _93
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %edx	 ;, tmp156
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %edx	 ;, tmp156
	jbe	.L174	 ;,
	cmpl	$5, %eax	 ;, _93
	jne	.L146	 ;,
.L174:
 ; D:\TC\src\parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%rbp), %r13	 ; base_name_136->info.type, current_type
.L145:
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%r15, %r15	 ; var_scope
	jne	.L148	 ;,
	testq	%r13, %r13	 ; current_type
	je	.L148	 ;,
 ; D:\TC\src\parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%r13)	 ;, current_type_51->kind
	jne	.L148	 ;,
 ; D:\TC\src\parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%r13), %r15	 ; current_type_51->info.scope, var_scope
.L148:
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp264
	movq	(%r14), %rcx	 ; token_ptr_150->lexeme, token_ptr_150->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp217
	jne	.L204	 ;,
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp267
	movq	(%r14), %rcx	 ; token_ptr_150->lexeme, token_ptr_150->lexeme
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp231
	je	.L162	 ;,
 ; D:\TC\src\parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rsi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movq	%rax, 56(%rsp)	 ; tmp232, %sfp
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp233, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L205	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rsi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp235, _158
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r14	 ; tmp236, _159
 ; D:\TC\src\parser.c:837:             if (index == 0)
	testq	%rax, %rax	 ; _159
	je	.L164	 ;,
.L165:
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_118->type
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movq	%rax, %r8	 ; tmp237, token
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp268
	movq	(%r8), %rcx	 ; token_118->lexeme, token_118->lexeme
	movq	%r8, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, token
	testb	%al, %al	 ; tmp238
	je	.L167	 ;,
 ; D:\TC\src\parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	%r12, %rdx	 ; <retval>,
	movq	%r14, %r9	 ; _159,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
	movq	%rax, %r12	 ; tmp239, <retval>
.L161:
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_147->type
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp244, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	je	.L171	 ;,
.L203:
	movq	%r12, %r9	 ; <retval>, <retval>
.L139:
 ; D:\TC\src\parser.c:873: }
	movq	%r9, %rax	 ; <retval>,
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
	.p2align 4,,10
	.p2align 3
.L162:
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp269
	movq	(%r14), %rcx	 ; token_ptr_150->lexeme, token_ptr_150->lexeme
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp240
	je	.L203	 ;,
 ; D:\TC\src\parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:849:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp241, token
 ; D:\TC\src\parser.c:851:             if (var_scope == 0) {
	testq	%r15, %r15	 ; var_scope
	je	.L206	 ;,
 ; D:\TC\src\parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_102->type
	jne	.L207	 ;,
 ; D:\TC\src\parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rdx	 ; token_102->lexeme, token_102->lexeme
	movq	%r15, %rcx	 ; var_scope,
	call	search	 ;
	movq	%rax, %rbp	 ; tmp242, base_name
 ; D:\TC\src\parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	 ; base_name
	je	.L208	 ;,
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%r12, %rdx	 ; <retval>,
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:866:             var_scope = 0;
	xorl	%r15d, %r15d	 ; var_scope
 ; D:\TC\src\parser.c:865:             current_type = 0;
	xorl	%r13d, %r13d	 ; current_type
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, %r12	 ; tmp243, <retval>
	jmp	.L161	 ;
	.p2align 4,,10
	.p2align 3
.L204:
 ; D:\TC\src\parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:804:             if (base_name == 0)
	testq	%rbp, %rbp	 ; base_name
	je	.L209	 ;,
.L150:
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movl	24(%rbp), %ecx	 ; base_name_136->kind, tmp265
	subl	$2, %ecx	 ;, tmp170
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %ecx	 ;, tmp170
	ja	.L210	 ;,
.L151:
 ; D:\TC\src\parser.c:809:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp219, token
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13	 ;, tmp203
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	movq	%rax, %r14	 ; tmp220, args
	.p2align 4,,10
	.p2align 3
.L152:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_49->type
	je	.L211	 ;,
.L160:
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rsi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp221, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L212	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rsi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp223, _151
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rdx	 ; tmp224, _152
 ; D:\TC\src\parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	 ; _152
	je	.L154	 ;,
.L155:
 ; D:\TC\src\parser.c:816:                 list_append(args, (pointer)arg);
	movq	%r14, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_140->type
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp225, token
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L156	 ;,
.L159:
 ; D:\TC\src\parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp175
	call	parser_error	 ;
.L142:
 ; D:\TC\src\parser.c:778:         return NULL;
	xorl	%r9d, %r9d	 ; <retval>
	jmp	.L139	 ;
	.p2align 4,,10
	.p2align 3
.L211:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_49->lexeme, token_49->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp229
	je	.L160	 ;,
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r14, 32(%rsp)	 ; args,
	movq	%r12, %rdx	 ; <retval>,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
 ; D:\TC\src\parser.c:830:             var_scope = 0;
	xorl	%r15d, %r15d	 ; var_scope
 ; D:\TC\src\parser.c:829:             current_type = 0;
	xorl	%r13d, %r13d	 ; current_type
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%rbp), %rbp	 ; base_name_136->info.type, base_name
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %r12	 ; tmp230, <retval>
	jmp	.L161	 ;
	.p2align 4,,10
	.p2align 3
.L156:
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp266
	movq	(%r15), %rcx	 ; token_140->lexeme, token_140->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp226
	jne	.L213	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_140->type
	jne	.L159	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%r15), %rcx	 ; token_140->lexeme, token_140->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp228
	jne	.L152	 ;,
	jmp	.L159	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp173
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp222, _154
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
.L154:
 ; D:\TC\src\parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp174
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _152
	jmp	.L155	 ;
	.p2align 4,,10
	.p2align 3
.L213:
 ; D:\TC\src\parser.c:820:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp227, token
 ; D:\TC\src\parser.c:821:                     token_ptr = token;
	jmp	.L152	 ;
	.p2align 4,,10
	.p2align 3
.L210:
 ; D:\TC\src\parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp172
	call	parser_error	 ;
	jmp	.L151	 ;
	.p2align 4,,10
	.p2align 3
.L143:
 ; D:\TC\src\parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp151
	call	parser_error	 ;
 ; D:\TC\src\parser.c:778:         return NULL;
	jmp	.L142	 ;
	.p2align 4,,10
	.p2align 3
.L146:
 ; D:\TC\src\parser.c:794:                 current_type = base_name;
	andl	$-5, %eax	 ;, _93
	cmove	%rbp, %r13	 ; current_type,, base_name, current_type
	jmp	.L145	 ;
.L205:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp188
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp234, _161
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
.L164:
 ; D:\TC\src\parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC13(%rip), %rcx	 ;, tmp189
	xorl	%r14d, %r14d	 ; _159
	call	parser_error	 ;
	jmp	.L165	 ;
	.p2align 4,,10
	.p2align 3
.L209:
 ; D:\TC\src\parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp169
	movq	%rax, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %rax	 ; %sfp, token
	jmp	.L150	 ;
.L167:
 ; D:\TC\src\parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%r8, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp190
	call	parser_error	 ;
 ; D:\TC\src\parser.c:843:                 return NULL;
	jmp	.L142	 ;
.L206:
 ; D:\TC\src\parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp197
	call	parser_error	 ;
 ; D:\TC\src\parser.c:853:                 return NULL;
	jmp	.L142	 ;
.L208:
 ; D:\TC\src\parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp200
	call	parser_error	 ;
 ; D:\TC\src\parser.c:862:                 return NULL;
	jmp	.L142	 ;
.L207:
 ; D:\TC\src\parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp198
	call	parser_error	 ;
 ; D:\TC\src\parser.c:857:                 return NULL;
	jmp	.L142	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC18:
	.ascii "Expected variable type\0"
	.align 8
.LC19:
	.ascii "Expected a type for variable declaration\0"
.LC20:
	.ascii "Unknown variable type\0"
.LC21:
	.ascii "Expected variable name\0"
	.align 8
.LC22:
	.ascii "Failed to parse variable initializer\0"
	.text
	.p2align 4
	.def	parse_variable;	.scl	3;	.type	32;	.endef
	.seh_proc	parse_variable
parse_variable:
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	.seh_endprologue
 ; D:\TC\src\parser.c:317: Variable* parse_variable(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, %rsi	 ; tmp123, lexer
	movq	%rdx, %rbp	 ; tmp124, now_scope
	movq	%r8, %r12	 ; tmp125, parser
 ; D:\TC\src\parser.c:323:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp126, token
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_26->type, _1
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L215	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L218	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rbx), %rcx	 ; token_26->lexeme, token_26->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp127
	je	.L218	 ;,
.L215:
 ; D:\TC\src\parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rdx	 ; token_26->lexeme, token_26->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search	 ;
	movq	%rax, %rdi	 ; tmp128, type
 ; D:\TC\src\parser.c:330:     if (type != 0) {
	testq	%rax, %rax	 ; type
	je	.L219	 ;,
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	 ;, type_31->kind
	jne	.L241	 ;,
.L220:
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_36->type
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp129, token
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	jne	.L242	 ;,
.L221:
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
	movq	%rax, %rbx	 ; tmp130, name
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_41->type
	je	.L243	 ;,
.L223:
 ; D:\TC\src\parser.c:341:     Expression* value = 0;
	xorl	%r8d, %r8d	 ; value
.L227:
 ; D:\TC\src\parser.c:353:     return create_variable(type, name, value);
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
 ; D:\TC\src\parser.c:354: }
	addq	$56, %rsp	 ;,
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
.L242:
 ; D:\TC\src\parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp115
	call	parser_error	 ;
	jmp	.L221	 ;
	.p2align 4,,10
	.p2align 3
.L218:
 ; D:\TC\src\parser.c:326:         parser_error("Expected variable type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp108
	call	parser_error	 ;
 ; D:\TC\src\parser.c:354: }
	xorl	%eax, %eax	 ;
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L241:
 ; D:\TC\src\parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp113
	call	parser_error	 ;
	jmp	.L220	 ;
	.p2align 4,,10
	.p2align 3
.L243:
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp117
	movq	(%rax), %rcx	 ; token_41->lexeme, token_41->lexeme
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp132
	je	.L223	 ;,
 ; D:\TC\src\parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp133, token
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp134, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L244	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp136, _54
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r8	 ; tmp137, value
 ; D:\TC\src\parser.c:350:         if (value == 0)
	testq	%rax, %rax	 ; value
	jne	.L227	 ;,
.L226:
 ; D:\TC\src\parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp121
	call	parser_error	 ;
	jmp	.L223	 ;
	.p2align 4,,10
	.p2align 3
.L219:
 ; D:\TC\src\parser.c:335:         parser_error("Unknown variable type", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp114
	call	parser_error	 ;
	jmp	.L220	 ;
.L244:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp120
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp135, _57
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
	jmp	.L226	 ;
	.seh_endproc
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
	.seh_proc	parse_statement
parse_statement:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$104, %rsp	 ;,
	.seh_stackalloc	104
	.seh_endprologue
 ; D:\TC\src\parser.c:355: Statement* parse_statement(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, %rbx	 ; tmp428, lexer
	movq	%rdx, %rdi	 ; tmp429, now_scope
	movq	%r8, %rsi	 ; tmp430, parser
 ; D:\TC\src\parser.c:361:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_47->type
 ; D:\TC\src\parser.c:361:     token = peek_current_token(lexer);
	movq	%rax, %rbp	 ; tmp431, token
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	je	.L425	 ;,
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp541, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L426	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rdi, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp543, _296
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r8	 ; tmp544, left_primary
.L340:
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%r8, 32(%rsp)	 ; left_primary,
.L424:
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp545, <retval>
.L332:
 ; D:\TC\src\parser.c:398:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:399:     if (statement == 0)
	testq	%rsi, %rsi	 ; <retval>
	je	.L427	 ;,
.L341:
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_90->type
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp547, token
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L342	 ;,
.L344:
 ; D:\TC\src\parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp409
	call	parser_error	 ;
.L245:
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
	.p2align 4,,10
	.p2align 3
.L342:
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp410
	movq	(%rbx), %rcx	 ; token_90->lexeme, token_90->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp548
	je	.L344	 ;,
	jmp	.L245	 ;
	.p2align 4,,10
	.p2align 3
.L425:
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp281
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp432
	jne	.L428	 ;,
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp332
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp480
	jne	.L429	 ;,
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp373
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp513
	jne	.L430	 ;,
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp393
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp529
	jne	.L431	 ;,
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp396
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp532
	je	.L333	 ;,
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
	movq	%rax, 32(%rsp)	 ; tmp533,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp534, <retval>
	jmp	.L332	 ;
	.p2align 4,,10
	.p2align 3
.L429:
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_192->type
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp481, token
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L286	 ;,
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp336
	movq	0(%rbp), %rcx	 ; token_192->lexeme, token_192->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp482
	je	.L286	 ;,
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_197->type
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp483, token
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L287	 ;,
.L290:
 ; D:\TC\src\parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp484, initializer
 ; D:\TC\src\parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	 ; initializer
	je	.L432	 ;,
.L289:
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp486, token
.L291:
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_204->type
	jne	.L294	 ;,
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14	 ;, tmp416
	movq	0(%rbp), %rcx	 ; token_204->lexeme, token_204->lexeme
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp487
	je	.L294	 ;,
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_209->type
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp488, token
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L295	 ;,
.L298:
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp489, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L433	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp492, _254
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp493, condition
 ; D:\TC\src\parser.c:549:         if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L300	 ;,
.L301:
 ; D:\TC\src\parser.c:551:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp494, token
.L299:
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_216->type
	jne	.L303	 ;,
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	0(%rbp), %rcx	 ; token_216->lexeme, token_216->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp495
	je	.L303	 ;,
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_221->type
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp496, token
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L304	 ;,
.L307:
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp497, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L434	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp500, _261
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:565:         if (increment == 0)
	testq	%rax, %rax	 ; increment
	je	.L309	 ;,
.L310:
 ; D:\TC\src\parser.c:567:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp502, token
.L308:
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_228->type
	jne	.L312	 ;,
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp362
	movq	0(%rbp), %rcx	 ; token_228->lexeme, token_228->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	 ; tmp503
	je	.L312	 ;,
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_233->type
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp504, token
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L314	 ;,
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp366
	movq	0(%rbp), %rcx	 ; token_233->lexeme, token_233->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp505
	je	.L314	 ;,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%rsi)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	movq	%rax, %r14	 ; tmp506, body
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp414
	movq	%r13, %rdx	 ; condition, condition
	movq	%rax, %r13	 ; token, token
	movq	%rdx, %r15	 ; condition, condition
	movq	%rbp, %rax	 ; tmp414, tmp414
	movq	%rsi, %rbp	 ; parser, parser
	movq	%rbx, %rsi	 ; lexer, lexer
	movq	%r12, %rbx	 ; initializer, initializer
	movq	%rax, %r12	 ; tmp414, tmp414
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L315	 ;
	.p2align 4,,10
	.p2align 3
.L316:
 ; D:\TC\src\parser.c:590:         list_append(body, (pointer)statement);
	movq	%rax, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:591:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp509, token
.L315:
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_241->type
	jne	.L317	 ;,
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_241->lexeme, token_241->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp510
	jne	.L435	 ;,
.L317:
 ; D:\TC\src\parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:588:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L316	 ;,
 ; D:\TC\src\parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
	movq	%rax, 64(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	64(%rsp), %rax	 ; %sfp, statement
	jmp	.L316	 ;
	.p2align 4,,10
	.p2align 3
.L427:
 ; D:\TC\src\parser.c:400:         parser_error("Failed to parse statement", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp408
	call	parser_error	 ;
	jmp	.L341	 ;
	.p2align 4,,10
	.p2align 3
.L428:
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_93->type
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp433, token
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L250	 ;,
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r15	 ;, tmp418
	movq	(%rax), %rcx	 ; token_93->lexeme, token_93->lexeme
	movq	(%r15), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp434
	je	.L250	 ;,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp435, token
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp436, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L436	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp438, _180
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp439, _31
 ; D:\TC\src\parser.c:422:     if (condition == 0)
	testq	%rax, %rax	 ; _31
	je	.L252	 ;,
.L253:
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_100->type
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp440, token
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L255	 ;,
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp598
	movq	0(%rbp), %rcx	 ; token_100->lexeme, token_100->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp441
	je	.L255	 ;,
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_105->type
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp442, token
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L257	 ;,
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp599
	movq	0(%rbp), %rcx	 ; token_105->lexeme, token_105->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp443
	je	.L257	 ;,
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	movq	%rax, %r14	 ; tmp444, body
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r13, 56(%rsp)	 ; _31, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp414
	movq	%rax, %r13	 ; token, token
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L258	 ;
	.p2align 4,,10
	.p2align 3
.L259:
 ; D:\TC\src\parser.c:443:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r14, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp447, token
.L258:
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_113->type
	jne	.L260	 ;,
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_113->lexeme, token_113->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp448
	jne	.L437	 ;,
.L260:
 ; D:\TC\src\parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp446, statement
 ; D:\TC\src\parser.c:441:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L259	 ;,
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC27(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L259	 ;
	.p2align 4,,10
	.p2align 3
.L250:
 ; D:\TC\src\parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp284
	call	parser_error	 ;
.L249:
 ; D:\TC\src\parser.c:417:         return NULL;
	xorl	%edx, %edx	 ; _176
.L262:
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp479, <retval>
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L245	 ;
	.p2align 4,,10
	.p2align 3
.L426:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	movq	%rax, 56(%rsp)	 ; left_primary, %sfp
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp407
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp542, _299
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
	movq	56(%rsp), %r8	 ; %sfp, left_primary
	jmp	.L340	 ;
	.p2align 4,,10
	.p2align 3
.L430:
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_266->type
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp514, token
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L321	 ;,
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp377
	movq	0(%rbp), %rcx	 ; token_266->lexeme, token_266->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp515
	je	.L321	 ;,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp516, token
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp517, condition
 ; D:\TC\src\parser.c:612:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	je	.L438	 ;,
.L322:
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_273->type
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp518, token
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L325	 ;,
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp382
	movq	0(%rbp), %rcx	 ; token_273->lexeme, token_273->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp519
	je	.L325	 ;,
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_278->type
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp520, token
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L327	 ;,
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp386
	movq	0(%rbp), %rcx	 ; token_278->lexeme, token_278->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp521
	je	.L327	 ;,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%rsi)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	movq	%rax, %r13	 ; tmp522, body
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp414
	movq	%rax, %r15	 ; tmp523, token
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L328	 ;
	.p2align 4,,10
	.p2align 3
.L329:
 ; D:\TC\src\parser.c:634:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r13, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:635:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp525, token
.L328:
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_286->type
	jne	.L330	 ;,
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r15), %rcx	 ; token_286->lexeme, token_286->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp526
	jne	.L439	 ;,
.L330:
 ; D:\TC\src\parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp524, statement
 ; D:\TC\src\parser.c:632:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L329	 ;,
 ; D:\TC\src\parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L329	 ;
	.p2align 4,,10
	.p2align 3
.L431:
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
	movq	%rax, 40(%rsp)	 ; tmp530,
	movl	$1, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp531, <retval>
	jmp	.L332	 ;
	.p2align 4,,10
	.p2align 3
.L255:
 ; D:\TC\src\parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp290
	call	parser_error	 ;
 ; D:\TC\src\parser.c:428:         return NULL;
	jmp	.L249	 ;
	.p2align 4,,10
	.p2align 3
.L286:
 ; D:\TC\src\parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp335
	call	parser_error	 ;
.L285:
 ; D:\TC\src\parser.c:526:         return NULL;
	xorl	%r9d, %r9d	 ; _250
.L293:
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp512, <retval>
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L245	 ;
	.p2align 4,,10
	.p2align 3
.L321:
 ; D:\TC\src\parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp376
	call	parser_error	 ;
.L320:
 ; D:\TC\src\parser.c:607:         return NULL;
	xorl	%r8d, %r8d	 ; _292
.L324:
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp528, <retval>
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L245	 ;
.L436:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp288
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp437, _183
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
.L252:
 ; D:\TC\src\parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp289
	xorl	%r13d, %r13d	 ; _31
	call	parser_error	 ;
	jmp	.L253	 ;
	.p2align 4,,10
	.p2align 3
.L333:
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp399
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp535
	je	.L334	 ;,
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rsi)	 ;, parser_49(D)->in_loop
	je	.L440	 ;,
 ; D:\TC\src\parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp536, <retval>
	jmp	.L332	 ;
	.p2align 4,,10
	.p2align 3
.L294:
 ; D:\TC\src\parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp343
	call	parser_error	 ;
 ; D:\TC\src\parser.c:542:         return NULL;
	jmp	.L285	 ;
.L257:
 ; D:\TC\src\parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp294
	call	parser_error	 ;
 ; D:\TC\src\parser.c:434:         return NULL;
	jmp	.L249	 ;
.L437:
 ; D:\TC\src\parser.c:447:     list(ElseIf*) else_if = create_list();
	movq	56(%rsp), %r13	 ; %sfp, _31
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp449, %sfp
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	movq	%rax, 72(%rsp)	 ; tmp450, %sfp
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_121->type
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp451, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	jne	.L275	 ;,
	movq	%r13, 80(%rsp)	 ; _31, %sfp
	movq	%r14, 88(%rsp)	 ; body, %sfp
	.p2align 4,,10
	.p2align 3
.L261:
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp602
	movq	(%r12), %rcx	 ; token_ptr_348->lexeme, token_ptr_348->lexeme
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp471
	je	.L441	 ;,
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
	movq	%rax, %r12	 ; tmp453, token
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L264	 ;,
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r15), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rax), %rcx	 ; token_122->lexeme, token_122->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp454
	je	.L264	 ;,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp455, token
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp456, left_primary
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; left_primary
	je	.L442	 ;,
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp458, _187
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp459, _13
 ; D:\TC\src\parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	 ; _13
	je	.L266	 ;,
.L267:
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_130->type
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp460, token
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L269	 ;,
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp600
	movq	(%r12), %rcx	 ; token_130->lexeme, token_130->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp461
	je	.L269	 ;,
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_136->type
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp462, token
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L271	 ;,
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp601
	movq	(%r12), %rcx	 ; token_136->lexeme, token_136->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp463
	je	.L271	 ;,
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	movq	%rax, %r12	 ; tmp464, elif_body
 ; D:\TC\src\parser.c:478:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r13, 56(%rsp)	 ; _13, %sfp
	movq	%rax, %r13	 ; token, token
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L272	 ;
	.p2align 4,,10
	.p2align 3
.L273:
 ; D:\TC\src\parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%r12, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:485:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp467, token
.L272:
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_145->type
	jne	.L274	 ;,
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_145->lexeme, token_145->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp468
	jne	.L443	 ;,
.L274:
 ; D:\TC\src\parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp466, statement
 ; D:\TC\src\parser.c:482:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L273	 ;,
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC32(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L273	 ;
	.p2align 4,,10
	.p2align 3
.L443:
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %r13	 ; %sfp, _13
	movq	%r12, %rdx	 ; elif_body,
	movq	%r13, %rcx	 ; _13,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp469, _151
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp470, token_ptr
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	je	.L261	 ;,
	movq	80(%rsp), %r13	 ; %sfp, _31
	movq	88(%rsp), %r14	 ; %sfp, body
.L275:
 ; D:\TC\src\parser.c:512:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%r14, %rdx	 ; body,
	movq	%r13, %rcx	 ; _31,
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp452, _176
	jmp	.L262	 ;
.L442:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp306
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp457, _190
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
.L266:
 ; D:\TC\src\parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;,
	xorl	%r13d, %r13d	 ; _13
	call	parser_error	 ;
	jmp	.L267	 ;
.L287:
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp339
	movq	0(%rbp), %rcx	 ; token_197->lexeme, token_197->lexeme
 ; D:\TC\src\parser.c:530:     Variable* initializer = 0;
	xorl	%r12d, %r12d	 ; initializer
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp485
	jne	.L291	 ;,
	jmp	.L290	 ;
.L325:
 ; D:\TC\src\parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp381
	call	parser_error	 ;
 ; D:\TC\src\parser.c:618:         return NULL;
	jmp	.L320	 ;
.L303:
 ; D:\TC\src\parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp352
	call	parser_error	 ;
 ; D:\TC\src\parser.c:558:         return NULL;
	jmp	.L285	 ;
.L334:
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp403
	movq	0(%rbp), %rcx	 ; token_47->lexeme, token_47->lexeme
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp537
	je	.L337	 ;,
 ; D:\TC\src\parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rsi)	 ;, parser_49(D)->in_loop
	je	.L444	 ;,
 ; D:\TC\src\parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$7, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rsi	 ; tmp538, <retval>
	jmp	.L332	 ;
.L295:
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_209->lexeme, token_209->lexeme
 ; D:\TC\src\parser.c:546:     Expression* condition = 0;
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp490
	jne	.L299	 ;,
	jmp	.L298	 ;
.L327:
 ; D:\TC\src\parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp385
	call	parser_error	 ;
 ; D:\TC\src\parser.c:624:         return NULL;
	jmp	.L320	 ;
.L439:
 ; D:\TC\src\parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%rsi)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:639:     return create_while(condition, body);
	movq	%r13, %rdx	 ; body,
	movq	%r14, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp527, _292
	jmp	.L324	 ;
.L432:
 ; D:\TC\src\parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp342
	call	parser_error	 ;
	jmp	.L289	 ;
.L312:
 ; D:\TC\src\parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp361
	call	parser_error	 ;
 ; D:\TC\src\parser.c:574:         return NULL;
	jmp	.L285	 ;
.L438:
 ; D:\TC\src\parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp380
	call	parser_error	 ;
	jmp	.L322	 ;
.L264:
 ; D:\TC\src\parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp302
	call	parser_error	 ;
 ; D:\TC\src\parser.c:458:             return NULL;
	jmp	.L249	 ;
.L269:
 ; D:\TC\src\parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp308
	call	parser_error	 ;
 ; D:\TC\src\parser.c:469:             return NULL;
	jmp	.L249	 ;
.L271:
 ; D:\TC\src\parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp312
	call	parser_error	 ;
 ; D:\TC\src\parser.c:475:             return NULL;
	jmp	.L249	 ;
.L304:
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp356
	movq	0(%rbp), %rcx	 ; token_221->lexeme, token_221->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp498
	je	.L307	 ;,
 ; D:\TC\src\parser.c:562:     Expression* increment = 0;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L308	 ;
.L440:
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp402
 ; D:\TC\src\parser.c:383:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	call	parser_error	 ;
	jmp	.L245	 ;
.L433:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp350
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp491, _257
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
.L300:
 ; D:\TC\src\parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp351
	xorl	%r13d, %r13d	 ; condition
	call	parser_error	 ;
	jmp	.L301	 ;
.L337:
 ; D:\TC\src\parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	$0, 40(%rsp)	 ;,
	movq	%rax, 32(%rsp)	 ; tmp539,
	jmp	.L424	 ;
.L435:
 ; D:\TC\src\parser.c:594:     ((parser))->in_loop = false;
	movb	$0, 2(%rbp)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%r14, %r9	 ; body,
	movq	%r15, %rdx	 ; condition,
	movq	%rbx, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp511, _250
	jmp	.L293	 ;
.L314:
 ; D:\TC\src\parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp365
	call	parser_error	 ;
 ; D:\TC\src\parser.c:580:         return NULL;
	jmp	.L285	 ;
.L441:
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%r12)	 ;, token_ptr_348->type
	movq	80(%rsp), %r13	 ; %sfp, _31
	movq	88(%rsp), %r14	 ; %sfp, body
	jne	.L275	 ;,
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp323
	movq	(%r12), %rcx	 ; token_ptr_348->lexeme, token_ptr_348->lexeme
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp472
	je	.L275	 ;,
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
	movq	%rax, %r12	 ; tmp473, token
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L278	 ;,
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp603
	movq	(%r12), %rcx	 ; token_163->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp474
	je	.L278	 ;,
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %r12	 ;, tmp420
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp475, token
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L279	 ;
	.p2align 4,,10
	.p2align 3
.L280:
 ; D:\TC\src\parser.c:507:             list_append(else_body, (pointer)statement);
	movq	72(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:508:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp477, token
.L279:
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_170->type
	jne	.L281	 ;,
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r15), %rcx	 ; token_170->lexeme, token_170->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp478
	jne	.L275	 ;,
.L281:
 ; D:\TC\src\parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:505:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L280	 ;,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%r15, %rdx	 ; token,
	movq	%r12, %rcx	 ; tmp420,
	movq	%rax, 56(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %rax	 ; %sfp, statement
	jmp	.L280	 ;
.L434:
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rcx	 ;, tmp359
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp499, _264
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
.L309:
 ; D:\TC\src\parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp360
	call	parser_error	 ;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L310	 ;
.L444:
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp406
 ; D:\TC\src\parser.c:383:                 return NULL;
	xorl	%esi, %esi	 ; <retval>
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	call	parser_error	 ;
	jmp	.L245	 ;
.L278:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp326
	call	parser_error	 ;
 ; D:\TC\src\parser.c:499:             return NULL;
	jmp	.L249	 ;
	.seh_endproc
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
	.seh_proc	parse_code
parse_code:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
	pushq	%r12	 ;
	.seh_pushreg	%r12
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$168, %rsp	 ;,
	.seh_stackalloc	168
	.seh_endprologue
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp421
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
 ; D:\TC\src\parser.c:19: Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%r8, 72(%rsp)	 ; tmp452, %sfp
	movq	%rcx, %rdi	 ; tmp450, lexer
	movq	%rdx, %rbx	 ; tmp451, now_scope
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	je	.L610	 ;,
.L446:
 ; D:\TC\src\parser.c:31:     if (now_scope == 0)
	testq	%rbx, %rbx	 ; now_scope
	je	.L611	 ;,
.L447:
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
	je	.L534	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %r13	 ;, tmp449
	movq	%rax, %r11	 ; token, token
	movq	%rdi, %r14	 ; lexer, lexer
	jmp	.L448	 ;
	.p2align 4,,10
	.p2align 3
.L488:
 ; D:\TC\src\parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC88(%rip), %rcx	 ;, tmp419
	call	parser_error	 ;
.L460:
 ; D:\TC\src\parser.c:57:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r11	 ; tmp547, token
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L534	 ;,
.L448:
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movl	24(%r11), %eax	 ; token_379->type, _31
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _31
	je	.L534	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _31
	jne	.L488	 ;,
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
	jne	.L612	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_379->type
	jne	.L488	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp585
	movq	(%r11), %rcx	 ; token_379->lexeme, token_379->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp473
	jne	.L613	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_379->type
	jne	.L488	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	(%r11), %rcx	 ; token_379->lexeme, token_379->lexeme
	movq	0(%r13), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp499
	je	.L488	 ;,
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
	jne	.L614	 ;,
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
	jne	.L492	 ;,
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp590
	movq	(%rbx), %rcx	 ; token_177->lexeme, token_177->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp504
	je	.L492	 ;,
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
	jmp	.L493	 ;
	.p2align 4,,10
	.p2align 3
.L531:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_165
	je	.L615	 ;,
.L494:
 ; D:\TC\src\parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%r10, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp414
	call	parser_error	 ;
.L527:
 ; D:\TC\src\parser.c:312:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r10	 ; tmp543, token
.L493:
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	 ; token_184->type, prephitmp_165
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_165
	jne	.L531	 ;,
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%r10), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp544
	jne	.L532	 ;,
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	movl	24(%r10), %eax	 ; token_184->type, prephitmp_165
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_165
	jne	.L494	 ;,
.L615:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp591
	movq	(%r10), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp507
	jne	.L616	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	 ;, token_184->type
	jne	.L494	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	(%r10), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	(%rdi), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp537
	je	.L494	 ;,
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
	je	.L617	 ;,
.L528:
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
	je	.L529	 ;,
.L530:
 ; D:\TC\src\parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp410
	call	parser_error	 ;
	jmp	.L527	 ;
	.p2align 4,,10
	.p2align 3
.L534:
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
.L612:
 ; D:\TC\src\parser.c:68:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_89->type
	jne	.L618	 ;,
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
	je	.L619	 ;,
.L453:
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _93
	jne	.L457	 ;,
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp309
	movq	(%rbx), %rcx	 ; token_101->lexeme, token_101->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp468
	je	.L457	 ;,
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
	je	.L620	 ;,
.L458:
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
	je	.L452	 ;,
.L459:
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
	jmp	.L460	 ;
	.p2align 4,,10
	.p2align 3
.L613:
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
	je	.L462	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _115
	jne	.L465	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%rbp), %rcx	 ; token_114->lexeme, token_114->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp476
	je	.L465	 ;,
.L462:
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
	je	.L621	 ;,
 ; D:\TC\src\parser.c:119:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_120->type
	jne	.L622	 ;,
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
	jne	.L469	 ;,
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp325
	movq	0(%rbp), %rcx	 ; token_124->lexeme, token_124->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp481
	je	.L469	 ;,
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
.L470:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_132->type
	je	.L623	 ;,
.L478:
 ; D:\TC\src\parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	je	.L624	 ;,
 ; D:\TC\src\parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_131->value
	je	.L473	 ;,
 ; D:\TC\src\parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp329
	call	parser_error	 ;
.L472:
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_134->type
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp485, token
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L474	 ;,
.L477:
 ; D:\TC\src\parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp330
	movq	%rbx, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L464:
 ; D:\TC\src\parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp351
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _168
.L487:
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
	jmp	.L460	 ;
	.p2align 4,,10
	.p2align 3
.L492:
 ; D:\TC\src\parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp357
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L490:
 ; D:\TC\src\parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp418
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _208
.L533:
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
	jmp	.L460	 ;
	.p2align 4,,10
	.p2align 3
.L616:
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
	je	.L496	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _214
	jne	.L499	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%r15), %rcx	 ; token_213->lexeme, token_213->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp511
	je	.L499	 ;,
.L496:
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
	je	.L625	 ;,
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_219->type
	jne	.L626	 ;,
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
	jne	.L503	 ;,
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp373
	movq	(%r15), %rcx	 ; token_223->lexeme, token_223->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp516
	je	.L503	 ;,
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
	je	.L504	 ;,
.L506:
 ; D:\TC\src\parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp376
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L505:
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
.L507:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_236->type
	je	.L627	 ;,
.L609:
	movq	%r12, %r10	 ; token, token
	movq	%r15, %r12	 ; tmp423, tmp423
	movq	%rbx, %r15	 ; token, token
.L511:
 ; D:\TC\src\parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp383
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L498	 ;
	.p2align 4,,10
	.p2align 3
.L611:
 ; D:\TC\src\parser.c:32:         now_scope = builtin_scope;
	movq	(%rsi), %rbx	 ; builtin_scope, now_scope
	jmp	.L447	 ;
	.p2align 4,,10
	.p2align 3
.L532:
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
	jne	.L533	 ;,
	jmp	.L490	 ;
	.p2align 4,,10
	.p2align 3
.L529:
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp411
	movq	(%rbx), %rcx	 ; token_198->lexeme, token_198->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp542
	je	.L530	 ;,
	jmp	.L527	 ;
	.p2align 4,,10
	.p2align 3
.L614:
 ; D:\TC\src\parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC69(%rip), %rcx	 ;, tmp355
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L490	 ;
	.p2align 4,,10
	.p2align 3
.L618:
 ; D:\TC\src\parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp303
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L452:
 ; D:\TC\src\parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	%r11, %rdx	 ; token,
	leaq	.LC56(%rip), %rcx	 ;, tmp314
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _111
	jmp	.L459	 ;
	.p2align 4,,10
	.p2align 3
.L457:
 ; D:\TC\src\parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp308
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L452	 ;
	.p2align 4,,10
	.p2align 3
.L469:
 ; D:\TC\src\parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp324
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L464	 ;
	.p2align 4,,10
	.p2align 3
.L503:
 ; D:\TC\src\parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp372
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L498:
 ; D:\TC\src\parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%r10, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp405
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _273
.L526:
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
	jmp	.L527	 ;
	.p2align 4,,10
	.p2align 3
.L623:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_132->lexeme, token_132->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp489
	je	.L478	 ;,
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
	jne	.L480	 ;,
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp341
	movq	(%r12), %rcx	 ; token_149->lexeme, token_149->lexeme
	movq	%r11, 96(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp491
	je	.L480	 ;,
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
	jmp	.L481	 ;
	.p2align 4,,10
	.p2align 3
.L483:
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
.L481:
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_157->type
	jne	.L485	 ;,
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rdi), %rcx	 ; token_157->lexeme, token_157->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp496
	jne	.L628	 ;,
.L485:
 ; D:\TC\src\parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rsi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:166:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L629	 ;,
 ; D:\TC\src\parser.c:168:         else if (have_return)
	testb	%bl, %bl	 ; have_return
	je	.L483	 ;,
 ; D:\TC\src\parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	movq	%rax, 96(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	96(%rsp), %rax	 ; %sfp, statement
	jmp	.L483	 ;
	.p2align 4,,10
	.p2align 3
.L473:
 ; D:\TC\src\parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L472	 ;
	.p2align 4,,10
	.p2align 3
.L474:
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%r15), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_134->lexeme, token_134->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp486
	jne	.L630	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_134->type
	jne	.L477	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rdi), %rcx	 ; token_134->lexeme, token_134->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp488
	jne	.L470	 ;,
	jmp	.L477	 ;
	.p2align 4,,10
	.p2align 3
.L627:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp596
	movq	(%rbx), %rcx	 ; token_236->lexeme, token_236->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp528
	jne	.L631	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_236->type
	jne	.L609	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_236->lexeme, token_236->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp522
	je	.L632	 ;,
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
	je	.L633	 ;,
 ; D:\TC\src\parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_242->value
	je	.L517	 ;,
 ; D:\TC\src\parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;,
	call	parser_error	 ;
.L516:
 ; D:\TC\src\parser.c:237:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp527, token
	jmp	.L507	 ;
	.p2align 4,,10
	.p2align 3
.L517:
 ; D:\TC\src\parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	120(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L516	 ;
	.p2align 4,,10
	.p2align 3
.L624:
 ; D:\TC\src\parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp328
	call	parser_error	 ;
	jmp	.L472	 ;
	.p2align 4,,10
	.p2align 3
.L633:
 ; D:\TC\src\parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp387
	call	parser_error	 ;
	jmp	.L516	 ;
	.p2align 4,,10
	.p2align 3
.L610:
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
	jmp	.L446	 ;
	.p2align 4,,10
	.p2align 3
.L465:
 ; D:\TC\src\parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp318
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L464	 ;
	.p2align 4,,10
	.p2align 3
.L499:
 ; D:\TC\src\parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp366
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L498	 ;
	.p2align 4,,10
	.p2align 3
.L617:
 ; D:\TC\src\parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp409
	movq	%rax, 56(%rsp)	 ; variable, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r8	 ; %sfp, variable
	jmp	.L528	 ;
	.p2align 4,,10
	.p2align 3
.L630:
 ; D:\TC\src\parser.c:146:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp487, token
 ; D:\TC\src\parser.c:147:             token_ptr = token;
	jmp	.L470	 ;
.L622:
 ; D:\TC\src\parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp322
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L464	 ;
.L626:
 ; D:\TC\src\parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp370
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L498	 ;
.L619:
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp304
	movq	(%rbx), %rcx	 ; token_92->lexeme, token_92->lexeme
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp465
	jne	.L454	 ;,
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_92->type, _93
	jmp	.L453	 ;
.L632:
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	%r12, %r10	 ; token, token
	movq	%r15, %r12	 ; tmp423, tmp423
	movq	%rbx, %r15	 ; token, token
	movq	128(%rsp), %rbx	 ; %sfp, return_type
	cmpl	$5, 24(%r15)	 ;, token_236->type
	jne	.L511	 ;,
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp595
	movq	(%r15), %rcx	 ; token_236->lexeme, token_236->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp525
	je	.L511	 ;,
.L519:
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
	jne	.L514	 ;,
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp597
	movq	0(%rbp), %rcx	 ; token_254->lexeme, token_254->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp529
	je	.L514	 ;,
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
	jmp	.L520	 ;
	.p2align 4,,10
	.p2align 3
.L522:
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
.L520:
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_262->type
	jne	.L524	 ;,
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_262->lexeme, token_262->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp534
	jne	.L634	 ;,
.L524:
 ; D:\TC\src\parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rsi, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:254:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L635	 ;,
 ; D:\TC\src\parser.c:256:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	je	.L522	 ;,
 ; D:\TC\src\parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
	movq	%rax, 128(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	128(%rsp), %rax	 ; %sfp, statement
	jmp	.L522	 ;
.L514:
 ; D:\TC\src\parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;, tmp392
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L498	 ;
	.p2align 4,,10
	.p2align 3
.L635:
 ; D:\TC\src\parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;,
	movq	%rax, 128(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	128(%rsp), %rax	 ; %sfp, statement
	jmp	.L522	 ;
.L504:
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp594
	movq	(%r15), %rcx	 ; token_228->lexeme, token_228->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp518
	je	.L506	 ;,
	jmp	.L505	 ;
.L620:
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
	jmp	.L458	 ;
.L634:
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
	jne	.L525	 ;,
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp403
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rbx	 ; name_void, return_type
	je	.L525	 ;,
 ; D:\TC\src\parser.c:267:         parser_error("Method missing return statement", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp404
	movq	%r10, 128(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
.L525:
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
	jne	.L526	 ;,
	jmp	.L498	 ;
	.p2align 4,,10
	.p2align 3
.L621:
 ; D:\TC\src\parser.c:116:         parser_error("Unknown function return type", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp321
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L464	 ;
.L625:
 ; D:\TC\src\parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp369
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L498	 ;
.L629:
 ; D:\TC\src\parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;,
	movq	%rax, 96(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	96(%rsp), %rax	 ; %sfp, statement
	jmp	.L483	 ;
.L454:
 ; D:\TC\src\parser.c:79:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$4, 24(%rax)	 ;, token_97->type
	jne	.L636	 ;,
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
	jmp	.L453	 ;
.L631:
	movq	%r12, %r10	 ; token, token
	movq	128(%rsp), %rbx	 ; %sfp, return_type
	movq	%r15, %r12	 ; tmp423, tmp423
	jmp	.L519	 ;
.L480:
 ; D:\TC\src\parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp340
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L464	 ;
.L628:
 ; D:\TC\src\parser.c:176:     ((parser))->in_function = false;
	movq	72(%rsp), %rax	 ; %sfp, parser
	movq	%rdi, %r9	 ; token, token
	movq	104(%rsp), %r11	 ; %sfp, token
	movq	112(%rsp), %rdi	 ; %sfp, return_type
	movb	$0, (%rax)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	 ; have_return
	jne	.L486	 ;,
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp349
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rdi	 ; name_void, return_type
	je	.L486	 ;,
 ; D:\TC\src\parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r9, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;, tmp350
	movq	%r11, 96(%rsp)	 ; token, %sfp
	call	parser_error	 ;
	movq	96(%rsp), %r11	 ; %sfp, token
.L486:
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
	jne	.L487	 ;,
	jmp	.L464	 ;
	.p2align 4,,10
	.p2align 3
.L636:
 ; D:\TC\src\parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp307
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L452	 ;
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.ASSIGN_SYMBOL, "dr"
	.globl	.refptr.ASSIGN_SYMBOL
	.linkonce	discard
.refptr.ASSIGN_SYMBOL:
	.quad	ASSIGN_SYMBOL
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

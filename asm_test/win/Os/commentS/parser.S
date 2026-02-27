	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "Failed to parse expression primary\0"
	.text
	.def	parse_expression;	.scl	3;	.type	32;	.endef
parse_expression:
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp92, parser
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp91, now_scope
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp90, lexer
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %rbx	 ; tmp93, <retval>
 ; D:\TC\src\parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	 ; <retval>
	jne	.L2	 ;,
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rsi, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC0(%rip), %rcx	 ;, tmp88
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rdx	 ; tmp94, _15
 ; D:\TC\src\parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error	 ;
	jmp	.L1	 ;
.L2:
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; <retval>,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp95, _1
 ; D:\TC\src\parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbx	 ; tmp96, <retval>
.L1:
 ; D:\TC\src\parser.c:695: }
	addq	$56, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.section .rdata,"dr"
.LC1:
	.ascii "Expected variable type\0"
.LC2:
	.ascii "Expected a type for variable declaration\0"
.LC3:
	.ascii "Unknown variable type\0"
.LC4:
	.ascii "Expected variable name\0"
.LC5:
	.ascii "Failed to parse variable initializer\0"
	.text
	.def	parse_variable;	.scl	3;	.type	32;	.endef
parse_variable:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp116, parser
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp115, now_scope
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp114, lexer
	subq	$72, %rsp	 ;,
 ; D:\TC\src\parser.c:323:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp117, token
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_26->type, _1
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L7	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L10	 ;,
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rsi), %rcx	 ; token_26->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp118
	je	.L10	 ;,
.L7:
 ; D:\TC\src\parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	(%rsi), %rdx	 ; token_26->lexeme,
	movq	%rbp, %rcx	 ; now_scope,
	call	search	 ;
	movq	%rax, %rdi	 ; tmp119, type
 ; D:\TC\src\parser.c:330:     if (type != 0) {
	testq	%rax, %rax	 ; type
	je	.L11	 ;,
 ; D:\TC\src\parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp108
 ; D:\TC\src\parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	 ;, type_31->kind
	je	.L12	 ;,
	jmp	.L32	 ;
.L11:
 ; D:\TC\src\parser.c:335:         parser_error("Unknown variable type", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp109
.L32:
	call	parser_error	 ;
.L12:
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_36->type
 ; D:\TC\src\parser.c:336:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp120, token
 ; D:\TC\src\parser.c:338:     if (token_ptr->type != IDENTIFIER)
	je	.L13	 ;,
 ; D:\TC\src\parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp110
	call	parser_error	 ;
.L13:
 ; D:\TC\src\parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	%rbp, 32(%rsp)	 ; now_scope,
	movq	(%rsi), %rcx	 ; token_36->lexeme,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; type,
	movl	$1, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	%rax, %rsi	 ; tmp121, name
 ; D:\TC\src\parser.c:342:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_41->type
	je	.L14	 ;,
.L16:
 ; D:\TC\src\parser.c:341:     Expression* value = 0;
	xorl	%r8d, %r8d	 ; value
	jmp	.L15	 ;
.L14:
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp111
	movq	(%rax), %rcx	 ; token_41->lexeme,
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp123
	je	.L16	 ;,
 ; D:\TC\src\parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:347:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp124, token
 ; D:\TC\src\parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r8	 ; tmp125, value
 ; D:\TC\src\parser.c:350:         if (value == 0)
	testq	%rax, %rax	 ; value
	jne	.L15	 ;,
 ; D:\TC\src\parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp112
	movq	%rax, 56(%rsp)	 ; value, %sfp
	call	parser_error	 ;
	movq	56(%rsp), %r8	 ; %sfp, value
.L15:
 ; D:\TC\src\parser.c:354: }
	addq	$72, %rsp	 ;,
 ; D:\TC\src\parser.c:353:     return create_variable(type, name, value);
	movq	%rsi, %rdx	 ; name,
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
.L10:
 ; D:\TC\src\parser.c:326:         parser_error("Expected variable type", token);
	movq	%rsi, %rdx	 ; token,
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
	.section .rdata,"dr"
.LC6:
	.ascii "Failed to parse parenthesized expression\0"
.LC7:
	.ascii "Expected ')' after expression\0"
.LC8:
	.ascii "Failed to parse operand of unary '!'\0"
.LC9:
	.ascii "Failed to parse operand of unary '-'\0"
.LC10:
	.ascii "Expected variable name in variable access\0"
.LC11:
	.ascii "Cannot call undefined variable\0"
.LC12:
	.ascii "Cannot call non-function variable\0"
.LC13:
	.ascii "Failed to parse function call argument\0"
.LC14:
	.ascii "Expected ',' or ')' after function call argument\0"
.LC15:
	.ascii "Failed to parse sequence index\0"
.LC16:
	.ascii "Expected ']' after sequence index\0"
.LC17:
	.ascii "Cannot access attribute without a valid scope\0"
.LC18:
	.ascii "Expected attribute name after '.'\0"
.LC19:
	.ascii "Unknown attribute name\0"
.LC20:
	.ascii "Failed to parse variable access\0"
.LC21:
	.ascii "Unexpected token in primary expression\0"
	.text
	.def	parse_primary;	.scl	3;	.type	32;	.endef
parse_primary:
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	movq	%r8, %rbp	 ; tmp234, parser
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:696: Primary* parse_primary(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, 128(%rsp)	 ; tmp232, lexer
	movq	%rdx, 136(%rsp)	 ; tmp233, now_scope
 ; D:\TC\src\parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp235, token
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_50->type, _1
 ; D:\TC\src\parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	jne	.L34	 ;,
 ; D:\TC\src\parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%rsi), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:710:         type = PRIM_INTEGER;
	xorl	%edi, %edi	 ; type
	jmp	.L35	 ;
.L34:
 ; D:\TC\src\parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	jne	.L36	 ;,
 ; D:\TC\src\parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%rsi), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %edi	 ;, type
	jmp	.L35	 ;
.L36:
 ; D:\TC\src\parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	jne	.L37	 ;,
 ; D:\TC\src\parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%rsi), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:716:         type = PRIM_STRING;
	movl	$2, %edi	 ;, type
	jmp	.L35	 ;
.L37:
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	jne	.L38	 ;,
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp182
	movq	(%rsi), %rcx	 ; token_50->lexeme,
	movq	(%rax), %rdx	 ; TRUE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp236
	je	.L39	 ;,
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%rsi), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:719:         type = PRIM_TRUE;
	movl	$3, %edi	 ;, type
 ; D:\TC\src\parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L35	 ;
.L39:
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_50->type
	jne	.L38	 ;,
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp183
	movq	(%rsi), %rcx	 ; token_50->lexeme,
	movq	(%rax), %rdx	 ; FALSE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp237
	je	.L38	 ;,
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%rsi), %rdx	 ; token_50->lexeme, str_value
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:722:         type = PRIM_FALSE;
	movl	$4, %edi	 ;, type
 ; D:\TC\src\parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L35	 ;
.L38:
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_50->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp184
	movq	(%rsi), %rcx	 ; token_50->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp238
	je	.L41	 ;,
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rbp, %r8	 ; parser,
 ; D:\TC\src\parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp239, token
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp185
 ; D:\TC\src\parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rax, %rsi	 ; tmp240, expr_value
 ; D:\TC\src\parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L129	 ;,
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %edi	 ; token_63->type, type
 ; D:\TC\src\parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp241, token
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %edi	 ;, type
	je	.L44	 ;,
.L46:
 ; D:\TC\src\parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp186
.L129:
	call	parser_error	 ;
 ; D:\TC\src\parser.c:731:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L33	 ;
.L44:
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp187
	movq	(%rbx), %rcx	 ; token_63->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp242
	je	.L46	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L35	 ;
.L41:
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_50->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp188
	movq	(%rsi), %rcx	 ; token_50->lexeme,
	movq	(%rax), %rdx	 ; NOT_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp243
	je	.L47	 ;,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rbp, %r8	 ; parser,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp244, token
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
 ; D:\TC\src\parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp189
 ; D:\TC\src\parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rax, %r9	 ; tmp245, prim_value
 ; D:\TC\src\parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L129	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %edi	 ;, type
	jmp	.L35	 ;
.L47:
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_50->type
	jne	.L48	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp190
	movq	(%rsi), %rcx	 ; token_50->lexeme,
	movq	(%rax), %rdx	 ; SUB_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp246
	je	.L48	 ;,
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rbp, %r8	 ; parser,
 ; D:\TC\src\parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp247, token
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
 ; D:\TC\src\parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp191
 ; D:\TC\src\parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rax, %r9	 ; tmp248, prim_value
 ; D:\TC\src\parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	 ; prim_value
	je	.L129	 ;,
 ; D:\TC\src\parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	 ; base
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %edi	 ;, type
.L35:
 ; D:\TC\src\parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbx, 32(%rsp)	 ; base,
	movq	%rsi, %r8	 ; expr_value,
	movl	%edi, %ecx	 ; type,
	call	create_primary	 ;
	jmp	.L33	 ;
.L48:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rsi), %eax	 ; token_50->type, _26
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	 ;, _26
	jne	.L127	 ;,
.L52:
 ; D:\TC\src\parser.c:774:     Token* token = peek_current_token(lexer);
	movq	128(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp249, token
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_89->type, _90
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _90
	jne	.L49	 ;,
	jmp	.L50	 ;
.L127:
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	 ;, _26
	jne	.L51	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp192
	movq	(%rsi), %rcx	 ; token_50->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	 ; tmp250
	je	.L51	 ;,
 ; D:\TC\src\parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%rbp)	 ;, parser_59(D)->in_method
	jne	.L52	 ;,
	jmp	.L51	 ;
.L49:
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _90
	je	.L53	 ;,
.L55:
 ; D:\TC\src\parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC10(%rip), %rcx	 ;, tmp193
	jmp	.L131	 ;
.L53:
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp194
	movq	(%rbx), %rcx	 ; token_89->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp251
	je	.L55	 ;,
.L50:
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rdx	 ; token_89->lexeme,
	movq	136(%rsp), %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:782:     Scope* var_scope = 0;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:780:     Name* current_type = 0;
	xorl	%r12d, %r12d	 ; current_type
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	call	search	 ;
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rdi	 ; tmp252, base_name
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	%rax, %rbx	 ; tmp253, base
 ; D:\TC\src\parser.c:786:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp254, token_ptr
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	jmp	.L56	 ;
.L61:
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp283
	movq	(%r14), %rcx	 ; token_ptr_115->lexeme,
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp266
	je	.L72	 ;,
 ; D:\TC\src\parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rbp, %r8	 ; parser,
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp267, token
 ; D:\TC\src\parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %r14	 ; tmp268, index
 ; D:\TC\src\parser.c:837:             if (index == 0)
	testq	%rax, %rax	 ; index
	jne	.L73	 ;,
 ; D:\TC\src\parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp216
	call	parser_error	 ;
.L73:
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_148->type
 ; D:\TC\src\parser.c:839:             token = get_next_token(lexer, true);
	movq	%rax, %r15	 ; tmp269, token
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L75	 ;,
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp218
	movq	(%r15), %rcx	 ; token_148->lexeme,
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp270
	je	.L75	 ;,
 ; D:\TC\src\parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	xorl	%edx, %edx	 ;
	movq	%r14, %r9	 ; index,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	%rdx, 32(%rsp)	 ;,
	movq	%rbx, %rdx	 ; base,
	call	create_variable_access	 ;
	movq	%rax, %rbx	 ; tmp271, base
.L71:
 ; D:\TC\src\parser.c:869:         token = peek_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %r14	 ; tmp276, token_ptr
.L56:
 ; D:\TC\src\parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%r14)	 ;, token_ptr_115->type
	jne	.L81	 ;,
 ; D:\TC\src\parser.c:789:         if (base_name != 0) {
	testq	%rdi, %rdi	 ; base_name
	jne	.L132	 ;,
.L57:
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%r13, %r13	 ; var_scope
	je	.L133	 ;,
.L60:
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp279
	movq	(%r14), %rcx	 ; token_ptr_115->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp255
	je	.L61	 ;,
 ; D:\TC\src\parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp256, token
 ; D:\TC\src\parser.c:804:             if (base_name == 0)
	testq	%rdi, %rdi	 ; base_name
	jne	.L62	 ;,
 ; D:\TC\src\parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC11(%rip), %rcx	 ;, tmp206
	call	parser_error	 ;
.L62:
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movl	24(%rdi), %eax	 ; base_name_98->kind, tmp280
	subl	$2, %eax	 ;, tmp207
 ; D:\TC\src\parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %eax	 ;, tmp207
	jbe	.L63	 ;,
 ; D:\TC\src\parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp209
	call	parser_error	 ;
.L63:
 ; D:\TC\src\parser.c:809:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:815:                     parser_error("Failed to parse function call argument", token);
	leaq	.LC13(%rip), %r14	 ;, tmp227
 ; D:\TC\src\parser.c:809:             token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp257, token
 ; D:\TC\src\parser.c:811:             list(Expression*) args = create_list();
	call	create_list	 ;
	movq	%rax, %r13	 ; tmp258, args
.L64:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_124->type
	je	.L134	 ;,
.L70:
 ; D:\TC\src\parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	136(%rsp), %rdx	 ; now_scope,
	movq	128(%rsp), %rcx	 ; lexer,
	movq	%rbp, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %r15	 ; tmp259, arg
 ; D:\TC\src\parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	 ; arg
	jne	.L65	 ;,
 ; D:\TC\src\parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%r12, %rdx	 ; token,
	movq	%r14, %rcx	 ; tmp227,
	call	parser_error	 ;
.L65:
 ; D:\TC\src\parser.c:816:                 list_append(args, (pointer)arg);
	movq	%r15, %rdx	 ; arg,
	movq	%r13, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:817:                 token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp260, token
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L66	 ;,
.L69:
 ; D:\TC\src\parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp211
.L131:
	call	parser_error	 ;
	jmp	.L54	 ;
.L132:
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%rdi), %eax	 ; base_name_98->kind, _99
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %edx	 ;, tmp195
 ; D:\TC\src\parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %edx	 ;, tmp195
	jbe	.L87	 ;,
	cmpl	$5, %eax	 ;, _99
	jne	.L58	 ;,
.L87:
 ; D:\TC\src\parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%rdi), %r12	 ; base_name_98->info.type, current_type
	jmp	.L57	 ;
.L58:
 ; D:\TC\src\parser.c:794:                 current_type = base_name;
	andl	$-5, %eax	 ;, _99
	cmove	%rdi, %r12	 ; current_type,, base_name, current_type
	jmp	.L57	 ;
.L133:
 ; D:\TC\src\parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%r12, %r12	 ; current_type
	je	.L60	 ;,
 ; D:\TC\src\parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%r12)	 ;, current_type_109->kind
	jne	.L60	 ;,
 ; D:\TC\src\parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%r12), %r13	 ; current_type_109->info.scope, var_scope
	jmp	.L60	 ;
.L66:
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp281
	movq	(%r12), %rcx	 ; token_125->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp261
	je	.L67	 ;,
 ; D:\TC\src\parser.c:820:                     token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp262, token
 ; D:\TC\src\parser.c:821:                     token_ptr = token;
	jmp	.L64	 ;
.L67:
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_125->type
	jne	.L69	 ;,
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp213
	movq	(%r12), %rcx	 ; token_125->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp263
	jne	.L64	 ;,
	jmp	.L69	 ;
.L134:
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp282
	movq	(%r12), %rcx	 ; token_124->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp264
	je	.L70	 ;,
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r13, 32(%rsp)	 ; args,
	movq	%rbx, %rdx	 ; base,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%rdi), %rdi	 ; base_name_98->info.type, base_name
 ; D:\TC\src\parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rbx	 ; tmp265, base
	jmp	.L130	 ;
.L75:
 ; D:\TC\src\parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp217
	jmp	.L131	 ;
.L72:
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp284
	movq	(%r14), %rcx	 ; token_ptr_115->lexeme,
	movq	(%rax), %rdx	 ; DOT_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp272
	jne	.L76	 ;,
.L81:
 ; D:\TC\src\parser.c:760:         if (variable_value == 0) {
	testq	%rbx, %rbx	 ; base
	je	.L54	 ;,
 ; D:\TC\src\parser.c:707:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:706:     Expression* expr_value = NULL;
	xorl	%esi, %esi	 ; expr_value
 ; D:\TC\src\parser.c:705:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %edi	 ;, type
	jmp	.L35	 ;
.L76:
 ; D:\TC\src\parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:849:             token = get_next_token(lexer, true);
	movq	128(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp273, token
 ; D:\TC\src\parser.c:851:             if (var_scope == 0) {
	testq	%r13, %r13	 ; var_scope
	jne	.L77	 ;,
 ; D:\TC\src\parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp220
	jmp	.L131	 ;
.L77:
 ; D:\TC\src\parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_158->type
	je	.L78	 ;,
 ; D:\TC\src\parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp221
	jmp	.L131	 ;
.L78:
 ; D:\TC\src\parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rdx	 ; token_158->lexeme,
	movq	%r13, %rcx	 ; var_scope,
	call	search	 ;
	movq	%rax, %rdi	 ; tmp274, base_name
 ; D:\TC\src\parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	 ; base_name
	jne	.L79	 ;,
 ; D:\TC\src\parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp222
	jmp	.L131	 ;
.L79:
 ; D:\TC\src\parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	xorl	%eax, %eax	 ;
	movq	%rbx, %rdx	 ; base,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; base_name,
	movq	%rax, 32(%rsp)	 ;,
	movl	$2, %ecx	 ;,
	call	create_variable_access	 ;
	movq	%rax, %rbx	 ; tmp275, base
.L130:
 ; D:\TC\src\parser.c:866:             var_scope = 0;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:865:             current_type = 0;
	xorl	%r12d, %r12d	 ; current_type
	jmp	.L71	 ;
.L54:
 ; D:\TC\src\parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp223
	jmp	.L129	 ;
.L51:
 ; D:\TC\src\parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp224
	jmp	.L129	 ;
.L33:
 ; D:\TC\src\parser.c:769: }
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
.LC22:
	.ascii "Failed to parse right operand\0"
	.text
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	movl	%r8d, %r15d	 ; tmp119, min_prec
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r9, %r12	 ; tmp120, now_scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp118, expr_left
 ; D:\TC\src\parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:641: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp117, lexer
	subq	$56, %rsp	 ;,
.L154:
 ; D:\TC\src\parser.c:678:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_ptr_13->type
	jne	.L148	 ;,
 ; D:\TC\src\parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_13->lexeme,
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:651:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movl	%eax, %ebp	 ; tmp122, op
 ; D:\TC\src\parser.c:651:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %r13d	 ; tmp123, op_prec
 ; D:\TC\src\parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %ebp	 ;, op
	je	.L148	 ;,
	cmpl	%r15d, %eax	 ; min_prec, op_prec
	jge	.L137	 ;,
.L148:
 ; D:\TC\src\parser.c:681:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:683:     return expr_left;
	jmp	.L135	 ;
.L137:
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
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:656:         token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp124, token
 ; D:\TC\src\parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp125, right_primary
 ; D:\TC\src\parser.c:659:         if (right_primary == 0) {
	testq	%rax, %rax	 ; right_primary
	jne	.L140	 ;,
 ; D:\TC\src\parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp111
	call	parser_error	 ;
 ; D:\TC\src\parser.c:661:             return NULL;
	jmp	.L141	 ;
.L140:
 ; D:\TC\src\parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rdi	 ; tmp126, right
.L153:
 ; D:\TC\src\parser.c:674:             token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_ptr_12->type
	jne	.L146	 ;,
 ; D:\TC\src\parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rcx	 ; token_ptr_12->lexeme,
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
 ; D:\TC\src\parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movl	%eax, %r14d	 ; tmp128, next_op
 ; D:\TC\src\parser.c:668:             int next_prec = operator_precedence(next_op);
	call	operator_precedence	 ;
	movl	%eax, %r8d	 ; tmp129, next_prec
 ; D:\TC\src\parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r14d	 ;, next_op
	je	.L146	 ;,
	cmpl	%eax, %r13d	 ; next_prec, op_prec
	jl	.L143	 ;,
.L146:
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rsi, %rdx	 ; <retval>,
	movl	%ebp, %ecx	 ; op,
	movq	%rdi, %r9	 ; right,
	xorl	%r8d, %r8d	 ;
	call	create_expression	 ;
 ; D:\TC\src\parser.c:678:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rsi	 ; tmp130, <retval>
	jmp	.L154	 ;
.L143:
 ; D:\TC\src\parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rax	 ; parser, tmp135
	movq	%rdi, %rdx	 ; right,
	movq	%r12, %r9	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	movq	%rax, 32(%rsp)	 ; tmp135,
	call	parse_expr_prec	 ;
	movq	%rax, %rdi	 ; tmp132, right
 ; D:\TC\src\parser.c:672:             if (right == 0)
	testq	%rax, %rax	 ; right
	jne	.L153	 ;,
.L141:
 ; D:\TC\src\parser.c:661:             return NULL;
	xorl	%esi, %esi	 ; <retval>
.L135:
 ; D:\TC\src\parser.c:684: }
	addq	$56, %rsp	 ;,
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
	.section .rdata,"dr"
.LC23:
	.ascii "Expected '(' after 'if'\0"
.LC24:
	.ascii "Failed to parse if condition\0"
.LC25:
	.ascii "Expected ')' after if condition\0"
.LC26:
	.ascii "Expected '{' to start if body\0"
.LC27:
	.ascii "Failed to parse if body statement\0"
.LC28:
	.ascii "Expected '(' after 'elif'\0"
.LC29:
	.ascii "Failed to parse else-if condition\0"
.LC30:
	.ascii "Expected ')' after else-if condition\0"
.LC31:
	.ascii "Expected '{' to start else-if body\0"
.LC32:
	.ascii "Failed to parse else-if body statement\0"
.LC33:
	.ascii "Expected '{' to start else body\0"
.LC34:
	.ascii "Failed to parse else body statement\0"
.LC35:
	.ascii "Expected '(' after 'for'\0"
.LC36:
	.ascii "Failed to parse for loop initializer\0"
.LC37:
	.ascii "Expected ';' after for loop initializer\0"
.LC38:
	.ascii "Failed to parse for loop condition\0"
.LC39:
	.ascii "Expected ';' after for loop condition\0"
.LC40:
	.ascii "Failed to parse for loop increment\0"
.LC41:
	.ascii "Expected ')' after for loop increment\0"
.LC42:
	.ascii "Expected '{' to start for loop body\0"
.LC43:
	.ascii "Failed to parse for loop body statement\0"
.LC44:
	.ascii "Expected '(' after 'while'\0"
.LC45:
	.ascii "Failed to parse while condition\0"
.LC46:
	.ascii "Expected ')' after while condition\0"
.LC47:
	.ascii "Expected '{' to start while body\0"
.LC48:
	.ascii "Failed to parse while body statement\0"
.LC49:
	.ascii "Cannot use 'break' outside of a loop\0"
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
	movq	%r8, %rbx	 ; tmp349, parser
	subq	$88, %rsp	 ;,
 ; D:\TC\src\parser.c:355: Statement* parse_statement(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, 160(%rsp)	 ; tmp347, lexer
	movq	%rdx, 168(%rsp)	 ; tmp348, now_scope
 ; D:\TC\src\parser.c:361:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_47->type
	jne	.L156	 ;,
	movq	%rax, %rsi	 ; tmp350, token
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp266
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; IF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp351
	je	.L157	 ;,
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_93->type
 ; D:\TC\src\parser.c:413:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp352, token
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L158	 ;,
.L160:
 ; D:\TC\src\parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp267
	jmp	.L326	 ;
.L158:
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp454
	movq	(%rsi), %rcx	 ; token_93->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp353
	je	.L160	 ;,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:419:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp354, token
 ; D:\TC\src\parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rsi	 ; tmp355, condition
 ; D:\TC\src\parser.c:422:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	jne	.L161	 ;,
 ; D:\TC\src\parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp269
	call	parser_error	 ;
.L161:
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_100->type
 ; D:\TC\src\parser.c:424:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp356, token
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L162	 ;,
.L163:
 ; D:\TC\src\parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp270
.L326:
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:         return NULL;
	xorl	%edx, %edx	 ; _177
	jmp	.L185	 ;
.L162:
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r14	 ;, tmp271
	movq	(%rax), %rcx	 ; token_100->lexeme,
	movq	(%r14), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp357
	je	.L163	 ;,
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_105->type
 ; D:\TC\src\parser.c:430:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp358, token
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L164	 ;,
.L165:
 ; D:\TC\src\parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp272
	jmp	.L326	 ;
.L164:
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %r13	 ;, tmp273
	movq	(%rax), %rcx	 ; token_105->lexeme,
	movq	0(%r13), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp359
	je	.L165	 ;,
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	leaq	.LC27(%rip), %rdi	 ;, tmp342
 ; D:\TC\src\parser.c:436:     list(Statement*) body = create_list();
	movq	%rax, 48(%rsp)	 ; tmp360, %sfp
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp341
 ; D:\TC\src\parser.c:437:     token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp361, token
.L166:
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r12)	 ;, token_113->type
	je	.L332	 ;,
.L168:
 ; D:\TC\src\parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp362, statement
 ; D:\TC\src\parser.c:441:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L167	 ;,
 ; D:\TC\src\parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r12, %rdx	 ; token,
	movq	%rdi, %rcx	 ; tmp342,
	call	parser_error	 ;
.L167:
 ; D:\TC\src\parser.c:443:         list_append(body, (pointer)statement);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r15, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp363, token
	jmp	.L166	 ;
.L332:
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%r12), %rcx	 ; token_113->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp364
	je	.L168	 ;,
 ; D:\TC\src\parser.c:447:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	leaq	.LC32(%rip), %r15	 ;, tmp339
 ; D:\TC\src\parser.c:447:     list(ElseIf*) else_if = create_list();
	movq	%rax, 56(%rsp)	 ; tmp365, %sfp
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:448:     list(Statement*) else_body = create_list();
	movq	%rax, 64(%rsp)	 ; tmp366, %sfp
 ; D:\TC\src\parser.c:449:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
	movq	%rax, %rbp	 ; tmp367, token_ptr
.L169:
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_ptr_153->type
	jne	.L181	 ;,
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp457
	movq	0(%rbp), %rcx	 ; token_ptr_153->lexeme,
	movq	(%rax), %rdx	 ; ELIF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp383
	je	.L333	 ;,
 ; D:\TC\src\parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:454:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_122->type
 ; D:\TC\src\parser.c:454:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp368, token
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L170	 ;,
.L171:
 ; D:\TC\src\parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp276
	jmp	.L326	 ;
.L170:
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp455
	movq	0(%rbp), %rcx	 ; token_122->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp369
	je	.L171	 ;,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:460:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp370, token
 ; D:\TC\src\parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp371, elif_condition
 ; D:\TC\src\parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	 ; elif_condition
	jne	.L172	 ;,
 ; D:\TC\src\parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;, tmp278
	call	parser_error	 ;
.L172:
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_130->type
 ; D:\TC\src\parser.c:465:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp372, token
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L173	 ;,
.L174:
 ; D:\TC\src\parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp279
	jmp	.L326	 ;
.L173:
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%rax), %rcx	 ; token_130->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp373
	je	.L174	 ;,
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_136->type
 ; D:\TC\src\parser.c:471:         token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp374, token
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L175	 ;,
.L176:
 ; D:\TC\src\parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp281
	jmp	.L326	 ;
.L175:
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_136->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp375
	je	.L176	 ;,
 ; D:\TC\src\parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
	movq	%rax, %r12	 ; tmp376, elif_body
.L325:
 ; D:\TC\src\parser.c:485:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_145->type
 ; D:\TC\src\parser.c:485:             token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp379, token
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	je	.L334	 ;,
.L179:
 ; D:\TC\src\parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:482:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L178	 ;,
 ; D:\TC\src\parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%rdi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp339,
	movq	%rax, 72(%rsp)	 ; statement, %sfp
	call	parser_error	 ;
	movq	72(%rsp), %rax	 ; %sfp, statement
.L178:
 ; D:\TC\src\parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%rax, %rdx	 ; statement,
	movq	%r12, %rcx	 ; elif_body,
	call	list_append	 ;
	jmp	.L325	 ;
.L334:
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp456
	movq	(%rdi), %rcx	 ; token_145->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp380
	je	.L179	 ;,
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rbp, %rcx	 ; elif_condition,
	movq	%r12, %rdx	 ; elif_body,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp381, _151
 ; D:\TC\src\parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:489:         token = peek_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	peek_next_token	 ;
	movq	%rax, %rbp	 ; tmp382, token_ptr
	jmp	.L169	 ;
.L333:
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_ptr_153->type
	jne	.L181	 ;,
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp286
	movq	0(%rbp), %rcx	 ; token_ptr_153->lexeme,
	movq	(%rax), %rdx	 ; ELSE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp385
	jne	.L335	 ;,
.L181:
 ; D:\TC\src\parser.c:512:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	48(%rsp), %rdx	 ; %sfp,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rsi, %rcx	 ; condition,
	movq	56(%rsp), %r8	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp384, _177
	jmp	.L185	 ;
.L335:
 ; D:\TC\src\parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:495:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_163->type
 ; D:\TC\src\parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp386, token
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L186	 ;,
.L187:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp287
	jmp	.L326	 ;
.L186:
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	0(%r13), %rdx	 ; L_BRACE_SYMBOL,
	movq	(%rax), %rcx	 ; token_163->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp387
	je	.L187	 ;,
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %rbp	 ;, tmp335
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp334
 ; D:\TC\src\parser.c:501:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp388, token
.L188:
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_170->type
	je	.L336	 ;,
.L190:
 ; D:\TC\src\parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp389, statement
 ; D:\TC\src\parser.c:505:             if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L189	 ;,
 ; D:\TC\src\parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%r13, %rdx	 ; token,
	movq	%rbp, %rcx	 ; tmp335,
	call	parser_error	 ;
.L189:
 ; D:\TC\src\parser.c:507:             list_append(else_body, (pointer)statement);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:508:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp390, token
	jmp	.L188	 ;
.L336:
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	0(%r13), %rcx	 ; token_170->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp391
	je	.L190	 ;,
	jmp	.L181	 ;
.L185:
 ; D:\TC\src\parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%esi, %esi	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	%rsi, 40(%rsp)	 ;,
	movq	%rsi, 32(%rsp)	 ;,
	jmp	.L331	 ;
.L157:
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp291
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; FOR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp393
	je	.L192	 ;,
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_178->type
 ; D:\TC\src\parser.c:522:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp394, token
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L193	 ;,
.L195:
 ; D:\TC\src\parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp292
	jmp	.L327	 ;
.L193:
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp293
	movq	(%rsi), %rcx	 ; token_178->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp395
	je	.L195	 ;,
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_183->type
 ; D:\TC\src\parser.c:528:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp396, token
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L196	 ;,
.L199:
 ; D:\TC\src\parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rsi	 ; tmp397, initializer
 ; D:\TC\src\parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	 ; initializer
	jne	.L198	 ;,
 ; D:\TC\src\parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp295
	call	parser_error	 ;
	jmp	.L198	 ;
.L196:
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp294
	movq	(%rdi), %rcx	 ; token_183->lexeme,
 ; D:\TC\src\parser.c:530:     Variable* initializer = 0;
	xorl	%esi, %esi	 ; initializer
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp398
	jne	.L200	 ;,
	jmp	.L199	 ;
.L198:
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp399, token
.L200:
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rdi)	 ;, token_190->type
	je	.L201	 ;,
.L203:
 ; D:\TC\src\parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp296
.L327:
	call	parser_error	 ;
 ; D:\TC\src\parser.c:526:         return NULL;
	xorl	%r9d, %r9d	 ; _237
	jmp	.L202	 ;
.L201:
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r12	 ;, tmp297
	movq	(%rdi), %rcx	 ; token_190->lexeme,
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp400
	je	.L203	 ;,
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_195->type
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp401, token
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L204	 ;,
.L207:
 ; D:\TC\src\parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp402, condition
 ; D:\TC\src\parser.c:549:         if (condition == 0)
	testq	%rax, %rax	 ; condition
	jne	.L206	 ;,
 ; D:\TC\src\parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp299
	call	parser_error	 ;
	jmp	.L206	 ;
.L204:
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	(%rax), %rcx	 ; token_195->lexeme,
 ; D:\TC\src\parser.c:546:     Expression* condition = 0;
	xorl	%edi, %edi	 ; condition
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp403
	jne	.L208	 ;,
	jmp	.L207	 ;
.L206:
 ; D:\TC\src\parser.c:551:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp404, token
.L208:
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	 ;, token_202->type
	je	.L209	 ;,
.L210:
 ; D:\TC\src\parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp300
	jmp	.L327	 ;
.L209:
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%r12), %rdx	 ; SEMICOLON_SYMBOL,
	movq	0(%rbp), %rcx	 ; token_202->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp405
	je	.L210	 ;,
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_207->type
 ; D:\TC\src\parser.c:560:     token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp406, token
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L211	 ;,
.L214:
 ; D:\TC\src\parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
	movq	%rax, %rbp	 ; tmp407, increment
 ; D:\TC\src\parser.c:565:         if (increment == 0)
	testq	%rax, %rax	 ; increment
	jne	.L213	 ;,
 ; D:\TC\src\parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp303
	call	parser_error	 ;
	jmp	.L213	 ;
.L211:
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp302
	movq	(%r12), %rcx	 ; token_207->lexeme,
 ; D:\TC\src\parser.c:562:     Expression* increment = 0;
	xorl	%ebp, %ebp	 ; increment
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp408
	jne	.L215	 ;,
	jmp	.L214	 ;
.L213:
 ; D:\TC\src\parser.c:567:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r12	 ; tmp409, token
.L215:
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%r12)	 ;, token_214->type
	je	.L216	 ;,
.L217:
 ; D:\TC\src\parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp304
	jmp	.L327	 ;
.L216:
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp305
	movq	(%r12), %rcx	 ; token_214->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	 ; tmp410
	je	.L217	 ;,
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_219->type
 ; D:\TC\src\parser.c:576:     token = get_next_token(lexer, true);
	movq	%rax, %r12	 ; tmp411, token
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L218	 ;,
.L219:
 ; D:\TC\src\parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%r12, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp306
	jmp	.L327	 ;
.L218:
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp307
	movq	(%r12), %rcx	 ; token_219->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp412
	je	.L219	 ;,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%rbx)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:582:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp413, body
 ; D:\TC\src\parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	leaq	.LC43(%rip), %r13	 ;, tmp344
 ; D:\TC\src\parser.c:584:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp414, token
.L220:
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_227->type
	je	.L337	 ;,
.L222:
 ; D:\TC\src\parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp415, statement
 ; D:\TC\src\parser.c:588:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L221	 ;,
 ; D:\TC\src\parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r15, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp344,
	call	parser_error	 ;
.L221:
 ; D:\TC\src\parser.c:590:         list_append(body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:591:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp416, token
	jmp	.L220	 ;
.L337:
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp458
	movq	(%r15), %rcx	 ; token_227->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp417
	je	.L222	 ;,
 ; D:\TC\src\parser.c:594:     ((parser))->in_loop = false;
	movb	$0, 2(%rbx)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	%r12, %r9	 ; body,
	movq	%rbp, %r8	 ; increment,
	movq	%rdi, %rdx	 ; condition,
	movq	%rsi, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp418, _237
.L202:
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%ebx, %ebx	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	%rbx, 40(%rsp)	 ;,
	movq	%rbx, 32(%rsp)	 ;,
.L331:
	call	create_statement	 ;
	movq	%rax, %rbx	 ; tmp419, <retval>
 ; D:\TC\src\parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L155	 ;
.L192:
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp310
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; WHILE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp420
	je	.L223	 ;,
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_238->type
 ; D:\TC\src\parser.c:603:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp421, token
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L224	 ;,
.L226:
 ; D:\TC\src\parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp311
	jmp	.L328	 ;
.L224:
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp312
	movq	(%rsi), %rcx	 ; token_238->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp422
	je	.L226	 ;,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
 ; D:\TC\src\parser.c:609:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp423, token
 ; D:\TC\src\parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	 ;
	movq	%rax, %rdi	 ; tmp424, condition
 ; D:\TC\src\parser.c:612:     if (condition == 0)
	testq	%rax, %rax	 ; condition
	jne	.L227	 ;,
 ; D:\TC\src\parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp313
	call	parser_error	 ;
.L227:
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_245->type
 ; D:\TC\src\parser.c:614:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp425, token
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L228	 ;,
.L230:
 ; D:\TC\src\parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp314
.L328:
	call	parser_error	 ;
 ; D:\TC\src\parser.c:607:         return NULL;
	xorl	%r8d, %r8d	 ; _265
	jmp	.L229	 ;
.L228:
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp315
	movq	(%rsi), %rcx	 ; token_245->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp426
	je	.L230	 ;,
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_250->type
 ; D:\TC\src\parser.c:620:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp427, token
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L231	 ;,
.L232:
 ; D:\TC\src\parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp316
	jmp	.L328	 ;
.L231:
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp317
	movq	(%rsi), %rcx	 ; token_250->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp428
	je	.L232	 ;,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%rbx)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:626:     list(Statement*) body = create_list();
	movq	%rax, %rbp	 ; tmp429, body
 ; D:\TC\src\parser.c:633:             parser_error("Failed to parse while body statement", token);
	leaq	.LC48(%rip), %r13	 ;, tmp346
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp345
 ; D:\TC\src\parser.c:628:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp430, token
.L233:
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_258->type
	je	.L338	 ;,
.L235:
 ; D:\TC\src\parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %r14	 ; tmp431, statement
 ; D:\TC\src\parser.c:632:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L234	 ;,
 ; D:\TC\src\parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%rsi, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp346,
	call	parser_error	 ;
.L234:
 ; D:\TC\src\parser.c:634:         list_append(body, (pointer)statement);
	movq	%r14, %rdx	 ; statement,
	movq	%rbp, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:635:         token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp432, token
	jmp	.L233	 ;
.L338:
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL,
	movq	(%rsi), %rcx	 ; token_258->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp433
	je	.L235	 ;,
 ; D:\TC\src\parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%rbx)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:639:     return create_while(condition, body);
	movq	%rbp, %rdx	 ; body,
	movq	%rdi, %rcx	 ; condition,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp434, _265
.L229:
 ; D:\TC\src\parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%r11d, %r11d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	%r11, 40(%rsp)	 ;,
	movq	%r11, 32(%rsp)	 ;,
	jmp	.L331	 ;
.L223:
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp320
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp436
	je	.L236	 ;,
 ; D:\TC\src\parser.c:372:             get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r10d, %r10d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 40(%rsp)	 ; tmp437,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	movq	%r10, 32(%rsp)	 ;,
	jmp	.L330	 ;
.L236:
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp321
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; RETURN_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp439
	je	.L238	 ;,
 ; D:\TC\src\parser.c:375:             token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r9, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
	movq	%rax, 32(%rsp)	 ; tmp440,
	jmp	.L330	 ;
.L238:
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp322
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; BREAK_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp442
	je	.L239	 ;,
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rbx)	 ;, parser_49(D)->in_loop
 ; D:\TC\src\parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp323
 ; D:\TC\src\parser.c:379:             if (!(((parser))->in_loop))
	je	.L329	 ;,
 ; D:\TC\src\parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r8d, %r8d	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ;,
	movq	%r8, 32(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	jmp	.L330	 ;
.L239:
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp324
	movq	(%rsi), %rcx	 ; token_47->lexeme,
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp444
	je	.L156	 ;,
 ; D:\TC\src\parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rbx)	 ;, parser_49(D)->in_loop
	jne	.L243	 ;,
 ; D:\TC\src\parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp325
.L329:
	call	parser_error	 ;
 ; D:\TC\src\parser.c:383:                 return NULL;
	xorl	%ebx, %ebx	 ; <retval>
	jmp	.L155	 ;
.L243:
 ; D:\TC\src\parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rcx, 40(%rsp)	 ;,
	movq	%rcx, 32(%rsp)	 ;,
	movl	$7, %ecx	 ;,
	jmp	.L330	 ;
.L156:
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	168(%rsp), %rdx	 ; now_scope,
	movq	160(%rsp), %rcx	 ; lexer,
	movq	%rbx, %r8	 ; parser,
	call	parse_expression	 ;
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp448,
	xorl	%ecx, %ecx	 ;
	movq	%rdx, 40(%rsp)	 ;,
	xorl	%edx, %edx	 ;
.L330:
	call	create_statement	 ;
 ; D:\TC\src\parser.c:398:     token = peek_current_token(lexer);
	movq	160(%rsp), %rcx	 ; lexer,
 ; D:\TC\src\parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %rbx	 ; tmp449, <retval>
 ; D:\TC\src\parser.c:398:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rdx	 ; tmp450, token
 ; D:\TC\src\parser.c:399:     if (statement == 0)
	testq	%rbx, %rbx	 ; <retval>
	jne	.L244	 ;,
 ; D:\TC\src\parser.c:400:         parser_error("Failed to parse statement", token);
	leaq	.LC51(%rip), %rcx	 ;, tmp326
	call	parser_error	 ;
.L244:
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	160(%rsp), %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_90->type
 ; D:\TC\src\parser.c:401:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp451, token
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L245	 ;,
.L247:
 ; D:\TC\src\parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp327
	call	parser_error	 ;
	jmp	.L155	 ;
.L245:
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp328
	movq	(%rsi), %rcx	 ; token_90->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp452
	je	.L247	 ;,
.L155:
 ; D:\TC\src\parser.c:406: }
	addq	$88, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
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
.LC53:
	.ascii "Expected identifier after 'import'\0"
.LC54:
	.ascii "Expected string literal after 'from'\0"
.LC55:
	.ascii "Expected ';' at end of import statement\0"
.LC56:
	.ascii "Failed to parse import statement\0"
.LC57:
	.ascii "Expected function return type after 'func'\0"
.LC58:
	.ascii "Unknown function return type\0"
.LC59:
	.ascii "Expected function name after return type\0"
.LC60:
	.ascii "Expected '(' after function name\0"
.LC61:
	.ascii "Failed to parse function parameter\0"
.LC62:
	.ascii "Function parameters cannot have default values\0"
.LC63:
	.ascii "Expected ',' or ')' after function parameter\0"
.LC64:
	.ascii "Expected '{' to start function body\0"
.LC65:
	.ascii "Failed to parse function body statement\0"
.LC66:
	.ascii "Unreachable code after return statement\0"
.LC67:
	.ascii "Function missing return statement\0"
.LC68:
	.ascii "Failed to parse function declaration\0"
.LC69:
	.ascii "Expected class name after 'class'\0"
.LC70:
	.ascii "Expected '{' to start class body\0"
.LC71:
	.ascii "Expected method return type after 'method'\0"
.LC72:
	.ascii "Unknown return type for method\0"
.LC73:
	.ascii "Expected method name after return type\0"
.LC74:
	.ascii "Expected '(' after method name\0"
.LC75:
	.ascii "Expected 'self' as first parameter of method\0"
.LC76:
	.ascii "Expected ',' or ')' after method parameter\0"
.LC77:
	.ascii "Failed to parse method parameter\0"
.LC78:
	.ascii "Method parameters cannot have default values\0"
.LC79:
	.ascii "Expected '{' to start method body\0"
.LC80:
	.ascii "Failed to parse method body statement\0"
.LC81:
	.ascii "Method missing return statement\0"
.LC82:
	.ascii "Failed to parse class method\0"
.LC83:
	.ascii "Failed to parse class variable\0"
.LC84:
	.ascii "Expected ';' after class variable declaration\0"
.LC85:
	.ascii "Unexpected token in class member\0"
.LC86:
	.ascii "Failed to parse class declaration\0"
.LC87:
	.ascii "Unexpected token in code member\0"
	.text
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movq	%r8, %r14	 ; tmp389, parser
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp388, now_scope
	pushq	%rbx	 ;
	subq	$136, %rsp	 ;,
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	movq	.refptr.builtin_scope(%rip), %rbx	 ;, tmp276
 ; D:\TC\src\parser.c:19: Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rcx, 48(%rsp)	 ; tmp387, %sfp
 ; D:\TC\src\parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, (%rbx)	 ;, builtin_scope
	jne	.L340	 ;,
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	xorl	%ecx, %ecx	 ;
	call	create_scope	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, (%rbx)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, 32(%rsp)	 ; _2,
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp278
	movq	(%rax), %rcx	 ; VOID_KEYWORD,
	call	create_name	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp279
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp391, name_void
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	(%rbx), %rax	 ; builtin_scope, builtin_scope
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp280
	movq	(%rax), %rcx	 ; INT_KEYWORD,
	call	create_name	 ;
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp283
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp392, name_int
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	(%rbx), %rax	 ; builtin_scope, builtin_scope
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp284
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD,
	call	create_name	 ;
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp287
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp393, name_float
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	(%rbx), %rax	 ; builtin_scope, builtin_scope
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp288
	movq	(%rax), %rcx	 ; STRING_KEYWORD,
	call	create_name	 ;
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp291
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp394, name_string
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	(%rbx), %rax	 ; builtin_scope, builtin_scope
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; builtin_scope,
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp292
	movq	(%rax), %rcx	 ; BOOL_KEYWORD,
	call	create_name	 ;
 ; D:\TC\src\parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp295
	movq	%rax, (%rdx)	 ; tmp395, name_bool
.L340:
 ; D:\TC\src\parser.c:31:     if (now_scope == 0)
	testq	%rsi, %rsi	 ; now_scope
	jne	.L341	 ;,
 ; D:\TC\src\parser.c:32:         now_scope = builtin_scope;
	movq	(%rbx), %rsi	 ; builtin_scope, now_scope
.L341:
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rsi, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 64(%rsp)	 ; tmp396, %sfp
 ; D:\TC\src\parser.c:36:     Scope* global_scope = create_scope(now_scope);
	call	create_scope	 ;
	movq	%rax, %r12	 ; tmp397, global_scope
.L355:
 ; D:\TC\src\parser.c:57:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp484, token
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L428	 ;,
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movl	24(%rax), %eax	 ; token_33->type, _31
 ; D:\TC\src\parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _31
	je	.L428	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _31
	jne	.L383	 ;,
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp486
	movq	(%rbx), %rcx	 ; token_33->lexeme,
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD,
	call	string_equal	 ;
	movl	%eax, %esi	 ; tmp399, have_return
 ; D:\TC\src\parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	je	.L344	 ;,
 ; D:\TC\src\parser.c:68:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:71:         parser_error("Expected identifier after 'import'", token);
	leaq	.LC53(%rip), %rcx	 ;, tmp298
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_89->type
 ; D:\TC\src\parser.c:68:     token = get_next_token(lexer, true);
	movq	%rax, %rdx	 ; tmp400, token
 ; D:\TC\src\parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	jne	.L504	 ;,
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:74:     string import_name = token_ptr->lexeme;
	movq	(%rax), %rdi	 ; token_89->lexeme, import_name
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_92->type
 ; D:\TC\src\parser.c:76:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp401, token
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	jne	.L347	 ;,
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp299
	movq	0(%rbp), %rcx	 ; token_92->lexeme,
	movq	(%rax), %rdx	 ; FROM_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp402
	jne	.L348	 ;,
.L347:
 ; D:\TC\src\parser.c:75:     string source = 0;
	xorl	%esi, %esi	 ; source
	jmp	.L349	 ;
.L348:
 ; D:\TC\src\parser.c:79:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_97->type
 ; D:\TC\src\parser.c:79:         token = get_next_token(lexer, true);
	movq	%rax, %rdx	 ; tmp403, token
 ; D:\TC\src\parser.c:81:         if (token_ptr->type != STRING) {
	je	.L350	 ;,
 ; D:\TC\src\parser.c:82:             parser_error("Expected string literal after 'from'", token);
	leaq	.LC54(%rip), %rcx	 ;, tmp300
.L504:
	call	parser_error	 ;
	jmp	.L346	 ;
.L350:
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:85:         source = token_ptr->lexeme;
	movq	(%rax), %rsi	 ; token_97->lexeme, source
 ; D:\TC\src\parser.c:86:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp404, token
.L349:
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_101->type
	je	.L351	 ;,
.L352:
 ; D:\TC\src\parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp301
	jmp	.L504	 ;
.L351:
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp302
	movq	0(%rbp), %rcx	 ; token_101->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp405
	je	.L352	 ;,
 ; D:\TC\src\parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	%r12, %r8	 ; global_scope,
	movq	%rsi, %rdx	 ; source,
	movq	%rdi, %rcx	 ; import_name,
	call	parse_import_file	 ;
 ; D:\TC\src\parser.c:95:     if (name == 0)
	testq	%rax, %rax	 ; name
	jne	.L353	 ;,
 ; D:\TC\src\parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	%r12, 32(%rsp)	 ; global_scope,
	xorl	%r9d, %r9d	 ;
	movl	$1, %edx	 ;,
	movq	%rdi, %rcx	 ; import_name,
	movq	.refptr.name_void(%rip), %rax	 ;, tmp303
	movq	(%rax), %r8	 ; name_void,
	call	create_name	 ;
.L353:
 ; D:\TC\src\parser.c:97:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%rax, %rcx	 ; name,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp408, _111
 ; D:\TC\src\parser.c:42:             if (import == 0)
	testq	%rax, %rax	 ; _111
	jne	.L354	 ;,
.L346:
 ; D:\TC\src\parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC56(%rip), %rcx	 ;, tmp304
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _111
.L354:
 ; D:\TC\src\parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	jmp	.L514	 ;
.L344:
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_33->type
	jne	.L383	 ;,
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp487
	movq	(%rbx), %rcx	 ; token_33->lexeme,
	movq	(%rax), %rdx	 ; FUNC_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; tmp410
	je	.L356	 ;,
 ; D:\TC\src\parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	%r12, %rcx	 ; global_scope,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	%rax, %r15	 ; tmp411, function_scope
 ; D:\TC\src\parser.c:106:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp412, token
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_114->type, _115
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _115
	je	.L357	 ;,
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _115
	je	.L358	 ;,
.L360:
 ; D:\TC\src\parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC57(%rip), %rcx	 ;, tmp306
	jmp	.L508	 ;
.L358:
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%rbp), %rcx	 ; token_114->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp413
	je	.L360	 ;,
.L357:
 ; D:\TC\src\parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	0(%rbp), %rdx	 ; token_114->lexeme,
	movq	%r12, %rcx	 ; global_scope,
	call	search	 ;
 ; D:\TC\src\parser.c:116:         parser_error("Unknown function return type", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp307
 ; D:\TC\src\parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rdi	 ; tmp414, return_type
 ; D:\TC\src\parser.c:113:     if (return_type == 0)
	testq	%rax, %rax	 ; return_type
	je	.L508	 ;,
 ; D:\TC\src\parser.c:119:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_120->type
	je	.L362	 ;,
 ; D:\TC\src\parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp308
.L508:
	call	parser_error	 ;
	jmp	.L359	 ;
.L362:
 ; D:\TC\src\parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	%r12, 32(%rsp)	 ; global_scope,
	movq	(%rax), %rcx	 ; token_120->lexeme,
	xorl	%r9d, %r9d	 ;
	movq	%rdi, %r8	 ; return_type,
	movl	$2, %edx	 ;,
	call	create_name	 ;
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	%rax, 80(%rsp)	 ; tmp416, %sfp
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_124->type
 ; D:\TC\src\parser.c:126:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp417, token
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L363	 ;,
.L364:
 ; D:\TC\src\parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp309
	jmp	.L508	 ;
.L363:
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp310
	movq	0(%rbp), %rcx	 ; token_124->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp418
	je	.L364	 ;,
 ; D:\TC\src\parser.c:132:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:140:             parser_error("Function parameters cannot have default values", token);
	leaq	.LC62(%rip), %r13	 ;, tmp373
 ; D:\TC\src\parser.c:132:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp419, token
 ; D:\TC\src\parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movq	%rax, 56(%rsp)	 ; tmp420, %sfp
.L365:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_132->type
	je	.L515	 ;,
.L373:
 ; D:\TC\src\parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r15, %rdx	 ; function_scope,
	movq	%r14, %r8	 ; parser,
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp421, parameter
 ; D:\TC\src\parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	jne	.L366	 ;,
 ; D:\TC\src\parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;,
	jmp	.L505	 ;
.L366:
 ; D:\TC\src\parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_131->value
	je	.L368	 ;,
 ; D:\TC\src\parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%rbp, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp373,
.L505:
	call	parser_error	 ;
	jmp	.L367	 ;
.L368:
 ; D:\TC\src\parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	56(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L367:
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_134->type
 ; D:\TC\src\parser.c:143:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp422, token
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L369	 ;,
.L372:
 ; D:\TC\src\parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp313
	jmp	.L508	 ;
.L369:
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp314
	movq	0(%rbp), %rcx	 ; token_134->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp423
	je	.L370	 ;,
 ; D:\TC\src\parser.c:146:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp424, token
 ; D:\TC\src\parser.c:147:             token_ptr = token;
	jmp	.L365	 ;
.L370:
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_134->type
	jne	.L372	 ;,
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp315
	movq	0(%rbp), %rcx	 ; token_134->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp425
	jne	.L365	 ;,
	jmp	.L372	 ;
.L515:
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp488
	movq	0(%rbp), %rcx	 ; token_132->lexeme,
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp426
	je	.L373	 ;,
 ; D:\TC\src\parser.c:153:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_149->type
 ; D:\TC\src\parser.c:153:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp427, token
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L374	 ;,
.L375:
 ; D:\TC\src\parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp317
	jmp	.L508	 ;
.L374:
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp318
	movq	0(%rbp), %rcx	 ; token_149->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp428
	je	.L375	 ;,
 ; D:\TC\src\parser.c:159:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:160:     parser->in_function = true;
	movb	$1, (%r14)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:159:     list(Statement*) body = create_list();
	movq	%rax, 72(%rsp)	 ; tmp429, %sfp
.L507:
 ; D:\TC\src\parser.c:173:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_157->type
 ; D:\TC\src\parser.c:173:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp432, token
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	je	.L516	 ;,
.L380:
 ; D:\TC\src\parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r15, %rdx	 ; function_scope,
	movq	%r14, %r8	 ; parser,
	call	parse_statement	 ;
 ; D:\TC\src\parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%rax, %rbp	 ; tmp431, statement
 ; D:\TC\src\parser.c:166:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	je	.L506	 ;,
 ; D:\TC\src\parser.c:168:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	je	.L378	 ;,
 ; D:\TC\src\parser.c:169:             parser_error("Unreachable code after return statement", token);
	leaq	.LC66(%rip), %rcx	 ;,
.L506:
	call	parser_error	 ;
.L378:
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:171:             have_return = true;
	cmpl	$5, 8(%rbp)	 ;, statement_156->type
	movb	$1, %al	 ;, tmp364
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	movq	%rbp, %rdx	 ; statement,
 ; D:\TC\src\parser.c:171:             have_return = true;
	cmove	%eax, %esi	 ; have_return,, tmp364, have_return
 ; D:\TC\src\parser.c:172:         list_append(body, (pointer)statement);
	call	list_append	 ;
	jmp	.L507	 ;
.L516:
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp489
	movq	0(%r13), %rcx	 ; token_157->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp433
	je	.L380	 ;,
 ; D:\TC\src\parser.c:176:     ((parser))->in_function = false;
	movb	$0, (%r14)	 ;, parser_72(D)->in_function
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L381	 ;,
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp322
 ; D:\TC\src\parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rdi	 ; name_void, return_type
	je	.L381	 ;,
 ; D:\TC\src\parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r13, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;, tmp323
	call	parser_error	 ;
.L381:
 ; D:\TC\src\parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%r15, 32(%rsp)	 ; function_scope,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rdx	 ; return_type,
	movq	72(%rsp), %r9	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_function	 ;
	movq	%rax, %r8	 ; tmp434, _168
 ; D:\TC\src\parser.c:47:             if (function == 0)
	testq	%rax, %rax	 ; _168
	jne	.L382	 ;,
.L359:
 ; D:\TC\src\parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp324
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _168
.L382:
 ; D:\TC\src\parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	jmp	.L514	 ;
.L356:
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%rbx)	 ;, token_33->type
	jne	.L383	 ;,
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rax	 ;, tmp325
	movq	(%rbx), %rcx	 ; token_33->lexeme,
	movq	(%rax), %rdx	 ; CLASS_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp436
	je	.L383	 ;,
 ; D:\TC\src\parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	%r12, %rcx	 ; global_scope,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:277:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	%rax, 56(%rsp)	 ; tmp437, %sfp
 ; D:\TC\src\parser.c:277:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:280:         parser_error("Expected class name after 'class'", token);
	leaq	.LC69(%rip), %rcx	 ;, tmp326
 ; D:\TC\src\parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_173->type
 ; D:\TC\src\parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rdx	 ; token,
 ; D:\TC\src\parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	jne	.L513	 ;,
 ; D:\TC\src\parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	%r12, 32(%rsp)	 ; global_scope,
	movq	(%rax), %rcx	 ; token_173->lexeme,
	xorl	%r8d, %r8d	 ;
	movl	$4, %edx	 ;,
	movq	56(%rsp), %r9	 ; %sfp,
	call	create_name	 ;
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	%rax, 88(%rsp)	 ; tmp439, %sfp
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_177->type
 ; D:\TC\src\parser.c:284:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp440, token
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L386	 ;,
.L387:
 ; D:\TC\src\parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp327
.L513:
	call	parser_error	 ;
	jmp	.L385	 ;
.L386:
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp328
	movq	(%rsi), %rcx	 ; token_177->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp441
	je	.L387	 ;,
 ; D:\TC\src\parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list	 ;
	movq	%rax, 96(%rsp)	 ; tmp442, %sfp
.L422:
 ; D:\TC\src\parser.c:312:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_184->type
 ; D:\TC\src\parser.c:312:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp480, token
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	je	.L517	 ;,
.L426:
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_184->type
	jne	.L389	 ;,
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp490
	movq	(%rsi), %rcx	 ; token_184->lexeme,
	movq	(%rax), %rdx	 ; METHOD_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	 ; tmp444
	je	.L390	 ;,
 ; D:\TC\src\parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	56(%rsp), %rcx	 ; %sfp,
	call	create_scope	 ;
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	88(%rsp), %r8	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movl	$1, %edx	 ;,
	movq	%rax, 32(%rsp)	 ; method_scope,
 ; D:\TC\src\parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	%rax, 72(%rsp)	 ; tmp445, %sfp
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp330
	movq	(%rax), %rcx	 ; SELF_KEYWORD,
	call	create_name	 ;
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	%rax, %rbp	 ; tmp446, self
 ; D:\TC\src\parser.c:189:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp447, token
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	 ; token_213->type, _214
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	 ;, _214
	je	.L391	 ;,
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	 ;, _214
	je	.L392	 ;,
.L394:
 ; D:\TC\src\parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp331
	jmp	.L511	 ;
.L392:
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rdi), %rcx	 ; token_213->lexeme,
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	 ; tmp448
	je	.L394	 ;,
.L391:
 ; D:\TC\src\parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%rdi), %rdx	 ; token_213->lexeme,
	movq	56(%rsp), %rcx	 ; %sfp,
	call	search	 ;
 ; D:\TC\src\parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp332
 ; D:\TC\src\parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, 80(%rsp)	 ; tmp449, %sfp
 ; D:\TC\src\parser.c:196:     if (return_type == 0) {
	testq	%rax, %rax	 ;
	je	.L511	 ;,
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_219->type
	je	.L396	 ;,
 ; D:\TC\src\parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp333
.L511:
	call	parser_error	 ;
	jmp	.L393	 ;
.L396:
 ; D:\TC\src\parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	56(%rsp), %rdi	 ; %sfp, class_scope
	movq	80(%rsp), %r8	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movl	$3, %edx	 ;,
	movq	%rdi, 32(%rsp)	 ; class_scope,
	movq	(%rax), %rcx	 ; token_219->lexeme,
	call	create_name	 ;
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	%rax, 120(%rsp)	 ; tmp451, %sfp
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_223->type
 ; D:\TC\src\parser.c:207:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp452, token
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L397	 ;,
.L398:
 ; D:\TC\src\parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp334
	jmp	.L511	 ;
.L397:
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp335
	movq	(%rdi), %rcx	 ; token_223->lexeme,
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp453
	je	.L398	 ;,
 ; D:\TC\src\parser.c:213:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	 ;, token_228->type
 ; D:\TC\src\parser.c:213:     token = get_next_token(lexer, true);
	movq	%rax, %rdi	 ; tmp454, token
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	je	.L399	 ;,
.L401:
 ; D:\TC\src\parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp336
	call	parser_error	 ;
	jmp	.L400	 ;
.L399:
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp337
	movq	(%rdi), %rcx	 ; token_228->lexeme,
	movq	(%rax), %rdx	 ; SELF_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	testb	%al, %al	 ; tmp455
	je	.L401	 ;,
.L400:
 ; D:\TC\src\parser.c:217:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:234:             parser_error("Method parameters cannot have default values", token);
	leaq	.LC78(%rip), %r13	 ;, tmp380
 ; D:\TC\src\parser.c:217:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp456, token
 ; D:\TC\src\parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	88(%rsp), %rcx	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; self,
 ; D:\TC\src\parser.c:219:     list(Variable*) parameters = create_list();
	movq	%rax, 104(%rsp)	 ; tmp457, %sfp
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	%rax, %rdx	 ; tmp458, _235
 ; D:\TC\src\parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	list_append	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rdi	 ;, tmp378
.L402:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_236->type
	je	.L518	 ;,
.L408:
 ; D:\TC\src\parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%r15, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp339
	jmp	.L511	 ;
.L518:
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rdi), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%r15), %rcx	 ; token_236->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp465
	jne	.L414	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%r15)	 ;, token_236->type
	jne	.L408	 ;,
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp494
	movq	(%r15), %rcx	 ; token_236->lexeme,
	movq	(%rax), %rdx	 ; COMMA_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp459
	je	.L404	 ;,
 ; D:\TC\src\parser.c:223:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r8	 ; parser,
 ; D:\TC\src\parser.c:223:             token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp460, token
 ; D:\TC\src\parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rdx	 ; tmp461, parameter
 ; D:\TC\src\parser.c:231:         if (parameter == 0)
	testq	%rax, %rax	 ; parameter
	jne	.L501	 ;,
 ; D:\TC\src\parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp341
	jmp	.L509	 ;
.L404:
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%r15)	 ;, token_236->type
	jne	.L408	 ;,
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	(%rdi), %rdx	 ; R_PAREN_SYMBOL,
	movq	(%r15), %rcx	 ; token_236->lexeme,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	 ; tmp462
	je	.L408	 ;,
.L414:
 ; D:\TC\src\parser.c:240:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_254->type
 ; D:\TC\src\parser.c:240:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp463, token
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L502	 ;,
	jmp	.L409	 ;
.L501:
 ; D:\TC\src\parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	 ;, parameter_242->value
	je	.L412	 ;,
 ; D:\TC\src\parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rbp, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp380,
.L509:
	call	parser_error	 ;
	jmp	.L411	 ;
.L412:
 ; D:\TC\src\parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	104(%rsp), %rcx	 ; %sfp,
	call	list_append	 ;
.L411:
 ; D:\TC\src\parser.c:237:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %r15	 ; tmp464, token
	jmp	.L402	 ;
.L409:
 ; D:\TC\src\parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rbp, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;, tmp344
	jmp	.L511	 ;
.L502:
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp345
	movq	0(%rbp), %rcx	 ; token_254->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp466
	je	.L409	 ;,
 ; D:\TC\src\parser.c:246:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:247:     ((parser))->in_function = true;
	movw	$257, (%r14)	 ;, MEM <unsigned short> [(char *)parser_72(D)]
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:249:     bool have_return = false;
	xorl	%r13d, %r13d	 ; have_return
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:246:     list(Statement*) body = create_list();
	movq	%rax, 112(%rsp)	 ; tmp467, %sfp
 ; D:\TC\src\parser.c:255:             parser_error("Failed to parse method body statement", token);
	leaq	.LC80(%rip), %r15	 ;, tmp377
 ; D:\TC\src\parser.c:250:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp468, token
.L415:
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rdi)	 ;, token_262->type
	je	.L519	 ;,
.L419:
 ; D:\TC\src\parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r8	 ; parser,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp469, statement
 ; D:\TC\src\parser.c:254:         if (statement == 0)
	testq	%rax, %rax	 ; statement
	jne	.L416	 ;,
 ; D:\TC\src\parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%rdi, %rdx	 ; token,
	movq	%r15, %rcx	 ; tmp377,
	jmp	.L510	 ;
.L416:
 ; D:\TC\src\parser.c:256:         else if (have_return)
	testb	%r13b, %r13b	 ; have_return
	je	.L417	 ;,
 ; D:\TC\src\parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
.L510:
	call	parser_error	 ;
.L417:
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	movq	112(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:259:             have_return = true;
	cmpl	$5, 8(%rbp)	 ;, statement_261->type
	movb	$1, %al	 ;, tmp368
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	movq	%rbp, %rdx	 ; statement,
 ; D:\TC\src\parser.c:259:             have_return = true;
	cmove	%eax, %r13d	 ; have_return,, tmp368, have_return
 ; D:\TC\src\parser.c:260:         list_append(body, (pointer)statement);
	call	list_append	 ;
 ; D:\TC\src\parser.c:261:         token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
	movq	%rax, %rdi	 ; tmp470, token
	jmp	.L415	 ;
.L519:
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp495
	movq	(%rdi), %rcx	 ; token_262->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp471
	je	.L419	 ;,
 ; D:\TC\src\parser.c:264:     ((parser))->in_function = false;
	movw	$0, (%r14)	 ;, MEM <unsigned short> [(char *)parser_72(D)]
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	testb	%r13b, %r13b	 ; have_return
	jne	.L420	 ;,
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp349
 ; D:\TC\src\parser.c:266:     if (!have_return && return_type != name_void)
	movq	80(%rsp), %rdx	 ; %sfp, return_type
	cmpq	(%rax), %rdx	 ; name_void, return_type
	je	.L420	 ;,
 ; D:\TC\src\parser.c:267:         parser_error("Method missing return statement", token);
	movq	%rdi, %rdx	 ; token,
	leaq	.LC81(%rip), %rcx	 ;, tmp350
	call	parser_error	 ;
.L420:
 ; D:\TC\src\parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	72(%rsp), %rax	 ; %sfp, method_scope
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	112(%rsp), %r9	 ; %sfp,
	movq	104(%rsp), %r8	 ; %sfp,
	movq	%rax, 32(%rsp)	 ; method_scope,
	movq	120(%rsp), %rcx	 ; %sfp,
	call	create_method	 ;
	movq	%rax, %rdx	 ; tmp472, _273
 ; D:\TC\src\parser.c:296:             if (method == 0)
	testq	%rax, %rax	 ; _273
	jne	.L421	 ;,
.L393:
 ; D:\TC\src\parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;, tmp351
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _273
.L421:
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp473, _190
 ; D:\TC\src\parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L422	 ;
.L390:
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rsi)	 ;, token_184->type
	jne	.L389	 ;,
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp352
	movq	(%rsi), %rcx	 ; token_184->lexeme,
	movq	(%rax), %rdx	 ; VAR_KEYWORD,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp474
	je	.L389	 ;,
 ; D:\TC\src\parser.c:300:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	48(%rsp), %rcx	 ; %sfp,
	movq	%r14, %r8	 ; parser,
 ; D:\TC\src\parser.c:300:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp475, token
 ; D:\TC\src\parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %r8	 ; tmp476, variable
 ; D:\TC\src\parser.c:303:             if (variable == 0)
	testq	%rax, %rax	 ; variable
	jne	.L423	 ;,
 ; D:\TC\src\parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp353
	movq	%rax, 72(%rsp)	 ; variable, %sfp
	call	parser_error	 ;
	movq	72(%rsp), %r8	 ; %sfp, variable
.L423:
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	96(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rdx	 ; tmp477, _197
 ; D:\TC\src\parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	list_append	 ;
 ; D:\TC\src\parser.c:306:             token = get_next_token(lexer, true);
	movq	48(%rsp), %rcx	 ; %sfp,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_198->type
 ; D:\TC\src\parser.c:306:             token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp478, token
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L424	 ;,
.L425:
 ; D:\TC\src\parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC84(%rip), %rcx	 ;, tmp354
	jmp	.L512	 ;
.L424:
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp355
	movq	(%rsi), %rcx	 ; token_198->lexeme,
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp479
	je	.L425	 ;,
	jmp	.L422	 ;
.L389:
 ; D:\TC\src\parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%rsi, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;,
.L512:
	call	parser_error	 ;
	jmp	.L422	 ;
.L517:
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp498
	movq	(%rsi), %rcx	 ; token_184->lexeme,
	movq	(%rax), %rdx	 ; R_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp481
	je	.L426	 ;,
 ; D:\TC\src\parser.c:315:     return create_class(name, members, class_scope);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_class	 ;
	movq	%rax, %r9	 ; tmp482, _208
 ; D:\TC\src\parser.c:52:             if (class_ == 0)
	testq	%rax, %rax	 ; _208
	jne	.L427	 ;,
.L385:
 ; D:\TC\src\parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp358
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _208
.L427:
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$2, %ecx	 ;,
.L514:
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rdx	 ; tmp483, _30
 ; D:\TC\src\parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	list_append	 ;
 ; D:\TC\src\parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	jmp	.L355	 ;
.L428:
 ; D:\TC\src\parser.c:60:     return create_code(members, global_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:61: }
	addq	$136, %rsp	 ;,
 ; D:\TC\src\parser.c:60:     return create_code(members, global_scope);
	movq	%r12, %rdx	 ; global_scope,
 ; D:\TC\src\parser.c:61: }
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
.L383:
 ; D:\TC\src\parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	%rbx, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;,
	call	parser_error	 ;
	jmp	.L355	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	search;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_name;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_scope;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_function;	.scl	2;	.type	32;	.endef
	.def	create_method;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
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

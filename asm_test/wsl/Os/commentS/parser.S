	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
	pushq	%r12	;
	movq	%rdx, %r12	; tmp92, parser
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp91, now_scope
	pushq	%rbx	;
; src/parser.c:685: Expression* parse_expression(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rdi, %rbx	; tmp90, lexer
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; <retval>
	je	.L5	;,
	movq	%rax, %rdx	; tmp93, <retval>
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, %r8	; parser,
	movq	%rbp, %rcx	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp95, _1
; src/parser.c:695: }
	popq	%rbx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%edx, %edx	;
; src/parser.c:695: }
	popq	%rbp	;
	popq	%r12	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	jmp	parse_expr_prec	;
.L5:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC0(%rip), %rdi	;, tmp88
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp94, _15
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:695: }
	popq	%rbx	;
	xorl	%eax, %eax	;
	popq	%rbp	;
	popq	%r12	;
	ret	
	.size	parse_expression, .-parse_expression
	.section	.rodata.str1.1
.LC1:
	.string	"Expected variable type"
.LC2:
	.string	"Expected a type for variable declaration"
.LC3:
	.string	"Unknown variable type"
.LC4:
	.string	"Expected variable name"
.LC5:
	.string	"Failed to parse variable initializer"
	.text
	.type	parse_variable, @function
parse_variable:
	pushq	%r15	;
	pushq	%r14	;
	movq	%rdx, %r14	; tmp116, parser
	pushq	%r13	;
	movq	%rsi, %r13	; tmp115, now_scope
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdi, %rbx	; tmp114, lexer
	pushq	%r8	;
; src/parser.c:323:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp117, token
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_26->type, _1
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L9	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _1
	jne	.L12	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%rbp), %rdi	; token_26->lexeme,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp118
	je	.L12	;,
.L9:
; src/parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	0(%rbp), %rsi	; token_26->lexeme,
	movq	%r13, %rdi	; now_scope,
	call	*search@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp119, type
; src/parser.c:330:     if (type != 0) {
	testq	%rax, %rax	; type
	je	.L13	;,
; src/parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp108
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	;, type_31->kind
	je	.L14	;,
	jmp	.L34	;
.L13:
; src/parser.c:335:         parser_error("Unknown variable type", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp109
.L34:
	call	*parser_error@GOTPCREL(%rip)	;
.L14:
; src/parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	;, token_36->type
; src/parser.c:336:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp120, token
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	je	.L15	;,
; src/parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp110
	call	*parser_error@GOTPCREL(%rip)	;
.L15:
; src/parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	0(%rbp), %rdi	; token_36->lexeme,
	xorl	%ecx, %ecx	;
	movq	%r13, %r8	; now_scope,
	movq	%r12, %rdx	; type,
	movl	$1, %esi	;,
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:342:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	%rax, %rbp	; tmp121, name
; src/parser.c:342:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_41->type
	je	.L16	;,
.L18:
; src/parser.c:341:     Expression* value = 0;
	xorl	%ebx, %ebx	; value
	jmp	.L17	;
.L16:
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	movq	(%rax), %rdi	; token_41->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; tmp123
	je	.L18	;,
; src/parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movq	%rbx, %rdi	; lexer,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:347:         token = get_next_token(lexer, true);
	movq	%rbx, %rdi	; lexer,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	movq	%r14, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
; src/parser.c:347:         token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp124, token
; src/parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %rbx	; tmp125, value
; src/parser.c:350:         if (value == 0)
	testq	%rax, %rax	; value
	jne	.L17	;,
; src/parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	%r15, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp112
	call	*parser_error@GOTPCREL(%rip)	;
.L17:
; src/parser.c:354: }
	popq	%rcx	;
; src/parser.c:353:     return create_variable(type, name, value);
	movq	%rbx, %rdx	; value,
	movq	%rbp, %rsi	; name,
; src/parser.c:354: }
	popq	%rbx	;
; src/parser.c:353:     return create_variable(type, name, value);
	movq	%r12, %rdi	; type,
; src/parser.c:354: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:353:     return create_variable(type, name, value);
	jmp	*create_variable@GOTPCREL(%rip)	;
.L12:
; src/parser.c:326:         parser_error("Expected variable type", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC1(%rip), %rdi	;, tmp105
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:354: }
	popq	%rdx	;
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.1
.LC6:
	.string	"Failed to parse parenthesized expression"
.LC7:
	.string	"Expected ')' after expression"
.LC8:
	.string	"Failed to parse operand of unary '!'"
.LC9:
	.string	"Failed to parse operand of unary '-'"
.LC10:
	.string	"Expected variable name in variable access"
.LC11:
	.string	"Cannot call undefined variable"
.LC12:
	.string	"Cannot call non-function variable"
.LC13:
	.string	"Failed to parse function call argument"
.LC14:
	.string	"Expected ',' or ')' after function call argument"
.LC15:
	.string	"Failed to parse sequence index"
.LC16:
	.string	"Expected ']' after sequence index"
.LC17:
	.string	"Cannot access attribute without a valid scope"
.LC18:
	.string	"Expected attribute name after '.'"
.LC19:
	.string	"Unknown attribute name"
.LC20:
	.string	"Failed to parse variable access"
.LC21:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	subq	$40, %rsp	;,
; src/parser.c:696: Primary* parse_primary(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rdi, (%rsp)	; tmp227, %sfp
	movq	%rsi, 8(%rsp)	; tmp228, %sfp
	movq	%rdx, 16(%rsp)	; tmp229, %sfp
; src/parser.c:702:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp230, token
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	; token_50->type, _1
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	jne	.L36	;,
; src/parser.c:711:         str_value = token_ptr->lexeme;
	movq	0(%rbp), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:710:         type = PRIM_INTEGER;
	xorl	%r12d, %r12d	; type
	jmp	.L37	;
.L36:
; src/parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	;, _1
	jne	.L38	;,
; src/parser.c:714:         str_value = token_ptr->lexeme;
	movq	0(%rbp), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %r12d	;, type
	jmp	.L37	;
.L38:
; src/parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	;, _1
	jne	.L39	;,
; src/parser.c:717:         str_value = token_ptr->lexeme;
	movq	0(%rbp), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:716:         type = PRIM_STRING;
	movl	$2, %r12d	;, type
	jmp	.L37	;
.L39:
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _1
	jne	.L40	;,
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	movq	0(%rbp), %rdi	; token_50->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp231
	je	.L41	;,
; src/parser.c:720:         str_value = token_ptr->lexeme;
	movq	0(%rbp), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:719:         type = PRIM_TRUE;
	movl	$3, %r12d	;, type
; src/parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L37	;
.L41:
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	;, token_50->type
	jne	.L40	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	movq	0(%rbp), %rdi	; token_50->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp232
	je	.L40	;,
; src/parser.c:723:         str_value = token_ptr->lexeme;
	movq	0(%rbp), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:722:         type = PRIM_FALSE;
	movl	$4, %r12d	;, type
; src/parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L37	;
.L40:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_50->type
	jne	.L50	;,
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	0(%rbp), %rdi	; token_50->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp233
	je	.L43	;,
; src/parser.c:726:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	16(%rsp), %rdx	; %sfp,
; src/parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp234, token
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
; src/parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC6(%rip), %rdi	;, tmp185
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%rax, %rbp	; tmp235, expr_value
; src/parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	; expr_value
	je	.L134	;,
; src/parser.c:733:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %r12d	; token_63->type, type
; src/parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp236, token
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %r12d	;, type
	je	.L46	;,
.L48:
; src/parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC7(%rip), %rdi	;, tmp186
	jmp	.L134	;
.L46:
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_63->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp237
	je	.L48	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
	jmp	.L37	;
.L43:
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_50->type
	jne	.L50	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	movq	0(%rbp), %rdi	; token_50->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp238
	je	.L49	;,
; src/parser.c:741:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	16(%rsp), %rdx	; %sfp,
; src/parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp239, token
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC8(%rip), %rdi	;, tmp189
; src/parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	jne	.L135	;,
	jmp	.L134	;
.L49:
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_50->type
	jne	.L50	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	movq	0(%rbp), %rdi	; token_50->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp241
	je	.L50	;,
; src/parser.c:750:         token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	movq	16(%rsp), %rdx	; %sfp,
; src/parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp242, token
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
; src/parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC9(%rip), %rdi	;, tmp191
; src/parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	jne	.L136	;,
	jmp	.L134	;
.L50:
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rbp), %eax	; token_50->type, _26
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, _26
	je	.L54	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	;, _26
	jne	.L53	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	0(%rbp), %rdi	; token_50->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	; tmp245
	je	.L53	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	16(%rsp), %rax	; %sfp, parser
	cmpb	$0, 1(%rax)	;, parser_59(D)->in_method
	je	.L53	;,
.L54:
; src/parser.c:774:     Token* token = peek_current_token(lexer);
	movq	(%rsp), %rdi	; %sfp,
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp244, token
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	; token_89->type, _90
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _90
	je	.L52	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _90
	je	.L55	;,
.L57:
; src/parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC10(%rip), %rdi	;, tmp193
.L133:
; src/parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	call	*parser_error@GOTPCREL(%rip)	;
.L56:
; src/parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC20(%rip), %rdi	;, tmp223
.L134:
; src/parser.c:765:         parser_error("Unexpected token in primary expression", token);
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:769: }
	addq	$40, %rsp	;,
	xorl	%eax, %eax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
.L135:
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %r12d	;, type
	jmp	.L37	;
.L136:
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%ebx, %ebx	; base
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %r12d	;, type
.L37:
; src/parser.c:769: }
	addq	$40, %rsp	;,
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rbx, %r8	; base,
	movq	%rbp, %rdx	; expr_value,
	movl	%r12d, %edi	; type,
; src/parser.c:769: }
	popq	%rbx	;
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%rax, %rcx	; prim_value,
; src/parser.c:769: }
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	jmp	*create_primary@GOTPCREL(%rip)	;
.L55:
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	(%rbx), %rdi	; token_89->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; tmp246
	je	.L57	;,
.L52:
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rsi	; token_89->lexeme,
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:782:     Scope* var_scope = 0;
	xorl	%r14d, %r14d	; var_scope
; src/parser.c:780:     Name* current_type = 0;
	xorl	%r13d, %r13d	; current_type
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	call	*search@GOTPCREL(%rip)	;
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movq	%rax, %rdx	; base_name,
	xorl	%edi, %edi	;
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	%rax, %r12	; tmp247, base_name
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:786:     token = peek_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	%rax, %rbx	; tmp248, base
; src/parser.c:786:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp249, token_ptr
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	jmp	.L58	;
.L82:
; src/parser.c:789:         if (base_name != 0) {
	testq	%r12, %r12	; base_name
	jne	.L137	;,
.L59:
; src/parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%r14, %r14	; var_scope
	je	.L138	;,
.L62:
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%r15), %rdi	; token_ptr_115->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp250
	jne	.L139	;,
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	movq	(%r15), %rdi	; token_ptr_115->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp261
	je	.L74	;,
; src/parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:834:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
; src/parser.c:834:             token = get_next_token(lexer, true);
	movq	%rax, 24(%rsp)	; tmp262, %sfp
; src/parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r15	; tmp263, index
; src/parser.c:837:             if (index == 0)
	testq	%rax, %rax	; index
	jne	.L75	;,
; src/parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	24(%rsp), %rsi	; %sfp,
	leaq	.LC15(%rip), %rdi	;, tmp216
	call	*parser_error@GOTPCREL(%rip)	;
.L75:
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_148->type
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	%rax, %rdx	; tmp264, token
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L77	;,
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	movq	(%rax), %rdi	; token_148->lexeme,
	movq	%rax, 24(%rsp)	; token, %sfp
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	24(%rsp), %rdx	; %sfp, token
	testb	%al, %al	; tmp265
	je	.L77	;,
; src/parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	%rbx, %rsi	; base,
	xorl	%r8d, %r8d	;
	movq	%r15, %rcx	; index,
	xorl	%edx, %edx	;
	movl	$3, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp266, base
.L73:
; src/parser.c:869:         token = peek_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp271, token_ptr
.L58:
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%r15)	;, token_ptr_115->type
	je	.L82	;,
	jmp	.L83	;
.L137:
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%r12), %eax	; base_name_98->kind, _99
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %edx	;, tmp195
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %edx	;, tmp195
	jbe	.L89	;,
	cmpl	$5, %eax	;, _99
	jne	.L60	;,
.L89:
; src/parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%r12), %r13	; base_name_98->info.type, current_type
	jmp	.L59	;
.L60:
; src/parser.c:794:                 current_type = base_name;
	andl	$-5, %eax	;, _99
	cmove	%r12, %r13	; current_type,, base_name, current_type
	jmp	.L59	;
.L138:
; src/parser.c:796:         if (var_scope == 0 && current_type != 0) {
	testq	%r13, %r13	; current_type
	je	.L62	;,
; src/parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%r13)	;, current_type_109->kind
	jne	.L62	;,
; src/parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%r13), %r14	; current_type_109->info.scope, var_scope
	jmp	.L62	;
.L139:
; src/parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp251, token
; src/parser.c:804:             if (base_name == 0)
	testq	%r12, %r12	; base_name
	jne	.L64	;,
; src/parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rsi	; token,
	leaq	.LC11(%rip), %rdi	;, tmp206
	call	*parser_error@GOTPCREL(%rip)	;
.L64:
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movl	24(%r12), %eax	; base_name_98->kind, tmp274
	subl	$2, %eax	;, tmp207
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %eax	;, tmp207
	jbe	.L65	;,
; src/parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%r13, %rsi	; token,
	leaq	.LC12(%rip), %rdi	;, tmp209
	call	*parser_error@GOTPCREL(%rip)	;
.L65:
; src/parser.c:809:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:815:                     parser_error("Failed to parse function call argument", token);
	leaq	.LC13(%rip), %r14	;, tmp226
; src/parser.c:809:             token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp252, token
; src/parser.c:811:             list(Expression*) args = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, %r15	; tmp253, args
.L66:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_124->type
	je	.L140	;,
.L72:
; src/parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	(%rsp), %rdi	; %sfp,
	call	parse_expression	;
; src/parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	; arg
	jne	.L67	;,
	movq	%rax, 24(%rsp)	; arg, %sfp
; src/parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%r13, %rsi	; token,
	movq	%r14, %rdi	; tmp226,
	call	*parser_error@GOTPCREL(%rip)	;
	movq	24(%rsp), %rax	; %sfp, arg
.L67:
; src/parser.c:816:                 list_append(args, (pointer)arg);
	movq	%rax, %rsi	; arg,
	movq	%r15, %rdi	; args,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:817:                 token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_125->type
; src/parser.c:817:                 token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp255, token
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L68	;,
.L71:
; src/parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%r13, %rsi	; token,
	leaq	.LC14(%rip), %rdi	;, tmp211
	jmp	.L133	;
.L68:
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movq	(%rax), %rdi	; token_125->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp256
	je	.L69	;,
; src/parser.c:820:                     token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp257, token
; src/parser.c:821:                     token_ptr = token;
	jmp	.L66	;
.L69:
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_125->type
	jne	.L71	;,
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_125->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp258
	jne	.L66	;,
	jmp	.L71	;
.L140:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_124->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp259
	je	.L72	;,
; src/parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rbx, %rsi	; base,
	movq	%r15, %r8	; args,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$1, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
; src/parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%r12), %r12	; base_name_98->info.type, base_name
; src/parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %rbx	; tmp260, base
	jmp	.L132	;
.L77:
; src/parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%rdx, %rsi	; token,
	leaq	.LC16(%rip), %rdi	;, tmp217
	jmp	.L133	;
.L74:
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	movq	(%r15), %rdi	; token_ptr_115->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; tmp267
	jne	.L78	;,
.L83:
; src/parser.c:760:         if (variable_value == 0) {
	testq	%rbx, %rbx	; base
	je	.L56	;,
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%eax, %eax	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%ebp, %ebp	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %r12d	;, type
	jmp	.L37	;
.L78:
; src/parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:849:             token = get_next_token(lexer, true);
	movq	(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp268, token
; src/parser.c:851:             if (var_scope == 0) {
	testq	%r14, %r14	; var_scope
	jne	.L79	;,
; src/parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rsi	; token,
	leaq	.LC17(%rip), %rdi	;, tmp220
	jmp	.L133	;
.L79:
; src/parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_158->type
	je	.L80	;,
; src/parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC18(%rip), %rdi	;, tmp221
	jmp	.L133	;
.L80:
; src/parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rsi	; token_158->lexeme,
	movq	%r14, %rdi	; var_scope,
	call	*search@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp269, base_name
; src/parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	; base_name
	jne	.L81	;,
; src/parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%r13, %rsi	; token,
	leaq	.LC19(%rip), %rdi	;, tmp222
	jmp	.L133	;
.L81:
; src/parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rbx, %rsi	; base,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%rax, %rdx	; base_name,
	movl	$2, %edi	;,
	call	*create_variable_access@GOTPCREL(%rip)	;
	movq	%rax, %rbx	; tmp270, base
.L132:
; src/parser.c:866:             var_scope = 0;
	xorl	%r14d, %r14d	; var_scope
; src/parser.c:865:             current_type = 0;
	xorl	%r13d, %r13d	; current_type
	jmp	.L73	;
.L53:
; src/parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC21(%rip), %rdi	;, tmp224
	jmp	.L134	;
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC22:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
	pushq	%r15	;
	movl	%edx, %r15d	; tmp119, min_prec
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp118, expr_left
; src/parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
; src/parser.c:641: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
	subq	$40, %rsp	;,
; src/parser.c:641: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
	movq	%rdi, 8(%rsp)	; tmp117, %sfp
	movq	%rcx, 16(%rsp)	; tmp120, %sfp
	movq	%r8, 24(%rsp)	; tmp121, %sfp
.L160:
; src/parser.c:678:         token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_ptr_13->type
	jne	.L154	;,
; src/parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rdi	; token_ptr_13->lexeme,
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %r12d	; tmp123, op
; src/parser.c:651:         int op_prec = operator_precedence(op);
	movl	%eax, %edi	; op,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, %r13d	; tmp124, op_prec
; src/parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	;, op
	je	.L154	;,
	cmpl	%r15d, %eax	; min_prec, op_prec
	jge	.L143	;,
.L154:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	8(%rsp), %rdi	; %sfp,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:683:     return expr_left;
	jmp	.L141	;
.L143:
; src/parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:656:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	24(%rsp), %rdx	; %sfp,
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:656:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp125, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp126, right_primary
; src/parser.c:659:         if (right_primary == 0) {
	testq	%rax, %rax	; right_primary
	jne	.L146	;,
; src/parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC22(%rip), %rdi	;, tmp111
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:661:             return NULL;
	jmp	.L147	;
.L146:
; src/parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	*create_expression@GOTPCREL(%rip)	;
	movq	%rax, %rbp	; tmp127, right
.L159:
; src/parser.c:674:             token = peek_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_ptr_12->type
	jne	.L152	;,
; src/parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rdi	; token_ptr_12->lexeme,
	call	*string_to_operator@GOTPCREL(%rip)	;
	movl	%eax, %r14d	; tmp129, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %edi	; next_op,
	call	*operator_precedence@GOTPCREL(%rip)	;
	movl	%eax, %edx	; tmp130, next_prec
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r14d	;, next_op
	je	.L152	;,
	cmpl	%eax, %r13d	; next_prec, op_prec
	jl	.L149	;,
.L152:
; src/parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbx, %rsi	; <retval>,
	movl	%r12d, %edi	; op,
	movq	%rbp, %rcx	; right,
	xorl	%edx, %edx	;
	call	*create_expression@GOTPCREL(%rip)	;
; src/parser.c:678:         token = peek_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %rbx	; tmp131, <retval>
	jmp	.L160	;
.L149:
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	24(%rsp), %r8	; %sfp,
	movq	16(%rsp), %rcx	; %sfp,
	movq	%rbp, %rsi	; right,
	movq	8(%rsp), %rdi	; %sfp,
	call	parse_expr_prec	;
	movq	%rax, %rbp	; tmp133, right
; src/parser.c:672:             if (right == 0)
	testq	%rax, %rax	; right
	jne	.L159	;,
.L147:
; src/parser.c:661:             return NULL;
	xorl	%ebx, %ebx	; <retval>
.L141:
; src/parser.c:684: }
	addq	$40, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.1
.LC23:
	.string	"Expected '(' after 'if'"
.LC24:
	.string	"Failed to parse if condition"
.LC25:
	.string	"Expected ')' after if condition"
.LC26:
	.string	"Expected '{' to start if body"
.LC27:
	.string	"Failed to parse if body statement"
.LC28:
	.string	"Expected '(' after 'elif'"
.LC29:
	.string	"Failed to parse else-if condition"
.LC30:
	.string	"Expected ')' after else-if condition"
.LC31:
	.string	"Expected '{' to start else-if body"
.LC32:
	.string	"Failed to parse else-if body statement"
.LC33:
	.string	"Expected '{' to start else body"
.LC34:
	.string	"Failed to parse else body statement"
.LC35:
	.string	"Expected '(' after 'for'"
.LC36:
	.string	"Failed to parse for loop initializer"
.LC37:
	.string	"Expected ';' after for loop initializer"
.LC38:
	.string	"Failed to parse for loop condition"
.LC39:
	.string	"Expected ';' after for loop condition"
.LC40:
	.string	"Failed to parse for loop increment"
.LC41:
	.string	"Expected ')' after for loop increment"
.LC42:
	.string	"Expected '{' to start for loop body"
.LC43:
	.string	"Failed to parse for loop body statement"
.LC44:
	.string	"Expected '(' after 'while'"
.LC45:
	.string	"Failed to parse while condition"
.LC46:
	.string	"Expected ')' after while condition"
.LC47:
	.string	"Expected '{' to start while body"
.LC48:
	.string	"Failed to parse while body statement"
.LC49:
	.string	"Cannot use 'break' outside of a loop"
.LC50:
	.string	"Cannot use 'continue' outside of a loop"
.LC51:
	.string	"Failed to parse statement"
.LC52:
	.string	"Expected ';' after statement"
	.text
	.type	parse_statement, @function
parse_statement:
	pushq	%r15	;
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rdx, %rbx	; tmp338, parser
	subq	$72, %rsp	;,
; src/parser.c:355: Statement* parse_statement(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rdi, 8(%rsp)	; tmp336, %sfp
	movq	%rsi, 16(%rsp)	; tmp337, %sfp
; src/parser.c:361:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	;, token_47->type
	jne	.L162	;,
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	IF_KEYWORD(%rip), %rsi	; IF_KEYWORD,
	movq	(%rax), %rdi	; token_47->lexeme,
	movq	%rax, %rbp	; tmp339, token
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	; tmp340
	je	.L163	;,
; src/parser.c:413:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_93->type
; src/parser.c:413:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp341, token
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L164	;,
.L166:
; src/parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC23(%rip), %rdi	;, tmp267
	jmp	.L331	;
.L164:
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_93->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp342
	je	.L166	;,
; src/parser.c:419:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
; src/parser.c:419:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp343, token
; src/parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %rbp	; tmp344, condition
; src/parser.c:422:     if (condition == 0)
	testq	%rax, %rax	; condition
	jne	.L167	;,
; src/parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%r12, %rsi	; token,
	leaq	.LC24(%rip), %rdi	;, tmp269
	call	*parser_error@GOTPCREL(%rip)	;
.L167:
; src/parser.c:424:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_100->type
; src/parser.c:424:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp345, token
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L168	;,
.L169:
; src/parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%r12, %rsi	; token,
	leaq	.LC25(%rip), %rdi	;, tmp270
.L331:
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:417:         return NULL;
	xorl	%esi, %esi	; _177
	jmp	.L191	;
.L168:
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_100->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp346
	je	.L169	;,
; src/parser.c:430:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_105->type
; src/parser.c:430:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp347, token
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L170	;,
.L171:
; src/parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%r12, %rsi	; token,
	leaq	.LC26(%rip), %rdi	;, tmp272
	jmp	.L331	;
.L170:
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_105->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp348
	je	.L171	;,
; src/parser.c:436:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:437:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:442:             parser_error("Failed to parse if body statement", token);
	leaq	.LC27(%rip), %r12	;, tmp333
; src/parser.c:436:     list(Statement*) body = create_list();
	movq	%rax, 24(%rsp)	; tmp349, %sfp
; src/parser.c:437:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp350, token
.L172:
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_113->type
	je	.L337	;,
.L174:
; src/parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r14	; tmp351, statement
; src/parser.c:441:         if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L173	;,
; src/parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r13, %rsi	; token,
	movq	%r12, %rdi	; tmp333,
	call	*parser_error@GOTPCREL(%rip)	;
.L173:
; src/parser.c:443:         list_append(body, (pointer)statement);
	movq	24(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:444:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp352, token
	jmp	.L172	;
.L337:
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%r13), %rdi	; token_113->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp353
	je	.L174	;,
; src/parser.c:447:     list(ElseIf*) else_if = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:464:             parser_error("Failed to parse else-if condition", token);
	leaq	.LC29(%rip), %r14	;, tmp332
; src/parser.c:447:     list(ElseIf*) else_if = create_list();
	movq	%rax, 32(%rsp)	; tmp354, %sfp
; src/parser.c:448:     list(Statement*) else_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:449:     token = peek_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:448:     list(Statement*) else_body = create_list();
	movq	%rax, 40(%rsp)	; tmp355, %sfp
; src/parser.c:449:     token = peek_next_token(lexer, true);
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp356, token_ptr
.L175:
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%r12)	;, token_ptr_153->type
	jne	.L187	;,
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	ELIF_KEYWORD(%rip), %rsi	; ELIF_KEYWORD,
	movq	(%r12), %rdi	; token_ptr_153->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; tmp372
	je	.L338	;,
; src/parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:454:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_122->type
; src/parser.c:454:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp357, token
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L176	;,
.L177:
; src/parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%r12, %rsi	; token,
	leaq	.LC28(%rip), %rdi	;, tmp276
	jmp	.L331	;
.L176:
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_122->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp358
	je	.L177	;,
; src/parser.c:460:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
; src/parser.c:460:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp359, token
; src/parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r12	; tmp360, elif_condition
; src/parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	; elif_condition
	jne	.L178	;,
; src/parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%r13, %rsi	; token,
	movq	%r14, %rdi	; tmp332,
	call	*parser_error@GOTPCREL(%rip)	;
.L178:
; src/parser.c:465:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_130->type
; src/parser.c:465:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp361, token
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L179	;,
.L180:
; src/parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC30(%rip), %rdi	;, tmp279
	jmp	.L331	;
.L179:
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_130->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp362
	je	.L180	;,
; src/parser.c:471:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_136->type
; src/parser.c:471:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp363, token
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L181	;,
.L182:
; src/parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC31(%rip), %rdi	;, tmp281
	jmp	.L331	;
.L181:
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_136->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp364
	je	.L182	;,
; src/parser.c:477:         list(Statement*) elif_body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:478:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	leaq	.LC32(%rip), %r15	;, tmp331
; src/parser.c:477:         list(Statement*) elif_body = create_list();
	movq	%rax, 48(%rsp)	; tmp365, %sfp
; src/parser.c:478:         token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp366, token
.L183:
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_145->type
	je	.L339	;,
.L185:
; src/parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
; src/parser.c:482:             if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L184	;,
	movq	%rax, 56(%rsp)	; statement, %sfp
; src/parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%r13, %rsi	; token,
	movq	%r15, %rdi	; tmp331,
	call	*parser_error@GOTPCREL(%rip)	;
	movq	56(%rsp), %rax	; %sfp, statement
.L184:
; src/parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%rax, %rsi	; statement,
	movq	48(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:485:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp368, token
	jmp	.L183	;
.L339:
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%r13), %rdi	; token_145->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp369
	je	.L185	;,
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r12, %rdi	; elif_condition,
	movq	48(%rsp), %rsi	; %sfp,
	call	*create_else_if@GOTPCREL(%rip)	;
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rsi	; tmp370, _151
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:489:         token = peek_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*peek_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp371, token_ptr
	jmp	.L175	;
.L338:
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%r12)	;, token_ptr_153->type
	jne	.L187	;,
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	ELSE_KEYWORD(%rip), %rsi	; ELSE_KEYWORD,
	movq	(%r12), %rdi	; token_ptr_153->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; tmp374
	jne	.L340	;,
.L187:
; src/parser.c:512:     token = peek_current_token(lexer);
	movq	8(%rsp), %rdi	; %sfp,
	call	*peek_current_token@GOTPCREL(%rip)	;
; src/parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	24(%rsp), %rsi	; %sfp,
	movq	40(%rsp), %rcx	; %sfp,
	movq	%rbp, %rdi	; condition,
	movq	32(%rsp), %rdx	; %sfp,
	call	*create_if@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp373, _177
	jmp	.L191	;
.L340:
; src/parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_163->type
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp375, token
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L192	;,
.L193:
; src/parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%r12, %rsi	; token,
	leaq	.LC33(%rip), %rdi	;, tmp287
	jmp	.L331	;
.L192:
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_163->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp376
	je	.L193	;,
; src/parser.c:501:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %r12	;, tmp330
; src/parser.c:501:         token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp377, token
.L194:
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_170->type
	je	.L341	;,
.L196:
; src/parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r14	; tmp378, statement
; src/parser.c:505:             if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L195	;,
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%r13, %rsi	; token,
	movq	%r12, %rdi	; tmp330,
	call	*parser_error@GOTPCREL(%rip)	;
.L195:
; src/parser.c:507:             list_append(else_body, (pointer)statement);
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r14, %rsi	; statement,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:508:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp379, token
	jmp	.L194	;
.L341:
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%r13), %rdi	; token_170->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp380
	je	.L196	;,
	jmp	.L187	;
.L191:
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$2, %edi	;,
	jmp	.L336	;
.L163:
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	FOR_KEYWORD(%rip), %rsi	; FOR_KEYWORD,
	movq	0(%rbp), %rdi	; token_47->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	; tmp381
	je	.L197	;,
; src/parser.c:522:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_178->type
; src/parser.c:522:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp382, token
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L198	;,
.L200:
; src/parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC35(%rip), %rdi	;, tmp292
	jmp	.L332	;
.L198:
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_178->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp383
	je	.L200	;,
; src/parser.c:528:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_183->type
; src/parser.c:528:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp384, token
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L201	;,
.L204:
; src/parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_variable	;
	movq	%rax, %rbp	; tmp385, initializer
; src/parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	; initializer
	jne	.L203	;,
; src/parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%r12, %rsi	; token,
	leaq	.LC36(%rip), %rdi	;, tmp295
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L203	;
.L201:
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_183->lexeme,
; src/parser.c:530:     Variable* initializer = 0;
	xorl	%ebp, %ebp	; initializer
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp386
	jne	.L205	;,
	jmp	.L204	;
.L203:
; src/parser.c:535:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp387, token
.L205:
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%r12)	;, token_190->type
	je	.L206	;,
.L208:
; src/parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%r12, %rsi	; token,
	leaq	.LC37(%rip), %rdi	;, tmp296
.L332:
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:526:         return NULL;
	xorl	%ecx, %ecx	; _237
	jmp	.L207	;
.L206:
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%r12), %rdi	; token_190->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp388
	je	.L208	;,
; src/parser.c:544:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_195->type
; src/parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp389, token
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L209	;,
.L212:
; src/parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
	movq	%rax, %r12	; tmp390, condition
; src/parser.c:549:         if (condition == 0)
	testq	%rax, %rax	; condition
	jne	.L211	;,
; src/parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC38(%rip), %rdi	;, tmp299
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L211	;
.L209:
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_195->lexeme,
; src/parser.c:546:     Expression* condition = 0;
	xorl	%r12d, %r12d	; condition
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp391
	jne	.L213	;,
	jmp	.L212	;
.L211:
; src/parser.c:551:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp392, token
.L213:
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%r13)	;, token_202->type
	je	.L214	;,
.L215:
; src/parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC39(%rip), %rdi	;, tmp300
	jmp	.L332	;
.L214:
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	0(%r13), %rdi	; token_202->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp393
	je	.L215	;,
; src/parser.c:560:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_207->type
; src/parser.c:560:     token = get_next_token(lexer, true);
	movq	%rax, %r14	; tmp394, token
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L216	;,
.L219:
; src/parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
	movq	%rax, %r13	; tmp395, increment
; src/parser.c:565:         if (increment == 0)
	testq	%rax, %rax	; increment
	jne	.L218	;,
; src/parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%r14, %rsi	; token,
	leaq	.LC40(%rip), %rdi	;, tmp303
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L218	;
.L216:
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_207->lexeme,
; src/parser.c:562:     Expression* increment = 0;
	xorl	%r13d, %r13d	; increment
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp396
	jne	.L220	;,
	jmp	.L219	;
.L218:
; src/parser.c:567:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp397, token
.L220:
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%r14)	;, token_214->type
	je	.L221	;,
.L222:
; src/parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%r14, %rsi	; token,
	leaq	.LC41(%rip), %rdi	;, tmp304
	jmp	.L332	;
.L221:
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%r14), %rdi	; token_214->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	; tmp398
	je	.L222	;,
; src/parser.c:576:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_219->type
; src/parser.c:576:     token = get_next_token(lexer, true);
	movq	%rax, %r14	; tmp399, token
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L223	;,
.L224:
; src/parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%r14, %rsi	; token,
	leaq	.LC42(%rip), %rdi	;, tmp306
	jmp	.L332	;
.L223:
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_219->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp400
	je	.L224	;,
; src/parser.c:582:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%rbx)	;, parser_49(D)->in_loop
; src/parser.c:584:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:582:     list(Statement*) body = create_list();
	movq	%rax, 24(%rsp)	; tmp401, %sfp
; src/parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	leaq	.LC43(%rip), %r15	;, tmp334
; src/parser.c:584:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp402, token
.L225:
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_227->type
	je	.L342	;,
.L227:
; src/parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
; src/parser.c:588:         if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L226	;,
	movq	%rax, 32(%rsp)	; statement, %sfp
; src/parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r14, %rsi	; token,
	movq	%r15, %rdi	; tmp334,
	call	*parser_error@GOTPCREL(%rip)	;
	movq	32(%rsp), %rax	; %sfp, statement
.L226:
; src/parser.c:590:         list_append(body, (pointer)statement);
	movq	%rax, %rsi	; statement,
	movq	24(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:591:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp404, token
	jmp	.L225	;
.L342:
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%r14), %rdi	; token_227->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp405
	je	.L227	;,
; src/parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	24(%rsp), %rcx	; %sfp,
; src/parser.c:594:     ((parser))->in_loop = false;
	movb	$0, 2(%rbx)	;, parser_49(D)->in_loop
; src/parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	%r13, %rdx	; increment,
	movq	%r12, %rsi	; condition,
	movq	%rbp, %rdi	; initializer,
	call	*create_for@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp406, _237
.L207:
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$4, %edi	;,
	jmp	.L336	;
.L197:
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	WHILE_KEYWORD(%rip), %rsi	; WHILE_KEYWORD,
	movq	0(%rbp), %rdi	; token_47->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; tmp407
	je	.L228	;,
; src/parser.c:603:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_238->type
; src/parser.c:603:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp408, token
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L229	;,
.L231:
; src/parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC44(%rip), %rdi	;, tmp311
	jmp	.L333	;
.L229:
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_238->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp409
	je	.L231	;,
; src/parser.c:609:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
; src/parser.c:609:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp410, token
; src/parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %rbp	; tmp411, condition
; src/parser.c:612:     if (condition == 0)
	testq	%rax, %rax	; condition
	jne	.L232	;,
; src/parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%r12, %rsi	; token,
	leaq	.LC45(%rip), %rdi	;, tmp313
	call	*parser_error@GOTPCREL(%rip)	;
.L232:
; src/parser.c:614:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_245->type
; src/parser.c:614:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp412, token
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L233	;,
.L235:
; src/parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%r12, %rsi	; token,
	leaq	.LC46(%rip), %rdi	;, tmp314
.L333:
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:607:         return NULL;
	xorl	%edx, %edx	; _265
	jmp	.L234	;
.L233:
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_245->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp413
	je	.L235	;,
; src/parser.c:620:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_250->type
; src/parser.c:620:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp414, token
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L236	;,
.L237:
; src/parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%r12, %rsi	; token,
	leaq	.LC47(%rip), %rdi	;, tmp316
	jmp	.L333	;
.L236:
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_250->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp415
	je	.L237	;,
; src/parser.c:626:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%rbx)	;, parser_49(D)->in_loop
; src/parser.c:628:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:626:     list(Statement*) body = create_list();
	movq	%rax, %r12	; tmp416, body
; src/parser.c:633:             parser_error("Failed to parse while body statement", token);
	leaq	.LC48(%rip), %r13	;, tmp335
; src/parser.c:628:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp417, token
.L238:
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_258->type
	je	.L343	;,
.L240:
; src/parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_statement	;
	movq	%rax, %r15	; tmp418, statement
; src/parser.c:632:         if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L239	;,
; src/parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%r14, %rsi	; token,
	movq	%r13, %rdi	; tmp335,
	call	*parser_error@GOTPCREL(%rip)	;
.L239:
; src/parser.c:634:         list_append(body, (pointer)statement);
	movq	%r15, %rsi	; statement,
	movq	%r12, %rdi	; body,
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:635:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp419, token
	jmp	.L238	;
.L343:
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%r14), %rdi	; token_258->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp420
	je	.L240	;,
; src/parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%rbx)	;, parser_49(D)->in_loop
; src/parser.c:639:     return create_while(condition, body);
	movq	%r12, %rsi	; body,
	movq	%rbp, %rdi	; condition,
	call	*create_while@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp421, _265
.L234:
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$3, %edi	;,
.L336:
; src/parser.c:406: }
	addq	$72, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	*create_statement@GOTPCREL(%rip)	;
.L228:
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	movq	0(%rbp), %rdi	; token_47->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp422
	je	.L241	;,
; src/parser.c:372:             get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_variable	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, %r9	;, tmp423
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	jmp	.L335	;
.L241:
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	RETURN_KEYWORD(%rip), %rsi	; RETURN_KEYWORD,
	movq	0(%rbp), %rdi	; token_47->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; tmp425
	je	.L243	;,
; src/parser.c:375:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp426
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	jmp	.L335	;
.L243:
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	BREAK_KEYWORD(%rip), %rsi	; BREAK_KEYWORD,
	movq	0(%rbp), %rdi	; token_47->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; tmp428
	je	.L244	;,
; src/parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rbx)	;, parser_49(D)->in_loop
; src/parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC49(%rip), %rdi	;, tmp323
; src/parser.c:379:             if (!(((parser))->in_loop))
	je	.L334	;,
; src/parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$6, %edi	;,
	jmp	.L335	;
.L244:
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	CONTINUE_KEYWORD(%rip), %rsi	; CONTINUE_KEYWORD,
	movq	0(%rbp), %rdi	; token_47->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; tmp430
	je	.L162	;,
; src/parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rbx)	;, parser_49(D)->in_loop
	jne	.L248	;,
; src/parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC50(%rip), %rdi	;, tmp325
.L334:
	call	*parser_error@GOTPCREL(%rip)	;
; src/parser.c:383:                 return NULL;
	xorl	%ebx, %ebx	; <retval>
	jmp	.L161	;
.L248:
; src/parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$7, %edi	;,
	jmp	.L335	;
.L162:
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%rbx, %rdx	; parser,
	call	parse_expression	;
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp434
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
.L335:
	call	*create_statement@GOTPCREL(%rip)	;
; src/parser.c:398:     token = peek_current_token(lexer);
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %rbx	; tmp435, <retval>
; src/parser.c:398:     token = peek_current_token(lexer);
	call	*peek_current_token@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp436, token
; src/parser.c:399:     if (statement == 0)
	testq	%rbx, %rbx	; <retval>
	jne	.L250	;,
; src/parser.c:400:         parser_error("Failed to parse statement", token);
	leaq	.LC51(%rip), %rdi	;, tmp326
	call	*parser_error@GOTPCREL(%rip)	;
.L250:
; src/parser.c:401:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_90->type
; src/parser.c:401:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp437, token
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L251	;,
.L253:
; src/parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC52(%rip), %rdi	;, tmp327
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L161	;
.L251:
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_90->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp438
	je	.L253	;,
.L161:
; src/parser.c:406: }
	addq	$72, %rsp	;,
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
	ret	
	.size	parse_statement, .-parse_statement
	.section	.rodata.str1.1
.LC53:
	.string	"Expected identifier after 'import'"
.LC54:
	.string	"Expected string literal after 'from'"
.LC55:
	.string	"Expected ';' at end of import statement"
.LC56:
	.string	"Failed to parse import statement"
.LC57:
	.string	"Expected function return type after 'func'"
.LC58:
	.string	"Unknown function return type"
.LC59:
	.string	"Expected function name after return type"
.LC60:
	.string	"Expected '(' after function name"
.LC61:
	.string	"Failed to parse function parameter"
.LC62:
	.string	"Function parameters cannot have default values"
.LC63:
	.string	"Expected ',' or ')' after function parameter"
.LC64:
	.string	"Expected '{' to start function body"
.LC65:
	.string	"Failed to parse function body statement"
.LC66:
	.string	"Unreachable code after return statement"
.LC67:
	.string	"Function missing return statement"
.LC68:
	.string	"Failed to parse function declaration"
.LC69:
	.string	"Expected class name after 'class'"
.LC70:
	.string	"Expected '{' to start class body"
.LC71:
	.string	"Expected method return type after 'method'"
.LC72:
	.string	"Unknown return type for method"
.LC73:
	.string	"Expected method name after return type"
.LC74:
	.string	"Expected '(' after method name"
.LC75:
	.string	"Expected 'self' as first parameter of method"
.LC76:
	.string	"Expected ',' or ')' after method parameter"
.LC77:
	.string	"Failed to parse method parameter"
.LC78:
	.string	"Method parameters cannot have default values"
.LC79:
	.string	"Expected '{' to start method body"
.LC80:
	.string	"Failed to parse method body statement"
.LC81:
	.string	"Method missing return statement"
.LC82:
	.string	"Failed to parse class method"
.LC83:
	.string	"Failed to parse class variable"
.LC84:
	.string	"Expected ';' after class variable declaration"
.LC85:
	.string	"Unexpected token in class member"
.LC86:
	.string	"Failed to parse class declaration"
.LC87:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
	pushq	%r15	;
	movq	%rdx, %r15	; tmp366, parser
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	movq	%rsi, %rbx	; tmp365, now_scope
	subq	$104, %rsp	;,
; src/parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, builtin_scope(%rip)	;, builtin_scope
; src/parser.c:19: Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rdi, 8(%rsp)	; tmp364, %sfp
; src/parser.c:23:     if (builtin_scope == 0) {
	jne	.L345	;,
; src/parser.c:24:         builtin_scope = create_scope(0);
	xorl	%edi, %edi	;
	call	*create_scope@GOTPCREL(%rip)	;
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	VOID_KEYWORD(%rip), %rdi	; VOID_KEYWORD,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, %r8	; tmp367, _2
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%esi, %esi	;
; src/parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	INT_KEYWORD(%rip), %rdi	; INT_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; tmp368, name_void
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	FLOAT_KEYWORD(%rip), %rdi	; FLOAT_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; tmp369, name_int
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	STRING_KEYWORD(%rip), %rdi	; STRING_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; tmp370, name_float
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; tmp371, name_string
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	BOOL_KEYWORD(%rip), %rdi	; BOOL_KEYWORD,
	xorl	%esi, %esi	;
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; tmp372, name_bool
.L345:
; src/parser.c:31:     if (now_scope == 0)
	testq	%rbx, %rbx	; now_scope
	jne	.L346	;,
; src/parser.c:32:         now_scope = builtin_scope;
	movq	builtin_scope(%rip), %rbx	; builtin_scope, now_scope
.L346:
; src/parser.c:35:     list(CodeMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rbx, %rdi	; now_scope,
; src/parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 32(%rsp)	; tmp373, %sfp
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	call	*create_scope@GOTPCREL(%rip)	;
	movq	%rax, 16(%rsp)	; tmp374, %sfp
.L360:
; src/parser.c:57:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r14	; tmp461, token
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L433	;,
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movl	24(%rax), %eax	; token_33->type, _31
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	; _31
	je	.L433	;,
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _31
	jne	.L388	;,
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	IMPORT_KEYWORD(%rip), %rsi	; IMPORT_KEYWORD,
	movq	(%r14), %rdi	; token_33->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
	movl	%eax, %ebx	; tmp376, have_return
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; have_return
	je	.L349	;,
; src/parser.c:68:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:71:         parser_error("Expected identifier after 'import'", token);
	leaq	.LC53(%rip), %rdi	;, tmp286
; src/parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_89->type
; src/parser.c:68:     token = get_next_token(lexer, true);
	movq	%rax, %rsi	; tmp377, token
; src/parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	jne	.L509	;,
; src/parser.c:74:     string import_name = token_ptr->lexeme;
	movq	(%rax), %rbp	; token_89->lexeme, import_name
; src/parser.c:76:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_92->type
; src/parser.c:76:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp378, token
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	jne	.L352	;,
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	FROM_KEYWORD(%rip), %rsi	; FROM_KEYWORD,
	movq	(%rax), %rdi	; token_92->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; tmp379
	jne	.L353	;,
.L352:
; src/parser.c:75:     string source = 0;
	xorl	%ebx, %ebx	; source
	jmp	.L354	;
.L353:
; src/parser.c:79:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	8(%rsp), %rdi	; %sfp,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:81:         if (token_ptr->type != STRING) {
	cmpl	$4, 24(%rax)	;, token_97->type
; src/parser.c:79:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	; tmp380, token
; src/parser.c:81:         if (token_ptr->type != STRING) {
	je	.L355	;,
; src/parser.c:82:             parser_error("Expected string literal after 'from'", token);
	leaq	.LC54(%rip), %rdi	;, tmp288
.L509:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L351	;
.L355:
; src/parser.c:85:         source = token_ptr->lexeme;
	movq	(%rax), %rbx	; token_97->lexeme, source
; src/parser.c:86:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp381, token
.L354:
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_101->type
	je	.L356	;,
.L357:
; src/parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%r12, %rsi	; token,
	leaq	.LC55(%rip), %rdi	;, tmp289
	jmp	.L509	;
.L356:
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%r12), %rdi	; token_101->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp382
	je	.L357	;,
; src/parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	16(%rsp), %rdx	; %sfp,
	movq	%rbx, %rsi	; source,
	movq	%rbp, %rdi	; import_name,
	call	*parse_import_file@GOTPCREL(%rip)	;
; src/parser.c:95:     if (name == 0)
	testq	%rax, %rax	; name
	jne	.L358	;,
; src/parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	16(%rsp), %r8	; %sfp,
	xorl	%ecx, %ecx	;
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; import_name,
	movq	name_void(%rip), %rdx	; name_void,
	call	*create_name@GOTPCREL(%rip)	;
.L358:
; src/parser.c:97:     return create_import(name, source);
	movq	%rbx, %rsi	; source,
	movq	%rax, %rdi	; name,
	call	*create_import@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp385, _111
; src/parser.c:42:             if (import == 0)
	testq	%rax, %rax	; _111
	jne	.L359	;,
.L351:
; src/parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	%r14, %rsi	; token,
	leaq	.LC56(%rip), %rdi	;, tmp292
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%esi, %esi	; _111
.L359:
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%edi, %edi	;
	jmp	.L519	;
.L349:
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r14)	;, token_33->type
	jne	.L388	;,
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	FUNC_KEYWORD(%rip), %rsi	; FUNC_KEYWORD,
	movq	(%r14), %rdi	; token_33->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; tmp387
	je	.L361	;,
; src/parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_scope@GOTPCREL(%rip)	;
; src/parser.c:106:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	%rax, 24(%rsp)	; tmp388, %sfp
; src/parser.c:106:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp389, token
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_114->type, _115
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _115
	je	.L362	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _115
	je	.L363	;,
.L365:
; src/parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%r13, %rsi	; token,
	leaq	.LC57(%rip), %rdi	;, tmp294
	jmp	.L513	;
.L363:
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%r13), %rdi	; token_114->lexeme,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp390
	je	.L365	;,
.L362:
; src/parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	0(%r13), %rsi	; token_114->lexeme,
	movq	16(%rsp), %rdi	; %sfp,
	call	*search@GOTPCREL(%rip)	;
; src/parser.c:116:         parser_error("Unknown function return type", token);
	movq	%r13, %rsi	; token,
	leaq	.LC58(%rip), %rdi	;, tmp295
; src/parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, %rbp	; tmp391, return_type
; src/parser.c:113:     if (return_type == 0)
	testq	%rax, %rax	; return_type
	je	.L513	;,
; src/parser.c:119:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_120->type
	je	.L367	;,
; src/parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rsi	; token,
	leaq	.LC59(%rip), %rdi	;, tmp296
.L513:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L364	;
.L367:
; src/parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	xorl	%ecx, %ecx	;
	movq	16(%rsp), %r8	; %sfp,
	movq	(%rax), %rdi	; token_120->lexeme,
	movq	%rbp, %rdx	; return_type,
	movl	$2, %esi	;,
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:126:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	%rax, 56(%rsp)	; tmp393, %sfp
; src/parser.c:126:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_124->type
; src/parser.c:126:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp394, token
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L368	;,
.L369:
; src/parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%r13, %rsi	; token,
	leaq	.LC60(%rip), %rdi	;, tmp297
	jmp	.L513	;
.L368:
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_124->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp395
	je	.L369	;,
; src/parser.c:132:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:140:             parser_error("Function parameters cannot have default values", token);
	leaq	.LC62(%rip), %r12	;, tmp359
; src/parser.c:132:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp396, token
; src/parser.c:134:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 40(%rsp)	; tmp397, %sfp
.L370:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_132->type
	je	.L520	;,
.L378:
; src/parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rdx	; parser,
	call	parse_variable	;
	movq	%rax, %rsi	; tmp398, parameter
; src/parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	; parameter
	jne	.L371	;,
; src/parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%r13, %rsi	; token,
	leaq	.LC61(%rip), %rdi	;, tmp299
	jmp	.L510	;
.L371:
; src/parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	;, parameter_131->value
	je	.L373	;,
; src/parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%r13, %rsi	; token,
	movq	%r12, %rdi	; tmp359,
.L510:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L372	;
.L373:
; src/parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	40(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
.L372:
; src/parser.c:143:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_134->type
; src/parser.c:143:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp399, token
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L374	;,
.L377:
; src/parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%r13, %rsi	; token,
	leaq	.LC63(%rip), %rdi	;, tmp301
	jmp	.L513	;
.L374:
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movq	(%rax), %rdi	; token_134->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp400
	je	.L375	;,
; src/parser.c:146:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp401, token
; src/parser.c:147:             token_ptr = token;
	jmp	.L370	;
.L375:
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_134->type
	jne	.L377	;,
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_134->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp402
	jne	.L370	;,
	jmp	.L377	;
.L520:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_132->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp403
	je	.L378	;,
; src/parser.c:153:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_149->type
; src/parser.c:153:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp404, token
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L379	;,
.L380:
; src/parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC64(%rip), %rdi	;, tmp305
	jmp	.L513	;
.L379:
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_149->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp405
	je	.L380	;,
; src/parser.c:159:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:160:     parser->in_function = true;
	movb	$1, (%r15)	;, parser_72(D)->in_function
; src/parser.c:159:     list(Statement*) body = create_list();
	movq	%rax, 48(%rsp)	; tmp406, %sfp
.L512:
; src/parser.c:173:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_157->type
; src/parser.c:173:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp409, token
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	je	.L521	;,
.L385:
; src/parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rdx	; parser,
	call	parse_statement	;
; src/parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%r12, %rsi	; token,
	leaq	.LC65(%rip), %rdi	;, tmp307
; src/parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%rax, %r13	; tmp408, statement
; src/parser.c:166:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L511	;,
; src/parser.c:168:         else if (have_return)
	testb	%bl, %bl	; have_return
	je	.L383	;,
; src/parser.c:169:             parser_error("Unreachable code after return statement", token);
	leaq	.LC66(%rip), %rdi	;,
.L511:
	call	*parser_error@GOTPCREL(%rip)	;
.L383:
; src/parser.c:171:             have_return = true;
	cmpl	$5, 8(%r13)	;, statement_156->type
	movb	$1, %al	;, tmp351
; src/parser.c:172:         list_append(body, (pointer)statement);
	movq	48(%rsp), %rdi	; %sfp,
	movq	%r13, %rsi	; statement,
; src/parser.c:171:             have_return = true;
	cmove	%eax, %ebx	; have_return,, tmp351, have_return
; src/parser.c:172:         list_append(body, (pointer)statement);
	call	*list_append@GOTPCREL(%rip)	;
	jmp	.L512	;
.L521:
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_157->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp410
	je	.L385	;,
; src/parser.c:176:     ((parser))->in_function = false;
	movb	$0, (%r15)	;, parser_72(D)->in_function
; src/parser.c:177:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	; have_return
	jne	.L386	;,
; src/parser.c:177:     if (!have_return && return_type != name_void)
	cmpq	name_void(%rip), %rbp	; name_void, return_type
	je	.L386	;,
; src/parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r12, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;, tmp310
	call	*parser_error@GOTPCREL(%rip)	;
.L386:
; src/parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	40(%rsp), %rdx	; %sfp,
	movq	24(%rsp), %r8	; %sfp,
	movq	%rbp, %rsi	; return_type,
	movq	48(%rsp), %rcx	; %sfp,
	movq	56(%rsp), %rdi	; %sfp,
	call	*create_function@GOTPCREL(%rip)	;
	movq	%rax, %rdx	; tmp411, _168
; src/parser.c:47:             if (function == 0)
	testq	%rax, %rax	; _168
	jne	.L387	;,
.L364:
; src/parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	%r14, %rsi	; token,
	leaq	.LC68(%rip), %rdi	;, tmp311
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%edx, %edx	; _168
.L387:
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	jmp	.L519	;
.L361:
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r14)	;, token_33->type
	jne	.L388	;,
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	CLASS_KEYWORD(%rip), %rsi	; CLASS_KEYWORD,
	movq	(%r14), %rdi	; token_33->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; tmp413
	je	.L388	;,
; src/parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	16(%rsp), %rdi	; %sfp,
	call	*create_scope@GOTPCREL(%rip)	;
; src/parser.c:277:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	%rax, 24(%rsp)	; tmp414, %sfp
; src/parser.c:277:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:280:         parser_error("Expected class name after 'class'", token);
	leaq	.LC69(%rip), %rdi	;, tmp313
; src/parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_173->type
; src/parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rsi	; token,
; src/parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	jne	.L518	;,
; src/parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	xorl	%edx, %edx	;
	movq	16(%rsp), %r8	; %sfp,
	movq	(%rax), %rdi	; token_173->lexeme,
	movl	$4, %esi	;,
	movq	24(%rsp), %rcx	; %sfp,
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:284:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	%rax, 56(%rsp)	; tmp416, %sfp
; src/parser.c:284:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_177->type
; src/parser.c:284:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp417, token
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L391	;,
.L392:
; src/parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC70(%rip), %rdi	;, tmp314
.L518:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L390	;
.L391:
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_177->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp418
	je	.L392	;,
; src/parser.c:290:     list(ClassMember*) members = create_list();
	call	*create_list@GOTPCREL(%rip)	;
	movq	%rax, 64(%rsp)	; tmp419, %sfp
.L427:
; src/parser.c:312:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_184->type
; src/parser.c:312:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp457, token
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	je	.L522	;,
.L431:
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_184->type
	jne	.L394	;,
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	METHOD_KEYWORD(%rip), %rsi	; METHOD_KEYWORD,
	movq	(%rbx), %rdi	; token_184->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	; tmp421
	je	.L395	;,
; src/parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	*create_scope@GOTPCREL(%rip)	;
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	56(%rsp), %rdx	; %sfp,
	xorl	%ecx, %ecx	;
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	movq	%rax, %r8	; tmp422,
	movl	$1, %esi	;,
; src/parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	%rax, 40(%rsp)	; tmp422, %sfp
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:189:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	%rax, %rbp	; tmp423, self
; src/parser.c:189:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r12	; tmp424, token
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_213->type, _214
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _214
	je	.L396	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _214
	je	.L397	;,
.L399:
; src/parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%r12, %rsi	; token,
	leaq	.LC71(%rip), %rdi	;, tmp318
	jmp	.L516	;
.L397:
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%r12), %rdi	; token_213->lexeme,
	call	*is_builtin_type@GOTPCREL(%rip)	;
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp425
	je	.L399	;,
.L396:
; src/parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%r12), %rsi	; token_213->lexeme,
	movq	24(%rsp), %rdi	; %sfp,
	call	*search@GOTPCREL(%rip)	;
; src/parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%r12, %rsi	; token,
	leaq	.LC72(%rip), %rdi	;, tmp319
; src/parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, 48(%rsp)	; tmp426, %sfp
; src/parser.c:196:     if (return_type == 0) {
	testq	%rax, %rax	;
	je	.L516	;,
; src/parser.c:200:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_219->type
	je	.L401	;,
; src/parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rsi	; token,
	leaq	.LC73(%rip), %rdi	;, tmp320
.L516:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L398	;
.L401:
; src/parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	xorl	%ecx, %ecx	;
	movq	24(%rsp), %r8	; %sfp,
	movq	(%rax), %rdi	; token_219->lexeme,
	movl	$3, %esi	;,
	movq	48(%rsp), %rdx	; %sfp,
	call	*create_name@GOTPCREL(%rip)	;
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	%rax, 88(%rsp)	; tmp428, %sfp
; src/parser.c:207:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_223->type
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp429, token
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	je	.L402	;,
.L403:
; src/parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%r12, %rsi	; token,
	leaq	.LC74(%rip), %rdi	;, tmp321
	jmp	.L516	;
.L402:
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	(%rax), %rdi	; token_223->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp430
	je	.L403	;,
; src/parser.c:213:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	;, token_228->type
; src/parser.c:213:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp431, token
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	je	.L404	;,
.L406:
; src/parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%r12, %rsi	; token,
	leaq	.LC75(%rip), %rdi	;, tmp323
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L405	;
.L404:
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	(%rax), %rdi	; token_228->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	testb	%al, %al	; tmp432
	je	.L406	;,
.L405:
; src/parser.c:217:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
; src/parser.c:234:             parser_error("Method parameters cannot have default values", token);
	leaq	.LC78(%rip), %r12	;, tmp361
; src/parser.c:217:     token = get_next_token(lexer, true);
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp433, token
; src/parser.c:219:     list(Variable*) parameters = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	56(%rsp), %rdi	; %sfp,
	xorl	%edx, %edx	;
	movq	%rbp, %rsi	; self,
; src/parser.c:219:     list(Variable*) parameters = create_list();
	movq	%rax, 72(%rsp)	; tmp434, %sfp
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	*create_variable@GOTPCREL(%rip)	;
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	72(%rsp), %rdi	; %sfp,
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	%rax, %rsi	; tmp435, _235
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	*list_append@GOTPCREL(%rip)	;
.L407:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_236->type
	je	.L523	;,
.L413:
; src/parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%r13, %rsi	; token,
	leaq	.LC76(%rip), %rdi	;, tmp326
	jmp	.L516	;
.L523:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_236->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp442
	jne	.L419	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_236->type
	jne	.L413	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	movq	0(%r13), %rdi	; token_236->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp436
	je	.L409	;,
; src/parser.c:223:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	40(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rdx	; parser,
; src/parser.c:223:             token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp437, token
; src/parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	;
	movq	%rax, %rsi	; tmp438, parameter
; src/parser.c:231:         if (parameter == 0)
	testq	%rax, %rax	; parameter
	jne	.L506	;,
; src/parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC77(%rip), %rdi	;, tmp328
	jmp	.L514	;
.L409:
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%r13)	;, token_236->type
	jne	.L413	;,
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	0(%r13), %rdi	; token_236->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	; tmp439
	je	.L413	;,
.L419:
; src/parser.c:240:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_254->type
; src/parser.c:240:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp440, token
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	je	.L507	;,
	jmp	.L414	;
.L506:
; src/parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	;, parameter_242->value
	je	.L417	;,
; src/parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rbp, %rsi	; token,
	movq	%r12, %rdi	; tmp361,
.L514:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L416	;
.L417:
; src/parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	72(%rsp), %rdi	; %sfp,
	call	*list_append@GOTPCREL(%rip)	;
.L416:
; src/parser.c:237:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp441, token
	jmp	.L407	;
.L414:
; src/parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC79(%rip), %rdi	;, tmp331
	jmp	.L516	;
.L507:
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_254->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp443
	je	.L414	;,
; src/parser.c:246:     list(Statement*) body = create_list();
	call	*create_list@GOTPCREL(%rip)	;
; src/parser.c:247:     ((parser))->in_function = true;
	movw	$257, (%r15)	;, MEM <unsigned short> [(char *)parser_72(D)]
; src/parser.c:250:     token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
; src/parser.c:249:     bool have_return = false;
	xorl	%r12d, %r12d	; have_return
; src/parser.c:246:     list(Statement*) body = create_list();
	movq	%rax, 80(%rsp)	; tmp444, %sfp
; src/parser.c:250:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp445, token
.L420:
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_262->type
	je	.L524	;,
.L424:
; src/parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	40(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rdx	; parser,
	call	parse_statement	;
; src/parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC80(%rip), %rdi	;, tmp333
; src/parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%rax, %rbp	; tmp446, statement
; src/parser.c:254:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L515	;,
; src/parser.c:256:         else if (have_return)
	testb	%r12b, %r12b	; have_return
	je	.L422	;,
; src/parser.c:257:             parser_error("Unreachable code after return statement", token);
	leaq	.LC66(%rip), %rdi	;,
.L515:
	call	*parser_error@GOTPCREL(%rip)	;
.L422:
; src/parser.c:259:             have_return = true;
	cmpl	$5, 8(%rbp)	;, statement_261->type
	movb	$1, %al	;, tmp355
; src/parser.c:260:         list_append(body, (pointer)statement);
	movq	80(%rsp), %rdi	; %sfp,
	movq	%rbp, %rsi	; statement,
; src/parser.c:259:             have_return = true;
	cmove	%eax, %r12d	; have_return,, tmp355, have_return
; src/parser.c:260:         list_append(body, (pointer)statement);
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:261:         token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
	movq	%rax, %r13	; tmp447, token
	jmp	.L420	;
.L524:
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	0(%r13), %rdi	; token_262->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp448
	je	.L424	;,
; src/parser.c:264:     ((parser))->in_function = false;
	movw	$0, (%r15)	;, MEM <unsigned short> [(char *)parser_72(D)]
; src/parser.c:266:     if (!have_return && return_type != name_void)
	testb	%r12b, %r12b	; have_return
	jne	.L425	;,
; src/parser.c:266:     if (!have_return && return_type != name_void)
	movq	48(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L425	;,
; src/parser.c:267:         parser_error("Method missing return statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC81(%rip), %rdi	;, tmp336
	call	*parser_error@GOTPCREL(%rip)	;
.L425:
; src/parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	48(%rsp), %rsi	; %sfp,
	movq	40(%rsp), %r8	; %sfp,
	movq	80(%rsp), %rcx	; %sfp,
	movq	72(%rsp), %rdx	; %sfp,
	movq	88(%rsp), %rdi	; %sfp,
	call	*create_method@GOTPCREL(%rip)	;
	movq	%rax, %rsi	; tmp449, _273
; src/parser.c:296:             if (method == 0)
	testq	%rax, %rax	; _273
	jne	.L426	;,
.L398:
; src/parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC82(%rip), %rdi	;, tmp337
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%esi, %esi	; _273
.L426:
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edi, %edi	;
	xorl	%edx, %edx	;
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	64(%rsp), %rdi	; %sfp,
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp450, _190
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L427	;
.L395:
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_184->type
	jne	.L394	;,
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	movq	(%rbx), %rdi	; token_184->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp451
	je	.L394	;,
; src/parser.c:300:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	24(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	movq	%r15, %rdx	; parser,
; src/parser.c:300:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp452, token
; src/parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	;
	movq	%rax, %rbp	; tmp453, variable
; src/parser.c:303:             if (variable == 0)
	testq	%rax, %rax	; variable
	jne	.L428	;,
; src/parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC83(%rip), %rdi	;, tmp339
	call	*parser_error@GOTPCREL(%rip)	;
.L428:
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rbp, %rdx	; variable,
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	call	*create_class_member@GOTPCREL(%rip)	;
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	64(%rsp), %rdi	; %sfp,
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rsi	; tmp454, _197
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:306:             token = get_next_token(lexer, true);
	movq	8(%rsp), %rdi	; %sfp,
	movl	$1, %esi	;,
	call	*get_next_token@GOTPCREL(%rip)	;
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_198->type
; src/parser.c:306:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp455, token
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L429	;,
.L430:
; src/parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC84(%rip), %rdi	;, tmp340
	jmp	.L517	;
.L429:
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	(%rax), %rdi	; token_198->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp456
	je	.L430	;,
	jmp	.L427	;
.L394:
; src/parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC85(%rip), %rdi	;,
.L517:
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L427	;
.L522:
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_184->lexeme,
	call	*string_equal@GOTPCREL(%rip)	;
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp458
	je	.L431	;,
; src/parser.c:315:     return create_class(name, members, class_scope);
	movq	24(%rsp), %rdx	; %sfp,
	movq	64(%rsp), %rsi	; %sfp,
	movq	56(%rsp), %rdi	; %sfp,
	call	*create_class@GOTPCREL(%rip)	;
	movq	%rax, %rcx	; tmp459, _208
; src/parser.c:52:             if (class_ == 0)
	testq	%rax, %rax	; _208
	jne	.L432	;,
.L390:
; src/parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	%r14, %rsi	; token,
	leaq	.LC86(%rip), %rdi	;, tmp344
	call	*parser_error@GOTPCREL(%rip)	;
	xorl	%ecx, %ecx	; _208
.L432:
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$2, %edi	;,
.L519:
	call	*create_code_member@GOTPCREL(%rip)	;
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rsi	; tmp460, _30
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	*list_append@GOTPCREL(%rip)	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	jmp	.L360	;
.L433:
; src/parser.c:60:     return create_code(members, global_scope);
	movq	16(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:61: }
	addq	$104, %rsp	;,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	popq	%r15	;
; src/parser.c:60:     return create_code(members, global_scope);
	jmp	*create_code@GOTPCREL(%rip)	;
.L388:
; src/parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	%r14, %rsi	; token,
	leaq	.LC87(%rip), %rdi	;,
	call	*parser_error@GOTPCREL(%rip)	;
	jmp	.L360	;
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

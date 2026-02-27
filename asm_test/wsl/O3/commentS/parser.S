	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O3 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC3:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC4:
	.string	"Failed to parse variable access"
	.align 8
.LC5:
	.string	"Unexpected token in primary expression"
	.align 8
.LC6:
	.string	"Failed to parse expression primary"
	.text
	.p2align 4
	.type	parse_expression, @function
parse_expression:
.LFB76:
	.cfi_startproc
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13	; tmp147, now_scope
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movq	%rdx, %r12	; tmp148, parser
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp	; tmp146, lexer
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp	;,
	.cfi_def_cfa_offset 64
; src/parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
	movq	%rax, %rbx	; tmp149, token
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	; token_15->type, _16
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	;, _16
	je	.L55	;,
; src/parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	;, _16
	je	.L56	;,
; src/parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	;, _16
	je	.L57	;,
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _16
	je	.L58	;,
.L6:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _16
	je	.L10	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, _16
	je	.L12	;,
.L13:
; src/parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp143
	call	parser_error@PLT	;
.L16:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbp, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp144
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp166, _65
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
; src/parser.c:695: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax	;
	popq	%rbx	;
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L56:
	.cfi_restore_state
; src/parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_15->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %ebx	;, type
.L3:
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movl	%ebx, %edi	; type,
	call	create_primary@PLT	;
	movq	%rax, %rdx	; tmp165, _63
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; _63
	je	.L16	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:695: }
	addq	$16, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 48
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, %r8	; parser,
	movq	%r13, %rcx	; now_scope,
; src/parser.c:695: }
	popq	%rbx	;
	.cfi_def_cfa_offset 40
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %rdi	; lexer,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp167, _1
; src/parser.c:695: }
	popq	%rbp	;
	.cfi_def_cfa_offset 32
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%edx, %edx	;
; src/parser.c:695: }
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	jmp	parse_expr_prec	;
	.p2align 4,,10
	.p2align 3
.L55:
	.cfi_restore_state
; src/parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_15->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:710:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	; type
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L57:
; src/parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_15->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:716:         type = PRIM_STRING;
	movl	$2, %ebx	;, type
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L58:
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	(%rbx), %rdi	; token_15->lexeme, token_15->lexeme
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp150
	jne	.L59	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movl	24(%rbx), %eax	; token_15->type, _24
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	;, _24
	jne	.L6	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	(%rbx), %rdi	; token_15->lexeme, token_15->lexeme
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp151
	jne	.L9	;,
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rbx), %eax	; token_15->type, prephitmp_64
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_64
	jne	.L20	;,
	.p2align 4,,10
	.p2align 3
.L10:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_15->lexeme, token_15->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp152
	jne	.L60	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movl	24(%rbx), %eax	; token_15->type, prephitmp_64
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_64
	jne	.L20	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	(%rbx), %rdi	; token_15->lexeme, token_15->lexeme
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp157
	jne	.L61	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movl	24(%rbx), %eax	; token_15->type, prephitmp_64
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_64
	jne	.L20	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	(%rbx), %rdi	; token_15->lexeme, token_15->lexeme
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp160
	jne	.L21	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rbx), %eax	; token_15->type, prephitmp_64
.L20:
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, prephitmp_64
	je	.L12	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	;, prephitmp_64
	jne	.L13	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	(%rbx), %rdi	; token_15->lexeme, token_15->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	; tmp164
	je	.L13	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%r12)	;, parser_6(D)->in_method
	je	.L13	;,
.L12:
; src/parser.c:759:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_variable_access	;
	movq	%rax, %r8	; tmp163, variable_value
; src/parser.c:760:         if (variable_value == 0) {
	testq	%rax, %rax	; variable_value
	je	.L23	;,
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	;, type
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L59:
; src/parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_15->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:719:         type = PRIM_TRUE;
	movl	$3, %ebx	;, type
; src/parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L9:
; src/parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_15->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:722:         type = PRIM_FALSE;
	movl	$4, %ebx	;, type
; src/parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L60:
; src/parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp153, token
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
; src/parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	; expr_value
	je	.L62	;,
; src/parser.c:733:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%rax, 8(%rsp)	; expr_value, %sfp
	call	get_next_token@PLT	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	8(%rsp), %rdx	; %sfp, expr_value
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	; token_35->type, type
; src/parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %r14	; tmp155, token
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	;, type
	jne	.L18	;,
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_35->lexeme, token_35->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	%rdx, 8(%rsp)	; expr_value, %sfp
	call	string_equal@PLT	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp156
	je	.L18	;,
	movq	8(%rsp), %rdx	; %sfp, expr_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L61:
; src/parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp158, token
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rcx	; tmp159, prim_value
; src/parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	je	.L63	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	;, type
	jmp	.L3	;
	.p2align 4,,10
	.p2align 3
.L21:
; src/parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp161, token
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rcx	; tmp162, prim_value
; src/parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	je	.L64	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	;, type
	jmp	.L3	;
.L18:
; src/parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%r14, %rsi	; token,
	leaq	.LC1(%rip), %rdi	;, tmp131
	call	parser_error@PLT	;
	jmp	.L16	;
.L23:
; src/parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp142
	call	parser_error@PLT	;
	jmp	.L16	;
.L62:
; src/parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC0(%rip), %rdi	;, tmp130
	call	parser_error@PLT	;
	jmp	.L16	;
.L63:
; src/parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp136
	call	parser_error@PLT	;
	jmp	.L16	;
.L64:
; src/parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp139
	call	parser_error@PLT	;
	jmp	.L16	;
	.cfi_endproc
.LFE76:
	.size	parse_expression, .-parse_expression
	.p2align 4
	.type	parse_primary, @function
parse_primary:
.LFB77:
	.cfi_startproc
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	%rdx, %r13	; tmp144, parser
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12	; tmp143, now_scope
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movq	%rdi, %rbp	; tmp142, lexer
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 64
; src/parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
	movq	%rax, %rbx	; tmp145, token
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	; token_50->type, _1
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	je	.L116	;,
; src/parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	;, _1
	je	.L117	;,
; src/parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	;, _1
	je	.L118	;,
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _1
	je	.L119	;,
.L70:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, _1
	je	.L74	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, _1
	je	.L76	;,
.L77:
; src/parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp140
	call	parser_error@PLT	;
.L82:
; src/parser.c:769: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax	;
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore_state
; src/parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %ebx	;, type
.L67:
; src/parser.c:769: }
	addq	$24, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movl	%ebx, %edi	; type,
; src/parser.c:769: }
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	jmp	create_primary@PLT	;
	.p2align 4,,10
	.p2align 3
.L116:
	.cfi_restore_state
; src/parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:710:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	; type
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L118:
; src/parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:716:         type = PRIM_STRING;
	movl	$2, %ebx	;, type
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L119:
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	(%rbx), %rdi	; token_50->lexeme, token_50->lexeme
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp146
	jne	.L120	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movl	24(%rbx), %eax	; token_50->type, _6
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	;, _6
	jne	.L70	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	(%rbx), %rdi	; token_50->lexeme, token_50->lexeme
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp147
	jne	.L73	;,
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rbx), %eax	; token_50->type, prephitmp_89
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_89
	jne	.L85	;,
	.p2align 4,,10
	.p2align 3
.L74:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_50->lexeme, token_50->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp148
	jne	.L121	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movl	24(%rbx), %eax	; token_50->type, prephitmp_89
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_89
	jne	.L85	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	(%rbx), %rdi	; token_50->lexeme, token_50->lexeme
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp153
	jne	.L122	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movl	24(%rbx), %eax	; token_50->type, prephitmp_89
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_89
	jne	.L85	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	(%rbx), %rdi	; token_50->lexeme, token_50->lexeme
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp156
	jne	.L86	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%rbx), %eax	; token_50->type, prephitmp_89
.L85:
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, prephitmp_89
	je	.L76	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	;, prephitmp_89
	jne	.L77	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	(%rbx), %rdi	; token_50->lexeme, token_50->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	; tmp160
	je	.L77	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%r13)	;, parser_59(D)->in_method
	je	.L77	;,
.L76:
; src/parser.c:759:         variable_value = parse_variable_access(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_variable_access	;
	movq	%rax, %r8	; tmp159, variable_value
; src/parser.c:760:         if (variable_value == 0) {
	testq	%rax, %rax	; variable_value
	je	.L88	;,
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	;, type
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L120:
; src/parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:719:         type = PRIM_TRUE;
	movl	$3, %ebx	;, type
; src/parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L73:
; src/parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%rbx), %rsi	; token_50->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:722:         type = PRIM_FALSE;
	movl	$4, %ebx	;, type
; src/parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L121:
; src/parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:726:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp149, token
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
; src/parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	; expr_value
	je	.L123	;,
; src/parser.c:733:         token = get_next_token(lexer, true);
	movq	%rbp, %rdi	; lexer,
	movl	$1, %esi	;,
	movq	%rax, 8(%rsp)	; expr_value, %sfp
	call	get_next_token@PLT	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	8(%rsp), %rdx	; %sfp, expr_value
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	; token_63->type, type
; src/parser.c:733:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	; tmp151, token
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	;, type
	jne	.L83	;,
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_63->lexeme, token_63->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	%rdx, 8(%rsp)	; expr_value, %sfp
	call	string_equal@PLT	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp152
	je	.L83	;,
	movq	8(%rsp), %rdx	; %sfp, expr_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:707:     Primary* prim_value = NULL;
	xorl	%ecx, %ecx	; prim_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L122:
; src/parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp154, token
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rcx	; tmp155, prim_value
; src/parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	je	.L124	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	;, type
	jmp	.L67	;
	.p2align 4,,10
	.p2align 3
.L86:
; src/parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:750:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp157, token
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rcx	; tmp158, prim_value
; src/parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	je	.L125	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	xorl	%r8d, %r8d	; variable_value
; src/parser.c:706:     Expression* expr_value = NULL;
	xorl	%edx, %edx	; expr_value
; src/parser.c:705:     string str_value = NULL;
	xorl	%esi, %esi	; str_value
; src/parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	;, type
	jmp	.L67	;
.L83:
; src/parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC1(%rip), %rdi	;, tmp128
	call	parser_error@PLT	;
; src/parser.c:737:             return NULL;
	jmp	.L82	;
.L88:
; src/parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp139
	call	parser_error@PLT	;
; src/parser.c:762:             return NULL;
	jmp	.L82	;
.L123:
; src/parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC0(%rip), %rdi	;, tmp127
	call	parser_error@PLT	;
; src/parser.c:731:             return NULL;
	jmp	.L82	;
.L124:
; src/parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp133
	call	parser_error@PLT	;
; src/parser.c:746:             return NULL;
	jmp	.L82	;
.L125:
; src/parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp136
	call	parser_error@PLT	;
; src/parser.c:755:             return NULL;
	jmp	.L82	;
	.cfi_endproc
.LFE77:
	.size	parse_primary, .-parse_primary
	.section	.rodata.str1.1
.LC7:
	.string	"Failed to parse right operand"
	.text
	.p2align 4
	.type	parse_expr_prec, @function
parse_expr_prec:
.LFB75:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%r8, %r15	; tmp125, parser
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	; tmp121, lexer
	subq	$40, %rsp	;,
	.cfi_def_cfa_offset 96
; src/parser.c:641: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
	movq	%rsi, 8(%rsp)	; tmp122, %sfp
; src/parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
; src/parser.c:641: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, Scope* now_scope, Parser* parser) {
	movl	%edx, 28(%rsp)	; tmp123, %sfp
	movq	%rcx, 16(%rsp)	; tmp124, %sfp
; src/parser.c:647:     token = peek_next_token(lexer, true);
	call	peek_next_token@PLT	;
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;,
	jne	.L136	;,
.L134:
; src/parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rdi	; token_ptr_67->lexeme, token_ptr_67->lexeme
	call	string_to_operator@PLT	;
; src/parser.c:651:         int op_prec = operator_precedence(op);
	movl	%eax, %edi	; op,
; src/parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movl	%eax, %r12d	; tmp127, op
; src/parser.c:651:         int op_prec = operator_precedence(op);
	call	operator_precedence@PLT	;
	movl	%eax, %ebp	; tmp128, op_prec
; src/parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r12d	;, op
	je	.L136	;,
	movl	28(%rsp), %eax	; %sfp, min_prec
	cmpl	%eax, %ebp	; min_prec, op_prec
	jl	.L136	;,
; src/parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:656:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r15, %rdx	; parser,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:656:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp129, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp130, right_primary
; src/parser.c:659:         if (right_primary == 0) {
	testq	%rax, %rax	; right_primary
	je	.L141	;,
; src/parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
	movq	%rax, %r13	; tmp131, right
.L140:
; src/parser.c:664:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;,
	jne	.L130	;,
; src/parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rdi	; token_ptr_66->lexeme, token_ptr_66->lexeme
	call	string_to_operator@PLT	;
	movl	%eax, %r14d	; tmp133, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %edi	; next_op,
	call	operator_precedence@PLT	;
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r14d	;, next_op
	je	.L130	;,
	cmpl	%eax, %ebp	; next_prec, op_prec
	jge	.L130	;,
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	16(%rsp), %rcx	; %sfp,
	movq	%r13, %rsi	; right,
	movq	%r15, %r8	; parser,
	movl	%eax, %edx	; next_prec,
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %r13	; tmp135, right
; src/parser.c:672:             if (right == 0)
	testq	%rax, %rax	; right
	jne	.L140	;,
; src/parser.c:661:             return NULL;
	xorl	%r14d, %r14d	; <retval>
	jmp	.L126	;
	.p2align 4,,10
	.p2align 3
.L130:
; src/parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	8(%rsp), %rsi	; %sfp,
	xorl	%edx, %edx	;
	movq	%r13, %rcx	; right,
	movl	%r12d, %edi	; op,
	call	create_expression@PLT	;
; src/parser.c:678:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, 8(%rsp)	; tmp137, %sfp
; src/parser.c:678:         token = peek_next_token(lexer, true);
	call	peek_next_token@PLT	;
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;,
	je	.L134	;,
.L136:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	movq	8(%rsp), %r14	; %sfp, <retval>
	call	peek_current_token@PLT	;
.L126:
; src/parser.c:684: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r14, %rax	; <retval>,
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L141:
	.cfi_restore_state
; src/parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%r13, %rsi	; token,
	leaq	.LC7(%rip), %rdi	;, tmp114
; src/parser.c:661:             return NULL;
	xorl	%r14d, %r14d	; <retval>
; src/parser.c:660:             parser_error("Failed to parse right operand", token);
	call	parser_error@PLT	;
	jmp	.L126	;
	.cfi_endproc
.LFE75:
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"Expected variable name in variable access"
	.align 8
.LC9:
	.string	"Cannot call undefined variable"
	.align 8
.LC10:
	.string	"Cannot call non-function variable"
	.align 8
.LC11:
	.string	"Failed to parse function call argument"
	.align 8
.LC12:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC13:
	.string	"Failed to parse sequence index"
	.align 8
.LC14:
	.string	"Expected ']' after sequence index"
	.align 8
.LC15:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC16:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC17:
	.string	"Unknown attribute name"
	.text
	.p2align 4
	.type	parse_variable_access, @function
parse_variable_access:
.LFB78:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12	; tmp200, parser
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rsi, %rbp	; tmp199, now_scope
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	; tmp198, lexer
	subq	$40, %rsp	;,
	.cfi_def_cfa_offset 96
; src/parser.c:774:     Token* token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
	movq	%rax, %r13	; tmp201, token
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	; token_80->type, _1
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _1
	je	.L143	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _1
	jne	.L146	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	0(%r13), %rdi	; token_80->lexeme, token_80->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; tmp202
	je	.L146	;,
.L143:
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	0(%r13), %rsi	; token_80->lexeme, token_80->lexeme
	movq	%rbp, %rdi	; now_scope,
	call	search@PLT	;
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	movq	%rax, %rdx	; base_name,
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	%rax, %r14	; tmp203, base_name
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	call	create_variable_access@PLT	;
; src/parser.c:786:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movq	%rax, %r13	; tmp204, <retval>
; src/parser.c:786:     token = peek_next_token(lexer, true);
	call	peek_next_token@PLT	;
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_91->type
; src/parser.c:786:     token = peek_next_token(lexer, true);
	movq	%rax, %r15	; tmp205, token_ptr
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	jne	.L142	;,
; src/parser.c:782:     Scope* var_scope = 0;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:780:     Name* current_type = 0;
	movq	$0, 16(%rsp)	;, %sfp
.L174:
; src/parser.c:789:         if (base_name != 0) {
	testq	%r14, %r14	; base_name
	je	.L148	;,
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%r14), %eax	; base_name_136->kind, _93
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %ecx	;, tmp155
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %ecx	;, tmp155
	jbe	.L177	;,
	cmpl	$5, %eax	;, _93
	jne	.L149	;,
.L177:
; src/parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%r14), %rax	; base_name_136->info.type, current_type
	movq	%rax, 16(%rsp)	; current_type, %sfp
.L148:
; src/parser.c:796:         if (var_scope == 0 && current_type != 0) {
	cmpq	$0, 8(%rsp)	;, %sfp
	jne	.L151	;,
	movq	16(%rsp), %rax	; %sfp, current_type
	testq	%rax, %rax	; current_type
	je	.L151	;,
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%rax)	;, current_type_51->kind
	jne	.L151	;,
; src/parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%rax), %rax	; current_type_51->info.scope, var_scope
	movq	%rax, 8(%rsp)	; var_scope, %sfp
.L151:
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r15), %rdi	; token_ptr_150->lexeme, token_ptr_150->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp206
	jne	.L207	;,
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	(%r15), %rdi	; token_ptr_150->lexeme, token_ptr_150->lexeme
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp220
	je	.L165	;,
; src/parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:834:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%rbp, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:834:             token = get_next_token(lexer, true);
	movq	%rax, 24(%rsp)	; tmp221, %sfp
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp222, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L208	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, %r8	; parser,
	movq	%rbp, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp224, _158
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %r15	; tmp225, _159
; src/parser.c:837:             if (index == 0)
	testq	%rax, %rax	; _159
	je	.L167	;,
.L168:
; src/parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_118->type
; src/parser.c:839:             token = get_next_token(lexer, true);
	movq	%rax, %rdx	; tmp226, token
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L170	;,
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	(%rax), %rdi	; token_118->lexeme, token_118->lexeme
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	movq	%rax, 24(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	24(%rsp), %rdx	; %sfp, token
	testb	%al, %al	; tmp227
	je	.L170	;,
; src/parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	%r13, %rsi	; <retval>,
	xorl	%r8d, %r8d	;
	movq	%r15, %rcx	; _159,
	xorl	%edx, %edx	;
	movl	$3, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, %r13	; tmp228, <retval>
.L164:
; src/parser.c:869:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_147->type
; src/parser.c:869:         token = peek_next_token(lexer, true);
	movq	%rax, %r15	; tmp233, token_ptr
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	je	.L174	;,
.L142:
; src/parser.c:873: }
	addq	$40, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax	; <retval>,
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L165:
	.cfi_restore_state
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	(%r15), %rdi	; token_ptr_150->lexeme, token_ptr_150->lexeme
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; tmp229
	je	.L142	;,
; src/parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:849:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:851:             if (var_scope == 0) {
	cmpq	$0, 8(%rsp)	;, %sfp
; src/parser.c:849:             token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp230, token
; src/parser.c:851:             if (var_scope == 0) {
	je	.L209	;,
; src/parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_102->type
	jne	.L210	;,
; src/parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rsi	; token_102->lexeme, token_102->lexeme
	movq	8(%rsp), %rdi	; %sfp,
	call	search@PLT	;
	movq	%rax, %r14	; tmp231, base_name
; src/parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	; base_name
	je	.L211	;,
; src/parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%r13, %rsi	; <retval>,
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	movq	%rax, %rdx	; base_name,
	movl	$2, %edi	;,
	call	create_variable_access@PLT	;
; src/parser.c:866:             var_scope = 0;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:865:             current_type = 0;
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	%rax, %r13	; tmp232, <retval>
	jmp	.L164	;
	.p2align 4,,10
	.p2align 3
.L207:
; src/parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:804:             if (base_name == 0)
	testq	%r14, %r14	; base_name
	je	.L212	;,
.L153:
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movl	24(%r14), %ecx	; base_name_136->kind, tmp242
	leal	-2(%rcx), %edx	;, tmp168
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %edx	;, tmp168
	ja	.L213	;,
.L154:
; src/parser.c:809:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp208, token
; src/parser.c:811:             list(Expression*) args = create_list();
	call	create_list@PLT	;
	movq	%rax, 8(%rsp)	; tmp209, %sfp
	.p2align 4,,10
	.p2align 3
.L155:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	;, token_49->type
	je	.L214	;,
.L163:
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%rbp, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rdx	; tmp210, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L215	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, %r8	; parser,
	movq	%rbp, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp212, _151
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %rsi	; tmp213, _152
; src/parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	; _152
	je	.L157	;,
.L158:
; src/parser.c:816:                 list_append(args, (pointer)arg);
	movq	8(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:817:                 token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_140->type
; src/parser.c:817:                 token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp214, token
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L159	;,
.L162:
; src/parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%r15, %rsi	; token,
	leaq	.LC12(%rip), %rdi	;, tmp173
	call	parser_error@PLT	;
.L145:
; src/parser.c:778:         return NULL;
	xorl	%r13d, %r13d	; <retval>
	jmp	.L142	;
	.p2align 4,,10
	.p2align 3
.L214:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r15), %rdi	; token_49->lexeme, token_49->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp218
	je	.L163	;,
; src/parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	8(%rsp), %r8	; %sfp,
	movq	%r13, %rsi	; <retval>,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$1, %edi	;,
	call	create_variable_access@PLT	;
; src/parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%r14), %r14	; base_name_136->info.type, base_name
; src/parser.c:830:             var_scope = 0;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:829:             current_type = 0;
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, %r13	; tmp219, <retval>
	jmp	.L164	;
	.p2align 4,,10
	.p2align 3
.L159:
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%rax), %rdi	; token_140->lexeme, token_140->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp215
	jne	.L216	;,
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r15)	;, token_140->type
	jne	.L162	;,
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r15), %rdi	; token_140->lexeme, token_140->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp217
	jne	.L155	;,
	jmp	.L162	;
	.p2align 4,,10
	.p2align 3
.L215:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;,
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp211, _154
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
.L157:
; src/parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%r15, %rsi	; token,
	leaq	.LC11(%rip), %rdi	;,
	call	parser_error@PLT	;
	xorl	%esi, %esi	; _152
	jmp	.L158	;
	.p2align 4,,10
	.p2align 3
.L216:
; src/parser.c:820:                     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp216, token
; src/parser.c:821:                     token_ptr = token;
	jmp	.L155	;
	.p2align 4,,10
	.p2align 3
.L213:
; src/parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%rax, %rsi	; token,
	leaq	.LC10(%rip), %rdi	;, tmp170
	call	parser_error@PLT	;
	jmp	.L154	;
	.p2align 4,,10
	.p2align 3
.L146:
; src/parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%r13, %rsi	; token,
	leaq	.LC8(%rip), %rdi	;, tmp151
	call	parser_error@PLT	;
; src/parser.c:778:         return NULL;
	jmp	.L145	;
	.p2align 4,,10
	.p2align 3
.L149:
; src/parser.c:794:                 current_type = base_name;
	andl	$-5, %eax	;, _93
	movq	16(%rsp), %rax	; %sfp, current_type
	cmove	%r14, %rax	; current_type,, base_name, current_type
	movq	%rax, 16(%rsp)	; current_type, %sfp
	jmp	.L148	;
.L208:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp182
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp223, _161
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
.L167:
; src/parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	24(%rsp), %rsi	; %sfp,
	leaq	.LC13(%rip), %rdi	;, tmp183
	xorl	%r15d, %r15d	; _159
	call	parser_error@PLT	;
	jmp	.L168	;
	.p2align 4,,10
	.p2align 3
.L212:
; src/parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rsi	; token,
	leaq	.LC9(%rip), %rdi	;, tmp167
	movq	%rax, 8(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	8(%rsp), %rax	; %sfp, token
	jmp	.L153	;
.L170:
; src/parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%rdx, %rsi	; token,
	leaq	.LC14(%rip), %rdi	;, tmp184
	call	parser_error@PLT	;
; src/parser.c:843:                 return NULL;
	jmp	.L145	;
.L209:
; src/parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rsi	; token,
	leaq	.LC15(%rip), %rdi	;, tmp189
	call	parser_error@PLT	;
; src/parser.c:853:                 return NULL;
	jmp	.L145	;
.L211:
; src/parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%r15, %rsi	; token,
	leaq	.LC17(%rip), %rdi	;, tmp192
	call	parser_error@PLT	;
; src/parser.c:862:                 return NULL;
	jmp	.L145	;
.L210:
; src/parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC16(%rip), %rdi	;, tmp190
	call	parser_error@PLT	;
; src/parser.c:857:                 return NULL;
	jmp	.L145	;
	.cfi_endproc
.LFE78:
	.size	parse_variable_access, .-parse_variable_access
	.section	.rodata.str1.1
.LC18:
	.string	"Expected variable type"
	.section	.rodata.str1.8
	.align 8
.LC19:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC20:
	.string	"Unknown variable type"
.LC21:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"Failed to parse variable initializer"
	.text
	.p2align 4
	.type	parse_variable, @function
parse_variable:
.LFB70:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14	; tmp124, parser
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13	; tmp123, now_scope
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdi, %rbp	; tmp122, lexer
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 64
; src/parser.c:323:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
	movq	%rax, %rbx	; tmp125, token
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_26->type, _1
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L218	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _1
	jne	.L221	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rbx), %rdi	; token_26->lexeme, token_26->lexeme
	call	is_builtin_type@PLT	;
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp126
	je	.L221	;,
.L218:
; src/parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rsi	; token_26->lexeme, token_26->lexeme
	movq	%r13, %rdi	; now_scope,
	call	search@PLT	;
	movq	%rax, %r12	; tmp127, type
; src/parser.c:330:     if (type != 0) {
	testq	%rax, %rax	; type
	je	.L222	;,
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	;, type_31->kind
	jne	.L245	;,
.L223:
; src/parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	;, token_36->type
; src/parser.c:336:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp128, token
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	jne	.L246	;,
.L224:
; src/parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	(%rbx), %rdi	; token_36->lexeme, token_36->lexeme
	xorl	%ecx, %ecx	;
	movq	%r13, %r8	; now_scope,
	movq	%r12, %rdx	; type,
	movl	$1, %esi	;,
	call	create_name@PLT	;
; src/parser.c:342:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	%rax, %rbx	; tmp129, name
; src/parser.c:342:     token = peek_next_token(lexer, true);
	call	peek_next_token@PLT	;
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_41->type
	je	.L247	;,
.L226:
; src/parser.c:341:     Expression* value = 0;
	xorl	%edx, %edx	; value
.L230:
; src/parser.c:354: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
; src/parser.c:353:     return create_variable(type, name, value);
	movq	%rbx, %rsi	; name,
	movq	%r12, %rdi	; type,
; src/parser.c:354: }
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/parser.c:353:     return create_variable(type, name, value);
	jmp	create_variable@PLT	;
	.p2align 4,,10
	.p2align 3
.L246:
	.cfi_restore_state
; src/parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rsi	; token,
	leaq	.LC21(%rip), %rdi	;, tmp115
	call	parser_error@PLT	;
	jmp	.L224	;
	.p2align 4,,10
	.p2align 3
.L221:
; src/parser.c:326:         parser_error("Expected variable type", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC18(%rip), %rdi	;, tmp108
	call	parser_error@PLT	;
; src/parser.c:354: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax	;
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L245:
	.cfi_restore_state
; src/parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC19(%rip), %rdi	;, tmp113
	call	parser_error@PLT	;
	jmp	.L223	;
	.p2align 4,,10
	.p2align 3
.L247:
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	(%rax), %rdi	; token_41->lexeme, token_41->lexeme
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; tmp131
	je	.L226	;,
; src/parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:347:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%r14, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:347:         token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp132, token
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp133, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L248	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%edx, %edx	;
	movq	%r14, %r8	; parser,
	movq	%r13, %rcx	; now_scope,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp135, _54
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %rdx	; tmp136, value
; src/parser.c:350:         if (value == 0)
	testq	%rax, %rax	; value
	jne	.L230	;,
.L229:
; src/parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	%r15, %rsi	; token,
	leaq	.LC22(%rip), %rdi	;, tmp120
	call	parser_error@PLT	;
	jmp	.L226	;
	.p2align 4,,10
	.p2align 3
.L222:
; src/parser.c:335:         parser_error("Unknown variable type", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC20(%rip), %rdi	;, tmp114
	call	parser_error@PLT	;
	jmp	.L223	;
.L248:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbp, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp119
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp134, _57
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
	jmp	.L229	;
	.cfi_endproc
.LFE70:
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.1
.LC23:
	.string	"Expected '(' after 'if'"
.LC24:
	.string	"Failed to parse if condition"
	.section	.rodata.str1.8
	.align 8
.LC25:
	.string	"Expected ')' after if condition"
	.section	.rodata.str1.1
.LC26:
	.string	"Expected '{' to start if body"
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"Failed to parse if body statement"
	.section	.rodata.str1.1
.LC28:
	.string	"Expected '(' after 'elif'"
	.section	.rodata.str1.8
	.align 8
.LC29:
	.string	"Failed to parse else-if condition"
	.align 8
.LC30:
	.string	"Expected ')' after else-if condition"
	.align 8
.LC31:
	.string	"Expected '{' to start else-if body"
	.align 8
.LC32:
	.string	"Failed to parse else-if body statement"
	.align 8
.LC33:
	.string	"Expected '{' to start else body"
	.align 8
.LC34:
	.string	"Failed to parse else body statement"
	.section	.rodata.str1.1
.LC35:
	.string	"Expected '(' after 'for'"
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Failed to parse for loop initializer"
	.align 8
.LC37:
	.string	"Expected ';' after for loop initializer"
	.align 8
.LC38:
	.string	"Failed to parse for loop condition"
	.align 8
.LC39:
	.string	"Expected ';' after for loop condition"
	.align 8
.LC40:
	.string	"Failed to parse for loop increment"
	.align 8
.LC41:
	.string	"Expected ')' after for loop increment"
	.align 8
.LC42:
	.string	"Expected '{' to start for loop body"
	.align 8
.LC43:
	.string	"Failed to parse for loop body statement"
	.section	.rodata.str1.1
.LC44:
	.string	"Expected '(' after 'while'"
	.section	.rodata.str1.8
	.align 8
.LC45:
	.string	"Failed to parse while condition"
	.align 8
.LC46:
	.string	"Expected ')' after while condition"
	.align 8
.LC47:
	.string	"Expected '{' to start while body"
	.align 8
.LC48:
	.string	"Failed to parse while body statement"
	.align 8
.LC49:
	.string	"Cannot use 'break' outside of a loop"
	.align 8
.LC50:
	.string	"Cannot use 'continue' outside of a loop"
	.section	.rodata.str1.1
.LC51:
	.string	"Failed to parse statement"
.LC52:
	.string	"Expected ';' after statement"
	.text
	.p2align 4
	.type	parse_statement, @function
parse_statement:
.LFB71:
	.cfi_startproc
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12	; tmp392, now_scope
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp	; tmp393, parser
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx	; tmp391, lexer
	subq	$56, %rsp	;,
	.cfi_def_cfa_offset 112
; src/parser.c:361:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
; src/parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	;, token_47->type
	je	.L431	;,
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_primary	;
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L432	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	movq	%rax, %rdx	; left_primary,
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp503, _296
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
.L429:
	movq	%rax, %r8	; tmp504, left_primary
.L344:
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	xorl	%edi, %edi	;
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp505, <retval>
.L335:
; src/parser.c:398:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:399:     if (statement == 0)
	testq	%rbp, %rbp	; <retval>
	je	.L433	;,
.L345:
; src/parser.c:401:     token = get_next_token(lexer, true);
	movq	%rbx, %rdi	; lexer,
	movl	$1, %esi	;,
	call	get_next_token@PLT	;
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_90->type
; src/parser.c:401:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp507, token
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L346	;,
.L348:
; src/parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC52(%rip), %rdi	;, tmp378
	call	parser_error@PLT	;
.L249:
; src/parser.c:406: }
	addq	$56, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax	; <retval>,
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L346:
	.cfi_restore_state
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_90->lexeme, token_90->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp508
	je	.L348	;,
	jmp	.L249	;
	.p2align 4,,10
	.p2align 3
.L431:
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	(%rax), %rdi	; token_47->lexeme, token_47->lexeme
	movq	IF_KEYWORD(%rip), %rsi	; IF_KEYWORD,
	movq	%rax, %r13	; tmp394, token
	call	string_equal@PLT	;
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	; tmp395
	jne	.L434	;,
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	0(%r13), %rdi	; token_47->lexeme, token_47->lexeme
	movq	FOR_KEYWORD(%rip), %rsi	; FOR_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	; tmp442
	jne	.L435	;,
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	0(%r13), %rdi	; token_47->lexeme, token_47->lexeme
	movq	WHILE_KEYWORD(%rip), %rsi	; WHILE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; tmp474
	jne	.L436	;,
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	0(%r13), %rdi	; token_47->lexeme, token_47->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp489
	jne	.L437	;,
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	0(%r13), %rdi	; token_47->lexeme, token_47->lexeme
	movq	RETURN_KEYWORD(%rip), %rsi	; RETURN_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; tmp492
	je	.L336	;,
; src/parser.c:375:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%r9d, %r9d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rax, %r8	;, tmp493
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	xorl	%esi, %esi	;
	movl	$5, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp494, <retval>
	jmp	.L335	;
	.p2align 4,,10
	.p2align 3
.L435:
; src/parser.c:522:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_192->type
; src/parser.c:522:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp443, token
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L289	;,
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_192->lexeme, token_192->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp444
	je	.L289	;,
; src/parser.c:528:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_197->type
; src/parser.c:528:     token = get_next_token(lexer, true);
	movq	%rax, %r14	; tmp445, token
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L290	;,
.L293:
; src/parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, %r13	; tmp446, initializer
; src/parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	; initializer
	je	.L438	;,
.L292:
; src/parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp448, token
.L294:
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%r14)	;, token_204->type
	jne	.L297	;,
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%r14), %rdi	; token_204->lexeme, token_204->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp449
	je	.L297	;,
; src/parser.c:544:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_209->type
; src/parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp450, token
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	je	.L298	;,
.L301:
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rdx	; tmp451, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L439	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp454, _254
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/parser.c:549:         if (condition == 0)
	testq	%rax, %rax	; condition
	je	.L303	;,
.L304:
; src/parser.c:551:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp456, token
.L302:
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%r15)	;, token_216->type
	jne	.L306	;,
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%r15), %rdi	; token_216->lexeme, token_216->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp457
	je	.L306	;,
; src/parser.c:560:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_221->type
; src/parser.c:560:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp458, token
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	je	.L307	;,
.L310:
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rdx	; tmp459, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L440	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp462, _261
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, 16(%rsp)	; increment, %sfp
; src/parser.c:565:         if (increment == 0)
	testq	%rax, %rax	; increment
	je	.L312	;,
.L313:
; src/parser.c:567:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp464, token
.L311:
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%r15)	;, token_228->type
	jne	.L315	;,
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	(%r15), %rdi	; token_228->lexeme, token_228->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	; tmp465
	je	.L315	;,
; src/parser.c:576:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_233->type
; src/parser.c:576:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp466, token
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L317	;,
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_233->lexeme, token_233->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp467
	je	.L317	;,
; src/parser.c:582:     list(Statement*) body = create_list();
	call	create_list@PLT	;
; src/parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%rbp)	;, parser_49(D)->in_loop
; src/parser.c:584:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:582:     list(Statement*) body = create_list();
	movq	%rax, %r15	; tmp468, body
; src/parser.c:584:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp469, token
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L318	;
	.p2align 4,,10
	.p2align 3
.L319:
; src/parser.c:590:         list_append(body, (pointer)statement);
	movq	%rax, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	list_append@PLT	;
; src/parser.c:591:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp471, token
.L318:
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_241->type
	jne	.L320	;,
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_241->lexeme, token_241->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp472
	jne	.L441	;,
.L320:
; src/parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
; src/parser.c:588:         if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L319	;,
; src/parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r14, %rsi	; token,
	leaq	.LC43(%rip), %rdi	;,
	movq	%rax, 24(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	24(%rsp), %rax	; %sfp, statement
	jmp	.L319	;
	.p2align 4,,10
	.p2align 3
.L433:
; src/parser.c:400:         parser_error("Failed to parse statement", token);
	movq	%rax, %rsi	; token,
	leaq	.LC51(%rip), %rdi	;, tmp377
	call	parser_error@PLT	;
	jmp	.L345	;
	.p2align 4,,10
	.p2align 3
.L434:
; src/parser.c:413:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_93->type
; src/parser.c:413:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp396, token
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L254	;,
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_93->lexeme, token_93->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp397
	je	.L254	;,
; src/parser.c:419:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:419:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp398, token
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp399, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L442	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp401, _180
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, 32(%rsp)	; _31, %sfp
; src/parser.c:422:     if (condition == 0)
	testq	%rax, %rax	; _31
	je	.L256	;,
.L257:
; src/parser.c:424:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_100->type
; src/parser.c:424:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp403, token
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L259	;,
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_100->lexeme, token_100->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp404
	je	.L259	;,
; src/parser.c:430:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_105->type
; src/parser.c:430:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp405, token
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L261	;,
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_105->lexeme, token_105->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp406
	je	.L261	;,
; src/parser.c:436:     list(Statement*) body = create_list();
	call	create_list@PLT	;
; src/parser.c:437:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:436:     list(Statement*) body = create_list();
	movq	%rax, %r15	; tmp407, body
; src/parser.c:437:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp408, token
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L262	;
	.p2align 4,,10
	.p2align 3
.L263:
; src/parser.c:443:         list_append(body, (pointer)statement);
	movq	%r14, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	list_append@PLT	;
; src/parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp410, token
.L262:
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_113->type
	jne	.L264	;,
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdi	; token_113->lexeme, token_113->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp411
	jne	.L443	;,
.L264:
; src/parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp409, statement
; src/parser.c:441:         if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L263	;,
; src/parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC27(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L263	;
	.p2align 4,,10
	.p2align 3
.L254:
; src/parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%r13, %rsi	; token,
	leaq	.LC23(%rip), %rdi	;, tmp283
	call	parser_error@PLT	;
.L253:
; src/parser.c:417:         return NULL;
	xorl	%esi, %esi	; _176
.L266:
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movl	$2, %edi	;,
.L430:
; src/parser.c:406: }
	addq	$56, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	create_statement@PLT	;
	.p2align 4,,10
	.p2align 3
.L432:
	.cfi_restore_state
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	movq	%rax, 8(%rsp)	; left_primary, %sfp
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp376
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp502, _299
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
	movq	8(%rsp), %r8	; %sfp, left_primary
	jmp	.L344	;
	.p2align 4,,10
	.p2align 3
.L436:
; src/parser.c:603:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_266->type
; src/parser.c:603:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp475, token
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L324	;,
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_266->lexeme, token_266->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp476
	je	.L324	;,
; src/parser.c:609:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:609:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp477, token
; src/parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	call	parse_expression	;
	movq	%rax, %r14	; tmp478, condition
; src/parser.c:612:     if (condition == 0)
	testq	%rax, %rax	; condition
	je	.L444	;,
.L325:
; src/parser.c:614:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_273->type
; src/parser.c:614:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp479, token
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L328	;,
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_273->lexeme, token_273->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp480
	je	.L328	;,
; src/parser.c:620:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_278->type
; src/parser.c:620:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp481, token
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L330	;,
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_278->lexeme, token_278->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp482
	je	.L330	;,
; src/parser.c:626:     list(Statement*) body = create_list();
	call	create_list@PLT	;
; src/parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%rbp)	;, parser_49(D)->in_loop
; src/parser.c:628:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:626:     list(Statement*) body = create_list();
	movq	%rax, %r13	; tmp483, body
; src/parser.c:628:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp484, token
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L331	;
	.p2align 4,,10
	.p2align 3
.L332:
; src/parser.c:634:         list_append(body, (pointer)statement);
	movq	%rax, %rsi	; statement,
	movq	%r13, %rdi	; body,
	call	list_append@PLT	;
; src/parser.c:635:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp486, token
.L331:
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	;, token_286->type
	jne	.L333	;,
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdi	; token_286->lexeme, token_286->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp487
	jne	.L445	;,
.L333:
; src/parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
; src/parser.c:632:         if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L332	;,
; src/parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%r15, %rsi	; token,
	leaq	.LC48(%rip), %rdi	;,
	movq	%rax, 8(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	8(%rsp), %rax	; %sfp, statement
	jmp	.L332	;
	.p2align 4,,10
	.p2align 3
.L437:
; src/parser.c:372:             get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rax, %r9	;, tmp490
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp491, <retval>
	jmp	.L335	;
	.p2align 4,,10
	.p2align 3
.L259:
; src/parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC25(%rip), %rdi	;, tmp288
	call	parser_error@PLT	;
; src/parser.c:428:         return NULL;
	jmp	.L253	;
	.p2align 4,,10
	.p2align 3
.L289:
; src/parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%r13, %rsi	; token,
	leaq	.LC35(%rip), %rdi	;, tmp322
	call	parser_error@PLT	;
.L288:
; src/parser.c:526:         return NULL;
	xorl	%ecx, %ecx	; _250
.L296:
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$4, %edi	;,
	jmp	.L430	;
	.p2align 4,,10
	.p2align 3
.L324:
; src/parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%r13, %rsi	; token,
	leaq	.LC44(%rip), %rdi	;, tmp353
	call	parser_error@PLT	;
.L323:
; src/parser.c:607:         return NULL;
	xorl	%edx, %edx	; _292
.L327:
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$3, %edi	;,
	jmp	.L430	;
.L442:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp286
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp400, _183
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
.L256:
; src/parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC24(%rip), %rdi	;, tmp287
	call	parser_error@PLT	;
	movq	$0, 32(%rsp)	;, %sfp
	jmp	.L257	;
	.p2align 4,,10
	.p2align 3
.L336:
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	0(%r13), %rdi	; token_47->lexeme, token_47->lexeme
	movq	BREAK_KEYWORD(%rip), %rsi	; BREAK_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; tmp495
	je	.L337	;,
; src/parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rbp)	;, parser_49(D)->in_loop
	je	.L446	;,
; src/parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$6, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp496, <retval>
	jmp	.L335	;
	.p2align 4,,10
	.p2align 3
.L297:
; src/parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%r14, %rsi	; token,
	leaq	.LC37(%rip), %rdi	;, tmp328
	call	parser_error@PLT	;
; src/parser.c:542:         return NULL;
	jmp	.L288	;
.L261:
; src/parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC26(%rip), %rdi	;, tmp291
	call	parser_error@PLT	;
; src/parser.c:434:         return NULL;
	jmp	.L253	;
.L443:
; src/parser.c:447:     list(ElseIf*) else_if = create_list();
	call	create_list@PLT	;
	movq	%rax, 24(%rsp)	; tmp412, %sfp
; src/parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list@PLT	;
	movq	%rax, 40(%rsp)	; tmp413, %sfp
	.p2align 4,,10
	.p2align 3
.L428:
; src/parser.c:449:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;,
; src/parser.c:449:     token = peek_next_token(lexer, true);
	movq	%rax, %r13	; tmp414, token_ptr
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	jne	.L279	;,
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	(%rax), %rdi	; token_ptr_348->lexeme, token_ptr_348->lexeme
	movq	ELIF_KEYWORD(%rip), %rsi	; ELIF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; tmp434
	je	.L447	;,
; src/parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:454:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_122->type
; src/parser.c:454:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp416, token
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L268	;,
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_122->lexeme, token_122->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp417
	je	.L268	;,
; src/parser.c:460:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:460:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp418, token
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rdx	; tmp419, left_primary
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; left_primary
	je	.L448	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%ecx, %ecx	;
	xorl	%esi, %esi	;
	movl	$19, %edi	;,
	call	create_expression@PLT	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbp, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	xorl	%edx, %edx	;
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rsi	; tmp421, _187
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, 16(%rsp)	; _13, %sfp
; src/parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	; _13
	je	.L270	;,
.L271:
; src/parser.c:465:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_130->type
; src/parser.c:465:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp423, token
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jne	.L273	;,
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_130->lexeme, token_130->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp424
	je	.L273	;,
; src/parser.c:471:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_136->type
; src/parser.c:471:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp425, token
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L275	;,
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_136->lexeme, token_136->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp426
	je	.L275	;,
; src/parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list@PLT	;
; src/parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:477:         list(Statement*) elif_body = create_list();
	movq	%rax, %r13	; tmp427, elif_body
; src/parser.c:478:         token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp428, token
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L276	;
	.p2align 4,,10
	.p2align 3
.L277:
; src/parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%rax, %rsi	; statement,
	movq	%r13, %rdi	; elif_body,
	call	list_append@PLT	;
; src/parser.c:485:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp430, token
.L276:
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_145->type
	jne	.L278	;,
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_145->lexeme, token_145->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp431
	jne	.L449	;,
.L278:
; src/parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
; src/parser.c:482:             if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L277	;,
; src/parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%r14, %rsi	; token,
	leaq	.LC32(%rip), %rdi	;,
	movq	%rax, 8(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	8(%rsp), %rax	; %sfp, statement
	jmp	.L277	;
	.p2align 4,,10
	.p2align 3
.L449:
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	16(%rsp), %rdi	; %sfp,
	movq	%r13, %rsi	; elif_body,
	call	create_else_if@PLT	;
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	24(%rsp), %rdi	; %sfp,
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rsi	; tmp432, _151
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append@PLT	;
	jmp	.L428	;
.L448:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp300
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp420, _190
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
.L270:
; src/parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC29(%rip), %rdi	;,
	call	parser_error@PLT	;
	movq	$0, 16(%rsp)	;, %sfp
	jmp	.L271	;
.L290:
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_197->lexeme, token_197->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
; src/parser.c:530:     Variable* initializer = 0;
	xorl	%r13d, %r13d	; initializer
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal@PLT	;
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp447
	jne	.L294	;,
	jmp	.L293	;
.L328:
; src/parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC46(%rip), %rdi	;, tmp357
	call	parser_error@PLT	;
; src/parser.c:618:         return NULL;
	jmp	.L323	;
.L306:
; src/parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%r15, %rsi	; token,
	leaq	.LC39(%rip), %rdi	;, tmp335
	call	parser_error@PLT	;
; src/parser.c:558:         return NULL;
	jmp	.L288	;
.L337:
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	0(%r13), %rdi	; token_47->lexeme, token_47->lexeme
	movq	CONTINUE_KEYWORD(%rip), %rsi	; CONTINUE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; tmp497
	je	.L340	;,
; src/parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%rbp)	;, parser_49(D)->in_loop
	je	.L450	;,
; src/parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	;
	xorl	%r8d, %r8d	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	xorl	%esi, %esi	;
	movl	$7, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp498, <retval>
	jmp	.L335	;
.L298:
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_209->lexeme, token_209->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp452
	je	.L301	;,
; src/parser.c:546:     Expression* condition = 0;
	movq	$0, 8(%rsp)	;, %sfp
	jmp	.L302	;
.L330:
; src/parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC47(%rip), %rdi	;, tmp360
	call	parser_error@PLT	;
; src/parser.c:624:         return NULL;
	jmp	.L323	;
.L445:
; src/parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%rbp)	;, parser_49(D)->in_loop
; src/parser.c:639:     return create_while(condition, body);
	movq	%r13, %rsi	; body,
	movq	%r14, %rdi	; condition,
	call	create_while@PLT	;
	movq	%rax, %rdx	; tmp488, _292
	jmp	.L327	;
.L438:
; src/parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%r14, %rsi	; token,
	leaq	.LC36(%rip), %rdi	;, tmp327
	call	parser_error@PLT	;
	jmp	.L292	;
.L315:
; src/parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%r15, %rsi	; token,
	leaq	.LC41(%rip), %rdi	;, tmp342
	call	parser_error@PLT	;
; src/parser.c:574:         return NULL;
	jmp	.L288	;
.L444:
; src/parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC45(%rip), %rdi	;, tmp356
	call	parser_error@PLT	;
	jmp	.L325	;
.L268:
; src/parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%r13, %rsi	; token,
	leaq	.LC28(%rip), %rdi	;, tmp297
	call	parser_error@PLT	;
; src/parser.c:458:             return NULL;
	jmp	.L253	;
.L279:
; src/parser.c:512:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	40(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	%r15, %rsi	; body,
	movq	32(%rsp), %rdi	; %sfp,
	call	create_if@PLT	;
	movq	%rax, %rsi	; tmp415, _176
	jmp	.L266	;
.L273:
; src/parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%r13, %rsi	; token,
	leaq	.LC30(%rip), %rdi	;, tmp302
	call	parser_error@PLT	;
; src/parser.c:469:             return NULL;
	jmp	.L253	;
.L275:
; src/parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC31(%rip), %rdi	;, tmp305
	call	parser_error@PLT	;
; src/parser.c:475:             return NULL;
	jmp	.L253	;
.L307:
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_221->lexeme, token_221->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp460
	je	.L310	;,
; src/parser.c:562:     Expression* increment = 0;
	movq	$0, 16(%rsp)	;, %sfp
	jmp	.L311	;
.L446:
; src/parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%r13, %rsi	; token,
	leaq	.LC49(%rip), %rdi	;, tmp372
; src/parser.c:383:                 return NULL;
	xorl	%ebp, %ebp	; <retval>
; src/parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	call	parser_error@PLT	;
	jmp	.L249	;
.L439:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp333
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp453, _257
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
.L303:
; src/parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%r15, %rsi	; token,
	leaq	.LC38(%rip), %rdi	;, tmp334
	call	parser_error@PLT	;
	movq	$0, 8(%rsp)	;, %sfp
	jmp	.L304	;
.L340:
; src/parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	jmp	.L429	;
.L317:
; src/parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%r15, %rsi	; token,
	leaq	.LC42(%rip), %rdi	;, tmp345
	call	parser_error@PLT	;
; src/parser.c:580:         return NULL;
	jmp	.L288	;
.L441:
; src/parser.c:594:     ((parser))->in_loop = false;
	movb	$0, 2(%rbp)	;, parser_49(D)->in_loop
; src/parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	16(%rsp), %rdx	; %sfp,
	movq	%r15, %rcx	; body,
	movq	%r13, %rdi	; initializer,
	movq	8(%rsp), %rsi	; %sfp,
	call	create_for@PLT	;
	movq	%rax, %rcx	; tmp473, _250
	jmp	.L296	;
.L447:
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%r13)	;, token_ptr_348->type
	jne	.L279	;,
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	0(%r13), %rdi	; token_ptr_348->lexeme, token_ptr_348->lexeme
	movq	ELSE_KEYWORD(%rip), %rsi	; ELSE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; tmp435
	je	.L279	;,
; src/parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_163->type
; src/parser.c:495:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp436, token
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L282	;,
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_163->lexeme,
	call	string_equal@PLT	;
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp437
	je	.L282	;,
; src/parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %r13	;, tmp382
; src/parser.c:501:         token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp438, token
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L283	;
	.p2align 4,,10
	.p2align 3
.L284:
; src/parser.c:507:             list_append(else_body, (pointer)statement);
	movq	40(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; statement,
	call	list_append@PLT	;
; src/parser.c:508:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp440, token
.L283:
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_170->type
	jne	.L285	;,
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_170->lexeme, token_170->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp441
	jne	.L279	;,
.L285:
; src/parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rbp, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
; src/parser.c:505:             if (statement == 0)
	testq	%rax, %rax	; statement
	jne	.L284	;,
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%r14, %rsi	; token,
	movq	%r13, %rdi	; tmp382,
	movq	%rax, 8(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	8(%rsp), %rax	; %sfp, statement
	jmp	.L284	;
.L440:
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC6(%rip), %rdi	;, tmp340
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rax, %rsi	; tmp461, _264
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	call	parser_error@PLT	;
.L312:
; src/parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%r15, %rsi	; token,
	leaq	.LC40(%rip), %rdi	;, tmp341
	call	parser_error@PLT	;
	movq	$0, 16(%rsp)	;, %sfp
	jmp	.L313	;
.L450:
; src/parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%r13, %rsi	; token,
	leaq	.LC50(%rip), %rdi	;, tmp375
; src/parser.c:383:                 return NULL;
	xorl	%ebp, %ebp	; <retval>
; src/parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	call	parser_error@PLT	;
	jmp	.L249	;
.L282:
; src/parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC33(%rip), %rdi	;, tmp315
	call	parser_error@PLT	;
; src/parser.c:499:             return NULL;
	jmp	.L253	;
	.cfi_endproc
.LFE71:
	.size	parse_statement, .-parse_statement
	.section	.rodata.str1.8
	.align 8
.LC53:
	.string	"Expected identifier after 'import'"
	.align 8
.LC54:
	.string	"Expected string literal after 'from'"
	.align 8
.LC55:
	.string	"Expected ';' at end of import statement"
	.align 8
.LC56:
	.string	"Failed to parse import statement"
	.align 8
.LC57:
	.string	"Expected function return type after 'func'"
	.section	.rodata.str1.1
.LC58:
	.string	"Unknown function return type"
	.section	.rodata.str1.8
	.align 8
.LC59:
	.string	"Expected function name after return type"
	.align 8
.LC60:
	.string	"Expected '(' after function name"
	.align 8
.LC61:
	.string	"Failed to parse function parameter"
	.align 8
.LC62:
	.string	"Function parameters cannot have default values"
	.align 8
.LC63:
	.string	"Expected ',' or ')' after function parameter"
	.align 8
.LC64:
	.string	"Expected '{' to start function body"
	.align 8
.LC65:
	.string	"Failed to parse function body statement"
	.align 8
.LC66:
	.string	"Unreachable code after return statement"
	.align 8
.LC67:
	.string	"Function missing return statement"
	.align 8
.LC68:
	.string	"Failed to parse function declaration"
	.align 8
.LC69:
	.string	"Expected class name after 'class'"
	.align 8
.LC70:
	.string	"Expected '{' to start class body"
	.align 8
.LC71:
	.string	"Expected method return type after 'method'"
	.align 8
.LC72:
	.string	"Unknown return type for method"
	.align 8
.LC73:
	.string	"Expected method name after return type"
	.align 8
.LC74:
	.string	"Expected '(' after method name"
	.align 8
.LC75:
	.string	"Expected 'self' as first parameter of method"
	.align 8
.LC76:
	.string	"Expected ',' or ')' after method parameter"
	.align 8
.LC77:
	.string	"Failed to parse method parameter"
	.align 8
.LC78:
	.string	"Method parameters cannot have default values"
	.align 8
.LC79:
	.string	"Expected '{' to start method body"
	.align 8
.LC81:
	.string	"Failed to parse method body statement"
	.align 8
.LC82:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC83:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC84:
	.string	"Failed to parse class variable"
	.align 8
.LC85:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC86:
	.string	"Unexpected token in class member"
	.align 8
.LC87:
	.string	"Failed to parse class declaration"
	.align 8
.LC88:
	.string	"Unexpected token in code member"
	.text
	.p2align 4
	.globl	parse_code
	.type	parse_code, @function
parse_code:
.LFB65:
	.cfi_startproc
	endbr64	
	pushq	%r15	;
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdi, %r15	; tmp400, lexer
	pushq	%r14	;
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13	;
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12	;
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx	; tmp401, now_scope
	subq	$120, %rsp	;,
	.cfi_def_cfa_offset 176
; src/parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, builtin_scope(%rip)	;, builtin_scope
; src/parser.c:19: Code* parse_code(Lexer* lexer, Scope* now_scope, Parser* parser) {
	movq	%rdx, 8(%rsp)	; tmp402, %sfp
; src/parser.c:23:     if (builtin_scope == 0) {
	je	.L618	;,
.L452:
; src/parser.c:32:         now_scope = builtin_scope;
	testq	%rbx, %rbx	; now_scope
	cmove	builtin_scope(%rip), %rbx	; builtin_scope,, now_scope
; src/parser.c:56:             parser_error("Unexpected token in code member", token);
	leaq	.LC88(%rip), %r14	;, tmp398
	movq	%r15, %rbp	; lexer, lexer
; src/parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list@PLT	;
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rbx, %rdi	; now_scope,
; src/parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 32(%rsp)	; tmp409, %sfp
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	call	create_scope@PLT	;
; src/parser.c:37:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rax, 24(%rsp)	; tmp410, %sfp
; src/parser.c:37:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	%rax, %r10	; tmp411, token
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	jne	.L454	;,
	jmp	.L540	;
	.p2align 4,,10
	.p2align 3
.L494:
; src/parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	%r10, %rsi	; token,
	movq	%r14, %rdi	; tmp398,
	call	parser_error@PLT	;
.L466:
; src/parser.c:57:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r10	; tmp497, token
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L540	;,
.L454:
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movl	24(%r10), %eax	; token_379->type, _31
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	; _31
	je	.L540	;,
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _31
	jne	.L494	;,
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	(%r10), %rdi	; token_379->lexeme, token_379->lexeme
	movq	IMPORT_KEYWORD(%rip), %rsi	; IMPORT_KEYWORD,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; have_return
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movl	%eax, %ebx	; tmp412, have_return
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jne	.L619	;,
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r10)	;, token_379->type
	jne	.L494	;,
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	(%r10), %rdi	; token_379->lexeme, token_379->lexeme
	movq	FUNC_KEYWORD(%rip), %rsi	; FUNC_KEYWORD,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp423
	jne	.L620	;,
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r10)	;, token_379->type
	jne	.L494	;,
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	(%r10), %rdi	; token_379->lexeme, token_379->lexeme
	movq	CLASS_KEYWORD(%rip), %rsi	; CLASS_KEYWORD,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp449
	je	.L494	;,
; src/parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_scope@PLT	;
; src/parser.c:277:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	%rax, 40(%rsp)	; tmp450, %sfp
; src/parser.c:277:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$1, 24(%rax)	;, token_173->type
	jne	.L621	;,
; src/parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	(%rax), %rdi	; token_173->lexeme, token_173->lexeme
	movq	24(%rsp), %r8	; %sfp,
	xorl	%edx, %edx	;
	movl	$4, %esi	;,
	movq	40(%rsp), %rcx	; %sfp,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	create_name@PLT	;
; src/parser.c:284:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	%rax, 56(%rsp)	; tmp452, %sfp
; src/parser.c:284:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_177->type
; src/parser.c:284:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp453, token
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L498	;,
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_177->lexeme, token_177->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp454
	je	.L498	;,
; src/parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list@PLT	;
; src/parser.c:291:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:311:             parser_error("Unexpected token in class member", token);
	leaq	.LC86(%rip), %r12	;, tmp396
; src/parser.c:290:     list(ClassMember*) members = create_list();
	movq	%rax, 48(%rsp)	; tmp455, %sfp
; src/parser.c:291:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	movq	%rax, %r9	; tmp456, token
	movq	%r10, 72(%rsp)	; token, %sfp
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L499	;
	.p2align 4,,10
	.p2align 3
.L537:
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	;, prephitmp_165
	je	.L622	;,
.L500:
; src/parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%r9, %rsi	; token,
	movq	%r12, %rdi	; tmp396,
	call	parser_error@PLT	;
.L533:
; src/parser.c:312:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r9	; tmp493, token
.L499:
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r9), %eax	; token_184->type, prephitmp_165
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	;, prephitmp_165
	jne	.L537	;,
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r9), %rdi	; token_184->lexeme, token_184->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp494
	jne	.L538	;,
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	16(%rsp), %r9	; %sfp, token
	movl	24(%r9), %eax	; token_184->type, prephitmp_165
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	;, prephitmp_165
	jne	.L500	;,
.L622:
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	(%r9), %rdi	; token_184->lexeme, token_184->lexeme
	movq	METHOD_KEYWORD(%rip), %rsi	; METHOD_KEYWORD,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp457
	jne	.L623	;,
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r9)	;, token_184->type
	jne	.L500	;,
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	(%r9), %rdi	; token_184->lexeme, token_184->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp487
	je	.L500	;,
; src/parser.c:300:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	8(%rsp), %rdx	; %sfp,
	movq	40(%rsp), %rsi	; %sfp,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:300:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp488, token
; src/parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	;
	movq	%rax, %rdx	; tmp489, variable
; src/parser.c:303:             if (variable == 0)
	testq	%rax, %rax	; variable
	je	.L624	;,
.L534:
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	xorl	%esi, %esi	;
	movl	$1, %edi	;,
	call	create_class_member@PLT	;
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rsi	; tmp490, _197
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	list_append@PLT	;
; src/parser.c:306:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_198->type
; src/parser.c:306:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp491, token
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	je	.L535	;,
.L536:
; src/parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC85(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L533	;
	.p2align 4,,10
	.p2align 3
.L540:
; src/parser.c:60:     return create_code(members, global_scope);
	movq	24(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:61: }
	addq	$120, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx	;
	.cfi_def_cfa_offset 48
	popq	%rbp	;
	.cfi_def_cfa_offset 40
	popq	%r12	;
	.cfi_def_cfa_offset 32
	popq	%r13	;
	.cfi_def_cfa_offset 24
	popq	%r14	;
	.cfi_def_cfa_offset 16
	popq	%r15	;
	.cfi_def_cfa_offset 8
; src/parser.c:60:     return create_code(members, global_scope);
	jmp	create_code@PLT	;
	.p2align 4,,10
	.p2align 3
.L619:
	.cfi_restore_state
; src/parser.c:68:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$1, 24(%rax)	;, token_89->type
	jne	.L625	;,
; src/parser.c:76:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r10, 16(%rsp)	; token, %sfp
; src/parser.c:74:     string import_name = token_ptr->lexeme;
	movq	(%rax), %r13	; token_89->lexeme, import_name
; src/parser.c:76:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:75:     string source = 0;
	xorl	%ebx, %ebx	; source
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	16(%rsp), %r10	; %sfp, token
; src/parser.c:76:     token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp414, token
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	; token_92->type, _93
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	;, _93
	je	.L626	;,
.L459:
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	;, _93
	jne	.L463	;,
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r12), %rdi	; token_101->lexeme, token_101->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp418
	je	.L463	;,
; src/parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	24(%rsp), %rdx	; %sfp,
	movq	%r13, %rdi	; import_name,
	movq	%rbx, %rsi	; source,
	call	parse_import_file@PLT	;
; src/parser.c:95:     if (name == 0)
	movq	16(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; name
; src/parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	%rax, %rdi	; tmp419, name
; src/parser.c:95:     if (name == 0)
	je	.L627	;,
.L464:
; src/parser.c:97:     return create_import(name, source);
	movq	%rbx, %rsi	; source,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	create_import@PLT	;
; src/parser.c:42:             if (import == 0)
	movq	16(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; _111
; src/parser.c:97:     return create_import(name, source);
	movq	%rax, %rsi	; tmp421, _111
; src/parser.c:42:             if (import == 0)
	je	.L458	;,
.L465:
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%edi, %edi	;
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	call	create_code_member@PLT	;
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rsi	; tmp422, _20
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	list_append@PLT	;
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jmp	.L466	;
	.p2align 4,,10
	.p2align 3
.L620:
; src/parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_scope@PLT	;
; src/parser.c:106:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	%rax, %r12	; tmp424, function_scope
; src/parser.c:106:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	16(%rsp), %r10	; %sfp, token
; src/parser.c:106:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp425, token
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_114->type, _115
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _115
	je	.L468	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _115
	jne	.L471	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%r13), %rdi	; token_114->lexeme, token_114->lexeme
	movq	%r10, 16(%rsp)	; token, %sfp
	call	is_builtin_type@PLT	;
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp426
	je	.L471	;,
.L468:
; src/parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	0(%r13), %rsi	; token_114->lexeme, token_114->lexeme
	movq	24(%rsp), %rdi	; %sfp,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	search@PLT	;
; src/parser.c:113:     if (return_type == 0)
	movq	16(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; return_type
; src/parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, 40(%rsp)	; return_type, %sfp
; src/parser.c:113:     if (return_type == 0)
	je	.L628	;,
; src/parser.c:119:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	get_next_token@PLT	;
; src/parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$1, 24(%rax)	;, token_120->type
	jne	.L629	;,
; src/parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	(%rax), %rdi	; token_120->lexeme, token_120->lexeme
	movq	24(%rsp), %r8	; %sfp,
	xorl	%ecx, %ecx	;
	movl	$2, %esi	;,
	movq	40(%rsp), %rdx	; %sfp,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	create_name@PLT	;
; src/parser.c:126:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	%rax, 48(%rsp)	; tmp429, %sfp
; src/parser.c:126:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_124->type
; src/parser.c:126:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp430, token
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L475	;,
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_124->lexeme, token_124->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp431
	je	.L475	;,
; src/parser.c:132:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp432, token
; src/parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list@PLT	;
	movb	%bl, 56(%rsp)	; have_return, %sfp
	movq	16(%rsp), %rbx	; %sfp, token
	movq	%rax, %r15	; tmp433, parameters
	.p2align 4,,10
	.p2align 3
.L476:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_132->type
	je	.L630	;,
.L484:
; src/parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	8(%rsp), %rdx	; %sfp,
	movq	%r12, %rsi	; function_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	; parameter
	je	.L631	;,
; src/parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	;, parameter_131->value
	je	.L479	;,
; src/parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%r13, %rsi	; token,
	leaq	.LC62(%rip), %rdi	;,
	call	parser_error@PLT	;
.L478:
; src/parser.c:143:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_134->type
; src/parser.c:143:         token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp435, token
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	je	.L480	;,
.L483:
; src/parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%r13, %rsi	; token,
	leaq	.LC63(%rip), %rdi	;,
	movq	%rbx, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
.L470:
; src/parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	%r10, %rsi	; token,
	leaq	.LC68(%rip), %rdi	;, tmp322
	call	parser_error@PLT	;
	xorl	%edx, %edx	; _168
.L493:
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%esi, %esi	;
	xorl	%ecx, %ecx	;
	movl	$1, %edi	;,
	call	create_code_member@PLT	;
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rsi	; tmp448, _25
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append@PLT	;
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	jmp	.L466	;
	.p2align 4,,10
	.p2align 3
.L498:
; src/parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC70(%rip), %rdi	;, tmp327
	movq	%r10, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
.L496:
; src/parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	%r10, %rsi	; token,
	leaq	.LC87(%rip), %rdi	;, tmp374
	call	parser_error@PLT	;
	xorl	%ecx, %ecx	; _208
.L539:
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%esi, %esi	;
	xorl	%edx, %edx	;
	movl	$2, %edi	;,
	call	create_code_member@PLT	;
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	32(%rsp), %rdi	; %sfp,
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rsi	; tmp496, _30
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	list_append@PLT	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	jmp	.L466	;
	.p2align 4,,10
	.p2align 3
.L623:
; src/parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	40(%rsp), %rdi	; %sfp,
	call	create_scope@PLT	;
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	56(%rsp), %rdx	; %sfp,
	xorl	%ecx, %ecx	;
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	movq	%rax, %r8	; method_scope,
	movl	$1, %esi	;,
; src/parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	%rax, %r13	; tmp458, method_scope
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	call	create_name@PLT	;
; src/parser.c:189:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	%rax, %rbx	; tmp459, self
; src/parser.c:189:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	16(%rsp), %r9	; %sfp, token
; src/parser.c:189:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp460, token
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_213->type, _214
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _214
	je	.L502	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _214
	jne	.L505	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%r15), %rdi	; token_213->lexeme, token_213->lexeme
	movq	%r9, 16(%rsp)	; token, %sfp
	call	is_builtin_type@PLT	;
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp461
	je	.L505	;,
.L502:
; src/parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%r15), %rsi	; token_213->lexeme, token_213->lexeme
	movq	40(%rsp), %rdi	; %sfp,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	search@PLT	;
; src/parser.c:196:     if (return_type == 0) {
	movq	16(%rsp), %r9	; %sfp, token
	testq	%rax, %rax	; return_type
; src/parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	%rax, 64(%rsp)	; return_type, %sfp
; src/parser.c:196:     if (return_type == 0) {
	je	.L632	;,
; src/parser.c:200:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	get_next_token@PLT	;
; src/parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	movq	16(%rsp), %r9	; %sfp, token
	cmpl	$1, 24(%rax)	;, token_219->type
	jne	.L633	;,
; src/parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	(%rax), %rdi	; token_219->lexeme, token_219->lexeme
	movq	40(%rsp), %r8	; %sfp,
	xorl	%ecx, %ecx	;
	movl	$3, %esi	;,
	movq	64(%rsp), %rdx	; %sfp,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	create_name@PLT	;
; src/parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	%rax, 96(%rsp)	; tmp464, %sfp
; src/parser.c:207:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	16(%rsp), %r9	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_223->type
; src/parser.c:207:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp465, token
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	jne	.L509	;,
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_223->lexeme, token_223->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp466
	je	.L509	;,
; src/parser.c:213:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	16(%rsp), %r9	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_228->type
; src/parser.c:213:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp467, token
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	je	.L510	;,
.L512:
; src/parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%r15, %rsi	; token,
	leaq	.LC75(%rip), %rdi	;, tmp342
	movq	%r9, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
.L511:
; src/parser.c:217:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp469, token
; src/parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list@PLT	;
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	56(%rsp), %rdi	; %sfp,
	movq	%rbx, %rsi	; self,
	xorl	%edx, %edx	;
; src/parser.c:219:     list(Variable*) parameters = create_list();
	movq	%rax, 80(%rsp)	; tmp470, %sfp
	movq	%r15, %rbx	; token, token
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	create_variable@PLT	;
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	80(%rsp), %rdi	; %sfp,
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	%rax, %rsi	; tmp471, _235
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	call	list_append@PLT	;
	movq	16(%rsp), %r15	; %sfp, token
	.p2align 4,,10
	.p2align 3
.L513:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_236->type
	je	.L634	;,
.L616:
	movq	%r15, %r9	; token, token
	movq	%rbx, %r15	; token, token
.L517:
; src/parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%r15, %rsi	; token,
	leaq	.LC76(%rip), %rdi	;, tmp347
	movq	%r9, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
	jmp	.L504	;
	.p2align 4,,10
	.p2align 3
.L538:
; src/parser.c:315:     return create_class(name, members, class_scope);
	movq	72(%rsp), %r10	; %sfp, token
	movq	40(%rsp), %rdx	; %sfp,
	movq	48(%rsp), %rsi	; %sfp,
	movq	56(%rsp), %rdi	; %sfp,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	create_class@PLT	;
; src/parser.c:52:             if (class_ == 0)
	movq	16(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; _208
; src/parser.c:315:     return create_class(name, members, class_scope);
	movq	%rax, %rcx	; tmp495, _208
; src/parser.c:52:             if (class_ == 0)
	jne	.L539	;,
	jmp	.L496	;
	.p2align 4,,10
	.p2align 3
.L535:
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_198->lexeme, token_198->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp492
	je	.L536	;,
	jmp	.L533	;
	.p2align 4,,10
	.p2align 3
.L621:
; src/parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC69(%rip), %rdi	;, tmp325
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L496	;
	.p2align 4,,10
	.p2align 3
.L625:
; src/parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC53(%rip), %rdi	;, tmp285
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
.L458:
; src/parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	%r10, %rsi	; token,
	leaq	.LC56(%rip), %rdi	;, tmp293
	call	parser_error@PLT	;
	xorl	%esi, %esi	; _111
	jmp	.L465	;
	.p2align 4,,10
	.p2align 3
.L463:
; src/parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%r12, %rsi	; token,
	leaq	.LC55(%rip), %rdi	;, tmp289
	movq	%r10, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L458	;
	.p2align 4,,10
	.p2align 3
.L475:
; src/parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%r13, %rsi	; token,
	leaq	.LC60(%rip), %rdi	;, tmp302
	movq	%r10, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L470	;
	.p2align 4,,10
	.p2align 3
.L509:
; src/parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%r15, %rsi	; token,
	leaq	.LC74(%rip), %rdi	;, tmp339
	movq	%r9, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
.L504:
; src/parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%r9, %rsi	; token,
	leaq	.LC83(%rip), %rdi	;, tmp364
	call	parser_error@PLT	;
	xorl	%esi, %esi	; _273
.L532:
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%edi, %edi	;
	xorl	%edx, %edx	;
	call	create_class_member@PLT	;
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rdi	; %sfp,
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rsi	; tmp486, _190
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append@PLT	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L533	;
	.p2align 4,,10
	.p2align 3
.L630:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdi	; token_132->lexeme, token_132->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp439
	je	.L484	;,
; src/parser.c:153:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%rbx, 16(%rsp)	; token, %sfp
	movzbl	56(%rsp), %ebx	; %sfp, have_return
	call	get_next_token@PLT	;
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_149->type
; src/parser.c:153:     token = get_next_token(lexer, true);
	movq	%rax, %r13	; tmp440, token
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L486	;,
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_149->lexeme, token_149->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp441
	je	.L486	;,
; src/parser.c:159:     list(Statement*) body = create_list();
	call	create_list@PLT	;
; src/parser.c:160:     parser->in_function = true;
	movq	8(%rsp), %rcx	; %sfp, parser
; src/parser.c:162:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:159:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	; tmp442, %sfp
; src/parser.c:160:     parser->in_function = true;
	movb	$1, (%rcx)	;, parser_72(D)->in_function
; src/parser.c:162:     token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	movq	%r15, 72(%rsp)	; parameters, %sfp
	movq	%rax, %r13	; tmp443, token
	movq	56(%rsp), %r15	; %sfp, body
	movq	%r10, 64(%rsp)	; token, %sfp
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L487	;
	.p2align 4,,10
	.p2align 3
.L489:
; src/parser.c:171:             have_return = true;
	cmpl	$5, 8(%rax)	;, statement_156->type
	movl	$1, %ecx	;, tmp528
; src/parser.c:172:         list_append(body, (pointer)statement);
	movq	%rax, %rsi	; statement,
	movq	%r15, %rdi	; body,
; src/parser.c:171:             have_return = true;
	cmove	%ecx, %ebx	; have_return,, tmp528, have_return
; src/parser.c:172:         list_append(body, (pointer)statement);
	call	list_append@PLT	;
; src/parser.c:173:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp445, token
.L487:
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_157->type
	jne	.L491	;,
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdi	; token_157->lexeme, token_157->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp446
	jne	.L635	;,
.L491:
; src/parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	8(%rsp), %rdx	; %sfp,
	movq	%r12, %rsi	; function_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_statement	;
; src/parser.c:166:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L636	;,
; src/parser.c:168:         else if (have_return)
	testb	%bl, %bl	; have_return
	je	.L489	;,
; src/parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;,
	movq	%rax, 16(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %rax	; %sfp, statement
	jmp	.L489	;
	.p2align 4,,10
	.p2align 3
.L479:
; src/parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rsi	; parameter,
	movq	%r15, %rdi	; parameters,
	call	list_append@PLT	;
	jmp	.L478	;
	.p2align 4,,10
	.p2align 3
.L480:
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%rax), %rdi	; token_134->lexeme, token_134->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp436
	jne	.L637	;,
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_134->type
	jne	.L483	;,
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdi	; token_134->lexeme, token_134->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp438
	jne	.L476	;,
	jmp	.L483	;
	.p2align 4,,10
	.p2align 3
.L634:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_236->lexeme, token_236->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp478
	jne	.L638	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_236->type
	jne	.L616	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%rbx), %rdi	; token_236->lexeme, token_236->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp472
	je	.L639	;,
; src/parser.c:223:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	8(%rsp), %rdx	; %sfp,
	movq	%r13, %rsi	; method_scope,
	movq	%rbp, %rdi	; lexer,
; src/parser.c:223:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp473, token
; src/parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	;
; src/parser.c:231:         if (parameter == 0)
	testq	%rax, %rax	; parameter
	je	.L640	;,
; src/parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	;, parameter_242->value
	je	.L523	;,
; src/parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC78(%rip), %rdi	;,
	call	parser_error@PLT	;
.L522:
; src/parser.c:237:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp477, token
	jmp	.L513	;
	.p2align 4,,10
	.p2align 3
.L523:
; src/parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	80(%rsp), %rdi	; %sfp,
	movq	%rax, %rsi	; parameter,
	call	list_append@PLT	;
	jmp	.L522	;
	.p2align 4,,10
	.p2align 3
.L631:
; src/parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%r13, %rsi	; token,
	leaq	.LC61(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L478	;
	.p2align 4,,10
	.p2align 3
.L640:
; src/parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC77(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L522	;
	.p2align 4,,10
	.p2align 3
.L618:
; src/parser.c:24:         builtin_scope = create_scope(0);
	xorl	%edi, %edi	;
	call	create_scope@PLT	;
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	VOID_KEYWORD(%rip), %rdi	; VOID_KEYWORD,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
; src/parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, %r8	; tmp403, _2
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	xorl	%esi, %esi	;
; src/parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	create_name@PLT	;
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	INT_KEYWORD(%rip), %rdi	; INT_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; tmp404, name_void
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	create_name@PLT	;
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	FLOAT_KEYWORD(%rip), %rdi	; FLOAT_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; tmp405, name_int
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	create_name@PLT	;
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	STRING_KEYWORD(%rip), %rdi	; STRING_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; tmp406, name_float
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	create_name@PLT	;
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	xorl	%ecx, %ecx	;
	xorl	%edx, %edx	;
	movq	BOOL_KEYWORD(%rip), %rdi	; BOOL_KEYWORD,
	xorl	%esi, %esi	;
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; tmp407, name_string
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	call	create_name@PLT	;
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; tmp408, name_bool
	jmp	.L452	;
	.p2align 4,,10
	.p2align 3
.L471:
; src/parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%r13, %rsi	; token,
	leaq	.LC57(%rip), %rdi	;, tmp296
	movq	%r10, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L470	;
	.p2align 4,,10
	.p2align 3
.L505:
; src/parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%r15, %rsi	; token,
	leaq	.LC71(%rip), %rdi	;, tmp333
	movq	%r9, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
	jmp	.L504	;
	.p2align 4,,10
	.p2align 3
.L624:
; src/parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC84(%rip), %rdi	;, tmp367
	movq	%rax, 16(%rsp)	; variable, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %rdx	; %sfp, variable
	jmp	.L534	;
	.p2align 4,,10
	.p2align 3
.L637:
; src/parser.c:146:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp437, token
; src/parser.c:147:             token_ptr = token;
	jmp	.L476	;
.L629:
; src/parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rsi	; token,
	leaq	.LC59(%rip), %rdi	;, tmp300
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L470	;
.L633:
; src/parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rsi	; token,
	leaq	.LC73(%rip), %rdi	;, tmp337
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
	jmp	.L504	;
.L626:
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	(%r12), %rdi	; token_92->lexeme, token_92->lexeme
	movq	FROM_KEYWORD(%rip), %rsi	; FROM_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	16(%rsp), %r10	; %sfp, token
	testb	%al, %al	; tmp415
	jne	.L460	;,
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%r12), %eax	; token_92->type, _93
	jmp	.L459	;
.L639:
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbx)	;, token_236->type
	movq	%r15, %r9	; token, token
	movq	%rbx, %r15	; token, token
	jne	.L517	;,
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	(%rbx), %rdi	; token_236->lexeme, token_236->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp475
	je	.L517	;,
.L525:
; src/parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	get_next_token@PLT	;
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	16(%rsp), %r9	; %sfp, token
	cmpl	$5, 24(%rax)	;, token_254->type
; src/parser.c:240:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	; tmp476, token
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	jne	.L520	;,
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_254->lexeme, token_254->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp479
	je	.L520	;,
	movq	%r9, 88(%rsp)	; token, %sfp
; src/parser.c:246:     list(Statement*) body = create_list();
	call	create_list@PLT	;
; src/parser.c:247:     ((parser))->in_function = true;
	movl	$257, %esi	;,
; src/parser.c:250:     token = get_next_token(lexer, true);
	movq	%rbp, %rdi	; lexer,
; src/parser.c:246:     list(Statement*) body = create_list();
	movq	%rax, 16(%rsp)	; tmp480, %sfp
; src/parser.c:247:     ((parser))->in_function = true;
	movq	8(%rsp), %rax	; %sfp, parser
	movw	%si, (%rax)	;, MEM <vector(2) char> [(char *)parser_72(D)]
; src/parser.c:250:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	call	get_next_token@PLT	;
	movq	88(%rsp), %r9	; %sfp, token
; src/parser.c:249:     bool have_return = false;
	xorl	%edx, %edx	; have_return
; src/parser.c:250:     token = get_next_token(lexer, true);
	movq	%rax, %r15	; tmp481, token
	movl	%edx, %ebx	; have_return, have_return
	movq	%r9, 104(%rsp)	; token, %sfp
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L526	;
	.p2align 4,,10
	.p2align 3
.L528:
; src/parser.c:260:         list_append(body, (pointer)statement);
	movq	16(%rsp), %rdi	; %sfp,
; src/parser.c:259:             have_return = true;
	cmpl	$5, 8(%rax)	;, statement_261->type
	movl	$1, %ecx	;, tmp533
; src/parser.c:260:         list_append(body, (pointer)statement);
	movq	%rax, %rsi	; statement,
; src/parser.c:259:             have_return = true;
	cmove	%ecx, %ebx	; have_return,, tmp533, have_return
; src/parser.c:260:         list_append(body, (pointer)statement);
	call	list_append@PLT	;
; src/parser.c:261:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r15	; tmp483, token
.L526:
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r15)	;, token_262->type
	jne	.L530	;,
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r15), %rdi	; token_262->lexeme, token_262->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp484
	jne	.L641	;,
.L530:
; src/parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	8(%rsp), %rdx	; %sfp,
	movq	%r13, %rsi	; method_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_statement	;
; src/parser.c:254:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L642	;,
; src/parser.c:256:         else if (have_return)
	testb	%bl, %bl	; have_return
	je	.L528	;,
; src/parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	%r15, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;,
	movq	%rax, 88(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	88(%rsp), %rax	; %sfp, statement
	jmp	.L528	;
.L520:
; src/parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC79(%rip), %rdi	;, tmp354
	movq	%r9, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
	jmp	.L504	;
	.p2align 4,,10
	.p2align 3
.L642:
; src/parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%r15, %rsi	; token,
	leaq	.LC81(%rip), %rdi	;,
	movq	%rax, 88(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	88(%rsp), %rax	; %sfp, statement
	jmp	.L528	;
.L510:
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	(%rax), %rdi	; token_228->lexeme, token_228->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	movq	%r9, 16(%rsp)	; token, %sfp
	call	string_equal@PLT	;
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	16(%rsp), %r9	; %sfp, token
	testb	%al, %al	; tmp468
	je	.L512	;,
	jmp	.L511	;
.L627:
; src/parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	24(%rsp), %r8	; %sfp,
	movq	%r13, %rdi	; import_name,
	xorl	%ecx, %ecx	;
	movl	$1, %esi	;,
	movq	name_void(%rip), %rdx	; name_void,
	call	create_name@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	movq	%rax, %rdi	; tmp420, name
	jmp	.L464	;
.L641:
; src/parser.c:264:     ((parser))->in_function = false;
	movq	8(%rsp), %rax	; %sfp, parser
	xorl	%ecx, %ecx	;
	movq	104(%rsp), %r9	; %sfp, token
	movw	%cx, (%rax)	;, MEM <vector(2) char> [(char *)parser_72(D)]
; src/parser.c:266:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	; have_return
	jne	.L531	;,
; src/parser.c:266:     if (!have_return && return_type != name_void)
	movq	64(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L531	;,
; src/parser.c:267:         parser_error("Method missing return statement", token);
	movq	%r15, %rsi	; token,
	leaq	.LC82(%rip), %rdi	;, tmp363
	movq	%r9, 88(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	88(%rsp), %r9	; %sfp, token
.L531:
; src/parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	64(%rsp), %rsi	; %sfp,
	movq	16(%rsp), %rcx	; %sfp,
	movq	%r13, %r8	; method_scope,
	movq	%r9, 88(%rsp)	; token, %sfp
	movq	80(%rsp), %rdx	; %sfp,
	movq	96(%rsp), %rdi	; %sfp,
	call	create_method@PLT	;
; src/parser.c:296:             if (method == 0)
	movq	88(%rsp), %r9	; %sfp, token
	testq	%rax, %rax	; _273
; src/parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%rax, %rsi	; tmp485, _273
; src/parser.c:296:             if (method == 0)
	jne	.L532	;,
	jmp	.L504	;
	.p2align 4,,10
	.p2align 3
.L628:
; src/parser.c:116:         parser_error("Unknown function return type", token);
	movq	%r13, %rsi	; token,
	leaq	.LC58(%rip), %rdi	;, tmp299
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L470	;
.L632:
; src/parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%r15, %rsi	; token,
	leaq	.LC72(%rip), %rdi	;, tmp336
	call	parser_error@PLT	;
	movq	16(%rsp), %r9	; %sfp, token
	jmp	.L504	;
.L636:
; src/parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC65(%rip), %rdi	;,
	movq	%rax, 16(%rsp)	; statement, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %rax	; %sfp, statement
	jmp	.L489	;
.L460:
; src/parser.c:79:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	get_next_token@PLT	;
; src/parser.c:81:         if (token_ptr->type != STRING) {
	movq	16(%rsp), %r10	; %sfp, token
	cmpl	$4, 24(%rax)	;, token_97->type
	jne	.L643	;,
; src/parser.c:86:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	movq	%r10, 16(%rsp)	; token, %sfp
; src/parser.c:85:         source = token_ptr->lexeme;
	movq	(%rax), %rbx	; token_97->lexeme, source
; src/parser.c:86:         token = get_next_token(lexer, true);
	call	get_next_token@PLT	;
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	16(%rsp), %r10	; %sfp, token
; src/parser.c:86:         token = get_next_token(lexer, true);
	movq	%rax, %r12	; tmp417, token
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rax), %eax	; token_100->type, _93
	jmp	.L459	;
.L638:
	movq	%r15, %r9	; token, token
	jmp	.L525	;
.L486:
; src/parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%r13, %rsi	; token,
	leaq	.LC64(%rip), %rdi	;, tmp314
	movq	%r10, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L470	;
.L635:
; src/parser.c:176:     ((parser))->in_function = false;
	movq	8(%rsp), %rax	; %sfp, parser
	movq	64(%rsp), %r10	; %sfp, token
	movq	72(%rsp), %r15	; %sfp, parameters
	movb	$0, (%rax)	;, parser_72(D)->in_function
; src/parser.c:177:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	; have_return
	jne	.L492	;,
; src/parser.c:177:     if (!have_return && return_type != name_void)
	movq	40(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L492	;,
; src/parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;, tmp321
	movq	%r10, 16(%rsp)	; token, %sfp
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
.L492:
; src/parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	56(%rsp), %rcx	; %sfp,
	movq	40(%rsp), %rsi	; %sfp,
	movq	%r15, %rdx	; parameters,
	movq	%r12, %r8	; function_scope,
	movq	48(%rsp), %rdi	; %sfp,
	movq	%r10, 16(%rsp)	; token, %sfp
	call	create_function@PLT	;
; src/parser.c:47:             if (function == 0)
	movq	16(%rsp), %r10	; %sfp, token
	testq	%rax, %rax	; _168
; src/parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rax, %rdx	; tmp447, _168
; src/parser.c:47:             if (function == 0)
	jne	.L493	;,
	jmp	.L470	;
	.p2align 4,,10
	.p2align 3
.L643:
; src/parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC54(%rip), %rdi	;, tmp288
	call	parser_error@PLT	;
	movq	16(%rsp), %r10	; %sfp, token
	jmp	.L458	;
	.cfi_endproc
.LFE65:
	.size	parse_code, .-parse_code
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

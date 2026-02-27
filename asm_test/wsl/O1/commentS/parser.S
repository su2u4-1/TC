	.file	"parser.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O1 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Failed to parse right operand"
	.text
	.type	parse_expr_prec, @function
parse_expr_prec:
.LFB75:
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp	;,
	.cfi_def_cfa_offset 96
	movq	%rdi, %r12	; tmp119, lexer
	movq	%rsi, 8(%rsp)	; tmp120, %sfp
	movl	%edx, 28(%rsp)	; tmp121, %sfp
	movq	%rcx, 16(%rsp)	; tmp122, %sfp
	movq	%r8, %r15	; tmp123, parser
; src/parser.c:647:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	call	peek_next_token@PLT	;
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_24->type
	je	.L7	;,
	movq	8(%rsp), %rbp	; %sfp, <retval>
	jmp	.L2	;
.L15:
; src/parser.c:660:             parser_error("Failed to parse right operand", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC0(%rip), %rdi	;, tmp112
	call	parser_error@PLT	;
; src/parser.c:661:             return NULL;
	jmp	.L1	;
.L13:
; src/parser.c:674:             token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_49->type
	jne	.L5	;,
.L6:
; src/parser.c:667:             OperatorType next_op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rdi	; token_ptr_66->lexeme, token_ptr_66->lexeme
	call	string_to_operator@PLT	;
	movl	%eax, %ebx	; tmp131, next_op
; src/parser.c:668:             int next_prec = operator_precedence(next_op);
	movl	%eax, %edi	; next_op,
	call	operator_precedence@PLT	;
; src/parser.c:669:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %ebx	;, next_op
	je	.L5	;,
	cmpl	%eax, %r13d	; next_prec, op_prec
	jge	.L5	;,
; src/parser.c:671:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	%r15, %r8	; parser,
	movq	16(%rsp), %rcx	; %sfp,
	movl	%eax, %edx	; next_prec,
	movq	%rbp, %rsi	; <retval>,
	movq	%r12, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %rbp	; tmp133, <retval>
; src/parser.c:672:             if (right == 0)
	testq	%rax, %rax	; <retval>
	jne	.L13	;,
	jmp	.L1	;
.L5:
; src/parser.c:677:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rbp, %rcx	; <retval>,
	movl	$0, %edx	;,
	movq	8(%rsp), %rsi	; %sfp,
	movl	%r14d, %edi	; op,
	call	create_expression@PLT	;
	movq	%rax, 8(%rsp)	; tmp135, %sfp
; src/parser.c:678:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:649:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_53->type
	jne	.L14	;,
.L7:
; src/parser.c:650:         OperatorType op = string_to_operator(token_ptr->lexeme);
	movq	(%rax), %rdi	; token_ptr_67->lexeme, token_ptr_67->lexeme
	call	string_to_operator@PLT	;
	movl	%eax, %r14d	; tmp125, op
; src/parser.c:651:         int op_prec = operator_precedence(op);
	movl	%eax, %edi	; op,
	call	operator_precedence@PLT	;
	movl	%eax, %r13d	; tmp126, op_prec
; src/parser.c:652:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %r14d	;, op
	je	.L9	;,
	movl	28(%rsp), %eax	; %sfp, min_prec
	cmpl	%eax, %r13d	; min_prec, op_prec
	jl	.L9	;,
; src/parser.c:654:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:656:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp127, token
; src/parser.c:658:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	%r15, %rdx	; parser,
	movq	16(%rsp), %rsi	; %sfp,
	movq	%r12, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rbp	; tmp128, <retval>
; src/parser.c:659:         if (right_primary == 0) {
	testq	%rax, %rax	; <retval>
	je	.L15	;,
; src/parser.c:663:         Expression* right = create_expression(OP_NONE, NULL, right_primary, 0);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; <retval>,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	create_expression@PLT	;
	movq	%rax, %rbp	; tmp129, <retval>
; src/parser.c:664:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:666:         while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_41->type
	je	.L6	;,
	jmp	.L5	;
.L14:
	movq	8(%rsp), %rbp	; %sfp, <retval>
	jmp	.L2	;
.L9:
	movq	8(%rsp), %rbp	; %sfp, <retval>
.L2:
; src/parser.c:681:     token = peek_current_token(lexer);
	movq	%r12, %rdi	; lexer,
	call	peek_current_token@PLT	;
.L1:
; src/parser.c:684: }
	movq	%rbp, %rax	; <retval>,
	addq	$40, %rsp	;,
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
	ret	
	.cfi_endproc
.LFE75:
	.size	parse_expr_prec, .-parse_expr_prec
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"Failed to parse expression primary"
	.text
	.type	parse_expression, @function
parse_expression:
.LFB76:
	.cfi_startproc
	pushq	%r13	;
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12	;
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp	;
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx	;
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 48
	movq	%rdi, %rbp	; tmp90, lexer
	movq	%rsi, %r12	; tmp91, now_scope
	movq	%rdx, %r13	; tmp92, parser
; src/parser.c:689:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	;
	movq	%rax, %rbx	; tmp93, <retval>
; src/parser.c:690:     if (left_primary == 0) {
	testq	%rax, %rax	; <retval>
	je	.L20	;,
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; <retval>,
	movl	$0, %esi	;,
	movl	$19, %edi	;,
	call	create_expression@PLT	;
	movq	%rax, %rsi	; tmp95, _2
; src/parser.c:694:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r13, %r8	; parser,
	movq	%r12, %rcx	; now_scope,
	movl	$0, %edx	;,
	movq	%rbp, %rdi	; lexer,
	call	parse_expr_prec	;
	movq	%rax, %rbx	; tmp96, <retval>
.L16:
; src/parser.c:695: }
	movq	%rbx, %rax	; <retval>,
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx	;
	.cfi_def_cfa_offset 32
	popq	%rbp	;
	.cfi_def_cfa_offset 24
	popq	%r12	;
	.cfi_def_cfa_offset 16
	popq	%r13	;
	.cfi_def_cfa_offset 8
	ret	
.L20:
	.cfi_restore_state
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	movq	%rbp, %rdi	; lexer,
	call	peek_current_token@PLT	;
	movq	%rax, %rsi	; tmp94, _1
; src/parser.c:691:         parser_error("Failed to parse expression primary", peek_current_token(lexer));
	leaq	.LC1(%rip), %rdi	;, tmp88
	call	parser_error@PLT	;
; src/parser.c:692:         return NULL;
	jmp	.L16	;
	.cfi_endproc
.LFE76:
	.size	parse_expression, .-parse_expression
	.section	.rodata.str1.1
.LC2:
	.string	"Expected variable type"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"Expected a type for variable declaration"
	.section	.rodata.str1.1
.LC4:
	.string	"Unknown variable type"
.LC5:
	.string	"Expected variable name"
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"Failed to parse variable initializer"
	.text
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
	subq	$24, %rsp	;,
	.cfi_def_cfa_offset 80
	movq	%rdi, %rbx	; tmp118, lexer
	movq	%rsi, %r12	; tmp119, now_scope
	movq	%rdx, %r13	; tmp120, parser
; src/parser.c:323:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
	movq	%rax, %r14	; tmp121, token
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_25->type, _1
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _1
	je	.L22	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _1
	jne	.L23	;,
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%r14), %rdi	; token_25->lexeme, token_25->lexeme
	call	is_builtin_type@PLT	;
; src/parser.c:325:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp122
	je	.L23	;,
.L22:
; src/parser.c:329:     Name* type = search(now_scope, token_ptr->lexeme);
	movq	(%r14), %rsi	; token_25->lexeme, token_25->lexeme
	movq	%r12, %rdi	; now_scope,
	call	search@PLT	;
	movq	%rax, %rbp	; tmp123, type
; src/parser.c:330:     if (type != 0) {
	testq	%rax, %rax	; type
	je	.L25	;,
; src/parser.c:332:         if (type_ptr->kind != NAME_TYPE && type_ptr->kind != NAME_CLASS)
	testl	$-5, 24(%rax)	;, type_30->kind
	jne	.L32	;,
.L26:
; src/parser.c:336:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp124, token
; src/parser.c:338:     if (token_ptr->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	;, token_35->type
	jne	.L33	;,
.L27:
; src/parser.c:340:     Name* name = create_name(token_ptr->lexeme, NAME_VARIABLE, type, NULL, now_scope);
	movq	(%r14), %rdi	; token_35->lexeme, token_35->lexeme
	movq	%r12, %r8	; now_scope,
	movl	$0, %ecx	;,
	movq	%rbp, %rdx	; type,
	movl	$1, %esi	;,
	call	create_name@PLT	;
	movq	%rax, %r14	; tmp125, name
; src/parser.c:342:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	peek_next_token@PLT	;
; src/parser.c:341:     Expression* value = 0;
	movl	$0, %r15d	;, value
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_40->type
	je	.L34	;,
.L28:
; src/parser.c:353:     return create_variable(type, name, value);
	movq	%r15, %rdx	; value,
	movq	%r14, %rsi	; name,
	movq	%rbp, %rdi	; type,
	call	create_variable@PLT	;
.L21:
; src/parser.c:354: }
	addq	$24, %rsp	;,
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
	ret	
.L23:
	.cfi_restore_state
; src/parser.c:326:         parser_error("Expected variable type", token);
	movq	%r14, %rsi	; token,
	leaq	.LC2(%rip), %rdi	;, tmp106
	call	parser_error@PLT	;
; src/parser.c:327:         return NULL;
	movl	$0, %eax	;, <retval>
	jmp	.L21	;
.L32:
; src/parser.c:333:             parser_error("Expected a type for variable declaration", token);
	movq	%r14, %rsi	; token,
	leaq	.LC3(%rip), %rdi	;, tmp110
	call	parser_error@PLT	;
	jmp	.L26	;
.L25:
; src/parser.c:335:         parser_error("Unknown variable type", token);
	movq	%r14, %rsi	; token,
	leaq	.LC4(%rip), %rdi	;, tmp111
	call	parser_error@PLT	;
	jmp	.L26	;
.L33:
; src/parser.c:339:         parser_error("Expected variable name", token);
	movq	%rax, %rsi	; token,
	leaq	.LC5(%rip), %rdi	;, tmp112
	call	parser_error@PLT	;
	jmp	.L27	;
.L34:
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	movq	(%rax), %rdi	; token_40->lexeme, token_40->lexeme
	movq	ASSIGN_SYMBOL(%rip), %rsi	; ASSIGN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:344:     if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	; tmp127
	je	.L28	;,
; src/parser.c:345:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:347:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, 8(%rsp)	; tmp128, %sfp
; src/parser.c:349:         value = parse_expression(lexer, now_scope, parser);
	movq	%r13, %rdx	; parser,
	movq	%r12, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r15	; tmp129, value
; src/parser.c:350:         if (value == 0)
	testq	%rax, %rax	; value
	jne	.L28	;,
; src/parser.c:351:             parser_error("Failed to parse variable initializer", token);
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC6(%rip), %rdi	;, tmp116
	call	parser_error@PLT	;
	jmp	.L28	;
	.cfi_endproc
.LFE70:
	.size	parse_variable, .-parse_variable
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Failed to parse parenthesized expression"
	.section	.rodata.str1.1
.LC8:
	.string	"Expected ')' after expression"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Failed to parse operand of unary '!'"
	.align 8
.LC10:
	.string	"Failed to parse operand of unary '-'"
	.align 8
.LC11:
	.string	"Expected variable name in variable access"
	.align 8
.LC12:
	.string	"Cannot call undefined variable"
	.align 8
.LC13:
	.string	"Cannot call non-function variable"
	.align 8
.LC14:
	.string	"Failed to parse function call argument"
	.align 8
.LC15:
	.string	"Expected ',' or ')' after function call argument"
	.align 8
.LC16:
	.string	"Failed to parse sequence index"
	.align 8
.LC17:
	.string	"Expected ']' after sequence index"
	.align 8
.LC18:
	.string	"Cannot access attribute without a valid scope"
	.align 8
.LC19:
	.string	"Expected attribute name after '.'"
	.section	.rodata.str1.1
.LC20:
	.string	"Unknown attribute name"
	.section	.rodata.str1.8
	.align 8
.LC21:
	.string	"Failed to parse variable access"
	.align 8
.LC22:
	.string	"Unexpected token in primary expression"
	.text
	.type	parse_primary, @function
parse_primary:
.LFB77:
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp	;,
	.cfi_def_cfa_offset 96
	movq	%rdi, %rbp	; tmp245, lexer
	movq	%rsi, %r15	; tmp246, now_scope
	movq	%rdx, %r14	; tmp247, parser
; src/parser.c:702:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
	movq	%rax, %r12	; tmp248, token
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	movl	24(%rax), %eax	; token_49->type, _1
; src/parser.c:709:     if (token_ptr->type == INTEGER) {
	cmpl	$2, %eax	;, _1
	je	.L87	;,
; src/parser.c:712:     } else if (token_ptr->type == FLOAT) {
	cmpl	$3, %eax	;, _1
	je	.L88	;,
; src/parser.c:715:     } else if (token_ptr->type == STRING) {
	cmpl	$4, %eax	;, _1
	je	.L89	;,
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	;, _1
	je	.L90	;,
.L40:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_49->type
	je	.L91	;,
.L48:
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movl	24(%r12), %eax	; token_49->type, _25
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$1, %eax	;, _25
	je	.L49	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpl	$6, %eax	;, _25
	jne	.L50	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	movq	(%r12), %rdi	; token_49->lexeme, token_49->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	testb	%al, %al	; tmp262
	je	.L50	;,
; src/parser.c:757:     } else if (token_ptr->type == IDENTIFIER || (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD) && ((parser))->in_method)) {
	cmpb	$0, 1(%r14)	;, parser_58(D)->in_method
	je	.L50	;,
.L49:
; src/parser.c:774:     Token* token = peek_current_token(lexer);
	movq	%rbp, %rdi	; lexer,
	call	peek_current_token@PLT	;
	movq	%rax, %rbx	; tmp263, token
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	; token_88->type, _89
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	;, _89
	je	.L51	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	;, _89
	jne	.L52	;,
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	movq	(%rbx), %rdi	; token_88->lexeme, token_88->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:776:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	; tmp264
	je	.L52	;,
.L51:
; src/parser.c:784:     base_name = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rsi	; token_88->lexeme, token_88->lexeme
	movq	%r15, %rdi	; now_scope,
	call	search@PLT	;
	movq	%rax, 16(%rsp)	; base_name, %sfp
; src/parser.c:785:     VariableAccess* base = create_variable_access(VAR_NAME, 0, base_name, NULL, NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	%rax, %rdx	; base_name,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, (%rsp)	; tmp266, %sfp
; src/parser.c:786:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	peek_next_token@PLT	;
	movq	%rax, %rbx	; tmp267, token_ptr
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_96->type
	jne	.L54	;,
; src/parser.c:780:     Name* current_type = 0;
	movl	$0, %r13d	;, current_type
; src/parser.c:782:     Scope* var_scope = 0;
	movq	$0, 8(%rsp)	;, %sfp
	jmp	.L76	;
.L87:
; src/parser.c:711:         str_value = token_ptr->lexeme;
	movq	(%r12), %rsi	; token_49->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:710:         type = PRIM_INTEGER;
	movl	$0, %r12d	;, type
.L37:
; src/parser.c:768:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	(%rsp), %r8	; %sfp,
	movq	%rbp, %rcx	; prim_value,
	movq	%rbx, %rdx	; <retval>,
	movl	%r12d, %edi	; type,
	call	create_primary@PLT	;
	movq	%rax, %rbx	; tmp290, <retval>
.L35:
; src/parser.c:769: }
	movq	%rbx, %rax	; <retval>,
	addq	$40, %rsp	;,
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
	ret	
.L88:
	.cfi_restore_state
; src/parser.c:714:         str_value = token_ptr->lexeme;
	movq	(%r12), %rsi	; token_49->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:713:         type = PRIM_FLOAT;
	movl	$1, %r12d	;, type
	jmp	.L37	;
.L89:
; src/parser.c:717:         str_value = token_ptr->lexeme;
	movq	(%r12), %rsi	; token_49->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:716:         type = PRIM_STRING;
	movl	$2, %r12d	;, type
	jmp	.L37	;
.L90:
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	movq	(%r12), %rdi	; token_49->lexeme, token_49->lexeme
	movq	TRUE_KEYWORD(%rip), %rsi	; TRUE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:718:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	; tmp249
	je	.L41	;,
; src/parser.c:720:         str_value = token_ptr->lexeme;
	movq	(%r12), %rsi	; token_49->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:719:         type = PRIM_TRUE;
	movl	$3, %r12d	;, type
; src/parser.c:720:         str_value = token_ptr->lexeme;
	jmp	.L37	;
.L41:
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, 24(%r12)	;, token_49->type
	jne	.L40	;,
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	movq	(%r12), %rdi	; token_49->lexeme, token_49->lexeme
	movq	FALSE_KEYWORD(%rip), %rsi	; FALSE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:721:     } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	; tmp250
	je	.L40	;,
; src/parser.c:723:         str_value = token_ptr->lexeme;
	movq	(%r12), %rsi	; token_49->lexeme, str_value
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:722:         type = PRIM_FALSE;
	movl	$4, %r12d	;, type
; src/parser.c:723:         str_value = token_ptr->lexeme;
	jmp	.L37	;
.L91:
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r12), %rdi	; token_49->lexeme, token_49->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:724:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp251
	jne	.L92	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_49->type
	jne	.L48	;,
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	movq	(%r12), %rdi	; token_49->lexeme, token_49->lexeme
	movq	NOT_SYMBOL(%rip), %rsi	; NOT_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:739:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	; tmp256
	jne	.L93	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	cmpl	$5, 24(%r12)	;, token_49->type
	jne	.L48	;,
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	movq	(%r12), %rdi	; token_49->lexeme, token_49->lexeme
	movq	SUB_SYMBOL(%rip), %rsi	; SUB_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:748:     } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	; tmp259
	je	.L48	;,
; src/parser.c:750:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp260, token
; src/parser.c:752:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r14, %rdx	; parser,
	movq	%r15, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rbp	; tmp261, prim_value
; src/parser.c:753:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	je	.L94	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:705:     string str_value = NULL;
	movl	$0, %esi	;, str_value
; src/parser.c:749:         type = PRIM_NEG_OPERAND;
	movl	$7, %r12d	;, type
	jmp	.L37	;
.L92:
; src/parser.c:726:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r12	; tmp252, token
; src/parser.c:728:         expr_value = parse_expression(lexer, now_scope, parser);
	movq	%r14, %rdx	; parser,
	movq	%r15, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %rbx	; tmp253, <retval>
; src/parser.c:729:         if (expr_value == NULL) {
	testq	%rax, %rax	; <retval>
	je	.L95	;,
; src/parser.c:733:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp254, token
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %r12d	; token_62->type, type
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %r12d	;, type
	jne	.L46	;,
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_62->lexeme, token_62->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:735:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp255
	je	.L46	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:705:     string str_value = NULL;
	movl	$0, %esi	;, str_value
	jmp	.L37	;
.L95:
; src/parser.c:730:             parser_error("Failed to parse parenthesized expression", token);
	movq	%r12, %rsi	; token,
	leaq	.LC7(%rip), %rdi	;, tmp188
	call	parser_error@PLT	;
; src/parser.c:731:             return NULL;
	jmp	.L35	;
.L46:
; src/parser.c:736:             parser_error("Expected ')' after expression", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC8(%rip), %rdi	;, tmp191
	call	parser_error@PLT	;
; src/parser.c:737:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L35	;
.L93:
; src/parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp257, token
; src/parser.c:743:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%r14, %rdx	; parser,
	movq	%r15, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_primary	;
	movq	%rax, %rbp	; tmp258, prim_value
; src/parser.c:744:         if (prim_value == 0) {
	testq	%rax, %rax	; prim_value
	je	.L96	;,
; src/parser.c:708:     VariableAccess* variable_value = NULL;
	movq	$0, (%rsp)	;, %sfp
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:705:     string str_value = NULL;
	movl	$0, %esi	;, str_value
; src/parser.c:740:         type = PRIM_NOT_OPERAND;
	movl	$6, %r12d	;, type
	jmp	.L37	;
.L96:
; src/parser.c:745:             parser_error("Failed to parse operand of unary '!'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC9(%rip), %rdi	;, tmp194
	call	parser_error@PLT	;
; src/parser.c:746:             return NULL;
	movq	%rbp, %rbx	; prim_value, <retval>
	jmp	.L35	;
.L94:
; src/parser.c:754:             parser_error("Failed to parse operand of unary '-'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC10(%rip), %rdi	;, tmp197
	call	parser_error@PLT	;
; src/parser.c:755:             return NULL;
	movq	%rbp, %rbx	; prim_value, <retval>
	jmp	.L35	;
.L52:
; src/parser.c:777:         parser_error("Expected variable name in variable access", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC11(%rip), %rdi	;, tmp202
	call	parser_error@PLT	;
; src/parser.c:778:         return NULL;
	jmp	.L77	;
.L84:
; src/parser.c:792:                 current_type = base_name_ptr->info.type;
	movq	16(%rsp), %rax	; %sfp, base_name
	movq	16(%rax), %r13	; base_name_234->info.type, current_type
.L55:
; src/parser.c:796:         if (var_scope == 0 && current_type != 0) {
	cmpq	$0, 8(%rsp)	;, %sfp
	jne	.L58	;,
	testq	%r13, %r13	; current_type
	je	.L58	;,
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:798:             if (type_ptr->kind == NAME_CLASS)
	cmpl	$4, 24(%r13)	;, current_type_108->kind
	je	.L97	;,
.L58:
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_ptr_236->lexeme, token_ptr_236->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:801:         if (string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp268
	jne	.L98	;,
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	movq	(%rbx), %rdi	; token_ptr_236->lexeme, token_ptr_236->lexeme
	movq	L_BRACKET_SYMBOL(%rip), %rsi	; L_BRACKET_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:831:         } else if (string_equal(token_ptr->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp279
	je	.L69	;,
; src/parser.c:832:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:834:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp280, token
; src/parser.c:836:             Expression* index = parse_expression(lexer, now_scope, parser);
	movq	%r14, %rdx	; parser,
	movq	%r15, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 24(%rsp)	; index, %sfp
; src/parser.c:837:             if (index == 0)
	testq	%rax, %rax	; index
	je	.L99	;,
.L70:
; src/parser.c:839:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp282, token
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_146->type
	jne	.L71	;,
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	movq	(%rax), %rdi	; token_146->lexeme, token_146->lexeme
	movq	R_BRACKET_SYMBOL(%rip), %rsi	; R_BRACKET_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:841:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACKET_SYMBOL)) {
	testb	%al, %al	; tmp283
	je	.L71	;,
; src/parser.c:845:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movl	$0, %r8d	;,
	movq	24(%rsp), %rcx	; %sfp,
	movl	$0, %edx	;,
	movq	(%rsp), %rsi	; %sfp,
	movl	$3, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, (%rsp)	; tmp284, %sfp
.L68:
; src/parser.c:869:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	peek_next_token@PLT	;
	movq	%rax, %rbx	; tmp289, token_ptr
; src/parser.c:788:     while (token_ptr->type == SYMBOL) {
	cmpl	$5, 24(%rax)	;, token_161->type
	jne	.L54	;,
.L76:
; src/parser.c:789:         if (base_name != 0) {
	movq	16(%rsp), %rax	; %sfp, base_name
	testq	%rax, %rax	; base_name
	je	.L55	;,
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	movl	24(%rax), %eax	; base_name_234->kind, _98
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	leal	-1(%rax), %edx	;, tmp204
; src/parser.c:791:             if (base_name_ptr->kind == NAME_VARIABLE || base_name_ptr->kind == NAME_ATTRIBUTE || base_name_ptr->kind == NAME_FUNCTION || base_name_ptr->kind == NAME_METHOD)
	cmpl	$2, %edx	;, tmp204
	jbe	.L84	;,
	cmpl	$5, %eax	;, _98
	je	.L84	;,
; src/parser.c:794:                 current_type = base_name;
	testl	$-5, %eax	;, _98
	cmove	16(%rsp), %r13	; current_type,, %sfp, current_type
	jmp	.L55	;
.L97:
; src/parser.c:799:                 var_scope = type_ptr->info.scope;
	movq	16(%r13), %rax	; current_type_108->info.scope, var_scope
	movq	%rax, 8(%rsp)	; var_scope, %sfp
	jmp	.L58	;
.L98:
; src/parser.c:802:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp269, token
; src/parser.c:804:             if (base_name == 0)
	cmpq	$0, 16(%rsp)	;, %sfp
	je	.L100	;,
.L60:
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	movq	16(%rsp), %rax	; %sfp, base_name
	movl	24(%rax), %eax	; base_name_234->kind, base_name_234->kind
	movl	%eax, 8(%rsp)	; base_name_234->kind, %sfp
	subl	$2, %eax	;, tmp217
; src/parser.c:807:             if (base_name_ptr->kind != NAME_FUNCTION && base_name_ptr->kind != NAME_METHOD)
	cmpl	$1, %eax	;, tmp217
	ja	.L101	;,
.L61:
; src/parser.c:809:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp270, token
; src/parser.c:811:             list(Expression*) args = create_list();
	call	create_list@PLT	;
	movq	%rax, 8(%rsp)	; tmp271, %sfp
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L62	;
.L100:
; src/parser.c:805:                 parser_error("Cannot call undefined variable", token);
	movq	%rax, %rsi	; token,
	leaq	.LC12(%rip), %rdi	;, tmp216
	call	parser_error@PLT	;
	jmp	.L60	;
.L101:
; src/parser.c:808:                 parser_error("Cannot call non-function variable", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC13(%rip), %rdi	;, tmp219
	call	parser_error@PLT	;
	jmp	.L61	;
.L104:
; src/parser.c:815:                     parser_error("Failed to parse function call argument", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC14(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L63	;
.L105:
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%rax), %rdi	; token_124->lexeme, token_124->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp274
	jne	.L102	;,
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_124->type
	jne	.L64	;,
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_124->lexeme, token_124->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:822:                 } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp276
	je	.L64	;,
.L62:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_123->type
	je	.L103	;,
.L67:
; src/parser.c:813:                 Expression* arg = parse_expression(lexer, now_scope, parser);
	movq	%r14, %rdx	; parser,
	movq	%r15, %rsi	; now_scope,
	movq	%rbp, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r13	; tmp272, arg
; src/parser.c:814:                 if (arg == 0)
	testq	%rax, %rax	; arg
	je	.L104	;,
.L63:
; src/parser.c:816:                 list_append(args, (pointer)arg);
	movq	%r13, %rsi	; arg,
	movq	8(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:817:                 token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp273, token
; src/parser.c:819:                 if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_124->type
	je	.L105	;,
.L64:
; src/parser.c:823:                     parser_error("Expected ',' or ')' after function call argument", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC15(%rip), %rdi	;, tmp225
	call	parser_error@PLT	;
.L77:
; src/parser.c:761:             parser_error("Failed to parse variable access", token);
	movq	%r12, %rsi	; token,
	leaq	.LC21(%rip), %rdi	;, tmp240
	call	parser_error@PLT	;
; src/parser.c:762:             return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L35	;
.L102:
; src/parser.c:820:                     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp275, token
; src/parser.c:821:                     token_ptr = token;
	jmp	.L62	;
.L103:
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_123->lexeme, token_123->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:812:             while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp277
	je	.L67	;,
; src/parser.c:827:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	8(%rsp), %r8	; %sfp,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movq	(%rsp), %rsi	; %sfp,
	movl	$1, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, (%rsp)	; tmp278, %sfp
; src/parser.c:828:             base_name = base_name_ptr->info.type;
	movq	16(%rsp), %rax	; %sfp, base_name
	movq	16(%rax), %rax	; base_name_234->info.type, base_name
	movq	%rax, 16(%rsp)	; base_name, %sfp
; src/parser.c:830:             var_scope = 0;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:829:             current_type = 0;
	movl	$0, %r13d	;, current_type
	jmp	.L68	;
.L99:
; src/parser.c:838:                 parser_error("Failed to parse sequence index", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC16(%rip), %rdi	;, tmp230
	call	parser_error@PLT	;
	jmp	.L70	;
.L71:
; src/parser.c:842:                 parser_error("Expected ']' after sequence index", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC17(%rip), %rdi	;, tmp233
	call	parser_error@PLT	;
; src/parser.c:843:                 return NULL;
	jmp	.L77	;
.L69:
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	movq	(%rbx), %rdi	; token_ptr_236->lexeme, token_ptr_236->lexeme
	movq	DOT_SYMBOL(%rip), %rsi	; DOT_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:846:         } else if (string_equal(token_ptr->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	; tmp285
	je	.L54	;,
; src/parser.c:847:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:849:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbp, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp286, token
; src/parser.c:851:             if (var_scope == 0) {
	cmpq	$0, 8(%rsp)	;, %sfp
	je	.L106	;,
; src/parser.c:855:             if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_155->type
	jne	.L107	;,
; src/parser.c:859:             base_name = search(var_scope, token_ptr->lexeme);
	movq	(%rax), %rsi	; token_155->lexeme, token_155->lexeme
	movq	8(%rsp), %rdi	; %sfp,
	call	search@PLT	;
	movq	%rax, 16(%rsp)	; base_name, %sfp
; src/parser.c:860:             if (base_name == 0) {
	testq	%rax, %rax	; base_name
	je	.L108	;,
; src/parser.c:864:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movq	16(%rsp), %rdx	; %sfp,
	movq	(%rsp), %rsi	; %sfp,
	movl	$2, %edi	;,
	call	create_variable_access@PLT	;
	movq	%rax, (%rsp)	; tmp288, %sfp
; src/parser.c:866:             var_scope = 0;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:865:             current_type = 0;
	movl	$0, %r13d	;, current_type
	jmp	.L68	;
.L106:
; src/parser.c:852:                 parser_error("Cannot access attribute without a valid scope", token);
	movq	%rax, %rsi	; token,
	leaq	.LC18(%rip), %rdi	;, tmp236
	call	parser_error@PLT	;
; src/parser.c:853:                 return NULL;
	jmp	.L77	;
.L107:
; src/parser.c:856:                 parser_error("Expected attribute name after '.'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC19(%rip), %rdi	;, tmp237
	call	parser_error@PLT	;
; src/parser.c:857:                 return NULL;
	jmp	.L77	;
.L108:
; src/parser.c:861:                 parser_error("Unknown attribute name", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC20(%rip), %rdi	;, tmp239
	call	parser_error@PLT	;
; src/parser.c:862:                 return NULL;
	jmp	.L77	;
.L54:
; src/parser.c:760:         if (variable_value == 0) {
	cmpq	$0, (%rsp)	;, %sfp
	je	.L77	;,
; src/parser.c:707:     Primary* prim_value = NULL;
	movl	$0, %ebp	;, prim_value
; src/parser.c:706:     Expression* expr_value = NULL;
	movl	$0, %ebx	;, <retval>
; src/parser.c:705:     string str_value = NULL;
	movl	$0, %esi	;, str_value
; src/parser.c:758:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %r12d	;, type
	jmp	.L37	;
.L50:
; src/parser.c:765:         parser_error("Unexpected token in primary expression", token);
	movq	%r12, %rsi	; token,
	leaq	.LC22(%rip), %rdi	;, tmp241
	call	parser_error@PLT	;
; src/parser.c:766:         return NULL;
	movl	$0, %ebx	;, <retval>
	jmp	.L35	;
	.cfi_endproc
.LFE77:
	.size	parse_primary, .-parse_primary
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp	;,
	.cfi_def_cfa_offset 112
	movq	%rdi, %rbx	; tmp371, lexer
	movq	%rsi, %r13	; tmp372, now_scope
	movq	%rdx, %r12	; tmp373, parser
; src/parser.c:361:     token = peek_current_token(lexer);
	call	peek_current_token@PLT	;
; src/parser.c:364:     if (token_ptr->type == KEYWORD) {
	cmpl	$6, 24(%rax)	;, token_45->type
	je	.L192	;,
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	;, tmp472
; src/parser.c:397:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp473, <retval>
.L179:
; src/parser.c:398:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:399:     if (statement == 0)
	testq	%rbp, %rbp	; <retval>
	je	.L193	;,
.L185:
; src/parser.c:401:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp475, token
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_88->type
	je	.L194	;,
.L186:
; src/parser.c:404:         parser_error("Expected ';' after statement", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC52(%rip), %rdi	;, tmp361
	call	parser_error@PLT	;
.L109:
; src/parser.c:406: }
	movq	%rbp, %rax	; <retval>,
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
	ret	
.L192:
	.cfi_restore_state
	movq	%rax, %rbp	; tmp374, token
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	movq	(%rax), %rdi	; token_45->lexeme, token_45->lexeme
	movq	IF_KEYWORD(%rip), %rsi	; IF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:365:         if (string_equal(token_ptr->lexeme, IF_KEYWORD))
	testb	%al, %al	; tmp375
	jne	.L195	;,
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	movq	0(%rbp), %rdi	; token_45->lexeme, token_45->lexeme
	movq	FOR_KEYWORD(%rip), %rsi	; FOR_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:367:         else if (string_equal(token_ptr->lexeme, FOR_KEYWORD))
	testb	%al, %al	; tmp417
	jne	.L196	;,
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	movq	0(%rbp), %rdi	; token_45->lexeme, token_45->lexeme
	movq	WHILE_KEYWORD(%rip), %rsi	; WHILE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:369:         else if (string_equal(token_ptr->lexeme, WHILE_KEYWORD))
	testb	%al, %al	; tmp444
	jne	.L197	;,
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_45->lexeme, token_45->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:371:         else if (string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp460
	je	.L178	;,
; src/parser.c:372:             get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, %r9	;, tmp461
; src/parser.c:373:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp462, <retval>
	jmp	.L179	;
.L195:
; src/parser.c:413:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp376, token
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_91->type
	jne	.L112	;,
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_91->lexeme, token_91->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:415:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp377
	je	.L112	;,
; src/parser.c:419:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp378, token
; src/parser.c:421:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 32(%rsp)	; condition, %sfp
; src/parser.c:422:     if (condition == 0)
	testq	%rax, %rax	; condition
	je	.L198	;,
.L115:
; src/parser.c:424:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp380, token
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_98->type
	jne	.L116	;,
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_98->lexeme, token_98->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:426:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp381
	je	.L116	;,
; src/parser.c:430:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp382, token
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_103->type
	jne	.L118	;,
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_103->lexeme, token_103->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:432:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp383
	je	.L118	;,
; src/parser.c:436:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, 8(%rsp)	; tmp384, %sfp
; src/parser.c:437:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp385, token
; src/parser.c:442:             parser_error("Failed to parse if body statement", token);
	leaq	.LC27(%rip), %r15	;, tmp368
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L120	;
.L112:
; src/parser.c:416:         parser_error("Expected '(' after 'if'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC23(%rip), %rdi	;, tmp271
	call	parser_error@PLT	;
; src/parser.c:417:         return NULL;
	movl	$0, %esi	;, _170
.L114:
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$2, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp416, <retval>
; src/parser.c:366:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L109	;
.L198:
; src/parser.c:423:         parser_error("Failed to parse if condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC24(%rip), %rdi	;, tmp272
	call	parser_error@PLT	;
	jmp	.L115	;
.L116:
; src/parser.c:427:         parser_error("Expected ')' after if condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC25(%rip), %rdi	;, tmp275
	call	parser_error@PLT	;
; src/parser.c:428:         return NULL;
	movl	$0, %esi	;, _170
	jmp	.L114	;
.L118:
; src/parser.c:433:         parser_error("Expected '{' to start if body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC26(%rip), %rdi	;, tmp278
	call	parser_error@PLT	;
; src/parser.c:434:         return NULL;
	movl	$0, %esi	;, _170
	jmp	.L114	;
.L122:
; src/parser.c:440:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbp	; tmp386, statement
; src/parser.c:441:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L199	;,
.L121:
; src/parser.c:443:         list_append(body, (pointer)statement);
	movq	%rbp, %rsi	; statement,
	movq	8(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp387, token
.L120:
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_111->type
	jne	.L122	;,
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_111->lexeme, token_111->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:439:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp388
	je	.L122	;,
; src/parser.c:447:     list(ElseIf*) else_if = create_list();
	call	create_list@PLT	;
	movq	%rax, 24(%rsp)	; tmp389, %sfp
; src/parser.c:448:     list(Statement*) else_body = create_list();
	call	create_list@PLT	;
	movq	%rax, 40(%rsp)	; tmp390, %sfp
; src/parser.c:449:     token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	peek_next_token@PLT	;
	movq	%rax, %rbp	; tmp391, token_ptr
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_119->type
	je	.L123	;,
	jmp	.L124	;
.L199:
; src/parser.c:442:             parser_error("Failed to parse if body statement", token);
	movq	%r14, %rsi	; token,
	movq	%r15, %rdi	; tmp368,
	call	parser_error@PLT	;
	jmp	.L121	;
.L125:
; src/parser.c:457:             parser_error("Expected '(' after 'elif'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC28(%rip), %rdi	;, tmp284
	call	parser_error@PLT	;
; src/parser.c:458:             return NULL;
	movl	$0, %esi	;, _170
	jmp	.L114	;
.L202:
; src/parser.c:464:             parser_error("Failed to parse else-if condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC29(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L127	;
.L128:
; src/parser.c:468:             parser_error("Expected ')' after else-if condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC30(%rip), %rdi	;, tmp288
	call	parser_error@PLT	;
; src/parser.c:469:             return NULL;
	movl	$0, %esi	;, _170
	jmp	.L114	;
.L130:
; src/parser.c:474:             parser_error("Expected '{' to start else-if body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC31(%rip), %rdi	;, tmp291
	call	parser_error@PLT	;
; src/parser.c:475:             return NULL;
	movl	$0, %esi	;, _170
	jmp	.L114	;
.L134:
; src/parser.c:481:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp402, statement
; src/parser.c:482:             if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L200	;,
.L133:
; src/parser.c:484:             list_append(elif_body, (pointer)statement);
	movq	%r14, %rsi	; statement,
	movq	%r15, %rdi	; elif_body,
	call	list_append@PLT	;
; src/parser.c:485:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp403, token
.L132:
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_140->type
	jne	.L134	;,
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_140->lexeme, token_140->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp404
	je	.L134	;,
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%r15, %rsi	; elif_body,
	movq	16(%rsp), %rdi	; %sfp,
	call	create_else_if@PLT	;
	movq	%rax, %rsi	; tmp405, _146
; src/parser.c:488:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	24(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:489:         token = peek_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	peek_next_token@PLT	;
	movq	%rax, %rbp	; tmp406, token_ptr
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_147->type
	jne	.L124	;,
.L123:
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_ptr_9->lexeme, token_ptr_9->lexeme
	movq	ELIF_KEYWORD(%rip), %rsi	; ELIF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:451:     while (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	; tmp407
	je	.L201	;,
; src/parser.c:452:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:454:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp392, token
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_120->type
	jne	.L125	;,
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_120->lexeme, token_120->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:456:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp393
	je	.L125	;,
; src/parser.c:460:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp394, token
; src/parser.c:462:         Expression* elif_condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 16(%rsp)	; elif_condition, %sfp
; src/parser.c:463:         if (elif_condition == 0)
	testq	%rax, %rax	; elif_condition
	je	.L202	;,
.L127:
; src/parser.c:465:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp396, token
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_127->type
	jne	.L128	;,
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_127->lexeme, token_127->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:467:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp397
	je	.L128	;,
; src/parser.c:471:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp398, token
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_132->type
	jne	.L130	;,
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_132->lexeme, token_132->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:473:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp399
	je	.L130	;,
; src/parser.c:477:         list(Statement*) elif_body = create_list();
	call	create_list@PLT	;
	movq	%rax, %r15	; tmp400, elif_body
; src/parser.c:478:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp401, token
; src/parser.c:480:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L132	;
.L200:
; src/parser.c:483:                 parser_error("Failed to parse else-if body statement", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC32(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L133	;
.L201:
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	;, token_ptr_9->type
	jne	.L124	;,
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_ptr_9->lexeme, token_ptr_9->lexeme
	movq	ELSE_KEYWORD(%rip), %rsi	; ELSE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:492:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	; tmp408
	jne	.L203	;,
.L124:
; src/parser.c:512:     token = peek_current_token(lexer);
	movq	%rbx, %rdi	; lexer,
	call	peek_current_token@PLT	;
; src/parser.c:514:     return create_if(condition, body, else_if, else_body);
	movq	40(%rsp), %rcx	; %sfp,
	movq	24(%rsp), %rdx	; %sfp,
	movq	8(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
	call	create_if@PLT	;
	movq	%rax, %rsi	; tmp415, _170
	jmp	.L114	;
.L203:
; src/parser.c:493:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:495:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp409, token
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_157->type
	jne	.L136	;,
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	movq	(%rax), %rdi	; token_157->lexeme,
	call	string_equal@PLT	;
; src/parser.c:497:         if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp410
	je	.L136	;,
; src/parser.c:501:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp411, token
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	leaq	.LC34(%rip), %r15	;, tmp363
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L138	;
.L136:
; src/parser.c:498:             parser_error("Expected '{' to start else body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC33(%rip), %rdi	;, tmp300
	call	parser_error@PLT	;
; src/parser.c:499:             return NULL;
	movl	$0, %esi	;, _170
	jmp	.L114	;
.L140:
; src/parser.c:504:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %r14	; tmp412, statement
; src/parser.c:505:             if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L204	;,
.L139:
; src/parser.c:507:             list_append(else_body, (pointer)statement);
	movq	%r14, %rsi	; statement,
	movq	40(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:508:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp413, token
.L138:
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_164->type
	jne	.L140	;,
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_164->lexeme, token_164->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:503:         while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp414
	je	.L140	;,
	jmp	.L124	;
.L204:
; src/parser.c:506:                 parser_error("Failed to parse else body statement", token);
	movq	%rbp, %rsi	; token,
	movq	%r15, %rdi	; tmp363,
	call	parser_error@PLT	;
	jmp	.L139	;
.L196:
; src/parser.c:522:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp418, token
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_172->type
	jne	.L143	;,
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_172->lexeme, token_172->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:524:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp419
	je	.L143	;,
; src/parser.c:528:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp420, token
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_177->type
	je	.L205	;,
.L146:
; src/parser.c:532:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, 8(%rsp)	; initializer, %sfp
; src/parser.c:533:         if (initializer == 0)
	testq	%rax, %rax	; initializer
	je	.L206	;,
.L148:
; src/parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp423, token
.L147:
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	;, token_184->type
	jne	.L149	;,
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	0(%rbp), %rdi	; token_184->lexeme, token_184->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:538:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp424
	je	.L149	;,
; src/parser.c:544:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp425, token
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_189->type
	je	.L207	;,
.L151:
; src/parser.c:548:         condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 16(%rsp)	; condition, %sfp
; src/parser.c:549:         if (condition == 0)
	testq	%rax, %rax	; condition
	je	.L208	;,
.L153:
; src/parser.c:551:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp428, token
.L152:
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rbp)	;, token_196->type
	jne	.L154	;,
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	0(%rbp), %rdi	; token_196->lexeme, token_196->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:554:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp429
	je	.L154	;,
; src/parser.c:560:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp430, token
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_201->type
	je	.L209	;,
.L156:
; src/parser.c:564:         increment = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 24(%rsp)	; increment, %sfp
; src/parser.c:565:         if (increment == 0)
	testq	%rax, %rax	; increment
	je	.L210	;,
.L158:
; src/parser.c:567:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp433, token
.L157:
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	cmpl	$5, 24(%rbp)	;, token_208->type
	jne	.L159	;,
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	movq	0(%rbp), %rdi	; token_208->lexeme, token_208->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:570:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL))
	testb	%al, %al	; tmp434
	je	.L159	;,
; src/parser.c:576:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp435, token
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_213->type
	jne	.L161	;,
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_213->lexeme, token_213->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:578:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp436
	je	.L161	;,
; src/parser.c:582:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, %r15	; tmp437, body
; src/parser.c:583:     ((parser))->in_loop = true;
	movb	$1, 2(%r12)	;, parser_47(D)->in_loop
; src/parser.c:584:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp438, token
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L163	;
.L143:
; src/parser.c:525:         parser_error("Expected '(' after 'for'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC35(%rip), %rdi	;, tmp308
	call	parser_error@PLT	;
; src/parser.c:526:         return NULL;
	movl	$0, %ecx	;, _230
.L145:
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$4, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp443, <retval>
; src/parser.c:368:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L109	;
.L205:
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_177->lexeme, token_177->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:530:     Variable* initializer = 0;
	movq	$0, 8(%rsp)	;, %sfp
; src/parser.c:531:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp421
	jne	.L147	;,
	jmp	.L146	;
.L206:
; src/parser.c:534:             parser_error("Failed to parse for loop initializer", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC36(%rip), %rdi	;, tmp311
	call	parser_error@PLT	;
	jmp	.L148	;
.L149:
; src/parser.c:541:         parser_error("Expected ';' after for loop initializer", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC37(%rip), %rdi	;, tmp314
	call	parser_error@PLT	;
; src/parser.c:542:         return NULL;
	movl	$0, %ecx	;, _230
	jmp	.L145	;
.L207:
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdi	; token_189->lexeme, token_189->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:546:     Expression* condition = 0;
	movq	$0, 16(%rsp)	;, %sfp
; src/parser.c:547:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp426
	jne	.L152	;,
	jmp	.L151	;
.L208:
; src/parser.c:550:             parser_error("Failed to parse for loop condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC38(%rip), %rdi	;, tmp317
	call	parser_error@PLT	;
	jmp	.L153	;
.L154:
; src/parser.c:557:         parser_error("Expected ';' after for loop condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC39(%rip), %rdi	;, tmp320
	call	parser_error@PLT	;
; src/parser.c:558:         return NULL;
	movl	$0, %ecx	;, _230
	jmp	.L145	;
.L209:
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_201->lexeme, token_201->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:562:     Expression* increment = 0;
	movq	$0, 24(%rsp)	;, %sfp
; src/parser.c:563:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp431
	jne	.L157	;,
	jmp	.L156	;
.L210:
; src/parser.c:566:             parser_error("Failed to parse for loop increment", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC40(%rip), %rdi	;, tmp323
	call	parser_error@PLT	;
	jmp	.L158	;
.L159:
; src/parser.c:573:         parser_error("Expected ')' after for loop increment", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC41(%rip), %rdi	;, tmp326
	call	parser_error@PLT	;
; src/parser.c:574:         return NULL;
	movl	$0, %ecx	;, _230
	jmp	.L145	;
.L161:
; src/parser.c:579:         parser_error("Expected '{' to start for loop body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC42(%rip), %rdi	;, tmp329
	call	parser_error@PLT	;
; src/parser.c:580:         return NULL;
	movl	$0, %ecx	;, _230
	jmp	.L145	;
.L165:
; src/parser.c:587:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbp	; tmp439, statement
; src/parser.c:588:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L211	;,
.L164:
; src/parser.c:590:         list_append(body, (pointer)statement);
	movq	%rbp, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	list_append@PLT	;
; src/parser.c:591:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp440, token
.L163:
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_221->type
	jne	.L165	;,
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_221->lexeme, token_221->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:586:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp441
	je	.L165	;,
; src/parser.c:594:     ((parser))->in_loop = false;
	movb	$0, 2(%r12)	;, parser_47(D)->in_loop
; src/parser.c:595:     return create_for(initializer, condition, increment, body);
	movq	%r15, %rcx	; body,
	movq	24(%rsp), %rdx	; %sfp,
	movq	16(%rsp), %rsi	; %sfp,
	movq	8(%rsp), %rdi	; %sfp,
	call	create_for@PLT	;
	movq	%rax, %rcx	; tmp442, _230
	jmp	.L145	;
.L211:
; src/parser.c:589:             parser_error("Failed to parse for loop body statement", token);
	movq	%r14, %rsi	; token,
	leaq	.LC43(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L164	;
.L197:
; src/parser.c:603:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp445, token
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_232->type
	jne	.L167	;,
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_232->lexeme, token_232->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:605:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp446
	je	.L167	;,
; src/parser.c:609:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp447, token
; src/parser.c:611:     Expression* condition = parse_expression(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, 8(%rsp)	; condition, %sfp
; src/parser.c:612:     if (condition == 0)
	testq	%rax, %rax	; condition
	je	.L212	;,
.L170:
; src/parser.c:614:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp449, token
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_239->type
	jne	.L171	;,
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_239->lexeme, token_239->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:616:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp450
	je	.L171	;,
; src/parser.c:620:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp451, token
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_244->type
	jne	.L173	;,
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_244->lexeme, token_244->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:622:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp452
	je	.L173	;,
; src/parser.c:626:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, %r15	; tmp453, body
; src/parser.c:627:     ((parser))->in_loop = true;
	movb	$1, 2(%r12)	;, parser_47(D)->in_loop
; src/parser.c:628:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp454, token
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L175	;
.L167:
; src/parser.c:606:         parser_error("Expected '(' after 'while'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC44(%rip), %rdi	;, tmp337
	call	parser_error@PLT	;
; src/parser.c:607:         return NULL;
	movl	$0, %edx	;, _258
.L169:
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$3, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp459, <retval>
; src/parser.c:370:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L109	;
.L212:
; src/parser.c:613:         parser_error("Failed to parse while condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC45(%rip), %rdi	;, tmp338
	call	parser_error@PLT	;
	jmp	.L170	;
.L171:
; src/parser.c:617:         parser_error("Expected ')' after while condition", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC46(%rip), %rdi	;, tmp341
	call	parser_error@PLT	;
; src/parser.c:618:         return NULL;
	movl	$0, %edx	;, _258
	jmp	.L169	;
.L173:
; src/parser.c:623:         parser_error("Expected '{' to start while body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC47(%rip), %rdi	;, tmp344
	call	parser_error@PLT	;
; src/parser.c:624:         return NULL;
	movl	$0, %edx	;, _258
	jmp	.L169	;
.L177:
; src/parser.c:631:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbp	; tmp455, statement
; src/parser.c:632:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L213	;,
.L176:
; src/parser.c:634:         list_append(body, (pointer)statement);
	movq	%rbp, %rsi	; statement,
	movq	%r15, %rdi	; body,
	call	list_append@PLT	;
; src/parser.c:635:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r14	; tmp456, token
.L175:
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r14)	;, token_252->type
	jne	.L177	;,
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdi	; token_252->lexeme, token_252->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:630:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp457
	je	.L177	;,
; src/parser.c:638:     ((parser))->in_loop = false;
	movb	$0, 2(%r12)	;, parser_47(D)->in_loop
; src/parser.c:639:     return create_while(condition, body);
	movq	%r15, %rsi	; body,
	movq	8(%rsp), %rdi	; %sfp,
	call	create_while@PLT	;
	movq	%rax, %rdx	; tmp458, _258
	jmp	.L169	;
.L213:
; src/parser.c:633:             parser_error("Failed to parse while body statement", token);
	movq	%r14, %rsi	; token,
	leaq	.LC48(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L176	;
.L178:
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_45->lexeme, token_45->lexeme
	movq	RETURN_KEYWORD(%rip), %rsi	; RETURN_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:374:         } else if (string_equal(token_ptr->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	; tmp463
	je	.L180	;,
; src/parser.c:375:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%rbx, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	;, tmp464
; src/parser.c:377:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$5, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp465, <retval>
	jmp	.L179	;
.L180:
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_45->lexeme, token_45->lexeme
	movq	BREAK_KEYWORD(%rip), %rsi	; BREAK_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:378:         } else if (string_equal(token_ptr->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	; tmp466
	je	.L181	;,
; src/parser.c:379:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%r12)	;, parser_47(D)->in_loop
	je	.L214	;,
; src/parser.c:385:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$6, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp467, <retval>
	jmp	.L179	;
.L214:
; src/parser.c:382:                 parser_error("Cannot use 'break' outside of a loop", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC49(%rip), %rdi	;, tmp354
	call	parser_error@PLT	;
; src/parser.c:383:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L109	;
.L181:
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	movq	0(%rbp), %rdi	; token_45->lexeme, token_45->lexeme
	movq	CONTINUE_KEYWORD(%rip), %rsi	; CONTINUE_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:386:         } else if (string_equal(token_ptr->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	; tmp468
	je	.L183	;,
; src/parser.c:387:             if (!(((parser))->in_loop))
	cmpb	$0, 2(%r12)	;, parser_47(D)->in_loop
	je	.L215	;,
; src/parser.c:393:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	movl	$0, %r9d	;,
	movl	$0, %r8d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$7, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp469, <retval>
	jmp	.L179	;
.L215:
; src/parser.c:390:                 parser_error("Cannot use 'continue' outside of a loop", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC50(%rip), %rdi	;, tmp357
	call	parser_error@PLT	;
; src/parser.c:391:                 return NULL;
	movl	$0, %ebp	;, <retval>
	jmp	.L109	;
.L183:
; src/parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%r12, %rdx	; parser,
	movq	%r13, %rsi	; now_scope,
	movq	%rbx, %rdi	; lexer,
	call	parse_expression	;
	movq	%rax, %r8	;, tmp470
; src/parser.c:395:             statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movl	$0, %r9d	;,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$0, %edi	;,
	call	create_statement@PLT	;
	movq	%rax, %rbp	; tmp471, <retval>
	jmp	.L179	;
.L193:
; src/parser.c:400:         parser_error("Failed to parse statement", token);
	movq	%rax, %rsi	; token,
	leaq	.LC51(%rip), %rdi	;, tmp358
	call	parser_error@PLT	;
	jmp	.L185	;
.L194:
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_88->lexeme, token_88->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:403:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp476
	jne	.L109	;,
	jmp	.L186	;
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
.LC80:
	.string	"Failed to parse method body statement"
	.align 8
.LC81:
	.string	"Method missing return statement"
	.section	.rodata.str1.1
.LC82:
	.string	"Failed to parse class method"
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"Failed to parse class variable"
	.align 8
.LC84:
	.string	"Expected ';' after class variable declaration"
	.align 8
.LC85:
	.string	"Unexpected token in class member"
	.align 8
.LC86:
	.string	"Failed to parse class declaration"
	.align 8
.LC87:
	.string	"Unexpected token in code member"
	.text
	.globl	parse_code
	.type	parse_code, @function
parse_code:
.LFB65:
	.cfi_startproc
	endbr64	
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
	pushq	%rbp	;
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx	;
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp	;,
	.cfi_def_cfa_offset 176
	movq	%rdi, %r12	; tmp400, lexer
	movq	%rsi, %rbx	; tmp401, now_scope
	movq	%rdx, 16(%rsp)	; tmp402, %sfp
; src/parser.c:23:     if (builtin_scope == 0) {
	cmpq	$0, builtin_scope(%rip)	;, builtin_scope
	je	.L313	;,
.L217:
; src/parser.c:32:         now_scope = builtin_scope;
	testq	%rbx, %rbx	; now_scope
	cmove	builtin_scope(%rip), %rbx	; builtin_scope,, now_scope
; src/parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list@PLT	;
	movq	%rax, 32(%rsp)	; tmp409, %sfp
; src/parser.c:36:     Scope* global_scope = create_scope(now_scope);
	movq	%rbx, %rdi	; now_scope,
	call	create_scope@PLT	;
	movq	%rax, 24(%rsp)	; tmp410, %sfp
; src/parser.c:37:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r12, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, 8(%rsp)	; token, %sfp
	movq	%r12, %r15	; lexer, lexer
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	jne	.L219	;,
.L220:
; src/parser.c:60:     return create_code(members, global_scope);
	movq	24(%rsp), %rsi	; %sfp,
	movq	32(%rsp), %rdi	; %sfp,
	call	create_code@PLT	;
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
	ret	
.L313:
	.cfi_restore_state
; src/parser.c:24:         builtin_scope = create_scope(0);
	movl	$0, %edi	;,
	call	create_scope@PLT	;
	movq	%rax, %r8	; tmp403, _2
; src/parser.c:24:         builtin_scope = create_scope(0);
	movq	%rax, builtin_scope(%rip)	; _2, builtin_scope
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	VOID_KEYWORD(%rip), %rdi	; VOID_KEYWORD,
	call	create_name@PLT	;
; src/parser.c:25:         name_void = create_name(VOID_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_void(%rip)	; tmp404, name_void
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	INT_KEYWORD(%rip), %rdi	; INT_KEYWORD,
	call	create_name@PLT	;
; src/parser.c:26:         name_int = create_name(INT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_int(%rip)	; tmp405, name_int
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	FLOAT_KEYWORD(%rip), %rdi	; FLOAT_KEYWORD,
	call	create_name@PLT	;
; src/parser.c:27:         name_float = create_name(FLOAT_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_float(%rip)	; tmp406, name_float
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	STRING_KEYWORD(%rip), %rdi	; STRING_KEYWORD,
	call	create_name@PLT	;
; src/parser.c:28:         name_string = create_name(STRING_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_string(%rip)	; tmp407, name_string
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	builtin_scope(%rip), %r8	; builtin_scope,
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movq	BOOL_KEYWORD(%rip), %rdi	; BOOL_KEYWORD,
	call	create_name@PLT	;
; src/parser.c:29:         name_bool = create_name(BOOL_KEYWORD, NAME_TYPE, NULL, NULL, builtin_scope);
	movq	%rax, name_bool(%rip)	; tmp408, name_bool
	jmp	.L217	;
.L330:
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	movq	8(%rsp), %rax	; %sfp, token
	movq	(%rax), %rdi	; token_368->lexeme, token_368->lexeme
	movq	IMPORT_KEYWORD(%rip), %rsi	; IMPORT_KEYWORD,
	call	string_equal@PLT	;
	movl	%eax, %ebp	; tmp412, have_return
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	; have_return
	jne	.L314	;,
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	8(%rsp), %rax	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_368->type
	jne	.L257	;,
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	movq	(%rax), %rdi	; token_368->lexeme, token_368->lexeme
	movq	FUNC_KEYWORD(%rip), %rsi	; FUNC_KEYWORD,
	call	string_equal@PLT	;
	movb	%al, 71(%rsp)	; _24, %sfp
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	; _24
	jne	.L315	;,
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	8(%rsp), %rax	; %sfp, token
	cmpl	$6, 24(%rax)	;, token_368->type
	jne	.L257	;,
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	movq	(%rax), %rdi	; token_368->lexeme, token_368->lexeme
	movq	CLASS_KEYWORD(%rip), %rsi	; CLASS_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:50:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	; tmp449
	je	.L257	;,
; src/parser.c:276:     Scope* class_scope = create_scope(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_scope@PLT	;
	movq	%rax, 40(%rsp)	; tmp450, %sfp
; src/parser.c:277:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:279:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_170->type
	jne	.L316	;,
; src/parser.c:283:     Name* name = create_name(token_ptr->lexeme, NAME_CLASS, NULL, class_scope, now_scope);
	movq	(%rax), %rdi	; token_170->lexeme, token_170->lexeme
	movq	24(%rsp), %r8	; %sfp,
	movq	40(%rsp), %rcx	; %sfp,
	movl	$0, %edx	;,
	movl	$4, %esi	;,
	call	create_name@PLT	;
	movq	%rax, 56(%rsp)	; tmp452, %sfp
; src/parser.c:284:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp453, token
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_174->type
	jne	.L260	;,
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_174->lexeme, token_174->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:286:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp454
	je	.L260	;,
; src/parser.c:290:     list(ClassMember*) members = create_list();
	call	create_list@PLT	;
	movq	%rax, 48(%rsp)	; tmp455, %sfp
; src/parser.c:291:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp456, token
; src/parser.c:311:             parser_error("Unexpected token in class member", token);
	leaq	.LC85(%rip), %r14	;, tmp397
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L262	;
.L314:
; src/parser.c:68:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:70:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_89->type
	jne	.L317	;,
; src/parser.c:74:     string import_name = token_ptr->lexeme;
	movq	(%rax), %r12	; token_89->lexeme, import_name
; src/parser.c:76:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp414, token
; src/parser.c:75:     string source = 0;
	movl	$0, %ebp	;, source
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	cmpl	$6, 24(%rax)	;, token_92->type
	je	.L318	;,
.L225:
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_101->type
	jne	.L227	;,
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rbx), %rdi	; token_101->lexeme, token_101->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:89:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	; tmp418
	je	.L227	;,
; src/parser.c:94:     name = parse_import_file(import_name, source, now_scope);
	movq	24(%rsp), %rdx	; %sfp,
	movq	%rbp, %rsi	; source,
	movq	%r12, %rdi	; import_name,
	call	parse_import_file@PLT	;
	movq	%rax, %rdi	; tmp419, name
; src/parser.c:95:     if (name == 0)
	testq	%rax, %rax	; name
	je	.L319	;,
.L229:
; src/parser.c:97:     return create_import(name, source);
	movq	%rbp, %rsi	; source,
	call	create_import@PLT	;
	movq	%rax, %rsi	; tmp421, _111
; src/parser.c:42:             if (import == 0)
	testq	%rax, %rax	; _111
	je	.L299	;,
.L230:
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movl	$0, %ecx	;,
	movl	$0, %edx	;,
	movl	$0, %edi	;,
	call	create_code_member@PLT	;
	movq	%rax, %rsi	; tmp422, _20
; src/parser.c:44:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	32(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	jmp	.L231	;
.L317:
; src/parser.c:71:         parser_error("Expected identifier after 'import'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC53(%rip), %rdi	;, tmp287
	call	parser_error@PLT	;
; src/parser.c:72:         return NULL;
	jmp	.L299	;
.L318:
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	movq	(%rax), %rdi	; token_92->lexeme, token_92->lexeme
	movq	FROM_KEYWORD(%rip), %rsi	; FROM_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:78:     if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	; tmp415
	je	.L225	;,
; src/parser.c:79:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:81:         if (token_ptr->type != STRING) {
	cmpl	$4, 24(%rax)	;, token_97->type
	jne	.L320	;,
; src/parser.c:85:         source = token_ptr->lexeme;
	movq	(%rax), %rbp	; token_97->lexeme, source
; src/parser.c:86:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp417, token
	jmp	.L225	;
.L320:
; src/parser.c:82:             parser_error("Expected string literal after 'from'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC54(%rip), %rdi	;, tmp290
	call	parser_error@PLT	;
; src/parser.c:83:             return NULL;
	jmp	.L299	;
.L227:
; src/parser.c:90:         parser_error("Expected ';' at end of import statement", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC55(%rip), %rdi	;, tmp293
	call	parser_error@PLT	;
.L299:
; src/parser.c:43:                 parser_error("Failed to parse import statement", token);
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC56(%rip), %rdi	;, tmp295
	call	parser_error@PLT	;
	movl	$0, %esi	;, _111
	jmp	.L230	;
.L319:
; src/parser.c:96:         name = create_name(import_name, NAME_VARIABLE, name_void, NULL, now_scope);
	movq	24(%rsp), %r8	; %sfp,
	movl	$0, %ecx	;,
	movq	name_void(%rip), %rdx	; name_void,
	movl	$1, %esi	;,
	movq	%r12, %rdi	; import_name,
	call	create_name@PLT	;
	movq	%rax, %rdi	; tmp420, name
	jmp	.L229	;
.L315:
; src/parser.c:105:     Scope* function_scope = create_scope(now_scope);
	movq	24(%rsp), %rdi	; %sfp,
	call	create_scope@PLT	;
	movq	%rax, %r12	; tmp424, function_scope
; src/parser.c:106:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp425, token
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_114->type, _115
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _115
	je	.L233	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _115
	jne	.L234	;,
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	(%rbx), %rdi	; token_114->lexeme, token_114->lexeme
	call	is_builtin_type@PLT	;
; src/parser.c:108:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp426
	je	.L234	;,
.L233:
; src/parser.c:112:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	(%rbx), %rsi	; token_114->lexeme, token_114->lexeme
	movq	24(%rsp), %rdi	; %sfp,
	call	search@PLT	;
	movq	%rax, 40(%rsp)	; return_type, %sfp
; src/parser.c:113:     if (return_type == 0)
	testq	%rax, %rax	; return_type
	je	.L321	;,
; src/parser.c:119:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:121:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_120->type
	jne	.L322	;,
; src/parser.c:125:     Name* name = create_name(token_ptr->lexeme, NAME_FUNCTION, return_type, NULL, now_scope);
	movq	(%rax), %rdi	; token_120->lexeme, token_120->lexeme
	movq	24(%rsp), %r8	; %sfp,
	movl	$0, %ecx	;,
	movq	40(%rsp), %rdx	; %sfp,
	movl	$2, %esi	;,
	call	create_name@PLT	;
	movq	%rax, 56(%rsp)	; tmp429, %sfp
; src/parser.c:126:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp430, token
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_124->type
	jne	.L238	;,
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_124->lexeme, token_124->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:128:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp431
	je	.L238	;,
; src/parser.c:132:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp432, token
; src/parser.c:134:     list(Variable*) parameters = create_list();
	call	create_list@PLT	;
	movq	%rax, 48(%rsp)	; tmp433, %sfp
; src/parser.c:140:             parser_error("Function parameters cannot have default values", token);
	leaq	.LC62(%rip), %r14	;, tmp390
; src/parser.c:138:             parser_error("Failed to parse function parameter", token);
	leaq	.LC61(%rip), %r13	;, tmp391
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L240	;
.L234:
; src/parser.c:109:         parser_error("Expected function return type after 'func'", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC57(%rip), %rdi	;, tmp299
	call	parser_error@PLT	;
.L300:
; src/parser.c:48:                 parser_error("Failed to parse function declaration", token);
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC68(%rip), %rdi	;, tmp324
	call	parser_error@PLT	;
	movl	$0, %edx	;, _165
	jmp	.L256	;
.L321:
; src/parser.c:116:         parser_error("Unknown function return type", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC58(%rip), %rdi	;, tmp301
	call	parser_error@PLT	;
; src/parser.c:117:         return NULL;
	jmp	.L300	;
.L322:
; src/parser.c:122:         parser_error("Expected function name after return type", token);
	movq	%rax, %rsi	; token,
	leaq	.LC59(%rip), %rdi	;, tmp302
	call	parser_error@PLT	;
; src/parser.c:123:         return NULL;
	jmp	.L300	;
.L238:
; src/parser.c:129:         parser_error("Expected '(' after function name", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC60(%rip), %rdi	;, tmp306
	call	parser_error@PLT	;
; src/parser.c:130:         return NULL;
	jmp	.L300	;
.L325:
; src/parser.c:138:             parser_error("Failed to parse function parameter", token);
	movq	%rbx, %rsi	; token,
	movq	%r13, %rdi	; tmp391,
	call	parser_error@PLT	;
	jmp	.L242	;
.L243:
; src/parser.c:142:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rsi	; parameter,
	movq	48(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
	jmp	.L242	;
.L326:
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	(%rax), %rdi	; token_134->lexeme, token_134->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp436
	jne	.L323	;,
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_134->type
	jne	.L244	;,
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_134->lexeme, token_134->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:148:         } else if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp438
	je	.L244	;,
.L240:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_132->type
	je	.L324	;,
.L247:
; src/parser.c:136:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	%r12, %rsi	; function_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:137:         if (parameter == 0)
	testq	%rax, %rax	; parameter
	je	.L325	;,
; src/parser.c:139:         else if (parameter->value != 0)
	cmpq	$0, 16(%rax)	;, parameter_131->value
	je	.L243	;,
; src/parser.c:140:             parser_error("Function parameters cannot have default values", token);
	movq	%rbx, %rsi	; token,
	movq	%r14, %rdi	; tmp390,
	call	parser_error@PLT	;
.L242:
; src/parser.c:143:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp435, token
; src/parser.c:145:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_134->type
	je	.L326	;,
.L244:
; src/parser.c:149:             parser_error("Expected ',' or ')' after function parameter", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC63(%rip), %rdi	;, tmp313
	call	parser_error@PLT	;
; src/parser.c:150:             return NULL;
	jmp	.L300	;
.L323:
; src/parser.c:146:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp437, token
; src/parser.c:147:             token_ptr = token;
	jmp	.L240	;
.L324:
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	(%rbx), %rdi	; token_132->lexeme, token_132->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:135:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp439
	je	.L247	;,
; src/parser.c:153:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp440, token
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_148->type
	jne	.L248	;,
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_148->lexeme, token_148->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:155:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp441
	je	.L248	;,
; src/parser.c:159:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, %r14	; tmp442, body
; src/parser.c:160:     parser->in_function = true;
	movq	16(%rsp), %rax	; %sfp, parser
	movb	$1, (%rax)	;, parser_72(D)->in_function
; src/parser.c:162:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp443, token
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L250	;
.L248:
; src/parser.c:156:         parser_error("Expected '{' to start function body", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC64(%rip), %rdi	;, tmp318
	call	parser_error@PLT	;
; src/parser.c:157:         return NULL;
	jmp	.L300	;
.L254:
; src/parser.c:165:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	%r12, %rsi	; function_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbx	; tmp444, statement
; src/parser.c:166:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L327	;,
; src/parser.c:168:         else if (have_return)
	testb	%bpl, %bpl	; have_return
	jne	.L328	;,
.L252:
; src/parser.c:171:             have_return = true;
	cmpl	$5, 8(%rbx)	;, statement_155->type
	movl	$1, %eax	;, tmp528
	cmove	%eax, %ebp	; have_return,, tmp528, have_return
; src/parser.c:172:         list_append(body, (pointer)statement);
	movq	%rbx, %rsi	; statement,
	movq	%r14, %rdi	; body,
	call	list_append@PLT	;
; src/parser.c:173:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %r13	; tmp445, token
.L250:
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	;, token_156->type
	jne	.L254	;,
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%r13), %rdi	; token_156->lexeme, token_156->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:164:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp446
	je	.L254	;,
; src/parser.c:176:     ((parser))->in_function = false;
	movq	16(%rsp), %rax	; %sfp, parser
	movb	$0, (%rax)	;, parser_72(D)->in_function
; src/parser.c:177:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	; have_return
	jne	.L255	;,
; src/parser.c:177:     if (!have_return && return_type != name_void)
	movq	40(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L255	;,
; src/parser.c:178:         parser_error("Function missing return statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC67(%rip), %rdi	;, tmp323
	call	parser_error@PLT	;
.L255:
; src/parser.c:179:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%r12, %r8	; function_scope,
	movq	%r14, %rcx	; body,
	movq	48(%rsp), %rdx	; %sfp,
	movq	40(%rsp), %rsi	; %sfp,
	movq	56(%rsp), %rdi	; %sfp,
	call	create_function@PLT	;
	movq	%rax, %rdx	; tmp447, _165
; src/parser.c:47:             if (function == 0)
	testq	%rax, %rax	; _165
	je	.L300	;,
.L256:
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movl	$0, %ecx	;,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	create_code_member@PLT	;
	movq	%rax, %rsi	; tmp448, _25
; src/parser.c:49:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	32(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:45:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, FUNC_KEYWORD)) {
	jmp	.L231	;
.L327:
; src/parser.c:167:             parser_error("Failed to parse function body statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC65(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L252	;
.L328:
; src/parser.c:169:             parser_error("Unreachable code after return statement", token);
	movq	%r13, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L252	;
.L316:
; src/parser.c:280:         parser_error("Expected class name after 'class'", token);
	movq	%rax, %rsi	; token,
	leaq	.LC69(%rip), %rdi	;, tmp327
	call	parser_error@PLT	;
; src/parser.c:281:         return NULL;
	jmp	.L301	;
.L260:
; src/parser.c:287:         parser_error("Expected '{' to start class body", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC70(%rip), %rdi	;, tmp331
	call	parser_error@PLT	;
.L301:
; src/parser.c:53:                 parser_error("Failed to parse class declaration", token);
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC86(%rip), %rdi	;, tmp374
	call	parser_error@PLT	;
	movl	$0, %ecx	;, _205
	jmp	.L297	;
.L296:
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_181->type
	je	.L329	;,
.L263:
; src/parser.c:311:             parser_error("Unexpected token in class member", token);
	movq	%rbx, %rsi	; token,
	movq	%r14, %rdi	; tmp397,
	call	parser_error@PLT	;
.L293:
; src/parser.c:312:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp493, token
.L262:
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	;, token_181->type
	jne	.L296	;,
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rbx), %rdi	; token_181->lexeme, token_181->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:293:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp494
	je	.L296	;,
; src/parser.c:315:     return create_class(name, members, class_scope);
	movq	40(%rsp), %rdx	; %sfp,
	movq	48(%rsp), %rsi	; %sfp,
	movq	56(%rsp), %rdi	; %sfp,
	call	create_class@PLT	;
	movq	%rax, %rcx	; tmp495, _205
; src/parser.c:52:             if (class_ == 0)
	testq	%rax, %rax	; _205
	je	.L301	;,
.L297:
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movl	$0, %edx	;,
	movl	$0, %esi	;,
	movl	$2, %edi	;,
	call	create_code_member@PLT	;
	movq	%rax, %rsi	; tmp496, _30
; src/parser.c:54:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	32(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
.L231:
; src/parser.c:57:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, 8(%rsp)	; token, %sfp
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testq	%rax, %rax	; token
	je	.L220	;,
.L219:
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	movq	8(%rsp), %rax	; %sfp, token
	movl	24(%rax), %eax	; token_368->type, _31
; src/parser.c:39:     while (token != 0 && token_ptr->type != EOF_TOKEN) {
	testl	%eax, %eax	; _31
	je	.L220	;,
; src/parser.c:40:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	;, _31
	je	.L330	;,
.L257:
; src/parser.c:56:             parser_error("Unexpected token in code member", token);
	movq	8(%rsp), %rsi	; %sfp,
	leaq	.LC87(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L231	;
.L329:
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	movq	(%rbx), %rdi	; token_181->lexeme, token_181->lexeme
	movq	METHOD_KEYWORD(%rip), %rsi	; METHOD_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	testb	%al, %al	; tmp457
	jne	.L331	;,
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%rbx)	;, token_181->type
	jne	.L263	;,
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	movq	(%rbx), %rdi	; token_181->lexeme, token_181->lexeme
	movq	VAR_KEYWORD(%rip), %rsi	; VAR_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:299:         } else if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	; tmp487
	je	.L263	;,
; src/parser.c:300:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp488, token
; src/parser.c:302:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	40(%rsp), %rsi	; %sfp,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
	movq	%rax, %rbx	; tmp489, variable
; src/parser.c:303:             if (variable == 0)
	testq	%rax, %rax	; variable
	je	.L332	;,
.L294:
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rbx, %rdx	; variable,
	movl	$0, %esi	;,
	movl	$1, %edi	;,
	call	create_class_member@PLT	;
	movq	%rax, %rsi	; tmp490, _194
; src/parser.c:305:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	48(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:306:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbx	; tmp491, token
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	;, token_195->type
	je	.L333	;,
.L295:
; src/parser.c:309:                 parser_error("Expected ';' after class variable declaration", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC84(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L293	;
.L331:
; src/parser.c:187:     Scope* method_scope = create_scope(now_scope);
	movq	40(%rsp), %rdi	; %sfp,
	call	create_scope@PLT	;
	movq	%rax, %r13	; tmp458, method_scope
; src/parser.c:188:     Name* self = create_name(SELF_KEYWORD, NAME_VARIABLE, class_name, NULL, method_scope);
	movq	%rax, %r8	; method_scope,
	movl	$0, %ecx	;,
	movq	56(%rsp), %rdx	; %sfp,
	movl	$1, %esi	;,
	movq	SELF_KEYWORD(%rip), %rdi	; SELF_KEYWORD,
	call	create_name@PLT	;
	movq	%rax, %r12	; tmp459, self
; src/parser.c:189:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp460, token
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movl	24(%rax), %eax	; token_210->type, _211
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$1, %eax	;, _211
	je	.L265	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	cmpl	$6, %eax	;, _211
	jne	.L266	;,
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	movq	0(%rbp), %rdi	; token_210->lexeme, token_210->lexeme
	call	is_builtin_type@PLT	;
; src/parser.c:191:     if (token_ptr->type != IDENTIFIER && !(token_ptr->type == KEYWORD && is_builtin_type(token_ptr->lexeme))) {
	testb	%al, %al	; tmp461
	je	.L266	;,
.L265:
; src/parser.c:195:     Name* return_type = search(now_scope, token_ptr->lexeme);
	movq	0(%rbp), %rsi	; token_210->lexeme, token_210->lexeme
	movq	40(%rsp), %rdi	; %sfp,
	call	search@PLT	;
	movq	%rax, 80(%rsp)	; return_type, %sfp
; src/parser.c:196:     if (return_type == 0) {
	testq	%rax, %rax	; return_type
	je	.L334	;,
; src/parser.c:200:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:202:     if (token_ptr->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	;, token_216->type
	jne	.L335	;,
; src/parser.c:206:     Name* name = create_name(token_ptr->lexeme, NAME_METHOD, return_type, NULL, now_scope);
	movq	(%rax), %rdi	; token_216->lexeme, token_216->lexeme
	movq	40(%rsp), %r8	; %sfp,
	movl	$0, %ecx	;,
	movq	80(%rsp), %rdx	; %sfp,
	movl	$3, %esi	;,
	call	create_name@PLT	;
	movq	%rax, 96(%rsp)	; tmp464, %sfp
; src/parser.c:207:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp465, token
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_220->type
	jne	.L270	;,
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	movq	(%rax), %rdi	; token_220->lexeme, token_220->lexeme
	movq	L_PAREN_SYMBOL(%rip), %rsi	; L_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:209:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp466
	je	.L270	;,
; src/parser.c:213:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp467, token
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	cmpl	$6, 24(%rax)	;, token_225->type
	je	.L336	;,
.L272:
; src/parser.c:216:         parser_error("Expected 'self' as first parameter of method", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC75(%rip), %rdi	;, tmp346
	call	parser_error@PLT	;
.L273:
; src/parser.c:217:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp469, token
; src/parser.c:219:     list(Variable*) parameters = create_list();
	call	create_list@PLT	;
	movq	%rax, 88(%rsp)	; tmp470, %sfp
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movl	$0, %edx	;,
	movq	%r12, %rsi	; self,
	movq	56(%rsp), %rdi	; %sfp,
	call	create_variable@PLT	;
	movq	%rax, %rsi	; tmp471, _232
; src/parser.c:220:     list_append(parameters, (pointer)create_variable(class_name, self, 0));
	movq	88(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:234:             parser_error("Method parameters cannot have default values", token);
	leaq	.LC78(%rip), %r12	;, tmp395
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	jmp	.L274	;
.L266:
; src/parser.c:192:         parser_error("Expected method return type after 'method'", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC71(%rip), %rdi	;, tmp336
	call	parser_error@PLT	;
.L302:
; src/parser.c:297:                 parser_error("Failed to parse class method", token);
	movq	%rbx, %rsi	; token,
	leaq	.LC82(%rip), %rdi	;, tmp364
	call	parser_error@PLT	;
	movl	$0, %esi	;, _267
	jmp	.L292	;
.L334:
; src/parser.c:197:         parser_error("Unknown return type for method", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC72(%rip), %rdi	;, tmp338
	call	parser_error@PLT	;
; src/parser.c:198:         return NULL;
	jmp	.L302	;
.L335:
; src/parser.c:203:         parser_error("Expected method name after return type", token);
	movq	%rax, %rsi	; token,
	leaq	.LC73(%rip), %rdi	;, tmp339
	call	parser_error@PLT	;
; src/parser.c:204:         return NULL;
	jmp	.L302	;
.L270:
; src/parser.c:210:         parser_error("Expected '(' after method name", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC74(%rip), %rdi	;, tmp343
	call	parser_error@PLT	;
; src/parser.c:211:         return NULL;
	jmp	.L302	;
.L336:
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	movq	(%rax), %rdi	; token_225->lexeme, token_225->lexeme
	movq	SELF_KEYWORD(%rip), %rsi	; SELF_KEYWORD,
	call	string_equal@PLT	;
; src/parser.c:215:     if (token_ptr->type != KEYWORD || !string_equal(token_ptr->lexeme, SELF_KEYWORD))
	testb	%al, %al	; tmp468
	jne	.L273	;,
	jmp	.L272	;
.L276:
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbp)	;, token_233->type
	jne	.L279	;,
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	movq	0(%rbp), %rdi	; token_233->lexeme, token_233->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:225:         } else if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) break;
	testb	%al, %al	; tmp475
	je	.L279	;,
.L280:
; src/parser.c:240:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp478, token
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	;, token_250->type
	jne	.L284	;,
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	movq	(%rax), %rdi	; token_250->lexeme, token_250->lexeme
	movq	L_BRACE_SYMBOL(%rip), %rsi	; L_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:242:     if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp479
	je	.L284	;,
; src/parser.c:246:     list(Statement*) body = create_list();
	call	create_list@PLT	;
	movq	%rax, 72(%rsp)	; tmp480, %sfp
; src/parser.c:247:     ((parser))->in_function = true;
	movq	16(%rsp), %rax	; %sfp, parser
	movb	$1, (%rax)	;, parser_72(D)->in_function
; src/parser.c:248:     ((parser))->in_method = true;
	movb	$1, 1(%rax)	;, parser_72(D)->in_method
; src/parser.c:250:     token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
; src/parser.c:249:     bool have_return = false;
	movzbl	71(%rsp), %r12d	; %sfp, have_return
	movq	%rbx, 104(%rsp)	; token, %sfp
	movq	%rax, %rbp	; token, token
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L286	;
.L337:
; src/parser.c:232:             parser_error("Failed to parse method parameter", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC77(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L281	;
.L282:
; src/parser.c:236:             list_append(parameters, (pointer)parameter);
	movq	%rax, %rsi	; parameter,
	movq	88(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
	jmp	.L281	;
.L338:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_233->lexeme, token_233->lexeme
	movq	R_PAREN_SYMBOL(%rip), %rsi	; R_PAREN_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	; tmp477
	jne	.L280	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_233->type
	jne	.L279	;,
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_233->lexeme, token_233->lexeme
	movq	COMMA_SYMBOL(%rip), %rsi	; COMMA_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:222:         if (token_ptr->type == SYMBOL && string_equal(token_ptr->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	; tmp472
	je	.L276	;,
; src/parser.c:223:             token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp473, token
; src/parser.c:230:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	%r13, %rsi	; method_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_variable	;
; src/parser.c:231:         if (parameter == 0)
	testq	%rax, %rax	; parameter
	je	.L337	;,
; src/parser.c:233:         else if (((parameter))->value != 0)
	cmpq	$0, 16(%rax)	;, parameter_239->value
	je	.L282	;,
; src/parser.c:234:             parser_error("Method parameters cannot have default values", token);
	movq	%rbp, %rsi	; token,
	movq	%r12, %rdi	; tmp395,
	call	parser_error@PLT	;
.L281:
; src/parser.c:237:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp476, token
.L274:
; src/parser.c:221:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_233->type
	je	.L338	;,
.L279:
; src/parser.c:227:             parser_error("Expected ',' or ')' after method parameter", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC76(%rip), %rdi	;, tmp351
	call	parser_error@PLT	;
; src/parser.c:228:             return NULL;
	jmp	.L302	;
.L284:
; src/parser.c:243:         parser_error("Expected '{' to start method body", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC79(%rip), %rdi	;, tmp358
	call	parser_error@PLT	;
; src/parser.c:244:         return NULL;
	jmp	.L302	;
.L290:
; src/parser.c:253:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	16(%rsp), %rdx	; %sfp,
	movq	%r13, %rsi	; method_scope,
	movq	%r15, %rdi	; lexer,
	call	parse_statement	;
	movq	%rax, %rbx	; tmp482, statement
; src/parser.c:254:         if (statement == 0)
	testq	%rax, %rax	; statement
	je	.L339	;,
; src/parser.c:256:         else if (have_return)
	testb	%r12b, %r12b	; have_return
	jne	.L340	;,
.L288:
; src/parser.c:259:             have_return = true;
	cmpl	$5, 8(%rbx)	;, statement_257->type
	movl	$1, %eax	;, tmp536
	cmove	%eax, %r12d	; have_return,, tmp536, have_return
; src/parser.c:260:         list_append(body, (pointer)statement);
	movq	%rbx, %rsi	; statement,
	movq	72(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:261:         token = get_next_token(lexer, true);
	movl	$1, %esi	;,
	movq	%r15, %rdi	; lexer,
	call	get_next_token@PLT	;
	movq	%rax, %rbp	; tmp483, token
.L286:
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	;, token_258->type
	jne	.L290	;,
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdi	; token_258->lexeme, token_258->lexeme
	movq	R_BRACE_SYMBOL(%rip), %rsi	; R_BRACE_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:252:     while (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	; tmp484
	je	.L290	;,
; src/parser.c:264:     ((parser))->in_function = false;
	movq	104(%rsp), %rbx	; %sfp, token
	movq	16(%rsp), %rax	; %sfp, parser
	movb	$0, (%rax)	;, parser_72(D)->in_function
; src/parser.c:265:     ((parser))->in_method = false;
	movb	$0, 1(%rax)	;, parser_72(D)->in_method
; src/parser.c:266:     if (!have_return && return_type != name_void)
	testb	%r12b, %r12b	; have_return
	jne	.L291	;,
; src/parser.c:266:     if (!have_return && return_type != name_void)
	movq	80(%rsp), %rax	; %sfp, return_type
	cmpq	name_void(%rip), %rax	; name_void, return_type
	je	.L291	;,
; src/parser.c:267:         parser_error("Method missing return statement", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC81(%rip), %rdi	;, tmp363
	call	parser_error@PLT	;
.L291:
; src/parser.c:268:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%r13, %r8	; method_scope,
	movq	72(%rsp), %rcx	; %sfp,
	movq	88(%rsp), %rdx	; %sfp,
	movq	80(%rsp), %rsi	; %sfp,
	movq	96(%rsp), %rdi	; %sfp,
	call	create_method@PLT	;
	movq	%rax, %rsi	; tmp485, _267
; src/parser.c:296:             if (method == 0)
	testq	%rax, %rax	; _267
	je	.L302	;,
.L292:
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movl	$0, %edx	;,
	movl	$0, %edi	;,
	call	create_class_member@PLT	;
	movq	%rax, %rsi	; tmp486, _187
; src/parser.c:298:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	48(%rsp), %rdi	; %sfp,
	call	list_append@PLT	;
; src/parser.c:294:         if (token_ptr->type == KEYWORD && string_equal(token_ptr->lexeme, METHOD_KEYWORD)) {
	jmp	.L293	;
.L339:
; src/parser.c:255:             parser_error("Failed to parse method body statement", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC80(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L288	;
.L340:
; src/parser.c:257:             parser_error("Unreachable code after return statement", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC66(%rip), %rdi	;,
	call	parser_error@PLT	;
	jmp	.L288	;
.L332:
; src/parser.c:304:                 parser_error("Failed to parse class variable", token);
	movq	%rbp, %rsi	; token,
	leaq	.LC83(%rip), %rdi	;, tmp367
	call	parser_error@PLT	;
	jmp	.L294	;
.L333:
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	movq	(%rax), %rdi	; token_195->lexeme, token_195->lexeme
	movq	SEMICOLON_SYMBOL(%rip), %rsi	; SEMICOLON_SYMBOL,
	call	string_equal@PLT	;
; src/parser.c:308:             if (token_ptr->type != SYMBOL || !string_equal(token_ptr->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	; tmp492
	jne	.L293	;,
	jmp	.L295	;
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

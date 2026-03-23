	.file	"D:\\TC\\src\\parser.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Failed to parse expression primary\0"
	.align 8
.LC1:
	.ascii "Failed to parse parenthesized expression\0"
.LC2:
	.ascii "Expected ')' after expression\0"
	.align 8
.LC3:
	.ascii "Failed to parse operand of unary '!'\0"
	.align 8
.LC4:
	.ascii "Failed to parse operand of unary '-'\0"
	.align 8
.LC5:
	.ascii "Expected variable name in variable access\0"
	.align 8
.LC6:
	.ascii "Cannot call undefined variable\0"
	.align 8
.LC7:
	.ascii "Cannot call non-function variable\0"
	.align 8
.LC8:
	.ascii "Failed to parse function call argument\0"
	.align 8
.LC9:
	.ascii "Expected ',' or ')' after function call argument\0"
	.align 8
.LC10:
	.ascii "Failed to parse sequence index\0"
	.align 8
.LC11:
	.ascii "Expected ']' after sequence index\0"
	.align 8
.LC12:
	.ascii "Cannot access attribute without a valid scope\0"
	.align 8
.LC13:
	.ascii "Expected attribute name after '.'\0"
.LC14:
	.ascii "Unknown attribute name\0"
	.align 8
.LC15:
	.ascii "Failed to parse variable access\0"
	.align 8
.LC16:
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
	movq	%rdx, %rbp	 ; tmp321, now_scope
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp322, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp320, lexer
	subq	$88, %rsp	 ;,
 ; D:\TC\src\parser.c:569:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %r15	 ; tmp323, token
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:\TC\src\parser.c:575:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L122	 ;,
 ; D:\TC\src\parser.c:578:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L123	 ;,
 ; D:\TC\src\parser.c:581:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L124	 ;,
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L125	 ;,
.L6:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	je	.L10	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L12	 ;,
.L13:
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp311
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp394
 ; D:\TC\src\parser.c:627:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L123:
 ; D:\TC\src\parser.c:580:         str_value = token->lexeme;
	movq	(%r15), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:579:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L3:
 ; D:\TC\src\parser.c:630:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r10, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
.L1:
 ; D:\TC\src\parser.c:631: }
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
.L122:
 ; D:\TC\src\parser.c:577:         str_value = token->lexeme;
	movq	(%r15), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:576:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L124:
 ; D:\TC\src\parser.c:583:         str_value = token->lexeme;
	movq	(%r15), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:582:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L125:
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp223
	movq	(%r15), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp324
	jne	.L126	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movl	24(%r15), %eax	 ; token_62->type, _6
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _6
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp226
	movq	(%r15), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:587:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp325
	jne	.L9	 ;,
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%r15), %eax	 ; token_62->type, pretmp_52
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_52
	jne	.L23	 ;,
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9	 ;, tmp313
	movq	(%r15), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%r9), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:590:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp326
	jne	.L127	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movl	24(%r15), %eax	 ; token_62->type, pretmp_52
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_52
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp241
	movq	(%r15), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:603:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp337
	jne	.L128	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movl	24(%r15), %eax	 ; token_62->type, pretmp_52
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_52
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp245
	movq	(%r15), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:611:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp341
	jne	.L24	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%r15), %eax	 ; token_62->type, pretmp_52
.L23:
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, pretmp_52
	je	.L12	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, pretmp_52
	jne	.L13	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp249
	movq	(%r15), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp346
	je	.L13	 ;,
 ; D:\TC\src\parser.c:619:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rdi)	 ;, parser_71(D)->in_method
	je	.L13	 ;,
.L12:
 ; D:\TC\src\parser.c:633:     Token* token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp345, token
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_117->type, _118
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _118
	je	.L27	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _118
	jne	.L30	 ;,
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp254
	movq	(%rsi), %rcx	 ; token_117->lexeme, token_117->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:634:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp348
	je	.L30	 ;,
.L27:
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_117->lexeme, token_117->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search_name	 ;
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:641:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %r12	 ; tmp349, base_name
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:642:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, 56(%rsp)	 ; variable_value, %sfp
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	movq	56(%rsp), %r10	 ; %sfp, variable_value
	cmpl	$5, 24(%rax)	 ;, token_127->type
 ; D:\TC\src\parser.c:643:     token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp351, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	jne	.L31	 ;,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9	 ;, tmp313
 ; D:\TC\src\parser.c:638:     Symbol* current_type = NULL;
	xorl	%esi, %esi	 ; current_type
 ; D:\TC\src\parser.c:640:     SymbolTable* var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r9, 64(%rsp)	 ; tmp313, %sfp
.L58:
 ; D:\TC\src\parser.c:645:         if (base_name != NULL) {
	testq	%r12, %r12	 ; base_name
	je	.L32	 ;,
 ; D:\TC\src\parser.c:647:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%r12), %rsi	 ; base_name_113->type, current_type
 ; D:\TC\src\parser.c:646:             current_type = base_name;     // class or type
	testq	%rsi, %rsi	 ; current_type
	cmove	%r12, %rsi	 ; current_type,, base_name, current_type
.L32:
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; var_scope
	jne	.L33	 ;,
	testq	%rsi, %rsi	 ; current_type
	je	.L33	 ;,
 ; D:\TC\src\parser.c:650:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movl	32(%rsi), %edx	 ; current_type_132->kind,
	testl	%edx, %edx	 ;
	jne	.L33	 ;,
 ; D:\TC\src\parser.c:651:             var_scope = current_type->scope;
	movq	8(%rsi), %r13	 ; current_type_132->scope, var_scope
.L33:
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %rax	 ; %sfp, tmp313
	movq	(%r14), %rcx	 ; token_267->lexeme, token_267->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:652:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp352
	jne	.L129	 ;,
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp419
	movq	(%r14), %rcx	 ; token_267->lexeme, token_267->lexeme
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:683:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp373
	je	.L49	 ;,
 ; D:\TC\src\parser.c:684:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:685:             token = get_next_token(lexer, true);
	movq	%rax, 72(%rsp)	 ; tmp374, %sfp
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp375, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L130	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp378, _241
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r14	 ; tmp379, _242
 ; D:\TC\src\parser.c:687:             if (index == NULL)
	testq	%rax, %rax	 ; _242
	je	.L51	 ;,
.L52:
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_191->type
 ; D:\TC\src\parser.c:689:             token = get_next_token(lexer, true);
	movq	%rax, %r11	 ; tmp381, token
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L54	 ;,
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp420
	movq	(%r11), %rcx	 ; token_191->lexeme, token_191->lexeme
	movq	%r11, 72(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:690:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	72(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp383
	je	.L54	 ;,
 ; D:\TC\src\parser.c:694:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r14, %r9	 ; _242,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp384, %sfp
.L48:
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_218->type
 ; D:\TC\src\parser.c:716:         token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp392, token
 ; D:\TC\src\parser.c:644:     while (token->type == SYMBOL) {
	je	.L58	 ;,
.L116:
	movq	56(%rsp), %r10	 ; %sfp, variable_value
.L31:
 ; D:\TC\src\parser.c:622:         if (variable_value == NULL) {
	testq	%r10, %r10	 ; variable_value
	je	.L29	 ;,
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:620:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L49:
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp421
	movq	(%r14), %rcx	 ; token_267->lexeme, token_267->lexeme
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:695:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp385
	je	.L116	 ;,
 ; D:\TC\src\parser.c:696:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:697:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp386, token
 ; D:\TC\src\parser.c:698:             if (var_scope == NULL) {
	testq	%r13, %r13	 ; var_scope
	je	.L131	 ;,
 ; D:\TC\src\parser.c:702:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_203->type
	jne	.L132	 ;,
 ; D:\TC\src\parser.c:706:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_203->lexeme, token_203->lexeme
	movq	%r13, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %r12	 ; tmp389, base_name
 ; D:\TC\src\parser.c:707:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L133	 ;,
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:713:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:712:             current_type = NULL;
	xorl	%esi, %esi	 ; current_type
 ; D:\TC\src\parser.c:711:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp391, %sfp
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L129:
 ; D:\TC\src\parser.c:653:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp353, token
 ; D:\TC\src\parser.c:654:             if (base_name == NULL)
	testq	%r12, %r12	 ; base_name
	je	.L134	 ;,
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	movl	32(%r12), %eax	 ; base_name_113->kind, _144
 ; D:\TC\src\parser.c:656:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _144
	je	.L135	 ;,
.L37:
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, %eax	 ;, _144
	jne	.L136	 ;,
.L36:
 ; D:\TC\src\parser.c:662:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp358, token
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13	 ;, tmp314
 ; D:\TC\src\parser.c:663:             list(Expression*) args = create_list();
	movq	%rax, %r14	 ; tmp359, args
	.p2align 4,,10
	.p2align 3
.L39:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_160->type
	je	.L137	 ;,
.L47:
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp360, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L138	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%rbp, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp363, _231
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rdx	 ; tmp364, _157
 ; D:\TC\src\parser.c:666:                 if (arg == NULL)
	testq	%rax, %rax	 ; _157
	je	.L41	 ;,
.L42:
 ; D:\TC\src\parser.c:668:                 list_append(args, (pointer)arg);
	movq	%r14, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_161->type
 ; D:\TC\src\parser.c:669:                 token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp366, token
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L43	 ;,
.L46:
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp276
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp367
 ; D:\TC\src\parser.c:673:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L29:
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%r15, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp309
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp393
 ; D:\TC\src\parser.c:623:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L137:
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_160->lexeme, token_160->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:664:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp371
	je	.L47	 ;,
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r14, 32(%rsp)	 ; args,
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:678:             base_name = base_name->type;
	movq	(%r12), %r12	 ; base_name_180->type, base_name
 ; D:\TC\src\parser.c:677:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, 56(%rsp)	 ; tmp372, %sfp
 ; D:\TC\src\parser.c:681:             if (base_name->kind == SYMBOL_CLASS)
	movl	32(%r12), %eax	 ; base_name_181->kind,
	testl	%eax, %eax	 ;
	jne	.L62	 ;,
 ; D:\TC\src\parser.c:682:                 var_scope = base_name->scope;
	movq	8(%r12), %r13	 ; base_name_181->scope, var_scope
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	xorl	%esi, %esi	 ; current_type
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp418
	movq	(%rsi), %rcx	 ; token_161->lexeme, token_161->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:670:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp368
	jne	.L139	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_161->type
	jne	.L46	 ;,
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_161->lexeme, token_161->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:672:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp370
	jne	.L39	 ;,
	jmp	.L46	 ;
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; MEM[(struct File * *)parser_71(D)], MEM[(struct File * *)parser_71(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, 72(%rsp)	 ; _236, %sfp
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	72(%rsp), %r8	 ; %sfp, _236
	leaq	.LC0(%rip), %rcx	 ;, tmp272
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp362, _237
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L41:
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp274
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp365
 ; D:\TC\src\parser.c:667:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _157
	jmp	.L42	 ;
	.p2align 4,,10
	.p2align 3
.L139:
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp369, token
 ; D:\TC\src\parser.c:671:                     token = get_next_token(lexer, true);
	jmp	.L39	 ;
	.p2align 4,,10
	.p2align 3
.L136:
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp270
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp357
 ; D:\TC\src\parser.c:661:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L126:
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	movq	(%r15), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:585:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:\TC\src\parser.c:586:         str_value = token->lexeme;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	movq	(%r15), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:588:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:\TC\src\parser.c:589:         str_value = token->lexeme;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp267
	movq	8(%r12), %rcx	 ; base_name_113->scope, _146
	movq	(%rax), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	call	search_name	 ;
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:\TC\src\parser.c:657:                 base_name = search_name(base_name->scope, CONSTRUCTOR_NAME);
	movq	%rax, %r12	 ; tmp355, base_name
 ; D:\TC\src\parser.c:658:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp356, %sfp
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	testq	%r12, %r12	 ; base_name
	je	.L36	 ;,
 ; D:\TC\src\parser.c:660:             if (base_name != NULL && base_name->kind != SYMBOL_SUBROUTINE)
	movl	32(%r12), %eax	 ; base_name_147->kind, _144
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L30:
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp253
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp347
 ; D:\TC\src\parser.c:635:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L130:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; MEM[(struct File * *)parser_71(D)], MEM[(struct File * *)parser_71(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r14	 ; tmp376, _246
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r14, %r8	 ; _246,
	leaq	.LC0(%rip), %rcx	 ;, tmp290
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp377, _247
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L51:
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	xorl	%r14d, %r14d	 ; _242
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	72(%rsp), %rdx	 ; %sfp,
	leaq	.LC10(%rip), %rcx	 ;, tmp292
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp380
 ; D:\TC\src\parser.c:688:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L127:
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:592:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp327, token
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp328, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L140	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp331, _109
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
 ; D:\TC\src\parser.c:594:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L16	 ;,
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_75->type, type
 ; D:\TC\src\parser.c:598:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp334, token
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L21	 ;,
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp238
	movq	(%rsi), %rcx	 ; token_75->lexeme, token_75->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:599:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp336
	je	.L21	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:573:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L128:
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:605:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp338, token
 ; D:\TC\src\parser.c:606:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp339, prim_value
 ; D:\TC\src\parser.c:607:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L141	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:604:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L24:
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:613:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp342, token
 ; D:\TC\src\parser.c:614:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp343, prim_value
 ; D:\TC\src\parser.c:615:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L142	 ;,
 ; D:\TC\src\parser.c:574:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:572:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:571:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:612:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L134:
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp266
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp354
 ; D:\TC\src\parser.c:655:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L36	 ;
.L21:
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp237
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp335
 ; D:\TC\src\parser.c:600:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
.L62:
 ; D:\TC\src\parser.c:680:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:679:             current_type = NULL;
	xorl	%esi, %esi	 ; current_type
	jmp	.L48	 ;
.L54:
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC11(%rip), %rcx	 ;, tmp294
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp382
 ; D:\TC\src\parser.c:691:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L133:
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp307
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp390
 ; D:\TC\src\parser.c:708:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L132:
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp304
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp388
 ; D:\TC\src\parser.c:703:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L131:
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp302
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp387
 ; D:\TC\src\parser.c:699:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L140:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; MEM[(struct File * *)parser_71(D)], MEM[(struct File * *)parser_71(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rbp	 ; tmp329, _114
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %r8	 ; _114,
	leaq	.LC0(%rip), %rcx	 ;, tmp233
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp330, _115
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L16:
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC1(%rip), %rcx	 ;, tmp235
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp333
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
.L142:
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp248
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp344
 ; D:\TC\src\parser.c:616:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
.L141:
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp244
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp340
 ; D:\TC\src\parser.c:608:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:596:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
	.section .rdata,"dr"
.LC17:
	.ascii "Failed to parse right operand\0"
	.text
	.p2align 4
	.def	parse_expr_prec;	.scl	3;	.type	32;	.endef
parse_expr_prec:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movl	%r8d, %r14d	 ; tmp126, min_prec
	pushq	%r13	 ;
	movq	%r9, %r13	 ; tmp127, now_scope
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp125, expr_left
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:526: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp124, lexer
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:528:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L144	 ;,
.L151:
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_70->lexeme, token_70->lexeme
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:530:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp129, op
 ; D:\TC\src\parser.c:531:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %esi	 ; tmp130, op_prec
 ; D:\TC\src\parser.c:532:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L144	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jl	.L144	 ;,
 ; D:\TC\src\parser.c:534:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r13, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:535:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp131, token
 ; D:\TC\src\parser.c:536:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp132, right_primary
 ; D:\TC\src\parser.c:537:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	je	.L158	 ;,
 ; D:\TC\src\parser.c:541:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp134, right
.L157:
 ; D:\TC\src\parser.c:542:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:543:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L147	 ;,
 ; D:\TC\src\parser.c:544:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_69->lexeme, token_69->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r15d	 ; tmp136, next_op
 ; D:\TC\src\parser.c:545:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:546:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r15d	 ;, next_op
	je	.L147	 ;,
	cmpl	%eax, %esi	 ; next_prec, op_prec
	jge	.L147	 ;,
 ; D:\TC\src\parser.c:548:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp144
	movq	%r13, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rbx, %rcx	 ; lexer,
	movq	%rdx, 32(%rsp)	 ; tmp144,
	movq	%rbp, %rdx	 ; right,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp138, right
 ; D:\TC\src\parser.c:549:             if (right == NULL)
	testq	%rax, %rax	 ; right
	jne	.L157	 ;,
 ; D:\TC\src\parser.c:539:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L143	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; expr_left,
	movq	%rbp, %r9	 ; right,
	movl	%edi, %ecx	 ; op,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:553:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %r12	 ; tmp140, expr_left
 ; D:\TC\src\parser.c:554:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:529:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	je	.L151	 ;,
.L144:
 ; D:\TC\src\parser.c:556:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L143:
 ; D:\TC\src\parser.c:558: }
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
.L158:
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	160(%rsp), %rax	 ; parser, tmp143
 ; D:\TC\src\parser.c:539:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%rax), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp117
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp133
 ; D:\TC\src\parser.c:538:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L143	 ;
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
parse_variable:
	pushq	%r13	 ;
	pushq	%r12	 ;
	movq	%r8, %r12	 ; tmp147, parser
	pushq	%rbp	 ;
	movq	%rdx, %rbp	 ; tmp146, now_scope
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp145, lexer
	pushq	%rbx	 ;
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:276:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp148, token
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_36->type, _1
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L160	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L163	 ;,
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_36->lexeme, token_36->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:277:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp150
	je	.L163	 ;,
.L160:
 ; D:\TC\src\parser.c:281:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_36->lexeme, token_36->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp151, type
 ; D:\TC\src\parser.c:282:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L164	 ;,
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_43->kind, _46
 ; D:\TC\src\parser.c:284:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$5, %eax	 ;, _46
	je	.L165	 ;,
	testl	%eax, %eax	 ; _46
	jne	.L190	 ;,
.L165:
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_50->type
 ; D:\TC\src\parser.c:288:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp154, token
 ; D:\TC\src\parser.c:289:     if (token->type != IDENTIFIER)
	jne	.L191	 ;,
.L166:
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	%rbp, %r9	 ; now_scope,
	movq	%rdi, %r8	 ; type,
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:291:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rbx	 ; tmp156, name
 ; D:\TC\src\parser.c:293:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_56->type
	je	.L192	 ;,
.L168:
 ; D:\TC\src\parser.c:292:     Expression* value = NULL;
	xorl	%r8d, %r8d	 ; value
.L172:
 ; D:\TC\src\parser.c:302: }
	addq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
 ; D:\TC\src\parser.c:302: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:\TC\src\parser.c:301:     return create_variable(type, name, value);
	jmp	create_variable	 ;
	.p2align 4,,10
	.p2align 3
.L191:
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp135
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp155
 ; D:\TC\src\parser.c:290:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L166	 ;
	.p2align 4,,10
	.p2align 3
.L163:
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp123
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp149
 ; D:\TC\src\parser.c:278:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:302: }
	addq	$56, %rsp	 ;,
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
.L190:
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp131
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp152
 ; D:\TC\src\parser.c:285:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L165	 ;
	.p2align 4,,10
	.p2align 3
.L192:
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp137
	movq	(%rax), %rcx	 ; token_56->lexeme, token_56->lexeme
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:294:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp158
	je	.L168	 ;,
 ; D:\TC\src\parser.c:295:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:296:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp159, token
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp160, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L193	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp163, _69
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r8	 ; tmp164, value
 ; D:\TC\src\parser.c:298:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L172	 ;,
.L171:
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp143
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp165
 ; D:\TC\src\parser.c:299:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L168	 ;
	.p2align 4,,10
	.p2align 3
.L164:
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp133
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp153
 ; D:\TC\src\parser.c:287:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L165	 ;
.L193:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; MEM[(struct File * *)parser_38(D)], MEM[(struct File * *)parser_38(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rbp	 ; tmp161, _74
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %r8	 ; _74,
	leaq	.LC0(%rip), %rcx	 ;, tmp141
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp162, _75
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L171	 ;
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
	movq	%rdx, %rdi	 ; tmp556, now_scope
	pushq	%rsi	 ;
	movq	%r8, %rsi	 ; tmp557, parser
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp555, lexer
	subq	$104, %rsp	 ;,
 ; D:\TC\src\parser.c:305:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:307:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	je	.L386	 ;,
.L195:
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rbp	 ; tmp715, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L387	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; left_primary,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp718, _411
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp719, left_primary
.L296:
 ; D:\TC\src\parser.c:337:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, 32(%rsp)	 ; left_primary,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp720, <retval>
.L283:
 ; D:\TC\src\parser.c:338:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp721, token
 ; D:\TC\src\parser.c:339:     if (statement == NULL)
	testq	%rbp, %rbp	 ; <retval>
	je	.L388	 ;,
.L297:
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:\TC\src\parser.c:341:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp723, token
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L298	 ;,
.L300:
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp536
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp724
 ; D:\TC\src\parser.c:343:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L194:
 ; D:\TC\src\parser.c:345: }
	addq	$104, %rsp	 ;,
	movq	%rbp, %rax	 ; <retval>,
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
.L298:
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp537
	movq	(%rbx), %rcx	 ; token_110->lexeme, token_110->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:342:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp725
	je	.L300	 ;,
	jmp	.L194	 ;
	.p2align 4,,10
	.p2align 3
.L386:
	movq	%rax, %rbp	 ; tmp558, token
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp369
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:308:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp559
	jne	.L389	 ;,
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp432
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:310:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp621
	jne	.L390	 ;,
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp483
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:312:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp665
	jne	.L391	 ;,
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp510
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:314:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp690
	jne	.L392	 ;,
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp513
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:317:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp693
	je	.L284	 ;,
 ; D:\TC\src\parser.c:318:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_85->type
	je	.L393	 ;,
.L285:
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rbp	 ; tmp697, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L394	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; left_primary,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp700, _391
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp701, left_primary
.L287:
 ; D:\TC\src\parser.c:321:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, 32(%rsp)	 ; left_primary,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp702, <retval>
	jmp	.L283	 ;
	.p2align 4,,10
	.p2align 3
.L390:
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_243->type
 ; D:\TC\src\parser.c:433:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp622, token
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L235	 ;,
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp437
	movq	0(%rbp), %rcx	 ; token_243->lexeme, token_243->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:434:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp624
	je	.L235	 ;,
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_250->type
 ; D:\TC\src\parser.c:438:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp625, token
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L236	 ;,
.L239:
 ; D:\TC\src\parser.c:441:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp626, initializer
 ; D:\TC\src\parser.c:442:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L395	 ;,
.L238:
 ; D:\TC\src\parser.c:444:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp629, token
.L240:
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_259->type
	jne	.L243	 ;,
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14	 ;, tmp546
	movq	0(%rbp), %rcx	 ; token_259->lexeme, token_259->lexeme
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:446:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp631
	je	.L243	 ;,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_266->type
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp632, token
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L244	 ;,
.L247:
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp633, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L396	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp637, _323
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp638, condition
 ; D:\TC\src\parser.c:454:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L249	 ;,
.L250:
 ; D:\TC\src\parser.c:456:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp640, token
.L248:
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_275->type
	jne	.L252	 ;,
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	0(%rbp), %rcx	 ; token_275->lexeme, token_275->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:458:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp642
	je	.L252	 ;,
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_282->type
 ; D:\TC\src\parser.c:462:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp643, token
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L253	 ;,
.L256:
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp644, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L397	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp648, _333
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:466:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L258	 ;,
.L259:
 ; D:\TC\src\parser.c:468:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp651, token
.L257:
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_291->type
	jne	.L261	 ;,
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp470
	movq	0(%rbp), %rcx	 ; token_291->lexeme, token_291->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:470:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp653
	je	.L261	 ;,
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_298->type
 ; D:\TC\src\parser.c:474:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp654, token
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L263	 ;,
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp475
	movq	0(%rbp), %rcx	 ; token_298->lexeme, token_298->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:475:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp656
	je	.L263	 ;,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:480:     parser->in_loop = true;
	movb	$1, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:479:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp657, body
 ; D:\TC\src\parser.c:481:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r12, 64(%rsp)	 ; initializer, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp543
	movq	%rax, %rbp	 ; tmp658, token
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L264	 ;
	.p2align 4,,10
	.p2align 3
.L265:
 ; D:\TC\src\parser.c:486:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:487:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp661, token
.L264:
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_310->type
	jne	.L266	 ;,
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_310->lexeme, token_310->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:482:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp662
	jne	.L398	 ;,
.L266:
 ; D:\TC\src\parser.c:483:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp659, statement
 ; D:\TC\src\parser.c:484:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L265	 ;,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp660
 ; D:\TC\src\parser.c:485:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L265	 ;
	.p2align 4,,10
	.p2align 3
.L388:
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp534
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp722
 ; D:\TC\src\parser.c:340:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L297	 ;
	.p2align 4,,10
	.p2align 3
.L389:
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:\TC\src\parser.c:348:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp560, token
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L199	 ;,
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12	 ;, tmp544
	movq	(%rax), %rcx	 ; token_114->lexeme, token_114->lexeme
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:349:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp562
	je	.L199	 ;,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:353:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp563, token
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp564, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L399	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp567, _225
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, 72(%rsp)	 ; _226, %sfp
 ; D:\TC\src\parser.c:355:     if (condition == NULL)
	testq	%rax, %rax	 ; _226
	je	.L201	 ;,
.L202:
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:357:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp570, token
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L204	 ;,
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp771
	movq	0(%rbp), %rcx	 ; token_125->lexeme, token_125->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:358:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp572
	je	.L204	 ;,
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:\TC\src\parser.c:362:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp573, token
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L206	 ;,
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp772
	movq	0(%rbp), %rcx	 ; token_132->lexeme, token_132->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:363:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp575
	je	.L206	 ;,
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:367:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp576, body
 ; D:\TC\src\parser.c:368:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp543
	movq	%rax, %rbp	 ; tmp577, token
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L207	 ;
	.p2align 4,,10
	.p2align 3
.L208:
 ; D:\TC\src\parser.c:373:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:374:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp580, token
.L207:
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_144->type
	jne	.L209	 ;,
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_144->lexeme, token_144->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:369:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp581
	jne	.L400	 ;,
.L209:
 ; D:\TC\src\parser.c:370:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp578, statement
 ; D:\TC\src\parser.c:371:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L208	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC27(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp579
 ; D:\TC\src\parser.c:372:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L208	 ;
	.p2align 4,,10
	.p2align 3
.L199:
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp373
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp561
 ; D:\TC\src\parser.c:350:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L198:
 ; D:\TC\src\parser.c:351:         return NULL;
	xorl	%edx, %edx	 ; _221
.L211:
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp620, <retval>
 ; D:\TC\src\parser.c:309:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L194	 ;
	.p2align 4,,10
	.p2align 3
.L387:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdi	 ; tmp716, _416
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _416,
	leaq	.LC0(%rip), %rcx	 ;, tmp532
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp717, _417
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L296	 ;
	.p2align 4,,10
	.p2align 3
.L391:
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_341->type
 ; D:\TC\src\parser.c:494:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp666, token
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L270	 ;,
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp488
	movq	0(%rbp), %rcx	 ; token_341->lexeme, token_341->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:495:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp668
	je	.L270	 ;,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:499:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp669, token
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp670, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L401	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp673, _381
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp674, _382
 ; D:\TC\src\parser.c:501:     if (condition == NULL)
	testq	%rax, %rax	 ; _382
	je	.L272	 ;,
.L273:
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_352->type
 ; D:\TC\src\parser.c:503:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp676, token
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L276	 ;,
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp497
	movq	0(%rbp), %rcx	 ; token_352->lexeme, token_352->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp678
	je	.L276	 ;,
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_359->type
 ; D:\TC\src\parser.c:508:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp679, token
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L278	 ;,
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp502
	movq	0(%rbp), %rcx	 ; token_359->lexeme, token_359->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:509:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp681
	je	.L278	 ;,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:514:     parser->in_loop = true;
	movb	$1, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:513:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp682, body
 ; D:\TC\src\parser.c:515:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp543
	movq	%rax, %rbp	 ; tmp683, token
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L279	 ;
	.p2align 4,,10
	.p2align 3
.L280:
 ; D:\TC\src\parser.c:520:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:521:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp686, token
.L279:
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_371->type
	jne	.L281	 ;,
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_371->lexeme, token_371->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:516:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp687
	jne	.L402	 ;,
.L281:
 ; D:\TC\src\parser.c:517:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp684, statement
 ; D:\TC\src\parser.c:518:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L280	 ;,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp685
 ; D:\TC\src\parser.c:519:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L280	 ;
	.p2align 4,,10
	.p2align 3
.L392:
 ; D:\TC\src\parser.c:315:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:316:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 40(%rsp)	 ; tmp691,
	movl	$1, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp692, <retval>
	jmp	.L283	 ;
	.p2align 4,,10
	.p2align 3
.L204:
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp382
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp571
 ; D:\TC\src\parser.c:359:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:360:         return NULL;
	jmp	.L198	 ;
	.p2align 4,,10
	.p2align 3
.L235:
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp436
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp623
 ; D:\TC\src\parser.c:435:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L234:
 ; D:\TC\src\parser.c:436:         return NULL;
	xorl	%r9d, %r9d	 ; _319
.L242:
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp664, <retval>
 ; D:\TC\src\parser.c:311:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L194	 ;
	.p2align 4,,10
	.p2align 3
.L270:
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp487
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp667
 ; D:\TC\src\parser.c:496:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L269:
 ; D:\TC\src\parser.c:497:         return NULL;
	xorl	%r8d, %r8d	 ; _377
.L275:
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp689, <retval>
 ; D:\TC\src\parser.c:313:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L194	 ;
.L399:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r13	 ; tmp565, _230
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r13, %r8	 ; _230,
	leaq	.LC0(%rip), %rcx	 ;, tmp378
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp566, _231
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L201:
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp380
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp569
 ; D:\TC\src\parser.c:356:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	$0, 72(%rsp)	 ;, %sfp
	jmp	.L202	 ;
	.p2align 4,,10
	.p2align 3
.L284:
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp521
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:322:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp703
	je	.L288	 ;,
 ; D:\TC\src\parser.c:323:             if (!parser->in_loop) {
	cmpb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
	je	.L403	 ;,
 ; D:\TC\src\parser.c:327:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp705, <retval>
	jmp	.L283	 ;
	.p2align 4,,10
	.p2align 3
.L243:
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp446
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp630
 ; D:\TC\src\parser.c:447:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:448:         return NULL;
	jmp	.L234	 ;
.L206:
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp387
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp574
 ; D:\TC\src\parser.c:364:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:365:         return NULL;
	jmp	.L198	 ;
.L400:
 ; D:\TC\src\parser.c:376:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp582, %sfp
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:377:     list(Statement*) else_body = create_list();
	movq	%rax, 80(%rsp)	 ; tmp583, %sfp
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:378:     token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp584, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jne	.L224	 ;,
	movq	%r15, 88(%rsp)	 ; body, %sfp
	.p2align 4,,10
	.p2align 3
.L210:
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp775
	movq	0(%rbp), %rcx	 ; token_466->lexeme, token_466->lexeme
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp610
	je	.L404	 ;,
 ; D:\TC\src\parser.c:380:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:\TC\src\parser.c:381:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp586, token
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L213	 ;,
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rax), %rcx	 ; token_153->lexeme, token_153->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp588
	je	.L213	 ;,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:386:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp589, token
 ; D:\TC\src\parser.c:560:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp590, left_primary
 ; D:\TC\src\parser.c:561:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L405	 ;,
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp593, _235
 ; D:\TC\src\parser.c:565:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r15	 ; tmp594, _236
 ; D:\TC\src\parser.c:388:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; _236
	je	.L215	 ;,
.L216:
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:\TC\src\parser.c:390:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp596, token
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L218	 ;,
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp773
	movq	0(%rbp), %rcx	 ; token_165->lexeme, token_165->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:391:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp598
	je	.L218	 ;,
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:\TC\src\parser.c:395:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp599, token
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L220	 ;,
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp774
	movq	0(%rbp), %rcx	 ; token_173->lexeme, token_173->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:396:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp601
	je	.L220	 ;,
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:401:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:400:         list(Statement*) elif_body = create_list();
	movq	%rax, %r13	 ; tmp602, elif_body
 ; D:\TC\src\parser.c:401:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r15, 56(%rsp)	 ; _236, %sfp
	movq	%rax, %rbp	 ; tmp603, token
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L221	 ;
	.p2align 4,,10
	.p2align 3
.L222:
 ; D:\TC\src\parser.c:406:             list_append(elif_body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:407:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp606, token
.L221:
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_186->type
	jne	.L223	 ;,
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_186->lexeme, token_186->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp607
	jne	.L406	 ;,
.L223:
 ; D:\TC\src\parser.c:403:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp604, statement
 ; D:\TC\src\parser.c:404:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L222	 ;,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC32(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp605
 ; D:\TC\src\parser.c:405:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L222	 ;
	.p2align 4,,10
	.p2align 3
.L406:
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %r15	 ; %sfp, _236
	movq	%r13, %rdx	 ; elif_body,
	movq	%r15, %rcx	 ; _236,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp608, _192
 ; D:\TC\src\parser.c:409:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_193->type
 ; D:\TC\src\parser.c:410:         token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp609, token
 ; D:\TC\src\parser.c:379:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	je	.L210	 ;,
	movq	88(%rsp), %r15	 ; %sfp, body
.L224:
 ; D:\TC\src\parser.c:428:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:429:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp585, _221
	jmp	.L211	 ;
.L405:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r13	 ; tmp591, _240
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r13, %r8	 ; _240,
	leaq	.LC0(%rip), %rcx	 ;, tmp402
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp592, _241
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L215:
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	xorl	%r15d, %r15d	 ; _236
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp595
 ; D:\TC\src\parser.c:389:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L216	 ;
.L236:
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp440
	movq	0(%rbp), %rcx	 ; token_250->lexeme, token_250->lexeme
 ; D:\TC\src\parser.c:439:     Variable* initializer = NULL;
	xorl	%r12d, %r12d	 ; initializer
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:440:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp627
	jne	.L240	 ;,
	jmp	.L239	 ;
.L276:
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp496
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp677
 ; D:\TC\src\parser.c:505:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:506:         return NULL;
	jmp	.L269	 ;
.L252:
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp458
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp641
 ; D:\TC\src\parser.c:459:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:460:         return NULL;
	jmp	.L234	 ;
.L393:
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp516
	movq	(%rax), %rcx	 ; token_85->lexeme, token_85->lexeme
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:319:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp695
	je	.L285	 ;,
 ; D:\TC\src\parser.c:320:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp696, <retval>
	jmp	.L194	 ;
.L288:
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp526
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:328:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp706
	je	.L195	 ;,
 ; D:\TC\src\parser.c:329:             if (!parser->in_loop) {
	cmpb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
	je	.L407	 ;,
 ; D:\TC\src\parser.c:333:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$7, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp708, <retval>
	jmp	.L283	 ;
.L244:
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_266->lexeme, token_266->lexeme
 ; D:\TC\src\parser.c:451:     Expression* condition = NULL;
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:452:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp634
	jne	.L248	 ;,
	jmp	.L247	 ;
.L278:
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp501
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp680
 ; D:\TC\src\parser.c:510:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:511:         return NULL;
	jmp	.L269	 ;
.L402:
 ; D:\TC\src\parser.c:523:     parser->in_loop = false;
	movb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:524:     return create_while(condition, body);
	movq	%r12, %rdx	 ; body,
	movq	%r13, %rcx	 ; _382,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp688, _377
	jmp	.L275	 ;
.L395:
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp444
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp628
 ; D:\TC\src\parser.c:443:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L238	 ;
.L261:
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp469
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp652
 ; D:\TC\src\parser.c:471:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:472:         return NULL;
	jmp	.L234	 ;
.L401:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r12	 ; tmp671, _386
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r12, %r8	 ; _386,
	leaq	.LC0(%rip), %rcx	 ;, tmp492
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp672, _387
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L272:
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	xorl	%r13d, %r13d	 ; _382
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp494
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp675
 ; D:\TC\src\parser.c:502:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L273	 ;
.L213:
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp397
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp587
 ; D:\TC\src\parser.c:383:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:384:             return NULL;
	jmp	.L198	 ;
.L218:
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp406
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp597
 ; D:\TC\src\parser.c:392:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:393:             return NULL;
	jmp	.L198	 ;
.L220:
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp411
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp600
 ; D:\TC\src\parser.c:397:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:398:             return NULL;
	jmp	.L198	 ;
.L253:
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp462
	movq	0(%rbp), %rcx	 ; token_282->lexeme, token_282->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:464:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp645
	je	.L256	 ;,
 ; D:\TC\src\parser.c:463:     Expression* increment = NULL;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L257	 ;
.L403:
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp525
 ; D:\TC\src\parser.c:325:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp704
 ; D:\TC\src\parser.c:324:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L194	 ;
.L396:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r13	 ; tmp635, _328
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r13, %r8	 ; _328,
	leaq	.LC0(%rip), %rcx	 ;, tmp454
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp636, _329
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L249:
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp456
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
 ; D:\TC\src\parser.c:455:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L250	 ;
.L398:
 ; D:\TC\src\parser.c:489:     parser->in_loop = false;
	movq	64(%rsp), %r12	 ; %sfp, initializer
	movb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:490:     return create_for(initializer, condition, increment, body);
	movq	%r15, %r9	 ; body,
	movq	%r13, %rdx	 ; condition,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%r12, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp663, _319
	jmp	.L242	 ;
.L263:
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp474
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp655
 ; D:\TC\src\parser.c:476:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:477:         return NULL;
	jmp	.L234	 ;
.L404:
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_466->type
	movq	88(%rsp), %r15	 ; %sfp, body
	jne	.L224	 ;,
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp423
	movq	0(%rbp), %rcx	 ; token_466->lexeme, token_466->lexeme
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:412:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp611
	je	.L224	 ;,
 ; D:\TC\src\parser.c:413:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:\TC\src\parser.c:414:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp612, token
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L227	 ;,
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp776
	movq	0(%rbp), %rcx	 ; token_204->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:415:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp614
	je	.L227	 ;,
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	 ;, tmp547
 ; D:\TC\src\parser.c:419:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp615, token
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L228	 ;
	.p2align 4,,10
	.p2align 3
.L229:
 ; D:\TC\src\parser.c:424:             list_append(else_body, (pointer)statement);
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:425:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp618, token
.L228:
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_215->type
	jne	.L230	 ;,
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_215->lexeme, token_215->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:420:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp619
	jne	.L224	 ;,
.L230:
 ; D:\TC\src\parser.c:421:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp616, statement
 ; D:\TC\src\parser.c:422:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L229	 ;,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp547,
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp617
 ; D:\TC\src\parser.c:423:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L229	 ;
.L394:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdi	 ; tmp698, _396
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _396,
	leaq	.LC0(%rip), %rcx	 ;, tmp520
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp699, _397
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L287	 ;
.L397:
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)],
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r14	 ; tmp646, _338
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r14, %r8	 ; _338,
	leaq	.LC0(%rip), %rcx	 ;, tmp465
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp647, _339
 ; D:\TC\src\parser.c:562:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L258:
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp467
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp650
 ; D:\TC\src\parser.c:467:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L259	 ;
.L407:
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp529
 ; D:\TC\src\parser.c:325:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp707
 ; D:\TC\src\parser.c:330:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L194	 ;
.L227:
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp426
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp613
 ; D:\TC\src\parser.c:416:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:417:             return NULL;
	jmp	.L198	 ;
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
	.ascii "Failed to import module '%s' from source '%s'\12\0"
	.align 8
.LC57:
	.ascii "Failed to parse import statement\0"
	.align 8
.LC58:
	.ascii "Expected function return type after 'func'\0"
.LC59:
	.ascii "Unknown function return type\0"
	.align 8
.LC60:
	.ascii "Expected function name after return type\0"
	.align 8
.LC61:
	.ascii "Expected '(' after function name\0"
	.align 8
.LC62:
	.ascii "Failed to parse function parameter\0"
	.align 8
.LC63:
	.ascii "Function parameters cannot have default values\0"
	.align 8
.LC64:
	.ascii "Expected ',' or ')' after function parameter\0"
	.align 8
.LC65:
	.ascii "Expected '{' to start function body\0"
	.align 8
.LC66:
	.ascii "Failed to parse function body statement\0"
	.align 8
.LC67:
	.ascii "Unreachable code after return statement\0"
	.align 8
.LC68:
	.ascii "Function missing return statement\0"
	.align 8
.LC69:
	.ascii "Failed to parse function declaration\0"
	.align 8
.LC70:
	.ascii "Expected class name after 'class'\0"
	.align 8
.LC71:
	.ascii "Expected '{' to start class body\0"
	.align 8
.LC72:
	.ascii "Expected method return type after 'method'\0"
	.align 8
.LC73:
	.ascii "Unknown return type for method\0"
	.align 8
.LC74:
	.ascii "Expected method name after return type\0"
	.align 8
.LC75:
	.ascii "Expected '(' after method name\0"
	.align 8
.LC76:
	.ascii "Expected 'self' as first parameter of method\0"
	.align 8
.LC77:
	.ascii "Expected ',' or ')' after method parameter\0"
	.align 8
.LC78:
	.ascii "Failed to parse method parameter\0"
	.align 8
.LC79:
	.ascii "Method parameters cannot have default values\0"
	.align 8
.LC80:
	.ascii "Expected '{' to start method body\0"
	.align 8
.LC82:
	.ascii "Failed to parse method body statement\0"
	.align 8
.LC83:
	.ascii "Method missing return statement\0"
.LC84:
	.ascii "Failed to parse class method\0"
	.align 8
.LC85:
	.ascii "Failed to parse class variable\0"
	.align 8
.LC86:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC87:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC88:
	.ascii "Constructor name conflicts with existing member\0"
	.align 8
.LC89:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC90:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movq	%r8, %r14	 ; tmp579, parser
	pushq	%r13	 ;
	movq	%rcx, %r13	 ; tmp577, lexer
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp578, now_scope
	subq	$152, %rsp	 ;,
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp548
 ; D:\TC\src\parser.c:21:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	je	.L578	 ;,
.L409:
 ; D:\TC\src\parser.c:29:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	je	.L579	 ;,
.L410:
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:32:     list(CodeMember*) members = create_list();
	movq	%rax, 72(%rsp)	 ; tmp586, %sfp
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:34:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r13, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:33:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rax, 64(%rsp)	 ; tmp587, %sfp
 ; D:\TC\src\parser.c:34:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %r11	 ; tmp588, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L501	 ;,
	movq	%r14, %r12	 ; parser, parser
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %r15	 ;, tmp576
	movq	%r13, %r14	 ; lexer, lexer
	jmp	.L411	 ;
	.p2align 4,,10
	.p2align 3
.L452:
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC90(%rip), %rcx	 ;, tmp546
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp715
 ; D:\TC\src\parser.c:52:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L423:
 ; D:\TC\src\parser.c:53:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r11	 ; tmp714, token
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L501	 ;,
.L411:
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	movl	24(%r11), %eax	 ; token_274->type, _39
 ; D:\TC\src\parser.c:35:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L501	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L452	 ;,
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp751
	movq	(%r11), %rcx	 ; token_274->lexeme, token_274->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; have_return
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movl	%eax, %esi	 ; tmp589, have_return
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jne	.L580	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_274->type
	jne	.L452	 ;,
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rax	 ;, tmp752
	movq	(%r11), %rcx	 ; token_274->lexeme, token_274->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp605
	jne	.L581	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	cmpl	$6, 24(%r11)	 ;, token_274->type
	jne	.L452	 ;,
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	(%r11), %rcx	 ; token_274->lexeme, token_274->lexeme
	movq	(%r15), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp643
	je	.L452	 ;,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:232:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 80(%rsp)	 ; tmp644, %sfp
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_216->type
 ; D:\TC\src\parser.c:233:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp645, token
 ; D:\TC\src\parser.c:234:     if (token->type != IDENTIFIER) {
	jne	.L582	 ;,
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	(%rax), %rcx	 ; token_216->lexeme, token_216->lexeme
	movq	80(%rsp), %r9	 ; %sfp,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:238:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class_scope);
	movq	%rax, 96(%rsp)	 ; tmp647, %sfp
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_222->type
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp648, token
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L456	 ;,
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp756
	movq	(%rbx), %rcx	 ; token_222->lexeme, token_222->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp650
	je	.L456	 ;,
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:245:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:244:     list(ClassMember*) members = create_list();
	movq	%rax, 88(%rsp)	 ; tmp651, %sfp
 ; D:\TC\src\parser.c:245:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rdi	 ;, tmp549
	movq	%rax, %r10	 ; tmp652, token
	movq	%r11, 112(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L457	 ;
	.p2align 4,,10
	.p2align 3
.L496:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_76
	je	.L583	 ;,
.L458:
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC87(%rip), %rcx	 ;, tmp533
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp704
 ; D:\TC\src\parser.c:262:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L492:
 ; D:\TC\src\parser.c:263:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r10	 ; tmp705, token
.L457:
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	 ; token_231->type, prephitmp_76
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, prephitmp_76
	jne	.L496	 ;,
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r10), %rcx	 ; token_231->lexeme, token_231->lexeme
	movq	(%rdi), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:246:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp706
	jne	.L497	 ;,
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movl	24(%r10), %eax	 ; token_231->type, prephitmp_76
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, prephitmp_76
	jne	.L458	 ;,
.L583:
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp758
	movq	(%r10), %rcx	 ; token_231->lexeme, token_231->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp653
	jne	.L584	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	 ;, token_231->type
	jne	.L458	 ;,
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp767
	movq	(%r10), %rcx	 ; token_231->lexeme, token_231->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:252:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp696
	je	.L458	 ;,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	%r12, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:253:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp697, token
 ; D:\TC\src\parser.c:254:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rsi	 ; tmp698, variable
 ; D:\TC\src\parser.c:255:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L585	 ;,
.L493:
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rsi, %r8	 ; variable,
	xorl	%edx, %edx	 ;
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	movq	%rax, %rdx	 ; tmp700, _248
 ; D:\TC\src\parser.c:257:             list_append(members, (pointer)create_class_member(CLASS_VARIABLE, NULL, variable));
	call	list_append	 ;
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_249->type
 ; D:\TC\src\parser.c:258:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp701, token
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L494	 ;,
.L495:
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC86(%rip), %rcx	 ;, tmp528
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp702
 ; D:\TC\src\parser.c:260:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L492	 ;
	.p2align 4,,10
	.p2align 3
.L501:
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:56: }
	addq	$152, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\parser.c:55:     return create_code(members, global_scope);
	jmp	create_code	 ;
	.p2align 4,,10
	.p2align 3
.L580:
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:\TC\src\parser.c:59:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp590, token
 ; D:\TC\src\parser.c:60:     if (token->type != IDENTIFIER) {
	jne	.L586	 ;,
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:64:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:65:     string source = NULL;
	xorl	%esi, %esi	 ; source
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:66:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp592, token
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	 ; token_106->type, _107
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _107
	je	.L587	 ;,
.L416:
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _107
	jne	.L420	 ;,
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp394
	movq	(%rbx), %rcx	 ; token_117->lexeme, token_117->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp598
	je	.L420	 ;,
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r12), %r9	 ; parser_74(D)->source_file,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movq	%rsi, %rdx	 ; source,
	call	parse_import_file	 ;
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; name
 ; D:\TC\src\parser.c:81:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	%rax, %rcx	 ; tmp599, name
 ; D:\TC\src\parser.c:82:     if (name == NULL) {
	je	.L588	 ;,
.L421:
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_import	 ;
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _132
 ; D:\TC\src\parser.c:86:     return create_import(name, source);
	movq	%rax, %rdx	 ; tmp602, _132
 ; D:\TC\src\parser.c:38:             if (import == NULL)
	je	.L415	 ;,
.L422:
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rdx	 ; tmp604, _22
 ; D:\TC\src\parser.c:40:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:36:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L423	 ;
	.p2align 4,,10
	.p2align 3
.L581:
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	64(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:90:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %rdi	 ; tmp606, function_scope
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:91:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp607, token
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L425	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	jne	.L428	 ;,
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_135->lexeme, token_135->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:92:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp609
	je	.L428	 ;,
.L425:
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_135->lexeme, token_135->lexeme
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	search_name	 ;
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:96:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 80(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:97:     if (return_type == NULL) {
	je	.L589	 ;,
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp612, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER) {
	jne	.L590	 ;,
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	(%rax), %rcx	 ; token_145->lexeme, token_145->lexeme
	movq	80(%rsp), %r8	 ; %sfp,
	movq	%rdi, %r9	 ; function_scope,
	movl	$1, %edx	 ;,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:106:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, function_scope);
	movq	%rax, 88(%rsp)	 ; tmp614, %sfp
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_151->type
 ; D:\TC\src\parser.c:107:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp615, token
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L432	 ;,
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp418
	movq	(%rbx), %rcx	 ; token_151->lexeme, token_151->lexeme
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:108:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp617
	je	.L432	 ;,
 ; D:\TC\src\parser.c:112:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 96(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp618, token
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	call	create_list	 ;
	movb	%sil, 104(%rsp)	 ; have_return, %sfp
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rbp	 ;, tmp562
 ; D:\TC\src\parser.c:113:     list(Variable*) parameters = create_list();
	movq	%rax, 56(%rsp)	 ; tmp619, %sfp
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp563
	movq	96(%rsp), %rsi	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L433:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_163->type
	je	.L591	 ;,
.L441:
 ; D:\TC\src\parser.c:115:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:116:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L592	 ;,
 ; D:\TC\src\parser.c:118:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_160->value
	je	.L436	 ;,
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp424
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp622
 ; D:\TC\src\parser.c:119:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L435:
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_167->type
 ; D:\TC\src\parser.c:122:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp623, token
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L437	 ;,
.L440:
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rsi, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp426
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp624
 ; D:\TC\src\parser.c:126:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L427:
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC69(%rip), %rcx	 ;, tmp452
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp641
 ; D:\TC\src\parser.c:44:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _211
.L451:
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rdx	 ; tmp642, _29
 ; D:\TC\src\parser.c:45:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:41:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L423	 ;
	.p2align 4,,10
	.p2align 3
.L456:
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp460
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp649
 ; D:\TC\src\parser.c:241:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L454:
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC89(%rip), %rcx	 ;, tmp544
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp712
 ; D:\TC\src\parser.c:49:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _273
.L500:
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	xorl	%edx, %edx	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	72(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	movq	%rax, %rdx	 ; tmp713, _36
 ; D:\TC\src\parser.c:50:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class_));
	call	list_append	 ;
 ; D:\TC\src\parser.c:46:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L423	 ;
	.p2align 4,,10
	.p2align 3
.L584:
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$2, %edx	 ;,
 ; D:\TC\src\parser.c:157:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, %rsi	 ; tmp654, method_scope
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp759
	movq	%rsi, %r9	 ; method_scope,
	movq	(%rax), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:158:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %r13	 ; tmp655, self
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
 ; D:\TC\src\parser.c:159:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp656, token
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_278->type, _279
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _279
	je	.L460	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _279
	jne	.L463	 ;,
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	0(%rbp), %rcx	 ; token_278->lexeme, token_278->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:160:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp658
	je	.L463	 ;,
.L460:
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	0(%rbp), %rdx	 ; token_278->lexeme, token_278->lexeme
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	search_name	 ;
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:164:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 104(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:165:     if (return_type == NULL) {
	je	.L593	 ;,
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_288->type
 ; D:\TC\src\parser.c:169:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp661, token
 ; D:\TC\src\parser.c:170:     if (token->type != IDENTIFIER) {
	jne	.L594	 ;,
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	(%rax), %rcx	 ; token_288->lexeme, token_288->lexeme
	movq	104(%rsp), %r8	 ; %sfp,
	movq	%rsi, %r9	 ; method_scope,
	movl	$1, %edx	 ;,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:174:     Symbol* name = create_symbol(token->lexeme, SYMBOL_SUBROUTINE, return_type, method_scope);
	movq	%rax, 128(%rsp)	 ; tmp663, %sfp
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_294->type
 ; D:\TC\src\parser.c:175:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp664, token
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L467	 ;,
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp480
	movq	0(%rbp), %rcx	 ; token_294->lexeme, token_294->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:176:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp666
	je	.L467	 ;,
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_301->type
 ; D:\TC\src\parser.c:180:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp667, token
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L468	 ;,
.L470:
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp484
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp668
 ; D:\TC\src\parser.c:182:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L469:
 ; D:\TC\src\parser.c:183:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 136(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp670, token
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:184:     list(Variable*) parameters = create_list();
	movq	%rax, %rbp	 ; tmp671, parameters
	movq	%rax, 120(%rsp)	 ; parameters, %sfp
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	leaq	.LC79(%rip), %r13	 ;, tmp570
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp672, _310
 ; D:\TC\src\parser.c:185:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
	movq	%rsi, 56(%rsp)	 ; method_scope, %sfp
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rbp	 ;, tmp569
	movq	136(%rsp), %rsi	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L471:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_311->type
	je	.L595	 ;,
.L576:
	movq	%rsi, %r10	 ; token, token
.L475:
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp492
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp676
 ; D:\TC\src\parser.c:191:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L579:
 ; D:\TC\src\parser.c:30:         now_scope = builtin_scope;
	movq	(%rsi), %rbx	 ; builtin_scope, now_scope
	jmp	.L410	 ;
	.p2align 4,,10
	.p2align 3
.L497:
 ; D:\TC\src\parser.c:265:     Symbol* constructor = search_name(class_scope, CONSTRUCTOR_NAME);
	movq	112(%rsp), %r11	 ; %sfp, token
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	.refptr.CONSTRUCTOR_NAME(%rip), %rbx	 ;, tmp537
	movq	%r11, 104(%rsp)	 ; token, %sfp
	movq	(%rbx), %rdx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	call	search_name	 ;
 ; D:\TC\src\parser.c:266:     if (constructor == NULL) {
	movq	56(%rsp), %r10	 ; %sfp, token
	movq	104(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; constructor
	je	.L596	 ;,
.L498:
 ; D:\TC\src\parser.c:270:     if (constructor->kind != SYMBOL_SUBROUTINE)
	cmpl	$1, 32(%rax)	 ;, constructor_268->kind
	movq	%r10, 56(%rsp)	 ; token, %sfp
	jne	.L597	 ;,
.L499:
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	80(%rsp), %r8	 ; %sfp,
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	movq	96(%rsp), %rcx	 ; %sfp,
	call	create_class	 ;
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	movq	56(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _273
 ; D:\TC\src\parser.c:272:     return create_class(name, members, class_scope);
	movq	%rax, %r9	 ; tmp711, _273
 ; D:\TC\src\parser.c:48:             if (class_ == NULL)
	jne	.L500	 ;,
	jmp	.L454	 ;
	.p2align 4,,10
	.p2align 3
.L494:
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp529
	movq	(%rbx), %rcx	 ; token_249->lexeme, token_249->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:259:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp703
	je	.L495	 ;,
	jmp	.L492	 ;
	.p2align 4,,10
	.p2align 3
.L582:
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp457
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp646
 ; D:\TC\src\parser.c:235:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L454	 ;
	.p2align 4,,10
	.p2align 3
.L586:
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp386
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp591
 ; D:\TC\src\parser.c:61:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
.L415:
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp403
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp603
 ; D:\TC\src\parser.c:39:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
	jmp	.L422	 ;
	.p2align 4,,10
	.p2align 3
.L597:
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 104(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC88(%rip), %rcx	 ;, tmp542
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp710
 ; D:\TC\src\parser.c:271:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
	jmp	.L499	 ;
	.p2align 4,,10
	.p2align 3
.L420:
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp393
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp597
 ; D:\TC\src\parser.c:77:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L415	 ;
	.p2align 4,,10
	.p2align 3
.L432:
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp417
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp616
 ; D:\TC\src\parser.c:109:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L427	 ;
	.p2align 4,,10
	.p2align 3
.L467:
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp479
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp665
 ; D:\TC\src\parser.c:177:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
.L462:
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC84(%rip), %rcx	 ;, tmp521
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp694
 ; D:\TC\src\parser.c:250:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _362
.L491:
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp695, _239
 ; D:\TC\src\parser.c:251:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:247:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L492	 ;
	.p2align 4,,10
	.p2align 3
.L591:
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_163->lexeme, token_163->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:114:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp628
	je	.L441	 ;,
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%rsi, 96(%rsp)	 ; token, %sfp
	movzbl	104(%rsp), %esi	 ; %sfp, have_return
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_184->type
 ; D:\TC\src\parser.c:130:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp629, token
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L443	 ;,
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp438
	movq	(%rbx), %rcx	 ; token_184->lexeme, token_184->lexeme
	movq	%r11, 96(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:131:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	96(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp631
	je	.L443	 ;,
	movq	%r11, 104(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:146:             have_return = true;
	movl	$1, %r13d	 ;, tmp559
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:136:     parser->in_function = true;
	movb	$1, 8(%r12)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:135:     list(Statement*) body = create_list();
	movq	%rax, 96(%rsp)	 ; tmp632, %sfp
 ; D:\TC\src\parser.c:138:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rbp	 ;, tmp549
	movq	%rax, %rbx	 ; tmp633, token
	movq	%r11, 112(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L444	 ;
	.p2align 4,,10
	.p2align 3
.L447:
 ; D:\TC\src\parser.c:146:             have_return = true;
	cmpl	$5, 8(%r9)	 ;, statement_193->type
	cmove	%r13d, %esi	 ; have_return,, tmp559, have_return
.L448:
 ; D:\TC\src\parser.c:147:         list_append(body, (pointer)statement);
	movq	96(%rsp), %rcx	 ; %sfp,
	movq	%r9, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:148:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp637, token
.L444:
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_196->type
	jne	.L449	 ;,
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_196->lexeme, token_196->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp638
	jne	.L598	 ;,
.L449:
 ; D:\TC\src\parser.c:140:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r9	 ; tmp634, statement
 ; D:\TC\src\parser.c:141:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L599	 ;,
 ; D:\TC\src\parser.c:143:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	je	.L447	 ;,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp636
 ; D:\TC\src\parser.c:144:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L447	 ;
	.p2align 4,,10
	.p2align 3
.L436:
 ; D:\TC\src\parser.c:121:             list_append(parameters, (pointer)parameter);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L437:
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_167->lexeme, token_167->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp625
	jne	.L600	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_167->type
	jne	.L440	 ;,
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_167->lexeme, token_167->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:125:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp627
	jne	.L433	 ;,
	jmp	.L440	 ;
	.p2align 4,,10
	.p2align 3
.L595:
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp763
	movq	(%rbx), %rcx	 ; token_311->lexeme, token_311->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:186:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp682
	jne	.L601	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_311->type
	jne	.L576	 ;,
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rbx), %rcx	 ; token_311->lexeme, token_311->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:187:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp673
	je	.L602	 ;,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r12, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:188:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp674, token
 ; D:\TC\src\parser.c:194:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:195:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L603	 ;,
 ; D:\TC\src\parser.c:197:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_317->value
	je	.L481	 ;,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp570,
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp680
 ; D:\TC\src\parser.c:198:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L480:
 ; D:\TC\src\parser.c:201:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp681, token
	jmp	.L471	 ;
	.p2align 4,,10
	.p2align 3
.L481:
 ; D:\TC\src\parser.c:200:             list_append(parameters, (pointer)parameter);
	movq	120(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L480	 ;
	.p2align 4,,10
	.p2align 3
.L592:
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp422
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp621
 ; D:\TC\src\parser.c:117:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L603:
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp497
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp679
 ; D:\TC\src\parser.c:196:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L480	 ;
	.p2align 4,,10
	.p2align 3
.L578:
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$5, %edx	 ;,
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp580, _2
 ; D:\TC\src\parser.c:22:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp358
	movq	(%rax), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp360
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:23:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp581, name_void
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp363
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp365
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:24:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp582, name_int
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp368
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp370
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:25:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp583, name_float
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp373
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp375
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp584, name_string
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp378
	movl	$5, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp380
	movq	%rax, (%rdx)	 ; tmp585, name_bool
	jmp	.L409	 ;
	.p2align 4,,10
	.p2align 3
.L428:
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp408
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp608
 ; D:\TC\src\parser.c:93:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L427	 ;
	.p2align 4,,10
	.p2align 3
.L463:
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp470
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp657
 ; D:\TC\src\parser.c:161:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L585:
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp526
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp699
 ; D:\TC\src\parser.c:256:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L493	 ;
	.p2align 4,,10
	.p2align 3
.L600:
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp626, token
 ; D:\TC\src\parser.c:124:             token = get_next_token(lexer, true);
	jmp	.L433	 ;
.L590:
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp414
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp613
 ; D:\TC\src\parser.c:103:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L427	 ;
.L594:
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp476
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp662
 ; D:\TC\src\parser.c:171:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L462	 ;
.L587:
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp387
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:67:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	56(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp593
	jne	.L417	 ;,
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rbx), %eax	 ; token_106->type, _107
	jmp	.L416	 ;
.L602:
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbx)	 ;, token_311->type
	movq	%rsi, %r10	 ; token, token
	movq	56(%rsp), %rsi	 ; %sfp, method_scope
	jne	.L475	 ;,
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp762
	movq	(%rbx), %rcx	 ; token_311->lexeme, token_311->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:189:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp677
	je	.L475	 ;,
.L483:
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_335->type
 ; D:\TC\src\parser.c:203:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp678, token
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L478	 ;,
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp764
	movq	(%rbx), %rcx	 ; token_335->lexeme, token_335->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:204:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp684
	je	.L478	 ;,
	movq	%r10, 136(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:211:     bool have_return = false;
	xorl	%ebp, %ebp	 ; have_return
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movl	$257, %edx	 ;,
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:209:     parser->in_function = true;
	movw	%dx, 8(%r12)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:208:     list(Statement*) body = create_list();
	movq	%rax, 56(%rsp)	 ; tmp685, %sfp
 ; D:\TC\src\parser.c:212:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp686, token
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L484	 ;
	.p2align 4,,10
	.p2align 3
.L487:
 ; D:\TC\src\parser.c:220:             have_return = true;
	cmpl	$5, 8(%r13)	 ;, statement_344->type
	movl	$1, %eax	 ;, tmp765
	cmove	%eax, %ebp	 ; have_return,, tmp765, have_return
.L488:
 ; D:\TC\src\parser.c:221:         list_append(body, (pointer)statement);
	movq	56(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:222:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp690, token
.L484:
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_347->type
	jne	.L489	 ;,
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%rdi), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_347->lexeme, token_347->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp691
	jne	.L604	 ;,
.L489:
 ; D:\TC\src\parser.c:214:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rsi, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp687, statement
 ; D:\TC\src\parser.c:215:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L605	 ;,
 ; D:\TC\src\parser.c:217:         else if (have_return)
	testb	%bpl, %bpl	 ; have_return
	je	.L487	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp689
 ; D:\TC\src\parser.c:218:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L487	 ;
.L596:
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	80(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	movq	(%rbx), %rcx	 ; CONSTRUCTOR_NAME, CONSTRUCTOR_NAME
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:267:         SymbolTable* constructor_scope = create_symbol_table(class_scope);
	movq	%rax, %r9	 ;, tmp708
 ; D:\TC\src\parser.c:268:         constructor = create_symbol(CONSTRUCTOR_NAME, SYMBOL_SUBROUTINE, name, constructor_scope);
	call	create_symbol	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L498	 ;
.L478:
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp504
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp683
 ; D:\TC\src\parser.c:205:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L605:
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp688
 ; D:\TC\src\parser.c:216:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L488	 ;
.L468:
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp761
	movq	0(%rbp), %rcx	 ; token_301->lexeme, token_301->lexeme
	movq	%r10, 56(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:181:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	56(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp669
	je	.L470	 ;,
	jmp	.L469	 ;
.L588:
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:83:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp399
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:\TC\src\parser.c:84:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp400
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$2, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	movq	%rax, %rcx	 ; tmp601, name
	jmp	.L421	 ;
.L604:
 ; D:\TC\src\parser.c:224:     parser->in_function = false;
	xorl	%eax, %eax	 ;
	movq	136(%rsp), %r10	 ; %sfp, token
	movw	%ax, 8(%r12)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	testb	%bpl, %bpl	 ; have_return
	jne	.L490	 ;,
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp517
 ; D:\TC\src\parser.c:226:     if (!have_return && return_type != name_void)
	movq	104(%rsp), %rdx	 ; %sfp, return_type
	cmpq	(%rax), %rdx	 ; name_void, return_type
	je	.L490	 ;,
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp519
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp692
 ; D:\TC\src\parser.c:227:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	136(%rsp), %r10	 ; %sfp, token
.L490:
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	104(%rsp), %rdx	 ; %sfp,
	movq	56(%rsp), %r9	 ; %sfp,
	movq	%rsi, 32(%rsp)	 ; method_scope,
	movq	120(%rsp), %r8	 ; %sfp,
	movq	128(%rsp), %rcx	 ; %sfp,
	movq	%r10, 136(%rsp)	 ; token, %sfp
	call	create_method	 ;
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	movq	136(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; _362
 ; D:\TC\src\parser.c:228:     return create_method(name, return_type, parameters, body, method_scope);
	movq	%rax, %rdx	 ; tmp693, _362
 ; D:\TC\src\parser.c:249:             if (method == NULL)
	jne	.L491	 ;,
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L589:
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp412
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp611
 ; D:\TC\src\parser.c:98:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L427	 ;
.L593:
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp474
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp660
 ; D:\TC\src\parser.c:166:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r10	 ; %sfp, token
	jmp	.L462	 ;
.L599:
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp635
 ; D:\TC\src\parser.c:142:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L448	 ;
.L417:
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	movq	56(%rsp), %r11	 ; %sfp, token
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:\TC\src\parser.c:68:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp594, token
 ; D:\TC\src\parser.c:69:         if (token->type != STRING) {
	jne	.L606	 ;,
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r11, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:73:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	56(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp596, token
 ; D:\TC\src\parser.c:76:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rax), %eax	 ; token_116->type, _107
	jmp	.L416	 ;
.L601:
	movq	%rsi, %r10	 ; token, token
	movq	56(%rsp), %rsi	 ; %sfp, method_scope
	jmp	.L483	 ;
.L443:
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp437
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp630
 ; D:\TC\src\parser.c:132:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L427	 ;
.L598:
 ; D:\TC\src\parser.c:150:     parser->in_function = false;
	movb	$0, 8(%r12)	 ;, parser_74(D)->in_function
	movq	112(%rsp), %r11	 ; %sfp, token
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L450	 ;,
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp448
 ; D:\TC\src\parser.c:151:     if (!have_return && return_type != name_void)
	movq	80(%rsp), %rsi	 ; %sfp, return_type
	cmpq	(%rax), %rsi	 ; name_void, return_type
	je	.L450	 ;,
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r11, 104(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp450
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
 ; D:\TC\src\parser.c:152:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r11	 ; %sfp, token
.L450:
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	56(%rsp), %r8	 ; %sfp,
	movq	96(%rsp), %r9	 ; %sfp,
	movq	%rdi, 32(%rsp)	 ; function_scope,
	movq	80(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r11, 104(%rsp)	 ; token, %sfp
	call	create_function	 ;
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	movq	104(%rsp), %r11	 ; %sfp, token
	testq	%rax, %rax	 ; _211
 ; D:\TC\src\parser.c:153:     return create_function(name, return_type, parameters, body, function_scope);
	movq	%rax, %r8	 ; tmp640, _211
 ; D:\TC\src\parser.c:43:             if (function == NULL)
	jne	.L451	 ;,
	jmp	.L427	 ;
	.p2align 4,,10
	.p2align 3
.L606:
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp391
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp595
 ; D:\TC\src\parser.c:70:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	56(%rsp), %r11	 ; %sfp, token
	jmp	.L415	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	peek_current_token;	.scl	2;	.type	32;	.endef
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.def	parser_error;	.scl	2;	.type	32;	.endef
	.def	create_primary;	.scl	2;	.type	32;	.endef
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.def	search_name;	.scl	2;	.type	32;	.endef
	.def	create_variable_access;	.scl	2;	.type	32;	.endef
	.def	peek_next_token;	.scl	2;	.type	32;	.endef
	.def	get_next_token;	.scl	2;	.type	32;	.endef
	.def	create_expression;	.scl	2;	.type	32;	.endef
	.def	create_list;	.scl	2;	.type	32;	.endef
	.def	list_append;	.scl	2;	.type	32;	.endef
	.def	string_to_operator;	.scl	2;	.type	32;	.endef
	.def	operator_precedence;	.scl	2;	.type	32;	.endef
	.def	is_builtin_type;	.scl	2;	.type	32;	.endef
	.def	create_symbol;	.scl	2;	.type	32;	.endef
	.def	create_variable;	.scl	2;	.type	32;	.endef
	.def	create_statement;	.scl	2;	.type	32;	.endef
	.def	create_else_if;	.scl	2;	.type	32;	.endef
	.def	create_if;	.scl	2;	.type	32;	.endef
	.def	create_while;	.scl	2;	.type	32;	.endef
	.def	create_for;	.scl	2;	.type	32;	.endef
	.def	create_symbol_table;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	create_class;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
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
	.section	.rdata$.refptr.CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.CONSTRUCTOR_NAME:
	.quad	CONSTRUCTOR_NAME
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

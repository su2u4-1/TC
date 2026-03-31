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
	movq	%rdx, %r12	 ; tmp336, now_scope
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp337, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp335, lexer
	subq	$88, %rsp	 ;,
 ; D:\TC\src\parser.c:694:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbp	 ; tmp338, token
 ; D:\TC\src\parser.c:700:     if (token->type == INTEGER) {
	movl	24(%rax), %eax	 ; token_62->type, _1
 ; D:\TC\src\parser.c:700:     if (token->type == INTEGER) {
	cmpl	$2, %eax	 ;, _1
	je	.L130	 ;,
 ; D:\TC\src\parser.c:703:     } else if (token->type == FLOAT) {
	cmpl	$3, %eax	 ;, _1
	je	.L131	 ;,
 ; D:\TC\src\parser.c:706:     } else if (token->type == STRING) {
	cmpl	$4, %eax	 ;, _1
	je	.L132	 ;,
 ; D:\TC\src\parser.c:709:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _1
	je	.L133	 ;,
.L6:
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, _1
	je	.L10	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, _1
	je	.L12	 ;,
.L13:
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC16(%rip), %rcx	 ;, tmp326
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp412
 ; D:\TC\src\parser.c:757:         parser_error("Unexpected token in primary expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:\TC\src\parser.c:705:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:704:         type = PRIM_FLOAT;
	movl	$1, %ebx	 ;, type
.L3:
 ; D:\TC\src\parser.c:762:     return create_primary(type, str_value, expr_value, prim_value, variable_value);
	movq	%r10, 32(%rsp)	 ; variable_value,
	movl	%ebx, %ecx	 ; type,
	call	create_primary	 ;
.L1:
 ; D:\TC\src\parser.c:763: }
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
.L130:
 ; D:\TC\src\parser.c:702:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:701:         type = PRIM_INTEGER;
	xorl	%ebx, %ebx	 ; type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L132:
 ; D:\TC\src\parser.c:708:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:707:         type = PRIM_STRING;
	movl	$2, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L133:
 ; D:\TC\src\parser.c:709:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	movq	.refptr.TRUE_KEYWORD(%rip), %rax	 ;, tmp233
	movq	0(%rbp), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; TRUE_KEYWORD, TRUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:709:     } else if (token->type == KEYWORD && string_equal(token->lexeme, TRUE_KEYWORD)) {
	testb	%al, %al	 ; tmp339
	jne	.L134	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movl	24(%rbp), %eax	 ; token_62->type, _6
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	cmpl	$6, %eax	 ;, _6
	jne	.L6	 ;,
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	movq	.refptr.FALSE_KEYWORD(%rip), %rax	 ;, tmp236
	movq	0(%rbp), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; FALSE_KEYWORD, FALSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:712:     } else if (token->type == KEYWORD && string_equal(token->lexeme, FALSE_KEYWORD)) {
	testb	%al, %al	 ; tmp340
	jne	.L9	 ;,
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movl	24(%rbp), %eax	 ; token_62->type, pretmp_53
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_53
	jne	.L23	 ;,
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9	 ;, tmp328
	movq	0(%rbp), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%r9), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:715:     } else if (token->type == SYMBOL && string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp341
	jne	.L135	 ;,
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movl	24(%rbp), %eax	 ; token_62->type, pretmp_53
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_53
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	movq	.refptr.NOT_SYMBOL(%rip), %rax	 ;, tmp251
	movq	0(%rbp), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; NOT_SYMBOL, NOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:730:     } else if (token->type == SYMBOL && string_equal(token->lexeme, NOT_SYMBOL)) {
	testb	%al, %al	 ; tmp352
	jne	.L136	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movl	24(%rbp), %eax	 ; token_62->type, pretmp_53
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	cmpl	$5, %eax	 ;, pretmp_53
	jne	.L23	 ;,
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	movq	.refptr.SUB_SYMBOL(%rip), %rax	 ;, tmp255
	movq	0(%rbp), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SUB_SYMBOL, SUB_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:739:     } else if (token->type == SYMBOL && string_equal(token->lexeme, SUB_SYMBOL)) {
	testb	%al, %al	 ; tmp356
	jne	.L24	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movl	24(%rbp), %eax	 ; token_62->type, pretmp_53
.L23:
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$1, %eax	 ;, pretmp_53
	je	.L12	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpl	$6, %eax	 ;, pretmp_53
	jne	.L13	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp259
	movq	0(%rbp), %rcx	 ; token_62->lexeme, token_62->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	testb	%al, %al	 ; tmp361
	je	.L13	 ;,
 ; D:\TC\src\parser.c:748:     } else if (token->type == IDENTIFIER || (token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD) && parser->in_method)) {
	cmpb	$0, 9(%rdi)	 ;, parser_71(D)->in_method
	je	.L13	 ;,
.L12:
 ; D:\TC\src\parser.c:766:     Token* token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rsi	 ; tmp360, token
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movl	24(%rax), %eax	 ; token_117->type, _118
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$1, %eax	 ;, _118
	je	.L27	 ;,
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	cmpl	$6, %eax	 ;, _118
	jne	.L30	 ;,
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	movq	.refptr.SELF_KEYWORD(%rip), %rax	 ;, tmp264
	movq	(%rsi), %rcx	 ; token_117->lexeme, token_117->lexeme
	movq	(%rax), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:767:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && string_equal(token->lexeme, SELF_KEYWORD))) {
	testb	%al, %al	 ; tmp363
	je	.L30	 ;,
.L27:
 ; D:\TC\src\parser.c:775:     base_name = search_name(now_scope, token->lexeme);
	movq	(%rsi), %rdx	 ; token_117->lexeme, token_117->lexeme
	movq	%r12, %rcx	 ; now_scope,
	call	search_name	 ;
 ; D:\TC\src\parser.c:776:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
 ; D:\TC\src\parser.c:775:     base_name = search_name(now_scope, token->lexeme);
	movq	%rax, %r15	 ; tmp364, base_name
 ; D:\TC\src\parser.c:776:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:777:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:776:     VariableAccess* base = create_variable_access(VAR_NAME, NULL, base_name, NULL, NULL);
	movq	%rax, 56(%rsp)	 ; variable_value, %sfp
 ; D:\TC\src\parser.c:777:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:778:     while (token->type == SYMBOL) {
	movq	56(%rsp), %r10	 ; %sfp, variable_value
	cmpl	$5, 24(%rax)	 ;, token_127->type
 ; D:\TC\src\parser.c:777:     token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp366, token
 ; D:\TC\src\parser.c:778:     while (token->type == SYMBOL) {
	jne	.L31	 ;,
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r9	 ;, tmp328
 ; D:\TC\src\parser.c:772:     Symbol* current_type = NULL;
	xorl	%esi, %esi	 ; class_name
 ; D:\TC\src\parser.c:774:     SymbolTable* var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	%r9, 64(%rsp)	 ; tmp328, %sfp
.L61:
 ; D:\TC\src\parser.c:779:         if (base_name != NULL) {
	testq	%r15, %r15	 ; base_name
	je	.L32	 ;,
 ; D:\TC\src\parser.c:781:             if (base_name->type != NULL)  // subroutine or variable or attribute or parameter
	movq	(%r15), %rsi	 ; base_name_283->type, class_name
 ; D:\TC\src\parser.c:780:             current_type = base_name;     // class or type
	testq	%rsi, %rsi	 ; class_name
	cmove	%r15, %rsi	 ; class_name,, base_name, class_name
.L32:
 ; D:\TC\src\parser.c:784:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	testq	%r13, %r13	 ; var_scope
	jne	.L33	 ;,
	testq	%rsi, %rsi	 ; class_name
	je	.L33	 ;,
 ; D:\TC\src\parser.c:784:         if (var_scope == NULL && current_type != NULL && current_type->kind == SYMBOL_CLASS)
	movl	32(%rsi), %r8d	 ; current_type_132->kind,
	testl	%r8d, %r8d	 ;
	jne	.L33	 ;,
 ; D:\TC\src\parser.c:785:             var_scope = current_type->ast_node.class->class_scope;
	movq	24(%rsi), %rax	 ; current_type_132->ast_node.class, current_type_132->ast_node.class
	movq	16(%rax), %r13	 ; _136->class_scope, var_scope
.L33:
 ; D:\TC\src\parser.c:786:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %rax	 ; %sfp, tmp328
	movq	(%r14), %rcx	 ; token_320->lexeme, token_320->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:786:         if (string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp367
	jne	.L137	 ;,
 ; D:\TC\src\parser.c:819:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	movq	.refptr.L_BRACKET_SYMBOL(%rip), %rax	 ;, tmp437
	movq	(%r14), %rcx	 ; token_320->lexeme, token_320->lexeme
	movq	(%rax), %rdx	 ; L_BRACKET_SYMBOL, L_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:819:         } else if (string_equal(token->lexeme, L_BRACKET_SYMBOL)) {
	testb	%al, %al	 ; tmp389
	je	.L50	 ;,
 ; D:\TC\src\parser.c:820:             token = get_next_token(lexer, true);  // consume '['
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:821:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:821:             token = get_next_token(lexer, true);
	movq	%rax, 72(%rsp)	 ; tmp390, %sfp
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp391, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L138	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%r12, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp394, _256
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r14	 ; tmp395, _257
 ; D:\TC\src\parser.c:823:             if (index == NULL)
	testq	%rax, %rax	 ; _257
	je	.L52	 ;,
.L53:
 ; D:\TC\src\parser.c:825:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_196->type
 ; D:\TC\src\parser.c:825:             token = get_next_token(lexer, true);
	movq	%rax, %r11	 ; tmp397, token
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	jne	.L55	 ;,
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	.refptr.R_BRACKET_SYMBOL(%rip), %rax	 ;, tmp438
	movq	(%r11), %rcx	 ; token_196->lexeme, token_196->lexeme
	movq	%r11, 72(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_BRACKET_SYMBOL, R_BRACKET_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:826:             if (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACKET_SYMBOL)) {
	movq	72(%rsp), %r11	 ; %sfp, token
	testb	%al, %al	 ; tmp399
	je	.L55	 ;,
 ; D:\TC\src\parser.c:831:             base = create_variable_access(VAR_GET_SEQ, base, NULL, index, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	movq	%r14, %r9	 ; _257,
	xorl	%r8d, %r8d	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp400, %sfp
.L49:
 ; D:\TC\src\parser.c:867:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:778:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;, token_233->type
 ; D:\TC\src\parser.c:867:         token = peek_next_token(lexer, true);
	movq	%rax, %r14	 ; tmp410, token
 ; D:\TC\src\parser.c:778:     while (token->type == SYMBOL) {
	je	.L61	 ;,
.L123:
	movq	56(%rsp), %r10	 ; %sfp, variable_value
.L31:
 ; D:\TC\src\parser.c:751:         if (variable_value == NULL) {
	testq	%r10, %r10	 ; variable_value
	je	.L29	 ;,
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:749:         type = PRIM_VARIABLE_ACCESS;
	movl	$8, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L50:
 ; D:\TC\src\parser.c:832:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	movq	.refptr.DOT_SYMBOL(%rip), %rax	 ;, tmp439
	movq	(%r14), %rcx	 ; token_320->lexeme, token_320->lexeme
	movq	(%rax), %rdx	 ; DOT_SYMBOL, DOT_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:832:         } else if (string_equal(token->lexeme, DOT_SYMBOL)) {
	testb	%al, %al	 ; tmp401
	je	.L123	 ;,
 ; D:\TC\src\parser.c:833:             token = get_next_token(lexer, true);  // consume '.'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:834:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r14	 ; tmp402, token
 ; D:\TC\src\parser.c:835:             if (var_scope == NULL) {
	testq	%r13, %r13	 ; var_scope
	je	.L139	 ;,
 ; D:\TC\src\parser.c:840:             if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_208->type
	jne	.L140	 ;,
 ; D:\TC\src\parser.c:845:             base_name = search_name(var_scope, token->lexeme);
	movq	(%rax), %rdx	 ; token_208->lexeme, token_208->lexeme
	movq	%r13, %rcx	 ; var_scope,
	call	search_name	 ;
	movq	%rax, %r15	 ; tmp405, base_name
 ; D:\TC\src\parser.c:846:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	je	.L141	 ;,
.L58:
 ; D:\TC\src\parser.c:862:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	%r15, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:864:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:863:             current_type = NULL;
	xorl	%esi, %esi	 ; class_name
 ; D:\TC\src\parser.c:862:             base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp409, %sfp
	jmp	.L49	 ;
	.p2align 4,,10
	.p2align 3
.L137:
 ; D:\TC\src\parser.c:787:             token = get_next_token(lexer, true);  // consume '('
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp368, token
 ; D:\TC\src\parser.c:788:             if (base_name == NULL)
	testq	%r15, %r15	 ; base_name
	je	.L142	 ;,
 ; D:\TC\src\parser.c:790:             else if (base_name->kind == SYMBOL_CLASS) {
	movl	32(%r15), %eax	 ; base_name_283->kind, _145
 ; D:\TC\src\parser.c:790:             else if (base_name->kind == SYMBOL_CLASS) {
	testl	%eax, %eax	 ; _145
	je	.L143	 ;,
.L37:
 ; D:\TC\src\parser.c:795:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	subl	$1, %eax	 ;, tmp282
	cmpl	$1, %eax	 ;, tmp282
	ja	.L144	 ;,
.L36:
 ; D:\TC\src\parser.c:797:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp374, token
 ; D:\TC\src\parser.c:798:             list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r13	 ;, tmp329
 ; D:\TC\src\parser.c:798:             list(Expression*) args = create_list();
	movq	%rax, %r14	 ; tmp375, args
	.p2align 4,,10
	.p2align 3
.L40:
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_164->type
	je	.L145	 ;,
.L48:
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp376, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L146	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	movq	%r12, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp379, _246
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rdx	 ; tmp380, _161
 ; D:\TC\src\parser.c:801:                 if (arg == NULL)
	testq	%rax, %rax	 ; _161
	je	.L42	 ;,
.L43:
 ; D:\TC\src\parser.c:803:                 list_append(args, (pointer)arg);
	movq	%r14, %rcx	 ; args,
	call	list_append	 ;
 ; D:\TC\src\parser.c:804:                 token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:\TC\src\parser.c:804:                 token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp382, token
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	je	.L44	 ;,
.L47:
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC9(%rip), %rcx	 ;, tmp290
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp383
 ; D:\TC\src\parser.c:808:                     parser_error("Expected ',' or ')' after function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L29:
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC15(%rip), %rcx	 ;, tmp324
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp411
 ; D:\TC\src\parser.c:752:             parser_error("Failed to parse variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
	.p2align 4,,10
	.p2align 3
.L145:
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_164->lexeme, token_164->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:799:             while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp387
	je	.L48	 ;,
 ; D:\TC\src\parser.c:813:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%r14, 32(%rsp)	 ; args,
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:814:             base_name = base_name->type;
	movq	(%r15), %r15	 ; base_name_184->type, base_name
 ; D:\TC\src\parser.c:813:             base = create_variable_access(VAR_FUNC_CALL, base, NULL, NULL, args);
	movq	%rax, 56(%rsp)	 ; tmp388, %sfp
 ; D:\TC\src\parser.c:817:             if (base_name->kind == SYMBOL_CLASS)
	movl	32(%r15), %ecx	 ; base_name_185->kind,
	testl	%ecx, %ecx	 ;
	jne	.L65	 ;,
 ; D:\TC\src\parser.c:818:                 var_scope = base_name->ast_node.class->class_scope;
	movq	24(%r15), %rax	 ; base_name_185->ast_node.class, base_name_185->ast_node.class
 ; D:\TC\src\parser.c:815:             current_type = NULL;
	xorl	%esi, %esi	 ; class_name
 ; D:\TC\src\parser.c:818:                 var_scope = base_name->ast_node.class->class_scope;
	movq	16(%rax), %r13	 ; _187->class_scope, var_scope
	jmp	.L49	 ;
	.p2align 4,,10
	.p2align 3
.L44:
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp436
	movq	(%rsi), %rcx	 ; token_165->lexeme, token_165->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:805:                 if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL))
	testb	%al, %al	 ; tmp384
	jne	.L147	 ;,
 ; D:\TC\src\parser.c:807:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rsi)	 ;, token_165->type
	jne	.L47	 ;,
 ; D:\TC\src\parser.c:807:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	0(%r13), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rsi), %rcx	 ; token_165->lexeme, token_165->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:807:                 else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp386
	jne	.L40	 ;,
	jmp	.L47	 ;
	.p2align 4,,10
	.p2align 3
.L146:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; MEM[(struct File * *)parser_71(D)], MEM[(struct File * *)parser_71(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, 72(%rsp)	 ; _251, %sfp
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	72(%rsp), %r8	 ; %sfp, _251
	leaq	.LC0(%rip), %rcx	 ;, tmp286
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp378, _252
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L42:
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC8(%rip), %rcx	 ;, tmp288
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp381
 ; D:\TC\src\parser.c:802:                     parser_error("Failed to parse function call argument", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _161
	jmp	.L43	 ;
	.p2align 4,,10
	.p2align 3
.L147:
 ; D:\TC\src\parser.c:806:                     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rsi	 ; tmp385, token
 ; D:\TC\src\parser.c:806:                     token = get_next_token(lexer, true);
	jmp	.L40	 ;
	.p2align 4,,10
	.p2align 3
.L141:
 ; D:\TC\src\parser.c:848:                 if (current_type != NULL) {
	testq	%rsi, %rsi	 ; class_name
	je	.L59	 ;,
 ; D:\TC\src\parser.c:849:                     if (current_type->kind == SYMBOL_CLASS)
	movl	32(%rsi), %edx	 ; current_type_132->kind,
	testl	%edx, %edx	 ;
	je	.L127	 ;,
 ; D:\TC\src\parser.c:851:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movq	(%rsi), %rsi	 ; current_type_132->type, class_name
 ; D:\TC\src\parser.c:851:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	testq	%rsi, %rsi	 ; class_name
	je	.L59	 ;,
 ; D:\TC\src\parser.c:851:                     else if (current_type->type != NULL && current_type->type->kind == SYMBOL_CLASS)
	movl	32(%rsi), %eax	 ; _221->kind,
	testl	%eax, %eax	 ;
	je	.L127	 ;,
 ; D:\TC\src\parser.c:847:                 string class_name = NULL;
	xorl	%esi, %esi	 ; class_name
	.p2align 4,,10
	.p2align 3
.L59:
 ; D:\TC\src\parser.c:854:                 string name = make_method_name(class_name, token->lexeme);
	movq	(%r14), %rdx	 ; token_208->lexeme, token_208->lexeme
	movq	%rsi, %rcx	 ; class_name,
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:855:                 base_name = search_name_use_strcmp(var_scope, name);
	movq	%r13, %rcx	 ; var_scope,
 ; D:\TC\src\parser.c:854:                 string name = make_method_name(class_name, token->lexeme);
	movq	%rax, %rdx	 ; tmp406, name
 ; D:\TC\src\parser.c:855:                 base_name = search_name_use_strcmp(var_scope, name);
	call	search_name_use_strcmp	 ;
	movq	%rax, %r15	 ; tmp407, base_name
 ; D:\TC\src\parser.c:857:             if (base_name == NULL) {
	testq	%rax, %rax	 ; base_name
	jne	.L58	 ;,
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC14(%rip), %rcx	 ;, tmp322
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp408
 ; D:\TC\src\parser.c:858:                 parser_error("Unknown attribute name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
	.p2align 4,,10
	.p2align 3
.L134:
 ; D:\TC\src\parser.c:711:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:710:         type = PRIM_TRUE;
	movl	$3, %ebx	 ;, type
 ; D:\TC\src\parser.c:711:         str_value = token->lexeme;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L9:
 ; D:\TC\src\parser.c:714:         str_value = token->lexeme;
	movq	0(%rbp), %rdx	 ; token_62->lexeme, str_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:713:         type = PRIM_FALSE;
	movl	$4, %ebx	 ;, type
 ; D:\TC\src\parser.c:714:         str_value = token->lexeme;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L144:
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC7(%rip), %rcx	 ;, tmp284
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp373
 ; D:\TC\src\parser.c:796:                 parser_error("Cannot call non-function variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L36	 ;
	.p2align 4,,10
	.p2align 3
.L143:
 ; D:\TC\src\parser.c:791:                 string name = make_method_name(base_name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp278
	movq	8(%r15), %rcx	 ; base_name_283->name, base_name_283->name
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
	movq	%rax, %rdx	 ; tmp370, name
 ; D:\TC\src\parser.c:792:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	24(%r15), %rax	 ; base_name_283->ast_node.class, base_name_283->ast_node.class
	movq	16(%rax), %rcx	 ; _149->class_scope, _150
	call	search_name_use_strcmp	 ;
 ; D:\TC\src\parser.c:793:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	movq	56(%rsp), %rdx	 ; %sfp,
	xorl	%r9d, %r9d	 ;
	movq	$0, 32(%rsp)	 ;,
	movq	%rax, %r8	 ; base_name,
	movl	$2, %ecx	 ;,
 ; D:\TC\src\parser.c:792:                 base_name = search_name_use_strcmp(base_name->ast_node.class->class_scope, name);
	movq	%rax, %r15	 ; tmp371, base_name
 ; D:\TC\src\parser.c:793:                 base = create_variable_access(VAR_GET_ATTR, base, base_name, NULL, NULL);
	call	create_variable_access	 ;
	movq	%rax, 56(%rsp)	 ; tmp372, %sfp
 ; D:\TC\src\parser.c:795:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	testq	%r15, %r15	 ; base_name
	je	.L36	 ;,
 ; D:\TC\src\parser.c:795:             if (base_name != NULL && base_name->kind != SYMBOL_FUNCTION && base_name->kind != SYMBOL_METHOD)
	movl	32(%r15), %eax	 ; base_name_151->kind, _145
	jmp	.L37	 ;
	.p2align 4,,10
	.p2align 3
.L30:
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC5(%rip), %rcx	 ;, tmp263
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp362
 ; D:\TC\src\parser.c:768:         parser_error("Expected variable name in variable access", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
	.p2align 4,,10
	.p2align 3
.L127:
 ; D:\TC\src\parser.c:852:                         class_name = current_type->type->name;
	movq	8(%rsi), %rsi	 ;, class_name
	jmp	.L59	 ;
.L138:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; MEM[(struct File * *)parser_71(D)], MEM[(struct File * *)parser_71(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r14	 ; tmp392, _261
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r14, %r8	 ; _261,
	leaq	.LC0(%rip), %rcx	 ;, tmp305
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp393, _262
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L52:
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	xorl	%r14d, %r14d	 ; _257
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	72(%rsp), %rdx	 ; %sfp,
	leaq	.LC10(%rip), %rcx	 ;, tmp307
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp396
 ; D:\TC\src\parser.c:824:                 parser_error("Failed to parse sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L53	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:\TC\src\parser.c:717:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:717:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp342, token
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp343, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L148	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rdi, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%r12, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp346, _109
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
 ; D:\TC\src\parser.c:719:         if (expr_value == NULL) {
	testq	%rax, %rax	 ; expr_value
	je	.L16	 ;,
 ; D:\TC\src\parser.c:724:         token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	movq	%rax, 56(%rsp)	 ; expr_value, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movl	24(%rax), %ebx	 ; token_75->type, type
 ; D:\TC\src\parser.c:724:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp349, token
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, %ebx	 ;, type
	jne	.L21	 ;,
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp248
	movq	(%rsi), %rcx	 ; token_75->lexeme, token_75->lexeme
	movq	%r8, 56(%rsp)	 ; expr_value, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:725:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp351
	je	.L21	 ;,
	movq	56(%rsp), %r8	 ; %sfp, expr_value
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:698:     Primary* prim_value = NULL;
	xorl	%r9d, %r9d	 ; prim_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L136:
 ; D:\TC\src\parser.c:732:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:733:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:732:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp353, token
 ; D:\TC\src\parser.c:733:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp354, prim_value
 ; D:\TC\src\parser.c:734:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L149	 ;,
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:731:         type = PRIM_NOT_OPERAND;
	movl	$6, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L24:
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:742:         prim_value = parse_primary(lexer, now_scope, parser);
	movq	%rdi, %r8	 ; parser,
	movq	%r12, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:741:         token = get_next_token(lexer, true);
	movq	%rax, %rsi	 ; tmp357, token
 ; D:\TC\src\parser.c:742:         prim_value = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r9	 ; tmp358, prim_value
 ; D:\TC\src\parser.c:743:         if (prim_value == NULL) {
	testq	%rax, %rax	 ; prim_value
	je	.L150	 ;,
 ; D:\TC\src\parser.c:699:     VariableAccess* variable_value = NULL;
	xorl	%r10d, %r10d	 ; variable_value
 ; D:\TC\src\parser.c:697:     Expression* expr_value = NULL;
	xorl	%r8d, %r8d	 ; expr_value
 ; D:\TC\src\parser.c:696:     string str_value = NULL;
	xorl	%edx, %edx	 ; str_value
 ; D:\TC\src\parser.c:740:         type = PRIM_NEG_OPERAND;
	movl	$7, %ebx	 ;, type
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L142:
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC6(%rip), %rcx	 ;, tmp277
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp369
 ; D:\TC\src\parser.c:789:                 parser_error("Cannot call undefined variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L36	 ;
.L21:
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC2(%rip), %rcx	 ;, tmp247
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp350
 ; D:\TC\src\parser.c:726:             parser_error("Expected ')' after expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
.L65:
 ; D:\TC\src\parser.c:816:             var_scope = NULL;
	xorl	%r13d, %r13d	 ; var_scope
 ; D:\TC\src\parser.c:815:             current_type = NULL;
	xorl	%esi, %esi	 ; class_name
	jmp	.L49	 ;
.L55:
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	movq	%r11, 56(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC11(%rip), %rcx	 ;, tmp309
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp398
 ; D:\TC\src\parser.c:827:                 parser_error("Expected ']' after sequence index", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L139:
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC12(%rip), %rcx	 ;, tmp317
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp403
 ; D:\TC\src\parser.c:836:                 parser_error("Cannot access attribute without a valid scope", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L140:
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%r14, %rdx	 ; token,
	leaq	.LC13(%rip), %rcx	 ;, tmp319
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp404
 ; D:\TC\src\parser.c:841:                 parser_error("Expected attribute name after '.'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L29	 ;
.L148:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; MEM[(struct File * *)parser_71(D)], MEM[(struct File * *)parser_71(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rbp	 ; tmp344, _114
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %r8	 ; _114,
	leaq	.LC0(%rip), %rcx	 ;, tmp243
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp345, _115
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L16:
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file, parser_71(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC1(%rip), %rcx	 ;, tmp245
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp348
 ; D:\TC\src\parser.c:720:             parser_error("Failed to parse parenthesized expression", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
.L150:
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC4(%rip), %rcx	 ;, tmp258
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp359
 ; D:\TC\src\parser.c:744:             parser_error("Failed to parse operand of unary '-'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
	xorl	%eax, %eax	 ; <retval>
	jmp	.L1	 ;
.L149:
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	(%rdi), %rcx	 ; parser_71(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rsi, %rdx	 ; token,
	leaq	.LC3(%rip), %rcx	 ;, tmp254
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp355
 ; D:\TC\src\parser.c:735:             parser_error("Failed to parse operand of unary '!'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:722:             return NULL;
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
 ; D:\TC\src\parser.c:645:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:642: static Expression* parse_expr_prec(Lexer* lexer, Expression* expr_left, int min_prec, SymbolTable* now_scope, Parser* parser) {
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp124, lexer
	subq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:645:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:646:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L152	 ;,
.L159:
 ; D:\TC\src\parser.c:647:         OperatorType op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_70->lexeme, token_70->lexeme
	call	string_to_operator	 ;
 ; D:\TC\src\parser.c:648:         int op_prec = operator_precedence(op);
	movl	%eax, %ecx	 ; op,
 ; D:\TC\src\parser.c:647:         OperatorType op = string_to_operator(token->lexeme);
	movl	%eax, %edi	 ; tmp129, op
 ; D:\TC\src\parser.c:648:         int op_prec = operator_precedence(op);
	call	operator_precedence	 ;
	movl	%eax, %esi	 ; tmp130, op_prec
 ; D:\TC\src\parser.c:649:         if (op == OP_NONE || op_prec < min_prec)
	cmpl	$19, %edi	 ;, op
	je	.L152	 ;,
	cmpl	%r14d, %eax	 ; min_prec, op_prec
	jl	.L152	 ;,
 ; D:\TC\src\parser.c:651:         token = get_next_token(lexer, true);  // consume operator
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:652:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:653:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	movq	160(%rsp), %r8	 ; parser,
	movq	%r13, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:652:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp131, token
 ; D:\TC\src\parser.c:653:         Primary* right_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp132, right_primary
 ; D:\TC\src\parser.c:654:         if (right_primary == NULL) {
	testq	%rax, %rax	 ; right_primary
	je	.L166	 ;,
 ; D:\TC\src\parser.c:659:         Expression* right = create_expression(OP_NONE, NULL, right_primary, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
	movq	%rax, %rbp	 ; tmp134, right
.L165:
 ; D:\TC\src\parser.c:660:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:661:         while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	jne	.L155	 ;,
 ; D:\TC\src\parser.c:662:             OperatorType next_op = string_to_operator(token->lexeme);
	movq	(%rax), %rcx	 ; token_69->lexeme, token_69->lexeme
	call	string_to_operator	 ;
	movl	%eax, %r15d	 ; tmp136, next_op
 ; D:\TC\src\parser.c:663:             int next_prec = operator_precedence(next_op);
	movl	%eax, %ecx	 ; next_op,
	call	operator_precedence	 ;
 ; D:\TC\src\parser.c:664:             if (next_op == OP_NONE || next_prec <= op_prec)
	cmpl	$19, %r15d	 ;, next_op
	je	.L155	 ;,
	cmpl	%eax, %esi	 ; next_prec, op_prec
	jge	.L155	 ;,
 ; D:\TC\src\parser.c:666:             right = parse_expr_prec(lexer, right, next_prec, now_scope, parser);
	movq	160(%rsp), %rdx	 ; parser, tmp144
	movq	%r13, %r9	 ; now_scope,
	movl	%eax, %r8d	 ; next_prec,
	movq	%rbx, %rcx	 ; lexer,
	movq	%rdx, 32(%rsp)	 ; tmp144,
	movq	%rbp, %rdx	 ; right,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp138, right
 ; D:\TC\src\parser.c:667:             if (right == NULL) {
	testq	%rax, %rax	 ; right
	jne	.L165	 ;,
 ; D:\TC\src\parser.c:657:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L151	 ;
	.p2align 4,,10
	.p2align 3
.L155:
 ; D:\TC\src\parser.c:673:         expr_left = create_expression(op, expr_left, NULL, right);
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; expr_left,
	movq	%rbp, %r9	 ; right,
	movl	%edi, %ecx	 ; op,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:674:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:673:         expr_left = create_expression(op, expr_left, NULL, right);
	movq	%rax, %r12	 ; tmp140, expr_left
 ; D:\TC\src\parser.c:674:         token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:646:     while (token->type == SYMBOL) {
	cmpl	$5, 24(%rax)	 ;,
	je	.L159	 ;,
.L152:
 ; D:\TC\src\parser.c:676:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
.L151:
 ; D:\TC\src\parser.c:679: }
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
.L166:
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	160(%rsp), %rax	 ; parser, tmp143
 ; D:\TC\src\parser.c:657:             return NULL;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	(%rax), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC17(%rip), %rcx	 ;, tmp117
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp133
 ; D:\TC\src\parser.c:655:             parser_error("Failed to parse right operand", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L151	 ;
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
 ; D:\TC\src\parser.c:363:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
	movq	%rax, %rbx	 ; tmp148, token
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_36->type, _1
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _1
	je	.L168	 ;,
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _1
	jne	.L171	 ;,
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_36->lexeme, token_36->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:364:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp150
	je	.L171	 ;,
.L168:
 ; D:\TC\src\parser.c:369:     Symbol* type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_36->lexeme, token_36->lexeme
	movq	%rbp, %rcx	 ; now_scope,
	call	search_name	 ;
	movq	%rax, %rdi	 ; tmp151, type
 ; D:\TC\src\parser.c:370:     if (type != NULL) {
	testq	%rax, %rax	 ; type
	je	.L172	 ;,
 ; D:\TC\src\parser.c:372:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	movl	32(%rax), %eax	 ; type_43->kind, _46
 ; D:\TC\src\parser.c:372:         if (type_ptr->kind != SYMBOL_TYPE && type_ptr->kind != SYMBOL_CLASS)
	cmpl	$6, %eax	 ;, _46
	je	.L173	 ;,
	testl	%eax, %eax	 ; _46
	jne	.L198	 ;,
.L173:
 ; D:\TC\src\parser.c:376:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:377:     if (token->type != IDENTIFIER)
	cmpl	$1, 24(%rax)	 ;, token_50->type
 ; D:\TC\src\parser.c:376:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp154, token
 ; D:\TC\src\parser.c:377:     if (token->type != IDENTIFIER)
	jne	.L199	 ;,
.L174:
 ; D:\TC\src\parser.c:379:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	(%rbx), %rcx	 ; token_50->lexeme, token_50->lexeme
	movq	%rbp, %r9	 ; now_scope,
	movq	%rdi, %r8	 ; type,
	movl	$3, %edx	 ;,
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:381:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:379:     Symbol* name = create_symbol(token->lexeme, SYMBOL_VARIABLE, type, now_scope);
	movq	%rax, %rbx	 ; tmp156, name
 ; D:\TC\src\parser.c:381:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:382:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_56->type
	je	.L200	 ;,
.L176:
 ; D:\TC\src\parser.c:380:     Expression* value = NULL;
	xorl	%r8d, %r8d	 ; value
.L180:
 ; D:\TC\src\parser.c:391: }
	addq	$56, %rsp	 ;,
 ; D:\TC\src\parser.c:390:     return create_variable(type, name, value);
	movq	%rbx, %rdx	 ; name,
	movq	%rdi, %rcx	 ; type,
 ; D:\TC\src\parser.c:391: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
 ; D:\TC\src\parser.c:390:     return create_variable(type, name, value);
	jmp	create_variable	 ;
	.p2align 4,,10
	.p2align 3
.L199:
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC21(%rip), %rcx	 ;, tmp135
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp155
 ; D:\TC\src\parser.c:378:         parser_error("Expected variable name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L174	 ;
	.p2align 4,,10
	.p2align 3
.L171:
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC18(%rip), %rcx	 ;, tmp123
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp149
 ; D:\TC\src\parser.c:365:         parser_error("Expected variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:391: }
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
.L198:
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC19(%rip), %rcx	 ;, tmp131
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp152
 ; D:\TC\src\parser.c:373:             parser_error("Expected a type for variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L173	 ;
	.p2align 4,,10
	.p2align 3
.L200:
 ; D:\TC\src\parser.c:382:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	movq	.refptr.ASSIGN_SYMBOL(%rip), %rdx	 ;, tmp137
	movq	(%rax), %rcx	 ; token_56->lexeme, token_56->lexeme
	movq	(%rdx), %rdx	 ; ASSIGN_SYMBOL, ASSIGN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:382:     if (token->type == SYMBOL && string_equal(token->lexeme, ASSIGN_SYMBOL)) {
	testb	%al, %al	 ; tmp158
	je	.L176	 ;,
 ; D:\TC\src\parser.c:383:         token = get_next_token(lexer, true);  // consume '='
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:384:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rsi, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%r12, %r8	 ; parser,
	movq	%rbp, %rdx	 ; now_scope,
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:384:         token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp159, token
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp160, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L201	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%r12, 32(%rsp)	 ; parser,
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %r9	 ; now_scope,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp163, _69
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r8	 ; tmp164, value
 ; D:\TC\src\parser.c:386:         if (value == NULL)
	testq	%rax, %rax	 ; value
	jne	.L180	 ;,
.L179:
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC22(%rip), %rcx	 ;, tmp143
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp165
 ; D:\TC\src\parser.c:387:             parser_error("Failed to parse variable initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L176	 ;
	.p2align 4,,10
	.p2align 3
.L172:
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; parser_38(D)->source_file, parser_38(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC20(%rip), %rcx	 ;, tmp133
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp153
 ; D:\TC\src\parser.c:375:         parser_error("Unknown variable type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L173	 ;
.L201:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%r12), %rcx	 ; MEM[(struct File * *)parser_38(D)], MEM[(struct File * *)parser_38(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rsi, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rbp	 ; tmp161, _74
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbp, %r8	 ; _74,
	leaq	.LC0(%rip), %rcx	 ;, tmp141
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp162, _75
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L179	 ;
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
 ; D:\TC\src\parser.c:395:     token = peek_current_token(lexer);
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:397:     if (token->type == KEYWORD) {
	cmpl	$6, 24(%rax)	 ;, token_60->type
	je	.L394	 ;,
.L203:
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rbp	 ; tmp715, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L395	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; left_primary,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp718, _411
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp719, left_primary
.L304:
 ; D:\TC\src\parser.c:431:         statement = create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, 32(%rsp)	 ; left_primary,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp720, <retval>
.L291:
 ; D:\TC\src\parser.c:432:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
	movq	%rax, %rdi	 ; tmp721, token
 ; D:\TC\src\parser.c:433:     if (statement == NULL)
	testq	%rbp, %rbp	 ; <retval>
	je	.L396	 ;,
.L305:
 ; D:\TC\src\parser.c:435:     token = get_next_token(lexer, true);
	movq	%rbx, %rcx	 ; lexer,
	movl	$1, %edx	 ;,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_110->type
 ; D:\TC\src\parser.c:435:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp723, token
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L306	 ;,
.L308:
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC52(%rip), %rcx	 ;, tmp536
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp724
 ; D:\TC\src\parser.c:437:         parser_error("Expected ';' after statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L202:
 ; D:\TC\src\parser.c:440: }
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
.L306:
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp537
	movq	(%rbx), %rcx	 ; token_110->lexeme, token_110->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:436:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp725
	je	.L308	 ;,
	jmp	.L202	 ;
	.p2align 4,,10
	.p2align 3
.L394:
	movq	%rax, %rbp	 ; tmp558, token
 ; D:\TC\src\parser.c:398:         if (string_equal(token->lexeme, IF_KEYWORD))
	movq	.refptr.IF_KEYWORD(%rip), %rax	 ;, tmp369
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; IF_KEYWORD, IF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:398:         if (string_equal(token->lexeme, IF_KEYWORD))
	testb	%al, %al	 ; tmp559
	jne	.L397	 ;,
 ; D:\TC\src\parser.c:400:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	movq	.refptr.FOR_KEYWORD(%rip), %rax	 ;, tmp432
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; FOR_KEYWORD, FOR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:400:         else if (string_equal(token->lexeme, FOR_KEYWORD))
	testb	%al, %al	 ; tmp621
	jne	.L398	 ;,
 ; D:\TC\src\parser.c:402:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	movq	.refptr.WHILE_KEYWORD(%rip), %rax	 ;, tmp483
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; WHILE_KEYWORD, WHILE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:402:         else if (string_equal(token->lexeme, WHILE_KEYWORD))
	testb	%al, %al	 ; tmp665
	jne	.L399	 ;,
 ; D:\TC\src\parser.c:404:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp510
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:404:         else if (string_equal(token->lexeme, VAR_KEYWORD)) {
	testb	%al, %al	 ; tmp690
	jne	.L400	 ;,
 ; D:\TC\src\parser.c:407:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	movq	.refptr.RETURN_KEYWORD(%rip), %rax	 ;, tmp513
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; RETURN_KEYWORD, RETURN_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:407:         } else if (string_equal(token->lexeme, RETURN_KEYWORD)) {
	testb	%al, %al	 ; tmp693
	je	.L292	 ;,
 ; D:\TC\src\parser.c:408:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:409:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_85->type
	je	.L401	 ;,
.L293:
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %rbp	 ; tmp697, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L402	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	movq	%rax, %r8	 ; left_primary,
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp700, _391
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %rbp	 ; tmp701, left_primary
.L295:
 ; D:\TC\src\parser.c:413:             statement = create_statement(RETURN_STATEMENT, NULL, NULL, NULL, parse_expression(lexer, now_scope, parser), NULL);
	movq	%rbp, 32(%rsp)	 ; left_primary,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp702, <retval>
	jmp	.L291	 ;
	.p2align 4,,10
	.p2align 3
.L398:
 ; D:\TC\src\parser.c:538:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_243->type
 ; D:\TC\src\parser.c:538:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp622, token
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L243	 ;,
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp437
	movq	0(%rbp), %rcx	 ; token_243->lexeme, token_243->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:539:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp624
	je	.L243	 ;,
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_250->type
 ; D:\TC\src\parser.c:544:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp625, token
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L244	 ;,
.L247:
 ; D:\TC\src\parser.c:547:         initializer = parse_variable(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
	movq	%rax, %r12	 ; tmp626, initializer
 ; D:\TC\src\parser.c:548:         if (initializer == NULL)
	testq	%rax, %rax	 ; initializer
	je	.L403	 ;,
.L246:
 ; D:\TC\src\parser.c:550:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp629, token
.L248:
 ; D:\TC\src\parser.c:552:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_259->type
	jne	.L251	 ;,
 ; D:\TC\src\parser.c:552:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %r14	 ;, tmp546
	movq	0(%rbp), %rcx	 ; token_259->lexeme, token_259->lexeme
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:552:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp631
	je	.L251	 ;,
 ; D:\TC\src\parser.c:557:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_266->type
 ; D:\TC\src\parser.c:557:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp632, token
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	je	.L252	 ;,
.L255:
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp633, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L404	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp637, _323
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp638, condition
 ; D:\TC\src\parser.c:561:         if (condition == NULL)
	testq	%rax, %rax	 ; condition
	je	.L257	 ;,
.L258:
 ; D:\TC\src\parser.c:563:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp640, token
.L256:
 ; D:\TC\src\parser.c:565:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_275->type
	jne	.L260	 ;,
 ; D:\TC\src\parser.c:565:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	0(%rbp), %rcx	 ; token_275->lexeme, token_275->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:565:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp642
	je	.L260	 ;,
 ; D:\TC\src\parser.c:570:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_282->type
 ; D:\TC\src\parser.c:570:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp643, token
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	je	.L261	 ;,
.L264:
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp644, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L405	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp648, _333
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, 56(%rsp)	 ; increment, %sfp
 ; D:\TC\src\parser.c:574:         if (increment == NULL)
	testq	%rax, %rax	 ; increment
	je	.L266	 ;,
.L267:
 ; D:\TC\src\parser.c:576:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp651, token
.L265:
 ; D:\TC\src\parser.c:578:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_291->type
	jne	.L269	 ;,
 ; D:\TC\src\parser.c:578:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp470
	movq	0(%rbp), %rcx	 ; token_291->lexeme, token_291->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:578:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp653
	je	.L269	 ;,
 ; D:\TC\src\parser.c:583:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_298->type
 ; D:\TC\src\parser.c:583:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp654, token
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L271	 ;,
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp475
	movq	0(%rbp), %rcx	 ; token_298->lexeme, token_298->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:584:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp656
	je	.L271	 ;,
 ; D:\TC\src\parser.c:589:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:590:     parser->in_loop = true;
	movb	$1, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:591:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:589:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp657, body
 ; D:\TC\src\parser.c:591:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r12, 64(%rsp)	 ; initializer, %sfp
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp543
	movq	%rax, %rbp	 ; tmp658, token
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L272	 ;
	.p2align 4,,10
	.p2align 3
.L273:
 ; D:\TC\src\parser.c:596:         list_append(body, (pointer)statement);
	movq	%r12, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:597:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp661, token
.L272:
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_310->type
	jne	.L274	 ;,
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_310->lexeme, token_310->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:592:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp662
	jne	.L406	 ;,
.L274:
 ; D:\TC\src\parser.c:593:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp659, statement
 ; D:\TC\src\parser.c:594:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L273	 ;,
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC43(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp660
 ; D:\TC\src\parser.c:595:             parser_error("Failed to parse for loop body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L273	 ;
	.p2align 4,,10
	.p2align 3
.L396:
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rdi, %rdx	 ; token,
	leaq	.LC51(%rip), %rcx	 ;, tmp534
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp722
 ; D:\TC\src\parser.c:434:         parser_error("Failed to parse statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L305	 ;
	.p2align 4,,10
	.p2align 3
.L397:
 ; D:\TC\src\parser.c:444:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_114->type
 ; D:\TC\src\parser.c:444:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp560, token
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L207	 ;,
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %r12	 ;, tmp544
	movq	(%rax), %rcx	 ; token_114->lexeme, token_114->lexeme
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:445:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp562
	je	.L207	 ;,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:450:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp563, token
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp564, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L407	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp567, _225
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, 72(%rsp)	 ; _226, %sfp
 ; D:\TC\src\parser.c:452:     if (condition == NULL)
	testq	%rax, %rax	 ; _226
	je	.L209	 ;,
.L210:
 ; D:\TC\src\parser.c:454:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_125->type
 ; D:\TC\src\parser.c:454:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp570, token
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L212	 ;,
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp771
	movq	0(%rbp), %rcx	 ; token_125->lexeme, token_125->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:455:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp572
	je	.L212	 ;,
 ; D:\TC\src\parser.c:460:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_132->type
 ; D:\TC\src\parser.c:460:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp573, token
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L214	 ;,
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp772
	movq	0(%rbp), %rcx	 ; token_132->lexeme, token_132->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:461:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp575
	je	.L214	 ;,
 ; D:\TC\src\parser.c:466:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:467:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:466:     list(Statement*) body = create_list();
	movq	%rax, %r15	 ; tmp576, body
 ; D:\TC\src\parser.c:467:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp543
	movq	%rax, %rbp	 ; tmp577, token
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L215	 ;
	.p2align 4,,10
	.p2align 3
.L216:
 ; D:\TC\src\parser.c:472:         list_append(body, (pointer)statement);
	movq	%r13, %rdx	 ; statement,
	movq	%r15, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:473:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp580, token
.L215:
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_144->type
	jne	.L217	 ;,
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_144->lexeme, token_144->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:468:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp581
	jne	.L408	 ;,
.L217:
 ; D:\TC\src\parser.c:469:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r13	 ; tmp578, statement
 ; D:\TC\src\parser.c:470:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L216	 ;,
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC27(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp579
 ; D:\TC\src\parser.c:471:             parser_error("Failed to parse if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L216	 ;
	.p2align 4,,10
	.p2align 3
.L207:
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC23(%rip), %rcx	 ;, tmp373
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp561
 ; D:\TC\src\parser.c:446:         parser_error("Expected '(' after 'if'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L206:
 ; D:\TC\src\parser.c:448:         return NULL;
	xorl	%edx, %edx	 ; _221
.L219:
 ; D:\TC\src\parser.c:399:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp620, <retval>
 ; D:\TC\src\parser.c:399:             return create_statement(IF_STATEMENT, parse_if(lexer, now_scope, parser), NULL, NULL, NULL, NULL);
	jmp	.L202	 ;
	.p2align 4,,10
	.p2align 3
.L395:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdi	 ; tmp716, _416
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _416,
	leaq	.LC0(%rip), %rcx	 ;, tmp532
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp717, _417
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L304	 ;
	.p2align 4,,10
	.p2align 3
.L399:
 ; D:\TC\src\parser.c:606:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_341->type
 ; D:\TC\src\parser.c:606:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp666, token
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L278	 ;,
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp488
	movq	0(%rbp), %rcx	 ; token_341->lexeme, token_341->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:607:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp668
	je	.L278	 ;,
 ; D:\TC\src\parser.c:612:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:612:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp669, token
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp670, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L409	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp673, _381
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r13	 ; tmp674, _382
 ; D:\TC\src\parser.c:614:     if (condition == NULL)
	testq	%rax, %rax	 ; _382
	je	.L280	 ;,
.L281:
 ; D:\TC\src\parser.c:616:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_352->type
 ; D:\TC\src\parser.c:616:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp676, token
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L284	 ;,
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp497
	movq	0(%rbp), %rcx	 ; token_352->lexeme, token_352->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:617:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp678
	je	.L284	 ;,
 ; D:\TC\src\parser.c:622:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_359->type
 ; D:\TC\src\parser.c:622:     token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp679, token
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L286	 ;,
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp502
	movq	0(%rbp), %rcx	 ; token_359->lexeme, token_359->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:623:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp681
	je	.L286	 ;,
 ; D:\TC\src\parser.c:628:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:629:     parser->in_loop = true;
	movb	$1, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:630:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:628:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp682, body
 ; D:\TC\src\parser.c:630:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r14	 ;, tmp543
	movq	%rax, %rbp	 ; tmp683, token
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L287	 ;
	.p2align 4,,10
	.p2align 3
.L288:
 ; D:\TC\src\parser.c:635:         list_append(body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:636:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp686, token
.L287:
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_371->type
	jne	.L289	 ;,
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_371->lexeme, token_371->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:631:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp687
	jne	.L410	 ;,
.L289:
 ; D:\TC\src\parser.c:632:         Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp684, statement
 ; D:\TC\src\parser.c:633:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L288	 ;,
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC48(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp685
 ; D:\TC\src\parser.c:634:             parser_error("Failed to parse while body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L288	 ;
	.p2align 4,,10
	.p2align 3
.L400:
 ; D:\TC\src\parser.c:405:             get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:406:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:406:             statement = create_statement(VARIABLE_STATEMENT, NULL, NULL, NULL, NULL, parse_variable(lexer, now_scope, parser));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 40(%rsp)	 ; tmp691,
	movl	$1, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp692, <retval>
	jmp	.L291	 ;
	.p2align 4,,10
	.p2align 3
.L212:
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC25(%rip), %rcx	 ;, tmp382
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp571
 ; D:\TC\src\parser.c:456:         parser_error("Expected ')' after if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:458:         return NULL;
	jmp	.L206	 ;
	.p2align 4,,10
	.p2align 3
.L243:
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC35(%rip), %rcx	 ;, tmp436
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp623
 ; D:\TC\src\parser.c:540:         parser_error("Expected '(' after 'for'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L242:
 ; D:\TC\src\parser.c:542:         return NULL;
	xorl	%r9d, %r9d	 ; _319
.L250:
 ; D:\TC\src\parser.c:401:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$4, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp664, <retval>
 ; D:\TC\src\parser.c:401:             return create_statement(FOR_STATEMENT, NULL, NULL, parse_for(lexer, now_scope, parser), NULL, NULL);
	jmp	.L202	 ;
	.p2align 4,,10
	.p2align 3
.L278:
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC44(%rip), %rcx	 ;, tmp487
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp667
 ; D:\TC\src\parser.c:608:         parser_error("Expected '(' after 'while'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L277:
 ; D:\TC\src\parser.c:610:         return NULL;
	xorl	%r8d, %r8d	 ; _377
.L283:
 ; D:\TC\src\parser.c:403:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	movq	$0, 40(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$3, %ecx	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp689, <retval>
 ; D:\TC\src\parser.c:403:             return create_statement(WHILE_STATEMENT, NULL, parse_while(lexer, now_scope, parser), NULL, NULL, NULL);
	jmp	.L202	 ;
.L407:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r13	 ; tmp565, _230
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r13, %r8	 ; _230,
	leaq	.LC0(%rip), %rcx	 ;, tmp378
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp566, _231
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L209:
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC24(%rip), %rcx	 ;, tmp380
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp569
 ; D:\TC\src\parser.c:453:         parser_error("Failed to parse if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	$0, 72(%rsp)	 ;, %sfp
	jmp	.L210	 ;
	.p2align 4,,10
	.p2align 3
.L292:
 ; D:\TC\src\parser.c:414:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	movq	.refptr.BREAK_KEYWORD(%rip), %rax	 ;, tmp521
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; BREAK_KEYWORD, BREAK_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:414:         } else if (string_equal(token->lexeme, BREAK_KEYWORD)) {
	testb	%al, %al	 ; tmp703
	je	.L296	 ;,
 ; D:\TC\src\parser.c:415:             if (!parser->in_loop) {
	cmpb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
	je	.L411	 ;,
 ; D:\TC\src\parser.c:420:             statement = create_statement(BREAK_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$6, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp705, <retval>
	jmp	.L291	 ;
	.p2align 4,,10
	.p2align 3
.L251:
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC37(%rip), %rcx	 ;, tmp446
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp630
 ; D:\TC\src\parser.c:553:         parser_error("Expected ';' after for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:555:         return NULL;
	jmp	.L242	 ;
.L214:
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC26(%rip), %rcx	 ;, tmp387
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp574
 ; D:\TC\src\parser.c:462:         parser_error("Expected '{' to start if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:464:         return NULL;
	jmp	.L206	 ;
.L408:
 ; D:\TC\src\parser.c:475:     list(ElseIf*) else_if = create_list();
	call	create_list	 ;
	movq	%rax, 64(%rsp)	 ; tmp582, %sfp
 ; D:\TC\src\parser.c:476:     list(Statement*) else_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:477:     token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:476:     list(Statement*) else_body = create_list();
	movq	%rax, 80(%rsp)	 ; tmp583, %sfp
 ; D:\TC\src\parser.c:477:     token = peek_next_token(lexer, true);
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:477:     token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp584, token
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	jne	.L232	 ;,
	movq	%r15, 88(%rsp)	 ; body, %sfp
	.p2align 4,,10
	.p2align 3
.L218:
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	movq	.refptr.ELIF_KEYWORD(%rip), %rax	 ;, tmp775
	movq	0(%rbp), %rcx	 ; token_466->lexeme, token_466->lexeme
	movq	(%rax), %rdx	 ; ELIF_KEYWORD, ELIF_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	testb	%al, %al	 ; tmp610
	je	.L412	 ;,
 ; D:\TC\src\parser.c:479:         token = get_next_token(lexer, true);  // consume 'elif'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:480:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_153->type
 ; D:\TC\src\parser.c:480:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp586, token
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L221	 ;,
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	movq	(%rax), %rcx	 ; token_153->lexeme, token_153->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:481:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp588
	je	.L221	 ;,
 ; D:\TC\src\parser.c:486:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:486:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp589, token
 ; D:\TC\src\parser.c:682:     Primary* left_primary = parse_primary(lexer, now_scope, parser);
	call	parse_primary	 ;
	movq	%rax, %r8	 ; tmp590, left_primary
 ; D:\TC\src\parser.c:683:     if (left_primary == NULL) {
	testq	%rax, %rax	 ; left_primary
	je	.L413	 ;,
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rsi, 32(%rsp)	 ; parser,
	movq	%rdi, %r9	 ; now_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rax, %rdx	 ; tmp593, _235
 ; D:\TC\src\parser.c:689:     return parse_expr_prec(lexer, create_expression(OP_NONE, NULL, left_primary, NULL), 0, now_scope, parser);
	movq	%rbx, %rcx	 ; lexer,
	call	parse_expr_prec	 ;
	movq	%rax, %r15	 ; tmp594, _236
 ; D:\TC\src\parser.c:488:         if (elif_condition == NULL)
	testq	%rax, %rax	 ; _236
	je	.L223	 ;,
.L224:
 ; D:\TC\src\parser.c:490:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_165->type
 ; D:\TC\src\parser.c:490:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp596, token
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	jne	.L226	 ;,
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp773
	movq	0(%rbp), %rcx	 ; token_165->lexeme, token_165->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:491:         if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp598
	je	.L226	 ;,
 ; D:\TC\src\parser.c:496:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_173->type
 ; D:\TC\src\parser.c:496:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp599, token
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L228	 ;,
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp774
	movq	0(%rbp), %rcx	 ; token_173->lexeme, token_173->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:497:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp601
	je	.L228	 ;,
 ; D:\TC\src\parser.c:502:         list(Statement*) elif_body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:503:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:502:         list(Statement*) elif_body = create_list();
	movq	%rax, %r13	 ; tmp602, elif_body
 ; D:\TC\src\parser.c:503:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%r15, 56(%rsp)	 ; _236, %sfp
	movq	%rax, %rbp	 ; tmp603, token
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L229	 ;
	.p2align 4,,10
	.p2align 3
.L230:
 ; D:\TC\src\parser.c:508:             list_append(elif_body, (pointer)statement);
	movq	%r15, %rdx	 ; statement,
	movq	%r13, %rcx	 ; elif_body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:509:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp606, token
.L229:
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_186->type
	jne	.L231	 ;,
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_186->lexeme, token_186->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:504:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp607
	jne	.L414	 ;,
.L231:
 ; D:\TC\src\parser.c:505:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r15	 ; tmp604, statement
 ; D:\TC\src\parser.c:506:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L230	 ;,
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC32(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp605
 ; D:\TC\src\parser.c:507:                 parser_error("Failed to parse else-if body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L230	 ;
	.p2align 4,,10
	.p2align 3
.L414:
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	56(%rsp), %r15	 ; %sfp, _236
	movq	%r13, %rdx	 ; elif_body,
	movq	%r15, %rcx	 ; _236,
	call	create_else_if	 ;
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	64(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	movq	%rax, %rdx	 ; tmp608, _192
 ; D:\TC\src\parser.c:511:         list_append(else_if, (pointer)create_else_if(elif_condition, elif_body));
	call	list_append	 ;
 ; D:\TC\src\parser.c:512:         token = peek_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	peek_next_token	 ;
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	cmpl	$6, 24(%rax)	 ;, token_193->type
 ; D:\TC\src\parser.c:512:         token = peek_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp609, token
 ; D:\TC\src\parser.c:478:     while (token->type == KEYWORD && string_equal(token->lexeme, ELIF_KEYWORD)) {
	je	.L218	 ;,
	movq	88(%rsp), %r15	 ; %sfp, body
.L232:
 ; D:\TC\src\parser.c:531:     token = peek_current_token(lexer);
	movq	%rbx, %rcx	 ; lexer,
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:533:     return create_if(condition, body, else_if, else_body);
	movq	80(%rsp), %r9	 ; %sfp,
	movq	64(%rsp), %r8	 ; %sfp,
	movq	%r15, %rdx	 ; body,
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_if	 ;
	movq	%rax, %rdx	 ; tmp585, _221
	jmp	.L219	 ;
.L413:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r13	 ; tmp591, _240
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r13, %r8	 ; _240,
	leaq	.LC0(%rip), %rcx	 ;, tmp402
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp592, _241
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L223:
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	xorl	%r15d, %r15d	 ; _236
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC29(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp595
 ; D:\TC\src\parser.c:489:             parser_error("Failed to parse else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L224	 ;
.L244:
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp440
	movq	0(%rbp), %rcx	 ; token_250->lexeme, token_250->lexeme
 ; D:\TC\src\parser.c:545:     Variable* initializer = NULL;
	xorl	%r12d, %r12d	 ; initializer
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:546:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp627
	jne	.L248	 ;,
	jmp	.L247	 ;
.L284:
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC46(%rip), %rcx	 ;, tmp496
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp677
 ; D:\TC\src\parser.c:618:         parser_error("Expected ')' after while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:620:         return NULL;
	jmp	.L277	 ;
.L260:
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC39(%rip), %rcx	 ;, tmp458
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp641
 ; D:\TC\src\parser.c:566:         parser_error("Expected ';' after for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:568:         return NULL;
	jmp	.L242	 ;
.L401:
 ; D:\TC\src\parser.c:409:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rdx	 ;, tmp516
	movq	(%rax), %rcx	 ; token_85->lexeme, token_85->lexeme
	movq	(%rdx), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:409:             if (token->type == SYMBOL && string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp695
	je	.L293	 ;,
 ; D:\TC\src\parser.c:411:                 return create_statement(RETURN_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$5, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp696, <retval>
	jmp	.L202	 ;
.L296:
 ; D:\TC\src\parser.c:421:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	movq	.refptr.CONTINUE_KEYWORD(%rip), %rax	 ;, tmp526
	movq	0(%rbp), %rcx	 ; token_60->lexeme, token_60->lexeme
	movq	(%rax), %rdx	 ; CONTINUE_KEYWORD, CONTINUE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:421:         } else if (string_equal(token->lexeme, CONTINUE_KEYWORD)) {
	testb	%al, %al	 ; tmp706
	je	.L203	 ;,
 ; D:\TC\src\parser.c:422:             if (!parser->in_loop) {
	cmpb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
	je	.L415	 ;,
 ; D:\TC\src\parser.c:427:             statement = create_statement(CONTINUE_STATEMENT, NULL, NULL, NULL, NULL, NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movl	$7, %ecx	 ;,
	movq	$0, 40(%rsp)	 ;,
	movq	$0, 32(%rsp)	 ;,
	call	create_statement	 ;
	movq	%rax, %rbp	 ; tmp708, <retval>
	jmp	.L291	 ;
.L252:
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	(%r14), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	movq	(%rax), %rcx	 ; token_266->lexeme, token_266->lexeme
 ; D:\TC\src\parser.c:558:     Expression* condition = NULL;
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	call	string_equal	 ;
 ; D:\TC\src\parser.c:559:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp634
	jne	.L256	 ;,
	jmp	.L255	 ;
.L286:
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC47(%rip), %rcx	 ;, tmp501
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp680
 ; D:\TC\src\parser.c:624:         parser_error("Expected '{' to start while body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:626:         return NULL;
	jmp	.L277	 ;
.L410:
 ; D:\TC\src\parser.c:638:     parser->in_loop = false;
	movb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:640:     return create_while(condition, body);
	movq	%r12, %rdx	 ; body,
	movq	%r13, %rcx	 ; _382,
	call	create_while	 ;
	movq	%rax, %r8	 ; tmp688, _377
	jmp	.L283	 ;
.L403:
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC36(%rip), %rcx	 ;, tmp444
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp628
 ; D:\TC\src\parser.c:549:             parser_error("Failed to parse for loop initializer", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L246	 ;
.L269:
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC41(%rip), %rcx	 ;, tmp469
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp652
 ; D:\TC\src\parser.c:579:         parser_error("Expected ')' after for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:581:         return NULL;
	jmp	.L242	 ;
.L409:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r12	 ; tmp671, _386
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r12, %r8	 ; _386,
	leaq	.LC0(%rip), %rcx	 ;, tmp492
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp672, _387
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L280:
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	xorl	%r13d, %r13d	 ; _382
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC45(%rip), %rcx	 ;, tmp494
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp675
 ; D:\TC\src\parser.c:615:         parser_error("Failed to parse while condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L281	 ;
.L221:
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC28(%rip), %rcx	 ;, tmp397
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp587
 ; D:\TC\src\parser.c:482:             parser_error("Expected '(' after 'elif'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:484:             return NULL;
	jmp	.L206	 ;
.L226:
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC30(%rip), %rcx	 ;, tmp406
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp597
 ; D:\TC\src\parser.c:492:             parser_error("Expected ')' after else-if condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:494:             return NULL;
	jmp	.L206	 ;
.L228:
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC31(%rip), %rcx	 ;, tmp411
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp600
 ; D:\TC\src\parser.c:498:             parser_error("Expected '{' to start else-if body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:500:             return NULL;
	jmp	.L206	 ;
.L261:
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp462
	movq	0(%rbp), %rcx	 ; token_282->lexeme, token_282->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:572:     if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp645
	je	.L264	 ;,
 ; D:\TC\src\parser.c:571:     Expression* increment = NULL;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L265	 ;
.L411:
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC49(%rip), %rcx	 ;, tmp525
 ; D:\TC\src\parser.c:418:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp704
 ; D:\TC\src\parser.c:416:                 parser_error("Cannot use 'break' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L202	 ;
.L404:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r13	 ; tmp635, _328
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r13, %r8	 ; _328,
	leaq	.LC0(%rip), %rcx	 ;, tmp454
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp636, _329
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L257:
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	xorl	%r13d, %r13d	 ; condition
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC38(%rip), %rcx	 ;, tmp456
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp639
 ; D:\TC\src\parser.c:562:             parser_error("Failed to parse for loop condition", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L258	 ;
.L406:
 ; D:\TC\src\parser.c:599:     parser->in_loop = false;
	movq	64(%rsp), %r12	 ; %sfp, initializer
	movb	$0, 10(%rsi)	 ;, parser_62(D)->in_loop
 ; D:\TC\src\parser.c:601:     return create_for(initializer, condition, increment, body);
	movq	%r15, %r9	 ; body,
	movq	%r13, %rdx	 ; condition,
	movq	56(%rsp), %r8	 ; %sfp,
	movq	%r12, %rcx	 ; initializer,
	call	create_for	 ;
	movq	%rax, %r9	 ; tmp663, _319
	jmp	.L250	 ;
.L271:
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC42(%rip), %rcx	 ;, tmp474
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp655
 ; D:\TC\src\parser.c:585:         parser_error("Expected '{' to start for loop body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:587:         return NULL;
	jmp	.L242	 ;
.L412:
 ; D:\TC\src\parser.c:514:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	cmpl	$6, 24(%rbp)	 ;, token_466->type
	movq	88(%rsp), %r15	 ; %sfp, body
	jne	.L232	 ;,
 ; D:\TC\src\parser.c:514:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	movq	.refptr.ELSE_KEYWORD(%rip), %rax	 ;, tmp423
	movq	0(%rbp), %rcx	 ; token_466->lexeme, token_466->lexeme
	movq	(%rax), %rdx	 ; ELSE_KEYWORD, ELSE_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:514:     if (token->type == KEYWORD && string_equal(token->lexeme, ELSE_KEYWORD)) {
	testb	%al, %al	 ; tmp611
	je	.L232	 ;,
 ; D:\TC\src\parser.c:515:         token = get_next_token(lexer, true);  // consume 'else'
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:516:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_204->type
 ; D:\TC\src\parser.c:516:         token = get_next_token(lexer, true);
	movq	%rax, %rbp	 ; tmp612, token
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L235	 ;,
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp776
	movq	0(%rbp), %rcx	 ; token_204->lexeme,
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL,
	call	string_equal	 ;
 ; D:\TC\src\parser.c:517:         if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp614
	je	.L235	 ;,
 ; D:\TC\src\parser.c:522:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	leaq	.LC34(%rip), %r13	 ;, tmp547
 ; D:\TC\src\parser.c:522:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp615, token
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L236	 ;
	.p2align 4,,10
	.p2align 3
.L237:
 ; D:\TC\src\parser.c:527:             list_append(else_body, (pointer)statement);
	movq	80(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:528:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%rbx, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbp	 ; tmp618, token
.L236:
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbp)	 ;, token_215->type
	jne	.L238	 ;,
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r14), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%rbp), %rcx	 ; token_215->lexeme, token_215->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:523:         while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp619
	jne	.L232	 ;,
.L238:
 ; D:\TC\src\parser.c:524:             Statement* statement = parse_statement(lexer, now_scope, parser);
	movq	%rsi, %r8	 ; parser,
	movq	%rdi, %rdx	 ; now_scope,
	movq	%rbx, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r12	 ; tmp616, statement
 ; D:\TC\src\parser.c:525:             if (statement == NULL)
	testq	%rax, %rax	 ; statement
	jne	.L237	 ;,
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	movq	%r13, %rcx	 ; tmp547,
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp617
 ; D:\TC\src\parser.c:526:                 parser_error("Failed to parse else body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L237	 ;
.L402:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)], MEM[(struct File * *)parser_62(D)]
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdi	 ; tmp698, _396
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rdi, %r8	 ; _396,
	leaq	.LC0(%rip), %rcx	 ;, tmp520
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp699, _397
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L295	 ;
.L405:
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; MEM[(struct File * *)parser_62(D)],
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rbx, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %r14	 ; tmp646, _338
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	peek_current_token	 ;
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%r14, %r8	 ; _338,
	leaq	.LC0(%rip), %rcx	 ;, tmp465
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	movq	%rax, %rdx	 ; tmp647, _339
 ; D:\TC\src\parser.c:684:         parser_error("Failed to parse expression primary", peek_current_token(lexer), get_full_path(parser->source_file));
	call	parser_error	 ;
.L266:
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file, parser_62(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC40(%rip), %rcx	 ;, tmp467
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp650
 ; D:\TC\src\parser.c:575:             parser_error("Failed to parse for loop increment", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	$0, 56(%rsp)	 ;, %sfp
	jmp	.L267	 ;
.L415:
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC50(%rip), %rcx	 ;, tmp529
 ; D:\TC\src\parser.c:418:                 return NULL;
	xorl	%ebp, %ebp	 ; <retval>
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp707
 ; D:\TC\src\parser.c:423:                 parser_error("Cannot use 'continue' outside of a loop", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L202	 ;
.L235:
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	(%rsi), %rcx	 ; parser_62(D)->source_file,
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rbp, %rdx	 ; token,
	leaq	.LC33(%rip), %rcx	 ;, tmp426
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp613
 ; D:\TC\src\parser.c:518:             parser_error("Expected '{' to start else body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
 ; D:\TC\src\parser.c:520:             return NULL;
	jmp	.L206	 ;
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
	.ascii "[warning] Unsupported type for class variable '%s': %s\12\0"
	.align 8
.LC87:
	.ascii "Expected ';' after class variable declaration\0"
	.align 8
.LC88:
	.ascii "Unexpected token in class member\0"
	.align 8
.LC89:
	.ascii "Constructor name conflicts with existing member\0"
.LC90:
	.ascii "0\0"
	.align 8
.LC91:
	.ascii "Failed to parse class declaration\0"
	.align 8
.LC92:
	.ascii "Unexpected token in code member\0"
	.text
	.p2align 4
	.globl	parse_code
	.def	parse_code;	.scl	2;	.type	32;	.endef
parse_code:
	pushq	%r15	 ;
	pushq	%r14	 ;
	movq	%rcx, %r14	 ; tmp694, lexer
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%r8, %rdi	 ; tmp696, parser
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rdx, %rbx	 ; tmp695, now_scope
	subq	$184, %rsp	 ;,
 ; D:\TC\src\parser.c:24:     if (builtin_scope == NULL) {
	movq	.refptr.builtin_scope(%rip), %rsi	 ;, tmp665
 ; D:\TC\src\parser.c:24:     if (builtin_scope == NULL) {
	cmpq	$0, (%rsi)	 ;, builtin_scope
	je	.L608	 ;,
.L417:
 ; D:\TC\src\parser.c:32:     if (now_scope == NULL)
	testq	%rbx, %rbx	 ; now_scope
	je	.L609	 ;,
.L418:
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rbx, %rcx	 ; now_scope,
 ; D:\TC\src\parser.c:35:     list(CodeMember*) members = create_list();
	movq	%rax, 80(%rsp)	 ; tmp703, %sfp
 ; D:\TC\src\parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:37:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:36:     SymbolTable* global_scope = create_symbol_table(now_scope);
	movq	%rax, 72(%rsp)	 ; tmp704, %sfp
 ; D:\TC\src\parser.c:37:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L527	 ;,
	movq	%rdi, %r15	 ; parser, parser
	jmp	.L419	 ;
	.p2align 4,,10
	.p2align 3
.L460:
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC92(%rip), %rcx	 ;, tmp663
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp882
 ; D:\TC\src\parser.c:55:             parser_error("Unexpected token in code member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L431:
 ; D:\TC\src\parser.c:56:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, 56(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testq	%rax, %rax	 ; token
	je	.L527	 ;,
.L419:
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	movq	56(%rsp), %rax	 ; %sfp, token
	movl	24(%rax), %eax	 ; token_363->type, _39
 ; D:\TC\src\parser.c:38:     while (token != NULL && token->type != EOF_TOKEN) {
	testl	%eax, %eax	 ; _39
	je	.L527	 ;,
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	cmpl	$6, %eax	 ;, _39
	jne	.L460	 ;,
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	movq	.refptr.IMPORT_KEYWORD(%rip), %rax	 ;, tmp936
	movq	(%rax), %rdx	 ; IMPORT_KEYWORD, IMPORT_KEYWORD
	movq	56(%rsp), %rax	 ; %sfp, token
	movq	(%rax), %rcx	 ; token_363->lexeme, token_363->lexeme
	call	string_equal	 ;
	movl	%eax, %esi	 ; tmp706, have_return
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	testb	%al, %al	 ; have_return
	jne	.L610	 ;,
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	56(%rsp), %rax	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_363->type
	jne	.L460	 ;,
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	movq	.refptr.FUNC_KEYWORD(%rip), %rdi	 ;, tmp939
	movq	(%rax), %rcx	 ; token_363->lexeme, token_363->lexeme
	movq	(%rdi), %rdx	 ; FUNC_KEYWORD, FUNC_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	testb	%al, %al	 ; tmp722
	jne	.L611	 ;,
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	56(%rsp), %rax	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_363->type
	jne	.L460	 ;,
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	movq	.refptr.CLASS_KEYWORD(%rip), %rsi	 ;, tmp944
	movq	(%rax), %rcx	 ; token_363->lexeme, token_363->lexeme
	movq	(%rsi), %rdx	 ; CLASS_KEYWORD, CLASS_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	testb	%al, %al	 ; tmp761
	je	.L460	 ;,
 ; D:\TC\src\parser.c:261:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:262:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:261:     SymbolTable* class_scope = create_symbol_table(now_scope);
	movq	%rax, 88(%rsp)	 ; tmp762, %sfp
 ; D:\TC\src\parser.c:262:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:263:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_217->type
 ; D:\TC\src\parser.c:262:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp763, token
 ; D:\TC\src\parser.c:263:     if (token->type != IDENTIFIER) {
	jne	.L612	 ;,
 ; D:\TC\src\parser.c:268:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:270:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	(%rbx), %rcx	 ; token_217->lexeme, token_217->lexeme
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\parser.c:268:     Class* class = (Class*)alloc_memory(sizeof(Class));
	movq	%rax, %r9	 ; tmp765, class
	movq	%rax, 112(%rsp)	 ; class, %sfp
 ; D:\TC\src\parser.c:269:     class->class_scope = class_scope;
	movq	88(%rsp), %rax	 ; %sfp, class_scope
	movq	%rax, 16(%r9)	 ; class_scope, class_221->class_scope
 ; D:\TC\src\parser.c:270:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:271:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:270:     Symbol* name = create_symbol(token->lexeme, SYMBOL_CLASS, NULL, class);
	movq	%rax, 96(%rsp)	 ; tmp766, %sfp
 ; D:\TC\src\parser.c:271:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_224->type
 ; D:\TC\src\parser.c:271:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp767, token
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L464	 ;,
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp948
	movq	(%rbx), %rcx	 ; token_224->lexeme, token_224->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:272:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp769
	je	.L464	 ;,
 ; D:\TC\src\parser.c:277:     list(ClassMember*) members = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:278:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	leaq	.LC88(%rip), %rsi	 ;, tmp688
 ; D:\TC\src\parser.c:277:     list(ClassMember*) members = create_list();
	movq	%rax, 104(%rsp)	 ; tmp770, %sfp
 ; D:\TC\src\parser.c:278:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	.refptr.R_BRACE_SYMBOL(%rip), %r12	 ;, tmp667
 ; D:\TC\src\parser.c:279:     size_t size = 0;
	movq	$0, 120(%rsp)	 ;, %sfp
	movq	.refptr.SELF_KEYWORD(%rip), %rdi	 ;, tmp664
 ; D:\TC\src\parser.c:278:     token = get_next_token(lexer, true);
	movq	%rax, %r10	 ; tmp771, token
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L465	 ;
	.p2align 4,,10
	.p2align 3
.L513:
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _279
	je	.L613	 ;,
.L466:
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %rcx	 ; tmp688,
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp826
 ; D:\TC\src\parser.c:308:             parser_error("Unexpected token in class member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L510:
 ; D:\TC\src\parser.c:309:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r10	 ; tmp827, token
.L465:
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movl	24(%r10), %eax	 ; token_233->type, _279
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, %eax	 ;, _279
	jne	.L513	 ;,
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r10), %rcx	 ; token_233->lexeme, token_233->lexeme
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:280:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp828
	jne	.L514	 ;,
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movl	24(%r10), %eax	 ; token_233->type, _279
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	cmpl	$6, %eax	 ;, _279
	jne	.L466	 ;,
.L613:
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	.refptr.METHOD_KEYWORD(%rip), %rax	 ;, tmp950
	movq	(%r10), %rcx	 ; token_233->lexeme, token_233->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; METHOD_KEYWORD, METHOD_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp772
	jne	.L614	 ;,
 ; D:\TC\src\parser.c:286:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	cmpl	$6, 24(%r10)	 ;, token_233->type
	jne	.L466	 ;,
 ; D:\TC\src\parser.c:286:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	.refptr.VAR_KEYWORD(%rip), %rax	 ;, tmp961
	movq	(%r10), %rcx	 ; token_233->lexeme, token_233->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; VAR_KEYWORD, VAR_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:286:         } else if (token->type == KEYWORD && string_equal(token->lexeme, VAR_KEYWORD)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp817
	je	.L466	 ;,
 ; D:\TC\src\parser.c:287:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:288:             Variable* variable = parse_variable(lexer, class_scope, parser);
	movq	88(%rsp), %rdx	 ; %sfp,
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:287:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp818, token
 ; D:\TC\src\parser.c:288:             Variable* variable = parse_variable(lexer, class_scope, parser);
	call	parse_variable	 ;
	movq	%rax, %rbp	 ; tmp819, variable
 ; D:\TC\src\parser.c:289:             if (variable == NULL)
	testq	%rax, %rax	 ; variable
	je	.L615	 ;,
.L501:
 ; D:\TC\src\parser.c:291:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	xorl	%edx, %edx	 ;
	movq	%rbp, %r8	 ; variable,
	movl	$1, %ecx	 ;,
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:292:             list_append(members, (pointer)member);
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:291:             ClassMember* member = create_class_member(CLASS_VARIABLE, NULL, variable);
	movq	%rax, %rbx	 ; tmp821, member
 ; D:\TC\src\parser.c:292:             list_append(members, (pointer)member);
	movq	%rax, %rdx	 ; member,
	call	list_append	 ;
 ; D:\TC\src\parser.c:293:             if (member->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rbx)	 ;, member_250->type
	je	.L616	 ;,
.L505:
 ; D:\TC\src\parser.c:304:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	cmpl	$5, 24(%rax)	 ;, token_269->type
 ; D:\TC\src\parser.c:304:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp823, token
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	je	.L509	 ;,
.L511:
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC87(%rip), %rcx	 ;, tmp622
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp824
 ; D:\TC\src\parser.c:306:                 parser_error("Expected ';' after class variable declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L510	 ;
	.p2align 4,,10
	.p2align 3
.L527:
 ; D:\TC\src\parser.c:59:     return create_code(members, global_scope);
	movq	72(%rsp), %rdx	 ; %sfp,
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:60: }
	addq	$184, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
 ; D:\TC\src\parser.c:59:     return create_code(members, global_scope);
	jmp	create_code	 ;
	.p2align 4,,10
	.p2align 3
.L610:
 ; D:\TC\src\parser.c:64:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:65:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_101->type
 ; D:\TC\src\parser.c:64:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp707, token
 ; D:\TC\src\parser.c:65:     if (token->type != IDENTIFIER) {
	jne	.L617	 ;,
 ; D:\TC\src\parser.c:72:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:70:     string import_name = token->lexeme;
	movq	(%rax), %rdi	 ; token_101->lexeme, import_name
 ; D:\TC\src\parser.c:71:     string source = NULL;
	xorl	%esi, %esi	 ; source
 ; D:\TC\src\parser.c:72:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp709, token
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movl	24(%rax), %eax	 ; token_106->type, _107
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	cmpl	$6, %eax	 ;, _107
	je	.L618	 ;,
.L424:
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	cmpl	$5, %eax	 ;, _107
	jne	.L428	 ;,
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp479
	movq	(%rbx), %rcx	 ; token_117->lexeme, token_117->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	testb	%al, %al	 ; tmp715
	je	.L428	 ;,
 ; D:\TC\src\parser.c:89:     name = parse_import_file(import_name, source, now_scope, parser->source_file);
	movq	(%r15), %r9	 ; parser_74(D)->source_file,
	movq	72(%rsp), %r8	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movq	%rsi, %rdx	 ; source,
	call	parse_import_file	 ;
	movq	%rax, %rcx	 ; tmp716, name
 ; D:\TC\src\parser.c:90:     if (name == NULL) {
	testq	%rax, %rax	 ; name
	je	.L619	 ;,
.L429:
 ; D:\TC\src\parser.c:95:     return create_import(name, source);
	movq	%rsi, %rdx	 ; source,
	call	create_import	 ;
	movq	%rax, %rdx	 ; tmp719, _132
 ; D:\TC\src\parser.c:41:             if (import == NULL)
	testq	%rax, %rax	 ; _132
	je	.L423	 ;,
.L430:
 ; D:\TC\src\parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	movq	%rax, %rdx	 ; tmp721, _22
 ; D:\TC\src\parser.c:43:             list_append(members, (pointer)create_code_member(CODE_IMPORT, import, NULL, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:39:         if (token->type == KEYWORD && string_equal(token->lexeme, IMPORT_KEYWORD)) {
	jmp	.L431	 ;
	.p2align 4,,10
	.p2align 3
.L611:
 ; D:\TC\src\parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	72(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:100:     SymbolTable* function_scope = create_symbol_table(now_scope);
	movq	%rax, %rdi	 ; tmp723, function_scope
 ; D:\TC\src\parser.c:101:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp724, token
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_135->type, _136
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _136
	je	.L433	 ;,
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _136
	jne	.L436	 ;,
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	(%rbx), %rcx	 ; token_135->lexeme, token_135->lexeme
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:102:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	testb	%al, %al	 ; tmp726
	je	.L436	 ;,
.L433:
 ; D:\TC\src\parser.c:107:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	(%rbx), %rdx	 ; token_135->lexeme, token_135->lexeme
	movq	72(%rsp), %rcx	 ; %sfp,
	call	search_name	 ;
	movq	%rax, %rbp	 ; tmp727, return_type
 ; D:\TC\src\parser.c:108:     if (return_type == NULL) {
	testq	%rax, %rax	 ; return_type
	je	.L620	 ;,
 ; D:\TC\src\parser.c:113:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:114:     if (token->type != IDENTIFIER) {
	cmpl	$1, 24(%rax)	 ;, token_145->type
 ; D:\TC\src\parser.c:113:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp729, token
 ; D:\TC\src\parser.c:114:     if (token->type != IDENTIFIER) {
	jne	.L621	 ;,
 ; D:\TC\src\parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	(%rbx), %rcx	 ; token_145->lexeme, token_145->lexeme
	movq	%rbp, %r8	 ; return_type,
	movl	$1, %edx	 ;,
 ; D:\TC\src\parser.c:120:     function->function_scope = function_scope;
	movq	%rdi, 32(%rax)	 ; function_scope, function_149->function_scope
 ; D:\TC\src\parser.c:119:     Function* function = (Function*)alloc_memory(sizeof(Function));
	movq	%rax, %r9	 ; tmp731, function
	movq	%rax, 88(%rsp)	 ; function, %sfp
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:122:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:121:     Symbol* name = create_symbol(token->lexeme, SYMBOL_FUNCTION, return_type, function);
	movq	%rax, 96(%rsp)	 ; tmp732, %sfp
 ; D:\TC\src\parser.c:122:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_152->type
 ; D:\TC\src\parser.c:122:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp733, token
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L440	 ;,
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp503
	movq	(%rbx), %rcx	 ; token_152->lexeme, token_152->lexeme
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:123:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp735
	je	.L440	 ;,
 ; D:\TC\src\parser.c:128:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp736, token
 ; D:\TC\src\parser.c:129:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %r12	 ;, tmp679
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %r13	 ;, tmp680
 ; D:\TC\src\parser.c:129:     list(Variable*) parameters = create_list();
	movq	%rax, 64(%rsp)	 ; tmp737, %sfp
	.p2align 4,,10
	.p2align 3
.L441:
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_164->type
	je	.L622	 ;,
.L449:
 ; D:\TC\src\parser.c:131:         Variable* parameter = parse_variable(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:132:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L623	 ;,
 ; D:\TC\src\parser.c:134:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_161->value
	je	.L444	 ;,
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC63(%rip), %rcx	 ;, tmp509
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp740
 ; D:\TC\src\parser.c:135:             parser_error("Function parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L443:
 ; D:\TC\src\parser.c:138:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_168->type
 ; D:\TC\src\parser.c:138:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp741, token
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	je	.L445	 ;,
.L448:
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC64(%rip), %rcx	 ;, tmp511
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp742
 ; D:\TC\src\parser.c:142:             parser_error("Expected ',' or ')' after function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L435:
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC69(%rip), %rcx	 ;, tmp537
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp759
 ; D:\TC\src\parser.c:47:                 parser_error("Failed to parse function declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r8d, %r8d	 ; _212
.L459:
 ; D:\TC\src\parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	xorl	%edx, %edx	 ;
	xorl	%r9d, %r9d	 ;
	movl	$1, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	movq	%rax, %rdx	 ; tmp760, _29
 ; D:\TC\src\parser.c:48:             list_append(members, (pointer)create_code_member(CODE_FUNCTION, NULL, function, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:44:         } else if (token->type == KEYWORD && string_equal(token->lexeme, FUNC_KEYWORD)) {
	jmp	.L431	 ;
	.p2align 4,,10
	.p2align 3
.L464:
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC71(%rip), %rcx	 ;, tmp545
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp768
 ; D:\TC\src\parser.c:273:         parser_error("Expected '{' to start class body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L462:
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC91(%rip), %rcx	 ;, tmp661
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp879
 ; D:\TC\src\parser.c:52:                 parser_error("Failed to parse class declaration", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%r9d, %r9d	 ; _362
.L526:
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	xorl	%edx, %edx	 ;
	xorl	%r8d, %r8d	 ;
	movl	$2, %ecx	 ;,
	call	create_code_member	 ;
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	80(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	movq	%rax, %rdx	 ; tmp880, _36
 ; D:\TC\src\parser.c:53:             list_append(members, (pointer)create_code_member(CODE_CLASS, NULL, NULL, class));
	call	list_append	 ;
 ; D:\TC\src\parser.c:49:         } else if (token->type == KEYWORD && string_equal(token->lexeme, CLASS_KEYWORD)) {
	jmp	.L431	 ;
	.p2align 4,,10
	.p2align 3
.L614:
 ; D:\TC\src\parser.c:177:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:178:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	(%rdi), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	96(%rsp), %r8	 ; %sfp,
	movl	$3, %edx	 ;,
	movq	%rax, %r9	 ; method_scope,
 ; D:\TC\src\parser.c:177:     SymbolTable* method_scope = create_symbol_table(now_scope);
	movq	%rax, %rbp	 ; tmp773, method_scope
 ; D:\TC\src\parser.c:178:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:179:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:178:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, class_name, method_scope);
	movq	%rax, %rbx	 ; tmp774, self
 ; D:\TC\src\parser.c:179:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	64(%rsp), %r10	 ; %sfp, token
 ; D:\TC\src\parser.c:179:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp775, token
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movl	24(%rax), %eax	 ; token_369->type, _370
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$1, %eax	 ;, _370
	je	.L468	 ;,
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	cmpl	$6, %eax	 ;, _370
	jne	.L471	 ;,
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	0(%r13), %rcx	 ; token_369->lexeme, token_369->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	is_builtin_type	 ;
 ; D:\TC\src\parser.c:180:     if (token->type != IDENTIFIER && !(token->type == KEYWORD && is_builtin_type(token->lexeme))) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp777
	je	.L471	 ;,
.L468:
 ; D:\TC\src\parser.c:185:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	0(%r13), %rdx	 ; token_369->lexeme, token_369->lexeme
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	search_name	 ;
 ; D:\TC\src\parser.c:186:     if (return_type == NULL) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; return_type
 ; D:\TC\src\parser.c:185:     Symbol* return_type = search_name(now_scope, token->lexeme);
	movq	%rax, 136(%rsp)	 ; return_type, %sfp
 ; D:\TC\src\parser.c:186:     if (return_type == NULL) {
	je	.L624	 ;,
 ; D:\TC\src\parser.c:191:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:192:     if (token->type != IDENTIFIER) {
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$1, 24(%rax)	 ;, token_379->type
 ; D:\TC\src\parser.c:191:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp780, token
 ; D:\TC\src\parser.c:192:     if (token->type != IDENTIFIER) {
	jne	.L625	 ;,
 ; D:\TC\src\parser.c:197:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	96(%rsp), %rcx	 ; %sfp, name
	movq	0(%r13), %rdx	 ; token_379->lexeme, token_379->lexeme
 ; D:\TC\src\parser.c:198:     method->method_scope = method_scope;
	movq	%rbp, 32(%rax)	 ; method_scope, method_383->method_scope
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	8(%rcx), %rcx	 ; name_223->name, name_223->name
 ; D:\TC\src\parser.c:198:     method->method_scope = method_scope;
	movq	%rax, 152(%rsp)	 ; method, %sfp
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	152(%rsp), %r9	 ; %sfp,
	movl	$2, %edx	 ;,
	movq	136(%rsp), %r8	 ; %sfp,
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, %rcx	 ; tmp783, _386
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:199:     Symbol* name = create_symbol(make_method_name(class_name->name, token->lexeme), SYMBOL_METHOD, return_type, method);
	movq	%rax, 160(%rsp)	 ; tmp784, %sfp
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_388->type
 ; D:\TC\src\parser.c:200:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp785, token
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	jne	.L475	 ;,
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	.refptr.L_PAREN_SYMBOL(%rip), %rax	 ;, tmp566
	movq	0(%r13), %rcx	 ; token_388->lexeme, token_388->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_PAREN_SYMBOL, L_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:201:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_PAREN_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp787
	je	.L475	 ;,
 ; D:\TC\src\parser.c:206:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$6, 24(%rax)	 ;, token_395->type
 ; D:\TC\src\parser.c:206:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp788, token
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	je	.L476	 ;,
.L478:
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC76(%rip), %rcx	 ;, tmp570
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp789
 ; D:\TC\src\parser.c:208:         parser_error("Expected 'self' as first parameter of method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
.L477:
 ; D:\TC\src\parser.c:209:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp791, token
 ; D:\TC\src\parser.c:210:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	96(%rsp), %rcx	 ; %sfp,
	movq	%rbx, %rdx	 ; self,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:210:     list(Variable*) parameters = create_list();
	movq	%rax, 144(%rsp)	 ; tmp792, %sfp
	movq	%r13, %rbx	 ; token, token
	movq	%r12, %r13	 ; tmp667, tmp667
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	144(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	movq	%rax, %rdx	 ; tmp793, _404
 ; D:\TC\src\parser.c:211:     list_append(parameters, (pointer)create_variable(class_name, self, NULL));
	call	list_append	 ;
	movq	64(%rsp), %r12	 ; %sfp, token
	.p2align 4,,10
	.p2align 3
.L479:
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_405->type
	je	.L626	 ;,
.L604:
	movq	%r12, %r10	 ; token, token
	movq	%r13, %r12	 ; tmp667, tmp667
	movq	%rbx, %r13	 ; token, token
.L483:
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC77(%rip), %rcx	 ;, tmp578
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp797
 ; D:\TC\src\parser.c:217:             parser_error("Expected ',' or ')' after method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L470	 ;
	.p2align 4,,10
	.p2align 3
.L609:
 ; D:\TC\src\parser.c:33:         now_scope = builtin_scope;
	movq	(%rsi), %rbx	 ; builtin_scope, now_scope
	jmp	.L418	 ;
	.p2align 4,,10
	.p2align 3
.L514:
 ; D:\TC\src\parser.c:311:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	.refptr.DEFAULT_INIT_NAME(%rip), %rax	 ;, tmp631
	movq	%r10, 128(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; DEFAULT_INIT_NAME, DEFAULT_INIT_NAME
	movq	96(%rsp), %rax	 ; %sfp, name
	movq	8(%rax), %rcx	 ; name_223->name, name_223->name
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:312:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; init_name,
 ; D:\TC\src\parser.c:311:     string init_name = make_method_name(name->name, DEFAULT_INIT_NAME);
	movq	%rax, %rbx	 ; tmp829, init_name
 ; D:\TC\src\parser.c:312:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	call	search_name_use_strcmp	 ;
 ; D:\TC\src\parser.c:313:     if (init == NULL) {
	movq	128(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; init
 ; D:\TC\src\parser.c:312:     Symbol* init = search_name_use_strcmp(class_scope, init_name);
	movq	%rax, 64(%rsp)	 ; init, %sfp
 ; D:\TC\src\parser.c:313:     if (init == NULL) {
	je	.L627	 ;,
.L515:
 ; D:\TC\src\parser.c:325:     if (init->kind != SYMBOL_METHOD)
	movq	64(%rsp), %rax	 ; %sfp, init
	movq	%r10, 128(%rsp)	 ; token, %sfp
	cmpl	$2, 32(%rax)	 ;, init_302->kind
	jne	.L628	 ;,
.L516:
 ; D:\TC\src\parser.c:327:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	96(%rsp), %r13	 ; %sfp, name
	movq	.refptr.DEFAULT_CONSTRUCTOR_NAME(%rip), %rax	 ;, tmp640
	movq	8(%r13), %rcx	 ; name_223->name, name_223->name
	movq	(%rax), %rdx	 ; DEFAULT_CONSTRUCTOR_NAME, DEFAULT_CONSTRUCTOR_NAME
	call	make_method_name	 ;
 ; D:\TC\src\parser.c:328:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
 ; D:\TC\src\parser.c:327:     string constructor_name = make_method_name(name->name, DEFAULT_CONSTRUCTOR_NAME);
	movq	%rax, %rbx	 ; tmp844, constructor_name
 ; D:\TC\src\parser.c:328:     Method* method = (Method*)alloc_memory(sizeof(Method));
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:329:     method->method_scope = create_symbol_table(class_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:328:     Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rbp	 ; tmp845, method
 ; D:\TC\src\parser.c:329:     method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:330:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movq	%rbx, %rcx	 ; constructor_name,
	movq	%rbp, %r9	 ; method,
	movq	%r13, %r8	 ; name,
 ; D:\TC\src\parser.c:329:     method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rbp)	 ; tmp846, method_310->method_scope
 ; D:\TC\src\parser.c:330:     Symbol* constructor = create_symbol(constructor_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	call	create_symbol	 ;
	movq	%rax, 128(%rsp)	 ; tmp847, %sfp
 ; D:\TC\src\parser.c:331:     list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:332:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rbp), %r9	 ; method_310->method_scope,
	movq	(%rdi), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r13, %r8	 ; name,
	movl	$3, %edx	 ;,
 ; D:\TC\src\parser.c:331:     list(Variable*) parameters = create_list();
	movq	%rax, %rsi	 ; tmp848, parameters
 ; D:\TC\src\parser.c:332:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rcx	 ; name,
 ; D:\TC\src\parser.c:332:     Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %rdx	 ; tmp849, self
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rsi, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp850, _317
 ; D:\TC\src\parser.c:333:     list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:334:     list(Variable*) init_params = list_copy(init->ast_node.method->parameters);
	movq	64(%rsp), %rax	 ; %sfp, init
	movq	24(%rax), %rax	 ; init_302->ast_node.method, init_302->ast_node.method
	movq	16(%rax), %rcx	 ; _318->parameters, _318->parameters
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp851, init_params
	.p2align 4,,10
	.p2align 3
.L518:
 ; D:\TC\src\parser.c:336:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbx, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp854, param
 ; D:\TC\src\parser.c:336:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	je	.L629	 ;,
.L519:
 ; D:\TC\src\parser.c:337:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	movq	8(%r12), %rax	 ; param_322->name, param_322->name
	movq	(%rdi), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	8(%rax), %rcx	 ; _323->name, _323->name
	call	string_equal	 ;
 ; D:\TC\src\parser.c:337:         if (string_equal(param->name->name, SELF_KEYWORD)) continue;
	testb	%al, %al	 ; tmp852
	jne	.L518	 ;,
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	8(%r12), %rdx	 ; param_322->name, param_322->name
	movq	(%r12), %rcx	 ; param_322->type, param_322->type
	xorl	%r8d, %r8d	 ;
	call	create_variable	 ;
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rsi, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	movq	%rax, %rdx	 ; tmp853, _328
 ; D:\TC\src\parser.c:338:         list_append(parameters, (pointer)create_variable(param->type, param->name, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:336:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	movq	%rbx, %rcx	 ; init_params,
	call	list_pop	 ;
	movq	%rax, %r12	 ; tmp854, param
 ; D:\TC\src\parser.c:336:     while ((param = (Variable*)list_pop(init_params)) != NULL) {
	testq	%rax, %rax	 ; param
	jne	.L519	 ;,
.L629:
 ; D:\TC\src\parser.c:340:     list(statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:341:     list(ClassMember*) ms = list_copy(members);
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:340:     list(statement*) body = create_list();
	movq	%rax, %r13	 ; tmp855, body
 ; D:\TC\src\parser.c:341:     list(ClassMember*) ms = list_copy(members);
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp856, ms
 ; D:\TC\src\parser.c:343:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	jmp	.L521	 ;
	.p2align 4,,10
	.p2align 3
.L523:
 ; D:\TC\src\parser.c:344:         if (mb->type == CLASS_VARIABLE) {
	cmpl	$1, 8(%rdi)	 ;, mb_331->type
	je	.L630	 ;,
.L521:
 ; D:\TC\src\parser.c:343:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	movq	%rbx, %rcx	 ; ms,
	call	list_pop	 ;
	movq	%rax, %rdi	 ; tmp865, mb
 ; D:\TC\src\parser.c:343:     while ((mb = (ClassMember*)list_pop(ms)) != NULL) {
	testq	%rax, %rax	 ; mb
	jne	.L523	 ;,
 ; D:\TC\src\parser.c:350:     list(Expression*) args = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:351:     list(Variable*) params = list_copy(parameters);
	movq	%rsi, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:350:     list(Expression*) args = create_list();
	movq	%rax, %r12	 ; tmp866, args
 ; D:\TC\src\parser.c:351:     list(Variable*) params = list_copy(parameters);
	call	list_copy	 ;
	movq	%rax, %rbx	 ; tmp867, params
 ; D:\TC\src\parser.c:352:     while ((param = (Variable*)list_pop(params)) != NULL)
	jmp	.L524	 ;
	.p2align 4,,10
	.p2align 3
.L525:
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	8(%rax), %r8	 ; param_349->name, param_349->name
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp868,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
	xorl	%r9d, %r9d	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %r8	 ;, tmp869
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	create_expression	 ;
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%r12, %rcx	 ; args,
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	movq	%rax, %rdx	 ; tmp870, _353
 ; D:\TC\src\parser.c:353:         list_append(args, (pointer)create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, param->name, NULL, NULL)), NULL));
	call	list_append	 ;
.L524:
 ; D:\TC\src\parser.c:352:     while ((param = (Variable*)list_pop(params)) != NULL)
	movq	%rbx, %rcx	 ; params,
	call	list_pop	 ;
 ; D:\TC\src\parser.c:352:     while ((param = (Variable*)list_pop(params)) != NULL)
	testq	%rax, %rax	 ; param
	jne	.L525	 ;,
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	$0, 32(%rsp)	 ;,
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	64(%rsp), %r8	 ; %sfp,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r12, 32(%rsp)	 ; args,
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp872, _354
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movl	$1, %ecx	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp873,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp874
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	create_expression	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp875,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%r13, %rcx	 ; body,
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp876, _358
 ; D:\TC\src\parser.c:354:     list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_FUNC_CALL, create_variable_access(VAR_NAME, NULL, init, NULL, NULL), NULL, NULL, args)), NULL), NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:355:     create_method_use_ptr(method, constructor, name, parameters, body, method->method_scope);
	movq	32(%rbp), %rax	 ; method_310->method_scope, method_310->method_scope
	movq	%rsi, %r9	 ; parameters,
	movq	%rbp, %rcx	 ; method,
	movq	96(%rsp), %rsi	 ; %sfp, name
	movq	%r13, 32(%rsp)	 ; body,
	movq	%rax, 40(%rsp)	 ; method_310->method_scope,
	movq	128(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %r8	 ; name,
	call	create_method_use_ptr	 ;
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rbp, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	104(%rsp), %rdi	 ; %sfp, members
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp877, _360
 ; D:\TC\src\parser.c:356:     list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rdi, %rcx	 ; members,
	call	list_append	 ;
 ; D:\TC\src\parser.c:358:     return create_class_use_ptr(class, name, members, class_scope, size);
	movq	120(%rsp), %rax	 ; %sfp, size
	movq	%rdi, %r8	 ; members,
	movq	%rsi, %rdx	 ; name,
	movq	88(%rsp), %r9	 ; %sfp,
	movq	112(%rsp), %rcx	 ; %sfp,
	movq	%rax, 32(%rsp)	 ; size,
	call	create_class_use_ptr	 ;
	movq	%rax, %r9	 ; tmp878, _362
 ; D:\TC\src\parser.c:51:             if (class == NULL)
	testq	%rax, %rax	 ; _362
	jne	.L526	 ;,
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L630:
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	(%rdi), %rax	 ; mb_331->content.variable, mb_331->content.variable
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	movq	8(%rax), %r8	 ; _334->name, _334->name
	movq	$0, 32(%rsp)	 ;,
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp857,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	movq	%rax, %r8	 ;, tmp858
 ; D:\TC\src\parser.c:345:             Expression* left = create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, mb->content.variable->name, NULL, NULL)), NULL);
	call	create_expression	 ;
	movq	%rax, %r12	 ; tmp859, left
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	(%rdi), %rax	 ; mb_331->content.variable, mb_331->content.variable
	movq	16(%rax), %r9	 ; _339->value, _340
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	testq	%r9, %r9	 ; _340
	je	.L631	 ;,
.L522:
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r12, %rdx	 ; left,
	movl	$13, %ecx	 ;,
	call	create_expression	 ;
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	xorl	%r9d, %r9d	 ;
	movq	$0, 40(%rsp)	 ;,
	xorl	%r8d, %r8d	 ;
	movq	%rax, 32(%rsp)	 ; tmp863,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%r13, %rcx	 ; body,
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	movq	%rax, %rdx	 ; tmp864, _346
 ; D:\TC\src\parser.c:347:             list_append(body, (pointer)create_statement(EXPRESSION_STATEMENT, NULL, NULL, NULL, create_expression(OP_ASSIGN, left, NULL, right), NULL));
	call	list_append	 ;
	jmp	.L521	 ;
	.p2align 4,,10
	.p2align 3
.L509:
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	movq	.refptr.SEMICOLON_SYMBOL(%rip), %rax	 ;, tmp623
	movq	(%rbx), %rcx	 ; token_269->lexeme, token_269->lexeme
	movq	(%rax), %rdx	 ; SEMICOLON_SYMBOL, SEMICOLON_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:305:             if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL))
	testb	%al, %al	 ; tmp825
	je	.L511	 ;,
	jmp	.L510	 ;
	.p2align 4,,10
	.p2align 3
.L616:
 ; D:\TC\src\parser.c:294:                 Symbol* type = member->content.variable->type;
	movq	(%rbx), %rdx	 ; member_250->content.variable, _252
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_int(%rip), %rcx	 ;, tmp613
 ; D:\TC\src\parser.c:294:                 Symbol* type = member->content.variable->type;
	movq	(%rdx), %rax	 ; _252->type, type
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_int, type
	je	.L607	 ;,
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_float(%rip), %rcx	 ;, tmp614
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_float, type
	je	.L607	 ;,
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	movq	.refptr.name_string(%rip), %rcx	 ;, tmp615
 ; D:\TC\src\parser.c:295:                 if (type == name_int || type == name_float || type == name_string)
	cmpq	(%rcx), %rax	 ; name_string, type
	je	.L607	 ;,
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_bool(%rip), %rcx	 ;, tmp616
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_bool, type
	je	.L506	 ;,
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	movq	.refptr.name_void(%rip), %rcx	 ;, tmp617
 ; D:\TC\src\parser.c:297:                 else if (type == name_bool || type == name_void)
	cmpq	(%rcx), %rax	 ; name_void, type
	je	.L506	 ;,
 ; D:\TC\src\parser.c:299:                 else if (type->kind == SYMBOL_CLASS)
	movl	32(%rax), %ecx	 ; type_253->kind,
	testl	%ecx, %ecx	 ;
	je	.L607	 ;,
 ; D:\TC\src\parser.c:302:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	8(%rax), %rbx	 ; type_253->name, _264
	movq	8(%rdx), %rax	 ; _252->name, _252->name
	movq	8(%rax), %rbp	 ; _265->name, _266
 ; D:\TC\src\parser.c:302:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:302:                     fprintf(stderr, "[warning] Unsupported type for class variable '%s': %s\n", member->content.variable->name->name, type->name);
	movq	%rbx, %r9	 ; _264,
	leaq	.LC86(%rip), %rdx	 ;, tmp620
	movq	24(%rax), %rcx	 ; _267->_stderr, _267->_stderr
	movq	%rbp, %r8	 ; _266,
	call	fprintf	 ;
	jmp	.L505	 ;
	.p2align 4,,10
	.p2align 3
.L607:
 ; D:\TC\src\parser.c:300:                     size += 8;  // pointer to object
	addq	$8, 120(%rsp)	 ;, %sfp
	jmp	.L505	 ;
	.p2align 4,,10
	.p2align 3
.L612:
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC70(%rip), %rcx	 ;, tmp542
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp764
 ; D:\TC\src\parser.c:264:         parser_error("Expected class name after 'class'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L462	 ;
	.p2align 4,,10
	.p2align 3
.L617:
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC53(%rip), %rcx	 ;, tmp471
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp708
 ; D:\TC\src\parser.c:66:         parser_error("Expected identifier after 'import'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L423:
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	56(%rsp), %rdx	 ; %sfp,
	leaq	.LC57(%rip), %rcx	 ;, tmp488
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp720
 ; D:\TC\src\parser.c:42:                 parser_error("Failed to parse import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _132
	jmp	.L430	 ;
	.p2align 4,,10
	.p2align 3
.L628:
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	128(%rsp), %rdx	 ; %sfp,
	leaq	.LC89(%rip), %rcx	 ;, tmp639
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp843
 ; D:\TC\src\parser.c:326:         parser_error("Constructor name conflicts with existing member", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L516	 ;
	.p2align 4,,10
	.p2align 3
.L428:
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC55(%rip), %rcx	 ;, tmp478
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp714
 ; D:\TC\src\parser.c:84:         parser_error("Expected ';' at end of import statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L423	 ;
	.p2align 4,,10
	.p2align 3
.L440:
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC61(%rip), %rcx	 ;, tmp502
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp734
 ; D:\TC\src\parser.c:124:         parser_error("Expected '(' after function name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L475:
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC75(%rip), %rcx	 ;, tmp565
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp786
 ; D:\TC\src\parser.c:202:         parser_error("Expected '(' after method name", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
.L470:
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	64(%rsp), %rdx	 ; %sfp,
	leaq	.LC84(%rip), %rcx	 ;, tmp607
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp815
 ; D:\TC\src\parser.c:284:                 parser_error("Failed to parse class method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	xorl	%edx, %edx	 ; _456
.L499:
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%ecx, %ecx	 ;
	xorl	%r8d, %r8d	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp816, _241
 ; D:\TC\src\parser.c:285:             list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:281:         if (token->type == KEYWORD && string_equal(token->lexeme, METHOD_KEYWORD)) {
	jmp	.L510	 ;
	.p2align 4,,10
	.p2align 3
.L622:
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_164->lexeme, token_164->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:130:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp746
	je	.L449	 ;,
 ; D:\TC\src\parser.c:147:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rax)	 ;, token_185->type
 ; D:\TC\src\parser.c:147:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp747, token
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L451	 ;,
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp523
	movq	(%rbx), %rcx	 ; token_185->lexeme, token_185->lexeme
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:148:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp749
	je	.L451	 ;,
 ; D:\TC\src\parser.c:153:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:154:     parser->in_function = true;
	movb	$1, 8(%r15)	 ;, parser_74(D)->in_function
 ; D:\TC\src\parser.c:156:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:153:     list(Statement*) body = create_list();
	movq	%rax, %r12	 ; tmp750, body
 ; D:\TC\src\parser.c:164:             have_return = true;
	movl	$1, %r13d	 ;, tmp676
 ; D:\TC\src\parser.c:156:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rbp, 112(%rsp)	 ; return_type, %sfp
	movq	%rax, %rbx	 ; tmp751, token
	movq	.refptr.R_BRACE_SYMBOL(%rip), %rax	 ;, tmp667
	movq	%rax, %rbp	 ; tmp667, tmp667
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L452	 ;
	.p2align 4,,10
	.p2align 3
.L455:
 ; D:\TC\src\parser.c:164:             have_return = true;
	cmpl	$5, 8(%r9)	 ;, statement_194->type
	cmove	%r13d, %esi	 ; have_return,, tmp676, have_return
.L456:
 ; D:\TC\src\parser.c:165:         list_append(body, (pointer)statement);
	movq	%r9, %rdx	 ; statement,
	movq	%r12, %rcx	 ; body,
	call	list_append	 ;
 ; D:\TC\src\parser.c:166:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp755, token
.L452:
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_197->type
	jne	.L457	 ;,
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	0(%rbp), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	(%rbx), %rcx	 ; token_197->lexeme, token_197->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:157:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp756
	jne	.L632	 ;,
.L457:
 ; D:\TC\src\parser.c:158:         Statement* statement = parse_statement(lexer, function_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rdi, %rdx	 ; function_scope,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %r9	 ; tmp752, statement
 ; D:\TC\src\parser.c:159:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L633	 ;,
 ; D:\TC\src\parser.c:161:         else if (have_return)
	testb	%sil, %sil	 ; have_return
	je	.L455	 ;,
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp754
 ; D:\TC\src\parser.c:162:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L455	 ;
	.p2align 4,,10
	.p2align 3
.L444:
 ; D:\TC\src\parser.c:137:             list_append(parameters, (pointer)parameter);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L443	 ;
	.p2align 4,,10
	.p2align 3
.L445:
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	0(%r13), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	movq	(%rax), %rcx	 ; token_168->lexeme, token_168->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:139:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp743
	jne	.L634	 ;,
 ; D:\TC\src\parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_168->type
	jne	.L448	 ;,
 ; D:\TC\src\parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	movq	(%rbx), %rcx	 ; token_168->lexeme, token_168->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:141:         } else if (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp745
	jne	.L441	 ;,
	jmp	.L448	 ;
	.p2align 4,,10
	.p2align 3
.L626:
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp956
	movq	(%rbx), %rcx	 ; token_405->lexeme, token_405->lexeme
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:212:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_PAREN_SYMBOL)) {
	testb	%al, %al	 ; tmp803
	jne	.L635	 ;,
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	cmpl	$5, 24(%rbx)	 ;, token_405->type
	jne	.L604	 ;,
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	movq	.refptr.COMMA_SYMBOL(%rip), %rax	 ;, tmp954
	movq	(%rbx), %rcx	 ; token_405->lexeme, token_405->lexeme
	movq	(%rax), %rdx	 ; COMMA_SYMBOL, COMMA_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:213:         if (token->type == SYMBOL && string_equal(token->lexeme, COMMA_SYMBOL)) {
	testb	%al, %al	 ; tmp794
	je	.L636	 ;,
 ; D:\TC\src\parser.c:214:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:220:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	movq	%r15, %r8	 ; parser,
	movq	%rbp, %rdx	 ; method_scope,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:214:             token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp795, token
 ; D:\TC\src\parser.c:220:         Variable* parameter = parse_variable(lexer, method_scope, parser);
	call	parse_variable	 ;
 ; D:\TC\src\parser.c:221:         if (parameter == NULL)
	testq	%rax, %rax	 ; parameter
	je	.L637	 ;,
 ; D:\TC\src\parser.c:223:         else if (parameter->value != NULL)
	cmpq	$0, 16(%rax)	 ;, parameter_411->value
	je	.L489	 ;,
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC79(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp801
 ; D:\TC\src\parser.c:224:             parser_error("Method parameters cannot have default values", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L488:
 ; D:\TC\src\parser.c:227:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp802, token
	jmp	.L479	 ;
	.p2align 4,,10
	.p2align 3
.L489:
 ; D:\TC\src\parser.c:226:             list_append(parameters, (pointer)parameter);
	movq	144(%rsp), %rcx	 ; %sfp,
	movq	%rax, %rdx	 ; parameter,
	call	list_append	 ;
	jmp	.L488	 ;
	.p2align 4,,10
	.p2align 3
.L623:
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC62(%rip), %rcx	 ;, tmp507
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp739
 ; D:\TC\src\parser.c:133:             parser_error("Failed to parse function parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L443	 ;
	.p2align 4,,10
	.p2align 3
.L637:
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC78(%rip), %rcx	 ;, tmp583
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp800
 ; D:\TC\src\parser.c:222:             parser_error("Failed to parse method parameter", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L488	 ;
	.p2align 4,,10
	.p2align 3
.L608:
 ; D:\TC\src\parser.c:25:         builtin_scope = create_symbol_table(NULL);
	xorl	%ecx, %ecx	 ;
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	xorl	%r8d, %r8d	 ;
	movl	$6, %edx	 ;,
 ; D:\TC\src\parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, %r9	 ; tmp697, _2
 ; D:\TC\src\parser.c:25:         builtin_scope = create_symbol_table(NULL);
	movq	%rax, (%rsi)	 ; _2, builtin_scope
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.VOID_KEYWORD(%rip), %rax	 ;, tmp443
	movq	(%rax), %rcx	 ; VOID_KEYWORD, VOID_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_void(%rip), %rdx	 ;, tmp445
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:26:         name_void = create_symbol(VOID_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp698, name_void
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.INT_KEYWORD(%rip), %rax	 ;, tmp448
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; INT_KEYWORD, INT_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_int(%rip), %rdx	 ;, tmp450
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:27:         name_int = create_symbol(INT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp699, name_int
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.FLOAT_KEYWORD(%rip), %rax	 ;, tmp453
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; FLOAT_KEYWORD, FLOAT_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_float(%rip), %rdx	 ;, tmp455
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:28:         name_float = create_symbol(FLOAT_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp700, name_float
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.STRING_KEYWORD(%rip), %rax	 ;, tmp458
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; STRING_KEYWORD, STRING_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_string(%rip), %rdx	 ;, tmp460
 ; D:\TC\src\parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	(%rsi), %r9	 ; builtin_scope,
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\parser.c:29:         name_string = create_symbol(STRING_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	%rax, (%rdx)	 ; tmp701, name_string
 ; D:\TC\src\parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.BOOL_KEYWORD(%rip), %rax	 ;, tmp463
	movl	$6, %edx	 ;,
	movq	(%rax), %rcx	 ; BOOL_KEYWORD, BOOL_KEYWORD
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:30:         name_bool = create_symbol(BOOL_KEYWORD, SYMBOL_TYPE, NULL, builtin_scope);
	movq	.refptr.name_bool(%rip), %rdx	 ;, tmp465
	movq	%rax, (%rdx)	 ; tmp702, name_bool
	jmp	.L417	 ;
	.p2align 4,,10
	.p2align 3
.L436:
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC58(%rip), %rcx	 ;, tmp493
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp725
 ; D:\TC\src\parser.c:103:         parser_error("Expected function return type after 'func'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L471:
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC72(%rip), %rcx	 ;, tmp555
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp776
 ; D:\TC\src\parser.c:181:         parser_error("Expected method return type after 'method'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L470	 ;
	.p2align 4,,10
	.p2align 3
.L615:
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC85(%rip), %rcx	 ;, tmp612
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp820
 ; D:\TC\src\parser.c:290:                 parser_error("Failed to parse class variable", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L501	 ;
	.p2align 4,,10
	.p2align 3
.L634:
 ; D:\TC\src\parser.c:140:             token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp744, token
 ; D:\TC\src\parser.c:140:             token = get_next_token(lexer, true);
	jmp	.L441	 ;
.L621:
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC60(%rip), %rcx	 ;, tmp499
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp730
 ; D:\TC\src\parser.c:115:         parser_error("Expected function name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L435	 ;
.L625:
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC74(%rip), %rcx	 ;, tmp561
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp781
 ; D:\TC\src\parser.c:193:         parser_error("Expected method name after return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L470	 ;
.L618:
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	movq	.refptr.FROM_KEYWORD(%rip), %rax	 ;, tmp472
	movq	(%rbx), %rcx	 ; token_106->lexeme, token_106->lexeme
	movq	(%rax), %rdx	 ; FROM_KEYWORD, FROM_KEYWORD
	call	string_equal	 ;
 ; D:\TC\src\parser.c:73:     if (token->type == KEYWORD && string_equal(token->lexeme, FROM_KEYWORD)) {
	testb	%al, %al	 ; tmp710
	jne	.L425	 ;,
.L606:
 ; D:\TC\src\parser.c:83:     if (token->type != SYMBOL || !string_equal(token->lexeme, SEMICOLON_SYMBOL)) {
	movl	24(%rbx), %eax	 ;, _107
	jmp	.L424	 ;
.L636:
 ; D:\TC\src\parser.c:215:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	cmpl	$5, 24(%rbx)	 ;, token_405->type
	movq	%r12, %r10	 ; token, token
	movq	%r13, %r12	 ; tmp667, tmp667
	movq	%rbx, %r13	 ; token, token
	jne	.L483	 ;,
 ; D:\TC\src\parser.c:215:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	.refptr.R_PAREN_SYMBOL(%rip), %rax	 ;, tmp955
	movq	(%rbx), %rcx	 ; token_405->lexeme, token_405->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; R_PAREN_SYMBOL, R_PAREN_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:215:         } else if (token->type == SYMBOL && string_equal(token->lexeme, R_PAREN_SYMBOL)) break;
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp798
	je	.L483	 ;,
.L491:
 ; D:\TC\src\parser.c:229:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	cmpl	$5, 24(%rax)	 ;, token_429->type
 ; D:\TC\src\parser.c:229:     token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp799, token
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	jne	.L486	 ;,
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	.refptr.L_BRACE_SYMBOL(%rip), %rax	 ;, tmp957
	movq	(%rbx), %rcx	 ; token_429->lexeme, token_429->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	movq	(%rax), %rdx	 ; L_BRACE_SYMBOL, L_BRACE_SYMBOL
	call	string_equal	 ;
 ; D:\TC\src\parser.c:230:     if (token->type != SYMBOL || !string_equal(token->lexeme, L_BRACE_SYMBOL)) {
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp805
	je	.L486	 ;,
	movq	%r10, 128(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:235:     list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:236:     parser->in_function = true;
	movl	$257, %r9d	 ;,
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:236:     parser->in_function = true;
	movw	%r9w, 8(%r15)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:235:     list(Statement*) body = create_list();
	movq	%rax, 64(%rsp)	 ; tmp806, %sfp
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
 ; D:\TC\src\parser.c:238:     bool have_return = false;
	xorl	%r11d, %r11d	 ; have_return
	movq	%rbp, 128(%rsp)	 ; method_scope, %sfp
 ; D:\TC\src\parser.c:239:     token = get_next_token(lexer, true);
	movq	%rax, %r13	 ; tmp807, token
	movl	%r11d, %ebx	 ; have_return, have_return
	movq	%r10, 168(%rsp)	 ; token, %sfp
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	jmp	.L492	 ;
	.p2align 4,,10
	.p2align 3
.L495:
 ; D:\TC\src\parser.c:247:             have_return = true;
	cmpl	$5, 8(%rbp)	 ;, statement_438->type
	movl	$1, %eax	 ;, tmp958
	cmove	%eax, %ebx	 ; have_return,, tmp958, have_return
.L496:
 ; D:\TC\src\parser.c:248:         list_append(body, (pointer)statement);
	movq	64(%rsp), %rcx	 ; %sfp,
	movq	%rbp, %rdx	 ; statement,
	call	list_append	 ;
 ; D:\TC\src\parser.c:249:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
	movq	%rax, %r13	 ; tmp811, token
.L492:
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	cmpl	$5, 24(%r13)	 ;, token_441->type
	jne	.L497	 ;,
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	movq	(%r12), %rdx	 ; R_BRACE_SYMBOL, R_BRACE_SYMBOL
	movq	0(%r13), %rcx	 ; token_441->lexeme, token_441->lexeme
	call	string_equal	 ;
 ; D:\TC\src\parser.c:240:     while (token->type != SYMBOL || !string_equal(token->lexeme, R_BRACE_SYMBOL)) {
	testb	%al, %al	 ; tmp812
	jne	.L638	 ;,
.L497:
 ; D:\TC\src\parser.c:241:         Statement* statement = parse_statement(lexer, method_scope, parser);
	movq	128(%rsp), %rdx	 ; %sfp,
	movq	%r15, %r8	 ; parser,
	movq	%r14, %rcx	 ; lexer,
	call	parse_statement	 ;
	movq	%rax, %rbp	 ; tmp808, statement
 ; D:\TC\src\parser.c:242:         if (statement == NULL)
	testq	%rax, %rax	 ; statement
	je	.L639	 ;,
 ; D:\TC\src\parser.c:244:         else if (have_return)
	testb	%bl, %bl	 ; have_return
	je	.L495	 ;,
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC67(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp810
 ; D:\TC\src\parser.c:245:             parser_error("Unreachable code after return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L495	 ;
.L627:
 ; D:\TC\src\parser.c:314:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movl	$40, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\parser.c:315:         method->method_scope = create_symbol_table(class_scope);
	movq	88(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:314:         Method* method = (Method*)alloc_memory(sizeof(Method));
	movq	%rax, %rsi	 ; tmp831, method
 ; D:\TC\src\parser.c:315:         method->method_scope = create_symbol_table(class_scope);
	call	create_symbol_table	 ;
 ; D:\TC\src\parser.c:316:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movq	96(%rsp), %r13	 ; %sfp, name
	movq	%rbx, %rcx	 ; init_name,
	movq	%rsi, %r9	 ; method,
 ; D:\TC\src\parser.c:315:         method->method_scope = create_symbol_table(class_scope);
	movq	%rax, 32(%rsi)	 ; tmp832, method_287->method_scope
 ; D:\TC\src\parser.c:316:         init = create_symbol(init_name, SYMBOL_METHOD, name, method);
	movl	$2, %edx	 ;,
	movq	%r13, %r8	 ; name,
	call	create_symbol	 ;
	movq	%rax, 64(%rsp)	 ; tmp833, %sfp
 ; D:\TC\src\parser.c:317:         list(Variable*) parameters = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:318:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	32(%rsi), %r9	 ; method_287->method_scope,
	movq	(%rdi), %rcx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	%r13, %r8	 ; name,
	movl	$3, %edx	 ;,
 ; D:\TC\src\parser.c:317:         list(Variable*) parameters = create_list();
	movq	%rax, %rbp	 ; tmp834, parameters
 ; D:\TC\src\parser.c:318:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	call	create_symbol	 ;
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%r13, %rcx	 ; name,
	movq	%rax, %rdx	 ; self,
 ; D:\TC\src\parser.c:318:         Symbol* self = create_symbol(SELF_KEYWORD, SYMBOL_VARIABLE, name, method->method_scope);
	movq	%rax, %r12	 ; tmp835, self
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	create_variable	 ;
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rbp, %rcx	 ; parameters,
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	movq	%rax, %rdx	 ; tmp836, _294
 ; D:\TC\src\parser.c:319:         list_append(parameters, (pointer)create_variable(name, self, NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:320:         list(Statement*) body = create_list();
	call	create_list	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	movq	%r12, %r8	 ; self,
	xorl	%edx, %edx	 ;
	movq	$0, 32(%rsp)	 ;,
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\parser.c:320:         list(Statement*) body = create_list();
	movq	%rax, %rbx	 ; tmp837, body
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_variable_access	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	%rax, 32(%rsp)	 ; tmp838,
	movl	$8, %ecx	 ;,
	call	create_primary	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %r8	 ;, tmp839
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	create_expression	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%edx, %edx	 ;
	movq	$0, 40(%rsp)	 ;,
	movl	$5, %ecx	 ;,
	movq	%rax, 32(%rsp)	 ; tmp840,
	call	create_statement	 ;
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rbx, %rcx	 ; body,
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	movq	%rax, %rdx	 ; tmp841, _299
 ; D:\TC\src\parser.c:321:         list_append(body, (pointer)create_statement(RETURN_STATEMENT, NULL, NULL, NULL, create_expression(OP_NONE, NULL, create_primary(PRIM_VARIABLE_ACCESS, NULL, NULL, NULL, create_variable_access(VAR_NAME, NULL, self, NULL, NULL)), NULL), NULL));
	call	list_append	 ;
 ; D:\TC\src\parser.c:322:         create_method_use_ptr(method, init, name, parameters, body, method->method_scope);
	movq	32(%rsi), %rax	 ; method_287->method_scope, method_287->method_scope
	movq	%rbp, %r9	 ; parameters,
	movq	%r13, %r8	 ; name,
	movq	%rbx, 32(%rsp)	 ; body,
	movq	64(%rsp), %rdx	 ; %sfp,
	movq	%rsi, %rcx	 ; method,
	movq	%rax, 40(%rsp)	 ; method_287->method_scope,
	call	create_method_use_ptr	 ;
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	xorl	%r8d, %r8d	 ;
	movq	%rsi, %rdx	 ; method,
	xorl	%ecx, %ecx	 ;
	call	create_class_member	 ;
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	104(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	movq	%rax, %rdx	 ; tmp842, _301
 ; D:\TC\src\parser.c:323:         list_append(members, (pointer)create_class_member(CLASS_METHOD, method, NULL));
	call	list_append	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
	jmp	.L515	 ;
.L486:
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC80(%rip), %rcx	 ;, tmp590
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp804
 ; D:\TC\src\parser.c:231:         parser_error("Expected '{' to start method body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L470	 ;
.L506:
 ; D:\TC\src\parser.c:298:                     size += 1;
	addq	$1, 120(%rsp)	 ;, %sfp
	jmp	.L505	 ;
	.p2align 4,,10
	.p2align 3
.L639:
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC82(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp809
 ; D:\TC\src\parser.c:243:             parser_error("Failed to parse method body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L496	 ;
.L631:
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movl	$2, %edx	 ;,
	leaq	.LC90(%rip), %rcx	 ;, tmp657
	call	create_string	 ;
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%r8d, %r8d	 ;
	xorl	%ecx, %ecx	 ;
	movq	$0, 32(%rsp)	 ;,
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %rdx	 ; tmp860, _341
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	create_primary	 ;
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	xorl	%r9d, %r9d	 ;
	xorl	%edx, %edx	 ;
	movl	$19, %ecx	 ;,
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	movq	%rax, %r8	 ;, tmp861
 ; D:\TC\src\parser.c:346:             Expression* right = mb->content.variable->value != NULL ? mb->content.variable->value : create_expression(OP_NONE, NULL, create_primary(PRIM_INTEGER, create_string("0", 2), NULL, NULL, NULL), NULL);
	call	create_expression	 ;
	movq	%rax, %r9	 ; tmp862, _340
	jmp	.L522	 ;
.L476:
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	(%rdi), %rdx	 ; SELF_KEYWORD, SELF_KEYWORD
	movq	(%rax), %rcx	 ; token_395->lexeme, token_395->lexeme
	movq	%r10, 64(%rsp)	 ; token, %sfp
	call	string_equal	 ;
 ; D:\TC\src\parser.c:207:     if (token->type != KEYWORD || !string_equal(token->lexeme, SELF_KEYWORD))
	movq	64(%rsp), %r10	 ; %sfp, token
	testb	%al, %al	 ; tmp790
	je	.L478	 ;,
	jmp	.L477	 ;
.L638:
 ; D:\TC\src\parser.c:251:     parser->in_function = false;
	xorl	%r8d, %r8d	 ;
	movq	168(%rsp), %r10	 ; %sfp, token
	movq	128(%rsp), %rbp	 ; %sfp, method_scope
	movw	%r8w, 8(%r15)	 ;, MEM <vector(2) char> [(char *)parser_74(D) + 8B]
 ; D:\TC\src\parser.c:253:     if (!have_return && return_type != name_void)
	testb	%bl, %bl	 ; have_return
	jne	.L498	 ;,
 ; D:\TC\src\parser.c:253:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp603
 ; D:\TC\src\parser.c:253:     if (!have_return && return_type != name_void)
	movq	136(%rsp), %rbx	 ; %sfp, return_type
	cmpq	(%rax), %rbx	 ; name_void, return_type
	je	.L498	 ;,
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%r10, 128(%rsp)	 ; token, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC83(%rip), %rcx	 ;, tmp605
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp813
 ; D:\TC\src\parser.c:254:         parser_error("Method missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	128(%rsp), %r10	 ; %sfp, token
.L498:
 ; D:\TC\src\parser.c:256:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	64(%rsp), %rax	 ; %sfp, body
	movq	%rbp, 40(%rsp)	 ; method_scope,
	movq	160(%rsp), %rdx	 ; %sfp,
	movq	144(%rsp), %r9	 ; %sfp,
	movq	%r10, 128(%rsp)	 ; token, %sfp
	movq	%rax, 32(%rsp)	 ; body,
	movq	136(%rsp), %r8	 ; %sfp,
	movq	152(%rsp), %rcx	 ; %sfp,
	call	create_method_use_ptr	 ;
 ; D:\TC\src\parser.c:283:             if (method == NULL)
	movq	128(%rsp), %r10	 ; %sfp, token
	testq	%rax, %rax	 ; _456
 ; D:\TC\src\parser.c:256:     return create_method_use_ptr(method, name, return_type, parameters, body, method_scope);
	movq	%rax, %rdx	 ; tmp814, _456
 ; D:\TC\src\parser.c:283:             if (method == NULL)
	jne	.L499	 ;,
	jmp	.L470	 ;
	.p2align 4,,10
	.p2align 3
.L619:
 ; D:\TC\src\parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	call	__getreent	 ;
 ; D:\TC\src\parser.c:91:         fprintf(stderr, "Failed to import module '%s' from source '%s'\n", import_name, source);
	movq	%rsi, %r9	 ; source,
	movq	%rdi, %r8	 ; import_name,
	leaq	.LC56(%rip), %rdx	 ;, tmp484
	movq	24(%rax), %rcx	 ; _127->_stderr, _127->_stderr
	call	fprintf	 ;
 ; D:\TC\src\parser.c:92:         name = create_symbol(import_name, SYMBOL_VARIABLE, name_void, now_scope);
	movq	.refptr.name_void(%rip), %rax	 ;, tmp485
	movq	72(%rsp), %r9	 ; %sfp,
	movq	%rdi, %rcx	 ; import_name,
	movl	$3, %edx	 ;,
	movq	(%rax), %r8	 ; name_void,
	call	create_symbol	 ;
	movq	%rax, %rcx	 ; tmp718, name
	jmp	.L429	 ;
.L620:
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC59(%rip), %rcx	 ;, tmp497
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp728
 ; D:\TC\src\parser.c:109:         parser_error("Unknown function return type", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L435	 ;
.L624:
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%r13, %rdx	 ; token,
	leaq	.LC73(%rip), %rcx	 ;, tmp559
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp779
 ; D:\TC\src\parser.c:187:         parser_error("Unknown return type for method", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	64(%rsp), %r10	 ; %sfp, token
	jmp	.L470	 ;
.L425:
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
	call	get_next_token	 ;
 ; D:\TC\src\parser.c:75:         if (token->type != STRING) {
	cmpl	$4, 24(%rax)	 ;, token_111->type
 ; D:\TC\src\parser.c:74:         token = get_next_token(lexer, true);
	movq	%rax, %rbx	 ; tmp711, token
 ; D:\TC\src\parser.c:75:         if (token->type != STRING) {
	jne	.L640	 ;,
 ; D:\TC\src\parser.c:81:         token = get_next_token(lexer, true);
	movl	$1, %edx	 ;,
	movq	%r14, %rcx	 ; lexer,
 ; D:\TC\src\parser.c:80:         source = token->lexeme;
	movq	(%rax), %rsi	 ; token_111->lexeme, source
 ; D:\TC\src\parser.c:81:         token = get_next_token(lexer, true);
	call	get_next_token	 ;
	movq	%rax, %rbx	 ; tmp713, token
	jmp	.L606	 ;
.L633:
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	movq	%rax, 104(%rsp)	 ; statement, %sfp
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC66(%rip), %rcx	 ;,
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp753
 ; D:\TC\src\parser.c:160:             parser_error("Failed to parse function body statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	movq	104(%rsp), %r9	 ; %sfp, statement
	jmp	.L456	 ;
.L635:
	movq	%r12, %r10	 ; token, token
	movq	%r13, %r12	 ; tmp667, tmp667
	jmp	.L491	 ;
.L632:
 ; D:\TC\src\parser.c:168:     parser->in_function = false;
	movb	$0, 8(%r15)	 ;, parser_74(D)->in_function
	movq	112(%rsp), %rbp	 ; %sfp, return_type
 ; D:\TC\src\parser.c:169:     if (!have_return && return_type != name_void)
	testb	%sil, %sil	 ; have_return
	jne	.L458	 ;,
 ; D:\TC\src\parser.c:169:     if (!have_return && return_type != name_void)
	movq	.refptr.name_void(%rip), %rax	 ;, tmp533
 ; D:\TC\src\parser.c:169:     if (!have_return && return_type != name_void)
	cmpq	(%rax), %rbp	 ; name_void, return_type
	je	.L458	 ;,
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC68(%rip), %rcx	 ;, tmp535
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp757
 ; D:\TC\src\parser.c:170:         parser_error("Function missing return statement", token, get_full_path(parser->source_file));
	call	parser_error	 ;
.L458:
 ; D:\TC\src\parser.c:172:     return create_function_use_ptr(function, name, return_type, parameters, body, function_scope);
	movq	%rdi, 40(%rsp)	 ; function_scope,
	movq	64(%rsp), %r9	 ; %sfp,
	movq	%rbp, %r8	 ; return_type,
	movq	96(%rsp), %rdx	 ; %sfp,
	movq	88(%rsp), %rcx	 ; %sfp,
	movq	%r12, 32(%rsp)	 ; body,
	call	create_function_use_ptr	 ;
	movq	%rax, %r8	 ; tmp758, _212
 ; D:\TC\src\parser.c:46:             if (function == NULL)
	testq	%rax, %rax	 ; _212
	jne	.L459	 ;,
	jmp	.L435	 ;
	.p2align 4,,10
	.p2align 3
.L451:
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC65(%rip), %rcx	 ;, tmp522
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp748
 ; D:\TC\src\parser.c:149:         parser_error("Expected '{' to start function body", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L435	 ;
.L640:
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	(%r15), %rcx	 ; parser_74(D)->source_file, parser_74(D)->source_file
	call	get_full_path	 ;
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rbx, %rdx	 ; token,
	leaq	.LC54(%rip), %rcx	 ;, tmp476
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	movq	%rax, %r8	 ;, tmp712
 ; D:\TC\src\parser.c:76:             parser_error("Expected string literal after 'from'", token, get_full_path(parser->source_file));
	call	parser_error	 ;
	jmp	.L423	 ;
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
	.def	make_method_name;	.scl	2;	.type	32;	.endef
	.def	search_name_use_strcmp;	.scl	2;	.type	32;	.endef
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
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	create_class_member;	.scl	2;	.type	32;	.endef
	.def	create_code;	.scl	2;	.type	32;	.endef
	.def	parse_import_file;	.scl	2;	.type	32;	.endef
	.def	create_import;	.scl	2;	.type	32;	.endef
	.def	create_code_member;	.scl	2;	.type	32;	.endef
	.def	list_copy;	.scl	2;	.type	32;	.endef
	.def	list_pop;	.scl	2;	.type	32;	.endef
	.def	create_method_use_ptr;	.scl	2;	.type	32;	.endef
	.def	create_class_use_ptr;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	create_function_use_ptr;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr.DEFAULT_INIT_NAME, "dr"
	.globl	.refptr.DEFAULT_INIT_NAME
	.linkonce	discard
.refptr.DEFAULT_INIT_NAME:
	.quad	DEFAULT_INIT_NAME
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
	.section	.rdata$.refptr.DEFAULT_CONSTRUCTOR_NAME, "dr"
	.globl	.refptr.DEFAULT_CONSTRUCTOR_NAME
	.linkonce	discard
.refptr.DEFAULT_CONSTRUCTOR_NAME:
	.quad	DEFAULT_CONSTRUCTOR_NAME
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

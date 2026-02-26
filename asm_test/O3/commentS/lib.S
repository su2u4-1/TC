	.file	"D:\\TC\\src\\lib.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3
	.text
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "Fatal: Cannot allocate memory\12\0"
	.text
	.p2align 4
	.def	increase_memory_size;	.scl	3;	.type	32;	.endef
	.seh_proc	increase_memory_size
increase_memory_size:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\lib.c:78: static void increase_memory_size(bool for_struct) {
	movl	%ecx, %esi	 ; tmp110, for_struct
 ; D:\TC\src\lib.c:79:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
	movq	%rax, %rbx	 ; tmp111, new_block
 ; D:\TC\src\lib.c:80:     if (new_block == NULL) {
	testq	%rax, %rax	 ; new_block
	je	.L12	 ;,
 ; D:\TC\src\lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:93:     new_block->size = defaultMemorySize;
	movdqa	.LC1(%rip), %xmm0	 ;, tmp107
 ; D:\TC\src\lib.c:95:     new_block->next = NULL;
	movq	$0, 16(%rbx)	 ;, new_block_18->next
 ; D:\TC\src\lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	 ; tmp113, new_block_18->block
 ; D:\TC\src\lib.c:93:     new_block->size = defaultMemorySize;
	movups	%xmm0, (%rbx)	 ; tmp107, MEM <vector(2) long unsigned int> [(long unsigned int *)new_block_18]
 ; D:\TC\src\lib.c:96:     if (for_struct) {
	testb	%sil, %sil	 ; for_struct
	jne	.L13	 ;,
 ; D:\TC\src\lib.c:105:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	 ; string_memory, struct_memory.10_2
 ; D:\TC\src\lib.c:108:         string_memory_count += defaultMemorySize;
	addq	$1024, string_memory_count(%rip)	 ;, string_memory_count
 ; D:\TC\src\lib.c:107:         string_memory = new_block;
	movq	%rbx, string_memory(%rip)	 ; new_block, string_memory
 ; D:\TC\src\lib.c:105:         string_memory_used += string_memory->used;
	movq	8(%rax), %rdx	 ; string_memory.14_9->used, string_memory.14_9->used
	addq	%rdx, string_memory_used(%rip)	 ; string_memory.14_9->used, string_memory_used
	movq	%rax, 16(%rbx)	 ; struct_memory.10_2, new_block_18->next
 ; D:\TC\src\lib.c:113: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L13:
 ; D:\TC\src\lib.c:97:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory.10_2
 ; D:\TC\src\lib.c:100:         struct_memory_count += defaultMemorySize;
	addq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
 ; D:\TC\src\lib.c:99:         struct_memory = new_block;
	movq	%rbx, struct_memory(%rip)	 ; new_block, struct_memory
 ; D:\TC\src\lib.c:97:         struct_memory_used += struct_memory->used;
	movq	8(%rax), %rdx	 ; struct_memory.10_2->used, struct_memory.10_2->used
	addq	%rdx, struct_memory_used(%rip)	 ; struct_memory.10_2->used, struct_memory_used
	movq	%rax, 16(%rbx)	 ; struct_memory.10_2, new_block_18->next
 ; D:\TC\src\lib.c:113: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
.L12:
 ; D:\TC\src\lib.c:81:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:81:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp104
	movq	24(%rax), %r9	 ; _33->_stderr,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:82:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rbx	 ; string_memory, next
 ; D:\TC\src\lib.c:83:         while (current != NULL) {
	testq	%rbx, %rbx	 ; next
	je	.L3	 ;,
.L4:
	movq	%rbx, %rsi	 ; next, current
 ; D:\TC\src\lib.c:84:             MemoryBlock* next = current->next;
	movq	16(%rbx), %rbx	 ; current_47->next, next
 ; D:\TC\src\lib.c:85:             free(current->block);
	movq	24(%rsi), %rcx	 ; current_49->block, current_49->block
	call	free	 ;
 ; D:\TC\src\lib.c:86:             free(current);
	movq	%rsi, %rcx	 ; current,
	call	free	 ;
 ; D:\TC\src\lib.c:83:         while (current != NULL) {
	testq	%rbx, %rbx	 ; next
	jne	.L4	 ;,
.L3:
 ; D:\TC\src\lib.c:90:         exit(1);
	movl	$1, %ecx	 ;,
 ; D:\TC\src\lib.c:89:         initialized = false;
	movb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:90:         exit(1);
	call	exit	 ;
	nop	
	.seh_endproc
	.p2align 4
	.globl	init
	.def	init;	.scl	2;	.type	32;	.endef
	.seh_proc	init
init:
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
 ; D:\TC\src\lib.c:165:     if (initialized) return;
	cmpb	$0, initialized(%rip)	 ;, initialized
	jne	.L14	 ;,
 ; D:\TC\src\lib.c:166:     if (struct_memory == NULL) {
	cmpq	$0, struct_memory(%rip)	 ;, struct_memory
	je	.L31	 ;,
 ; D:\TC\src\lib.c:179:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	 ;, string_memory
	je	.L32	 ;,
.L18:
	leaq	keywordStrings(%rip), %rbx	 ;, ivtmp.104
 ; D:\TC\src\lib.c:192:     initialized = true;
	movl	$1, %edi	 ;, pretmp_204
	movl	$6, %edx	 ;, _28
	movb	$1, initialized(%rip)	 ;, initialized
	leaq	keywordList(%rip), %rsi	 ;, ivtmp.106
	leaq	176(%rbx), %rbp	 ;, _202
	jmp	.L25	 ;
	.p2align 4,,10
	.p2align 3
.L20:
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	testq	%rdx, %rdx	 ; _28
	je	.L21	 ;,
.L33:
	call	create_string_check.part.0	 ;
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rbx	 ;, ivtmp.104
	addq	$8, %rsi	 ;, ivtmp.106
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	movzbl	initialized(%rip), %edi	 ; initialized, pretmp_204
 ; D:\TC\src\lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	%rax, -8(%rsi)	 ; tmp297, MEM[(char * *)_37]
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	%rbx, %rbp	 ; ivtmp.104, _202
	je	.L23	 ;,
.L22:
 ; D:\TC\src\lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	(%rbx), %rcx	 ; MEM[(const char * *)_203], MEM[(const char * *)_203]
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp298, _28
.L25:
	movq	(%rbx), %rcx	 ; MEM[(const char * *)_4], _29
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	testb	%dil, %dil	 ; pretmp_204
	jne	.L20	 ;,
	movq	%rcx, 40(%rsp)	 ; _29, %sfp
	movq	%rdx, 32(%rsp)	 ; _28, %sfp
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	call	init	 ;
	movq	32(%rsp), %rdx	 ; %sfp, _28
	movq	40(%rsp), %rcx	 ; %sfp, _29
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	testq	%rdx, %rdx	 ; _28
	jne	.L33	 ;,
	.p2align 4,,10
	.p2align 3
.L21:
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rbx	 ;, ivtmp.104
 ; D:\TC\src\lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	$0, (%rsi)	 ;, MEM[(char * *)_200]
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	movzbl	initialized(%rip), %edi	 ; initialized, pretmp_204
 ; D:\TC\src\lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rsi	 ;, ivtmp.106
	cmpq	%rbp, %rbx	 ; _202, ivtmp.104
	jne	.L22	 ;,
	.p2align 4,,10
	.p2align 3
.L23:
	leaq	symbolStrings(%rip), %rbx	 ;, ivtmp.83
	leaq	symbolList(%rip), %rsi	 ;, ivtmp.85
 ; D:\TC\src\lib.c:192:     initialized = true;
	movl	$1, %edx	 ;, prephitmp_113
	leaq	240(%rbx), %rdi	 ;, _104
	jmp	.L24	 ;
	.p2align 4,,10
	.p2align 3
.L26:
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	testq	%rdx, %rdx	 ; prephitmp_113
	je	.L27	 ;,
.L34:
	call	create_string_check.part.0	 ;
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$8, %rbx	 ;, ivtmp.83
	addq	$8, %rsi	 ;, ivtmp.85
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	%rax, -8(%rsi)	 ; tmp299, MEM[(char * *)_91]
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	cmpq	%rbx, %rdi	 ; ivtmp.83, _104
	je	.L29	 ;,
.L28:
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	(%rbx), %rcx	 ; MEM[(const char * *)_95], MEM[(const char * *)_95]
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp300, prephitmp_113
.L24:
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	(%rbx), %rcx	 ; MEM[(const char * *)_111], _34
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	jne	.L26	 ;,
	movq	%rdx, 40(%rsp)	 ; prephitmp_113, %sfp
	movq	%rcx, 32(%rsp)	 ; _34, %sfp
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	call	init	 ;
	movq	40(%rsp), %rdx	 ; %sfp, prephitmp_113
	movq	32(%rsp), %rcx	 ; %sfp, _34
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	testq	%rdx, %rdx	 ; prephitmp_113
	jne	.L34	 ;,
	.p2align 4,,10
	.p2align 3
.L27:
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$8, %rbx	 ;, ivtmp.83
 ; D:\TC\src\lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	$0, (%rsi)	 ;, MEM[(char * *)_109]
 ; D:\TC\src\lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$8, %rsi	 ;, ivtmp.85
	cmpq	%rbx, %rdi	 ; ivtmp.83, _104
	jne	.L28	 ;,
	.p2align 4,,10
	.p2align 3
.L29:
 ; D:\TC\src\lib.c:197:     IMPORT_KEYWORD = keywordList[0];
	movq	keywordList(%rip), %rax	 ; keywordList[0], keywordList[0]
	movq	%rax, IMPORT_KEYWORD(%rip)	 ; keywordList[0], IMPORT_KEYWORD
 ; D:\TC\src\lib.c:198:     FROM_KEYWORD = keywordList[1];
	movq	8+keywordList(%rip), %rax	 ; keywordList[1], keywordList[1]
	movq	%rax, FROM_KEYWORD(%rip)	 ; keywordList[1], FROM_KEYWORD
 ; D:\TC\src\lib.c:199:     FUNC_KEYWORD = keywordList[2];
	movq	16+keywordList(%rip), %rax	 ; keywordList[2], keywordList[2]
	movq	%rax, FUNC_KEYWORD(%rip)	 ; keywordList[2], FUNC_KEYWORD
 ; D:\TC\src\lib.c:200:     CLASS_KEYWORD = keywordList[3];
	movq	24+keywordList(%rip), %rax	 ; keywordList[3], keywordList[3]
	movq	%rax, CLASS_KEYWORD(%rip)	 ; keywordList[3], CLASS_KEYWORD
 ; D:\TC\src\lib.c:201:     METHOD_KEYWORD = keywordList[4];
	movq	32+keywordList(%rip), %rax	 ; keywordList[4], keywordList[4]
	movq	%rax, METHOD_KEYWORD(%rip)	 ; keywordList[4], METHOD_KEYWORD
 ; D:\TC\src\lib.c:202:     SELF_KEYWORD = keywordList[5];
	movq	40+keywordList(%rip), %rax	 ; keywordList[5], keywordList[5]
	movq	%rax, SELF_KEYWORD(%rip)	 ; keywordList[5], SELF_KEYWORD
 ; D:\TC\src\lib.c:203:     IF_KEYWORD = keywordList[6];
	movq	48+keywordList(%rip), %rax	 ; keywordList[6], keywordList[6]
	movq	%rax, IF_KEYWORD(%rip)	 ; keywordList[6], IF_KEYWORD
 ; D:\TC\src\lib.c:204:     ELIF_KEYWORD = keywordList[7];
	movq	56+keywordList(%rip), %rax	 ; keywordList[7], keywordList[7]
	movq	%rax, ELIF_KEYWORD(%rip)	 ; keywordList[7], ELIF_KEYWORD
 ; D:\TC\src\lib.c:205:     ELSE_KEYWORD = keywordList[8];
	movq	64+keywordList(%rip), %rax	 ; keywordList[8], keywordList[8]
	movq	%rax, ELSE_KEYWORD(%rip)	 ; keywordList[8], ELSE_KEYWORD
 ; D:\TC\src\lib.c:206:     WHILE_KEYWORD = keywordList[9];
	movq	72+keywordList(%rip), %rax	 ; keywordList[9], keywordList[9]
	movq	%rax, WHILE_KEYWORD(%rip)	 ; keywordList[9], WHILE_KEYWORD
 ; D:\TC\src\lib.c:207:     FOR_KEYWORD = keywordList[10];
	movq	80+keywordList(%rip), %rax	 ; keywordList[10], keywordList[10]
	movq	%rax, FOR_KEYWORD(%rip)	 ; keywordList[10], FOR_KEYWORD
 ; D:\TC\src\lib.c:208:     TRUE_KEYWORD = keywordList[11];
	movq	88+keywordList(%rip), %rax	 ; keywordList[11], keywordList[11]
	movq	%rax, TRUE_KEYWORD(%rip)	 ; keywordList[11], TRUE_KEYWORD
 ; D:\TC\src\lib.c:209:     FALSE_KEYWORD = keywordList[12];
	movq	96+keywordList(%rip), %rax	 ; keywordList[12], keywordList[12]
	movq	%rax, FALSE_KEYWORD(%rip)	 ; keywordList[12], FALSE_KEYWORD
 ; D:\TC\src\lib.c:210:     RETURN_KEYWORD = keywordList[13];
	movq	104+keywordList(%rip), %rax	 ; keywordList[13], keywordList[13]
	movq	%rax, RETURN_KEYWORD(%rip)	 ; keywordList[13], RETURN_KEYWORD
 ; D:\TC\src\lib.c:211:     BREAK_KEYWORD = keywordList[14];
	movq	112+keywordList(%rip), %rax	 ; keywordList[14], keywordList[14]
	movq	%rax, BREAK_KEYWORD(%rip)	 ; keywordList[14], BREAK_KEYWORD
 ; D:\TC\src\lib.c:212:     CONTINUE_KEYWORD = keywordList[15];
	movq	120+keywordList(%rip), %rax	 ; keywordList[15], keywordList[15]
	movq	%rax, CONTINUE_KEYWORD(%rip)	 ; keywordList[15], CONTINUE_KEYWORD
 ; D:\TC\src\lib.c:213:     INT_KEYWORD = keywordList[16];
	movq	128+keywordList(%rip), %rax	 ; keywordList[16], keywordList[16]
	movq	%rax, INT_KEYWORD(%rip)	 ; keywordList[16], INT_KEYWORD
 ; D:\TC\src\lib.c:214:     FLOAT_KEYWORD = keywordList[17];
	movq	136+keywordList(%rip), %rax	 ; keywordList[17], keywordList[17]
	movq	%rax, FLOAT_KEYWORD(%rip)	 ; keywordList[17], FLOAT_KEYWORD
 ; D:\TC\src\lib.c:215:     STRING_KEYWORD = keywordList[18];
	movq	144+keywordList(%rip), %rax	 ; keywordList[18], keywordList[18]
	movq	%rax, STRING_KEYWORD(%rip)	 ; keywordList[18], STRING_KEYWORD
 ; D:\TC\src\lib.c:216:     BOOL_KEYWORD = keywordList[19];
	movq	152+keywordList(%rip), %rax	 ; keywordList[19], keywordList[19]
	movq	%rax, BOOL_KEYWORD(%rip)	 ; keywordList[19], BOOL_KEYWORD
 ; D:\TC\src\lib.c:217:     VOID_KEYWORD = keywordList[20];
	movq	160+keywordList(%rip), %rax	 ; keywordList[20], keywordList[20]
	movq	%rax, VOID_KEYWORD(%rip)	 ; keywordList[20], VOID_KEYWORD
 ; D:\TC\src\lib.c:218:     VAR_KEYWORD = keywordList[21];
	movq	168+keywordList(%rip), %rax	 ; keywordList[21], keywordList[21]
	movq	%rax, VAR_KEYWORD(%rip)	 ; keywordList[21], VAR_KEYWORD
 ; D:\TC\src\lib.c:219:     L_PAREN_SYMBOL = symbolList[0];
	movq	symbolList(%rip), %rax	 ; symbolList[0], symbolList[0]
	movq	%rax, L_PAREN_SYMBOL(%rip)	 ; symbolList[0], L_PAREN_SYMBOL
 ; D:\TC\src\lib.c:220:     R_PAREN_SYMBOL = symbolList[1];
	movq	8+symbolList(%rip), %rax	 ; symbolList[1], symbolList[1]
	movq	%rax, R_PAREN_SYMBOL(%rip)	 ; symbolList[1], R_PAREN_SYMBOL
 ; D:\TC\src\lib.c:221:     L_BRACE_SYMBOL = symbolList[2];
	movq	16+symbolList(%rip), %rax	 ; symbolList[2], symbolList[2]
	movq	%rax, L_BRACE_SYMBOL(%rip)	 ; symbolList[2], L_BRACE_SYMBOL
 ; D:\TC\src\lib.c:222:     R_BRACE_SYMBOL = symbolList[3];
	movq	24+symbolList(%rip), %rax	 ; symbolList[3], symbolList[3]
	movq	%rax, R_BRACE_SYMBOL(%rip)	 ; symbolList[3], R_BRACE_SYMBOL
 ; D:\TC\src\lib.c:223:     COMMA_SYMBOL = symbolList[4];
	movq	32+symbolList(%rip), %rax	 ; symbolList[4], symbolList[4]
	movq	%rax, COMMA_SYMBOL(%rip)	 ; symbolList[4], COMMA_SYMBOL
 ; D:\TC\src\lib.c:224:     NOT_SYMBOL = symbolList[5];
	movq	40+symbolList(%rip), %rax	 ; symbolList[5], symbolList[5]
	movq	%rax, NOT_SYMBOL(%rip)	 ; symbolList[5], NOT_SYMBOL
 ; D:\TC\src\lib.c:225:     DOT_SYMBOL = symbolList[6];
	movq	48+symbolList(%rip), %rax	 ; symbolList[6], symbolList[6]
	movq	%rax, DOT_SYMBOL(%rip)	 ; symbolList[6], DOT_SYMBOL
 ; D:\TC\src\lib.c:226:     L_BRACKET_SYMBOL = symbolList[7];
	movq	56+symbolList(%rip), %rax	 ; symbolList[7], symbolList[7]
	movq	%rax, L_BRACKET_SYMBOL(%rip)	 ; symbolList[7], L_BRACKET_SYMBOL
 ; D:\TC\src\lib.c:227:     R_BRACKET_SYMBOL = symbolList[8];
	movq	64+symbolList(%rip), %rax	 ; symbolList[8], symbolList[8]
	movq	%rax, R_BRACKET_SYMBOL(%rip)	 ; symbolList[8], R_BRACKET_SYMBOL
 ; D:\TC\src\lib.c:228:     SEMICOLON_SYMBOL = symbolList[9];
	movq	72+symbolList(%rip), %rax	 ; symbolList[9], symbolList[9]
	movq	%rax, SEMICOLON_SYMBOL(%rip)	 ; symbolList[9], SEMICOLON_SYMBOL
 ; D:\TC\src\lib.c:229:     UNDERLINE_SYMBOL = symbolList[10];
	movq	80+symbolList(%rip), %rax	 ; symbolList[10], symbolList[10]
	movq	%rax, UNDERLINE_SYMBOL(%rip)	 ; symbolList[10], UNDERLINE_SYMBOL
 ; D:\TC\src\lib.c:230:     ADD_SYMBOL = symbolList[11];
	movq	88+symbolList(%rip), %rax	 ; symbolList[11], symbolList[11]
	movq	%rax, ADD_SYMBOL(%rip)	 ; symbolList[11], ADD_SYMBOL
 ; D:\TC\src\lib.c:231:     SUB_SYMBOL = symbolList[12];
	movq	96+symbolList(%rip), %rax	 ; symbolList[12], symbolList[12]
	movq	%rax, SUB_SYMBOL(%rip)	 ; symbolList[12], SUB_SYMBOL
 ; D:\TC\src\lib.c:232:     MUL_SYMBOL = symbolList[13];
	movq	104+symbolList(%rip), %rax	 ; symbolList[13], symbolList[13]
	movq	%rax, MUL_SYMBOL(%rip)	 ; symbolList[13], MUL_SYMBOL
 ; D:\TC\src\lib.c:233:     DIV_SYMBOL = symbolList[14];
	movq	112+symbolList(%rip), %rax	 ; symbolList[14], symbolList[14]
	movq	%rax, DIV_SYMBOL(%rip)	 ; symbolList[14], DIV_SYMBOL
 ; D:\TC\src\lib.c:234:     MOD_SYMBOL = symbolList[15];
	movq	120+symbolList(%rip), %rax	 ; symbolList[15], symbolList[15]
	movq	%rax, MOD_SYMBOL(%rip)	 ; symbolList[15], MOD_SYMBOL
 ; D:\TC\src\lib.c:235:     LT_SYMBOL = symbolList[16];
	movq	128+symbolList(%rip), %rax	 ; symbolList[16], symbolList[16]
	movq	%rax, LT_SYMBOL(%rip)	 ; symbolList[16], LT_SYMBOL
 ; D:\TC\src\lib.c:236:     GT_SYMBOL = symbolList[17];
	movq	136+symbolList(%rip), %rax	 ; symbolList[17], symbolList[17]
	movq	%rax, GT_SYMBOL(%rip)	 ; symbolList[17], GT_SYMBOL
 ; D:\TC\src\lib.c:237:     ASSIGN_SYMBOL = symbolList[18];
	movq	144+symbolList(%rip), %rax	 ; symbolList[18], symbolList[18]
	movq	%rax, ASSIGN_SYMBOL(%rip)	 ; symbolList[18], ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:238:     EQ_SYMBOL = symbolList[19];
	movq	152+symbolList(%rip), %rax	 ; symbolList[19], symbolList[19]
	movq	%rax, EQ_SYMBOL(%rip)	 ; symbolList[19], EQ_SYMBOL
 ; D:\TC\src\lib.c:239:     NE_SYMBOL = symbolList[20];
	movq	160+symbolList(%rip), %rax	 ; symbolList[20], symbolList[20]
	movq	%rax, NE_SYMBOL(%rip)	 ; symbolList[20], NE_SYMBOL
 ; D:\TC\src\lib.c:240:     LE_SYMBOL = symbolList[21];
	movq	168+symbolList(%rip), %rax	 ; symbolList[21], symbolList[21]
	movq	%rax, LE_SYMBOL(%rip)	 ; symbolList[21], LE_SYMBOL
 ; D:\TC\src\lib.c:241:     GE_SYMBOL = symbolList[22];
	movq	176+symbolList(%rip), %rax	 ; symbolList[22], symbolList[22]
	movq	%rax, GE_SYMBOL(%rip)	 ; symbolList[22], GE_SYMBOL
 ; D:\TC\src\lib.c:242:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	184+symbolList(%rip), %rax	 ; symbolList[23], symbolList[23]
	movq	%rax, ADD_ASSIGN_SYMBOL(%rip)	 ; symbolList[23], ADD_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:243:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	192+symbolList(%rip), %rax	 ; symbolList[24], symbolList[24]
	movq	%rax, SUB_ASSIGN_SYMBOL(%rip)	 ; symbolList[24], SUB_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:244:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	200+symbolList(%rip), %rax	 ; symbolList[25], symbolList[25]
	movq	%rax, MUL_ASSIGN_SYMBOL(%rip)	 ; symbolList[25], MUL_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	208+symbolList(%rip), %rax	 ; symbolList[26], symbolList[26]
	movq	%rax, DIV_ASSIGN_SYMBOL(%rip)	 ; symbolList[26], DIV_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	216+symbolList(%rip), %rax	 ; symbolList[27], symbolList[27]
	movq	%rax, MOD_ASSIGN_SYMBOL(%rip)	 ; symbolList[27], MOD_ASSIGN_SYMBOL
 ; D:\TC\src\lib.c:247:     AND_SYMBOL = symbolList[28];
	movq	224+symbolList(%rip), %rax	 ; symbolList[28], symbolList[28]
	movq	%rax, AND_SYMBOL(%rip)	 ; symbolList[28], AND_SYMBOL
 ; D:\TC\src\lib.c:248:     OR_SYMBOL = symbolList[29];
	movq	232+symbolList(%rip), %rax	 ; symbolList[29], symbolList[29]
	movq	%rax, OR_SYMBOL(%rip)	 ; symbolList[29], OR_SYMBOL
.L14:
 ; D:\TC\src\lib.c:249: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L31:
 ; D:\TC\src\lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, struct_memory(%rip)	 ; tmp169, struct_memory
 ; D:\TC\src\lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, %rbx	 ; tmp291, tmp169
 ; D:\TC\src\lib.c:168:         if (struct_memory == NULL) {
	testq	%rax, %rax	 ; tmp169
	je	.L30	 ;,
 ; D:\TC\src\lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:174:         struct_memory->size = defaultMemorySize;
	movdqa	.LC1(%rip), %xmm0	 ;, tmp173
 ; D:\TC\src\lib.c:179:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	 ;, string_memory
 ; D:\TC\src\lib.c:176:         struct_memory->next = NULL;
	movq	$0, 16(%rbx)	 ;, MEM[(struct MemoryBlock *)_3].next
 ; D:\TC\src\lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	 ; tmp293, MEM[(struct MemoryBlock *)_3].block
 ; D:\TC\src\lib.c:177:         struct_memory_count = defaultMemorySize;
	movq	$1024, struct_memory_count(%rip)	 ;, struct_memory_count
 ; D:\TC\src\lib.c:174:         struct_memory->size = defaultMemorySize;
	movups	%xmm0, (%rbx)	 ; tmp173, MEM <vector(2) long unsigned int> [(long unsigned int *)_3]
 ; D:\TC\src\lib.c:179:     if (string_memory == NULL) {
	jne	.L18	 ;,
.L32:
 ; D:\TC\src\lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, string_memory(%rip)	 ; tmp174, string_memory
 ; D:\TC\src\lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, %rbx	 ; tmp294, tmp174
 ; D:\TC\src\lib.c:181:         if (string_memory == NULL) {
	testq	%rax, %rax	 ; tmp174
	je	.L30	 ;,
 ; D:\TC\src\lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %ecx	 ;,
	call	malloc	 ;
 ; D:\TC\src\lib.c:187:         string_memory->size = defaultMemorySize;
	movdqa	.LC1(%rip), %xmm0	 ;, tmp178
 ; D:\TC\src\lib.c:189:         string_memory->next = NULL;
	movq	$0, 16(%rbx)	 ;, MEM[(struct MemoryBlock *)_24].next
 ; D:\TC\src\lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	 ; tmp296, MEM[(struct MemoryBlock *)_24].block
 ; D:\TC\src\lib.c:190:         string_memory_count = defaultMemorySize;
	movq	$1024, string_memory_count(%rip)	 ;, string_memory_count
 ; D:\TC\src\lib.c:187:         string_memory->size = defaultMemorySize;
	movups	%xmm0, (%rbx)	 ; tmp178, MEM <vector(2) long unsigned int> [(long unsigned int *)_24]
	jmp	.L18	 ;
.L30:
 ; D:\TC\src\lib.c:182:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:182:             fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp176
	movq	24(%rax), %r9	 ;,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:184:             exit(1);
	movl	$1, %ecx	 ;,
 ; D:\TC\src\lib.c:183:             initialized = false;
	movb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:184:             exit(1);
	call	exit	 ;
	nop	
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC2:
	.ascii "Info: Allocate big memory block of size %zu bytes\12\0"
	.align 8
.LC3:
	.ascii "struct_memory->used % ALIGN_SIZE == 0\0"
.LC4:
	.ascii "D:\\TC\\src\\lib.c\0"
	.text
	.p2align 4
	.def	create_string_check.part.0;	.scl	3;	.type	32;	.endef
	.seh_proc	create_string_check.part.0
create_string_check.part.0:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\lib.c:127: static string create_string_check(const char* data, size_t length, bool check) {
	movq	%rcx, %rdi	 ; tmp132, data
	movq	%rdx, %rbx	 ; tmp133, length
 ; D:\TC\src\lib.c:142:     if (length >= defaultMemorySize - 1)
	cmpq	$1022, %rdx	 ;, length
	ja	.L42	 ;,
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rdx	 ; string_memory, string_memory.1_4
	movq	8(%rdx), %rcx	 ; string_memory.1_4->used, _5
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	leaq	(%rbx,%rcx), %rax	 ;, tmp120
 ; D:\TC\src\lib.c:145:         if (string_memory->used + length >= string_memory->size)
	cmpq	(%rdx), %rax	 ; string_memory.1_4->size, tmp120
	jnb	.L43	 ;,
.L38:
 ; D:\TC\src\lib.c:148:         string_memory->used += length + 1;
	leaq	1(%rcx,%rbx), %rax	 ;, tmp123
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	24(%rdx), %rsi	 ; prephitmp_86->block, <retval>
 ; D:\TC\src\lib.c:148:         string_memory->used += length + 1;
	movq	%rax, 8(%rdx)	 ; tmp123, prephitmp_86->used
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	addq	%rcx, %rsi	 ; _5, <retval>
.L37:
 ; D:\TC\src\lib.c:150:     strncpy(str, data, length);
	movq	%rbx, %r8	 ; length,
	movq	%rdi, %rdx	 ; data,
	movq	%rsi, %rcx	 ; <retval>,
	call	strncpy	 ;
 ; D:\TC\src\lib.c:151:     str[length] = '\0';
	movb	$0, (%rsi,%rbx)	 ;, *_16
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L44	 ;,
.L39:
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %r8	 ; struct_memory, struct_memory.32_43
	movq	8(%r8), %rdx	 ; struct_memory.32_43->used, _44
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	leaq	24(%rdx), %rax	 ;, tmp124
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	(%r8), %rax	 ; struct_memory.32_43->size, tmp124
	jnb	.L45	 ;,
.L40:
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	testb	$7, %dl	 ;, _44
	jne	.L46	 ;,
 ; D:\TC\src\lib.c:261:     ++memoryBlockCount;
	addq	$1, memoryBlockCount(%rip)	 ;, memoryBlockCount
 ; D:\TC\src\lib.c:155:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rax	 ; all_string_list, all_string_list
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	%rdx, %rcx	 ; _44, tmp127
 ; D:\TC\src\lib.c:260:     struct_memory->used += size;
	addq	$24, %rdx	 ;, tmp129
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	andq	$-8, %rcx	 ;, tmp127
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	addq	24(%r8), %rcx	 ; prephitmp_90->block, ptr
 ; D:\TC\src\lib.c:260:     struct_memory->used += size;
	movq	%rdx, 8(%r8)	 ; tmp129, prephitmp_90->used
 ; D:\TC\src\lib.c:155:     new_str->next = all_string_list;
	movq	%rax, 16(%rcx)	 ; all_string_list, MEM[(struct StringList *)ptr_54].next
 ; D:\TC\src\lib.c:158: }
	movq	%rsi, %rax	 ; <retval>,
 ; D:\TC\src\lib.c:153:     new_str->str = str;
	movq	%rsi, (%rcx)	 ; <retval>, MEM[(struct StringList *)ptr_54].str
 ; D:\TC\src\lib.c:154:     new_str->length = length;
	movq	%rbx, 8(%rcx)	 ; length, MEM[(struct StringList *)ptr_54].length
 ; D:\TC\src\lib.c:156:     all_string_list = new_str;
	movq	%rcx, all_string_list(%rip)	 ; ptr, all_string_list
 ; D:\TC\src\lib.c:158: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:\TC\src\lib.c:146:             increase_memory_size(false);
	xorl	%ecx, %ecx	 ;
	call	increase_memory_size	 ;
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rdx	 ; string_memory, string_memory.1_4
 ; D:\TC\src\lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	8(%rdx), %rcx	 ; pretmp_85->used, _5
	jmp	.L38	 ;
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:\TC\src\lib.c:143:         str = alloc_big_memory(length + 1);
	leaq	1(%rdx), %rbp	 ;, _2
 ; D:\TC\src\lib.c:116:     string_memory_count += size;
	addq	%rbp, string_memory_count(%rip)	 ; _2, string_memory_count
 ; D:\TC\src\lib.c:118:     char* block = (char*)malloc(size);
	movq	%rbp, %rcx	 ; _2,
 ; D:\TC\src\lib.c:117:     string_memory_used += size;
	addq	%rbp, string_memory_used(%rip)	 ; _2, string_memory_used
 ; D:\TC\src\lib.c:118:     char* block = (char*)malloc(size);
	call	malloc	 ;
	movq	%rax, %rsi	 ; tmp134, tmp115
 ; D:\TC\src\lib.c:119:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	call	__getreent	 ;
 ; D:\TC\src\lib.c:119:     fprintf(stderr, "Info: Allocate big memory block of size %zu bytes\n", size);
	movq	%rbp, %r8	 ; _2,
	leaq	.LC2(%rip), %rdx	 ;, tmp117
	movq	24(%rax), %rcx	 ; _38->_stderr, _38->_stderr
	call	fprintf	 ;
 ; D:\TC\src\lib.c:120:     if (block == NULL) {
	testq	%rsi, %rsi	 ; <retval>
	jne	.L37	 ;,
 ; D:\TC\src\lib.c:121:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	call	__getreent	 ;
 ; D:\TC\src\lib.c:121:         fprintf(stderr, "Fatal: Cannot allocate memory\n");
	movl	$30, %r8d	 ;,
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp119
	movq	24(%rax), %r9	 ; _40->_stderr,
	call	fwrite	 ;
 ; D:\TC\src\lib.c:122:         exit(1);
	movl	$1, %ecx	 ;,
	call	exit	 ;
	.p2align 4,,10
	.p2align 3
.L45:
 ; D:\TC\src\lib.c:256:         increase_memory_size(true);
	movl	$1, %ecx	 ;,
	call	increase_memory_size	 ;
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	movq	struct_memory(%rip), %r8	 ; struct_memory, struct_memory.32_43
	movq	8(%r8), %rdx	 ; pretmp_89->used, _44
	jmp	.L40	 ;
	.p2align 4,,10
	.p2align 3
.L44:
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	call	init	 ;
	jmp	.L39	 ;
.L46:
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$258, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp126
	call	__assert_func	 ;
	nop	
	.seh_endproc
	.p2align 4
	.globl	create_string
	.def	create_string;	.scl	2;	.type	32;	.endef
	.seh_proc	create_string
create_string:
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
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:160: string create_string(const char* data, size_t length) {
	movq	%rcx, %rbp	 ; tmp98, data
	movq	%rdx, %rsi	 ; tmp99, length
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	je	.L62	 ;,
.L48:
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	testq	%rbp, %rbp	 ; data
	je	.L53	 ;,
	testq	%rsi, %rsi	 ; length
	je	.L53	 ;,
 ; D:\TC\src\lib.c:131:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %rbx	 ; all_string_list, current
 ; D:\TC\src\lib.c:133:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L50	 ;,
 ; D:\TC\src\lib.c:132:         string existing = NULL;
	xorl	%r12d, %r12d	 ; <retval>
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L51:
 ; D:\TC\src\lib.c:136:             current = current->next;
	movq	16(%rbx), %rbx	 ; current_5->next, current
 ; D:\TC\src\lib.c:133:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L63	 ;,
.L52:
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	cmpq	8(%rbx), %rsi	 ; current_5->length, length
	jne	.L51	 ;,
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	(%rbx), %rdi	 ; current_5->str, _13
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	testq	%rdi, %rdi	 ; _13
	je	.L51	 ;,
 ; D:\TC\src\lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	%rsi, %r8	 ; length,
	movq	%rbp, %rdx	 ; data,
	movq	%rdi, %rcx	 ; _13,
	call	strncmp	 ;
 ; D:\TC\src\lib.c:136:             current = current->next;
	movq	16(%rbx), %rbx	 ; current_5->next, current
 ; D:\TC\src\lib.c:135:                 existing = current->str;
	testl	%eax, %eax	 ; tmp100
	cmove	%rdi, %r12	 ; <retval>,, _13, <retval>
 ; D:\TC\src\lib.c:133:         while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L52	 ;,
.L63:
 ; D:\TC\src\lib.c:138:         if (existing != NULL)
	testq	%r12, %r12	 ; <retval>
	je	.L50	 ;,
 ; D:\TC\src\lib.c:162: }
	movq	%r12, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%rsi, %rdx	 ; length,
	movq	%rbp, %rcx	 ; data,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	jmp	create_string_check.part.0	 ;
	.p2align 4,,10
	.p2align 3
.L62:
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	call	init	 ;
	jmp	.L48	 ;
	.p2align 4,,10
	.p2align 3
.L53:
 ; D:\TC\src\lib.c:129:     if (data == NULL || length == 0) return 0;
	xorl	%r12d, %r12d	 ; <retval>
 ; D:\TC\src\lib.c:162: }
	movq	%r12, %rax	 ; <retval>,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.seh_endproc
	.p2align 4
	.globl	alloc_memory
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.seh_proc	alloc_memory
alloc_memory:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:253: pointer alloc_memory(size_t size) {
	movq	%rcx, %rbx	 ; tmp104, size
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	je	.L68	 ;,
.L65:
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rdx	 ; struct_memory, struct_memory.32_2
	movq	8(%rdx), %rcx	 ; struct_memory.32_2->used, _3
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	leaq	(%rcx,%rbx), %rax	 ;, tmp97
 ; D:\TC\src\lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	(%rdx), %rax	 ; struct_memory.32_2->size, tmp97
	jnb	.L69	 ;,
.L66:
 ; D:\TC\src\lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	addq	$7, %rbx	 ;, _7
 ; D:\TC\src\lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	andq	$-8, %rbx	 ;, size
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	testb	$7, %cl	 ;, _3
	jne	.L70	 ;,
 ; D:\TC\src\lib.c:261:     ++memoryBlockCount;
	addq	$1, memoryBlockCount(%rip)	 ;, memoryBlockCount
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	%rcx, %rax	 ; _3, tmp100
 ; D:\TC\src\lib.c:260:     struct_memory->used += size;
	addq	%rcx, %rbx	 ; _3, tmp102
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	andq	$-8, %rax	 ;, tmp100
 ; D:\TC\src\lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	addq	24(%rdx), %rax	 ; prephitmp_36->block, <retval>
 ; D:\TC\src\lib.c:260:     struct_memory->used += size;
	movq	%rbx, 8(%rdx)	 ; tmp102, prephitmp_36->used
 ; D:\TC\src\lib.c:263: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L68:
 ; D:\TC\src\lib.c:254:     if (!initialized) init();
	call	init	 ;
	jmp	.L65	 ;
	.p2align 4,,10
	.p2align 3
.L69:
 ; D:\TC\src\lib.c:256:         increase_memory_size(true);
	movl	$1, %ecx	 ;,
	call	increase_memory_size	 ;
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	movq	struct_memory(%rip), %rdx	 ; struct_memory, struct_memory.32_2
	movq	8(%rdx), %rcx	 ; pretmp_35->used, _3
	jmp	.L66	 ;
.L70:
 ; D:\TC\src\lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	leaq	.LC3(%rip), %r9	 ;,
	leaq	__func__.0(%rip), %r8	 ;,
	movl	$258, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp99
	call	__assert_func	 ;
	nop	
	.seh_endproc
	.p2align 4
	.globl	is_keyword
	.def	is_keyword;	.scl	2;	.type	32;	.endef
	.seh_proc	is_keyword
is_keyword:
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\lib.c:266:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
 ; D:\TC\src\lib.c:265: bool is_keyword(const string str) {
	movq	%rcx, %rbx	 ; tmp90, str
 ; D:\TC\src\lib.c:266:     if (!initialized) init();
	je	.L77	 ;,
.L72:
	leaq	keywordList(%rip), %rax	 ;, ivtmp.132
	leaq	176(%rax), %rdx	 ;, _12
	jmp	.L74	 ;
	.p2align 4,,10
	.p2align 3
.L79:
 ; D:\TC\src\lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rax	 ;, ivtmp.132
	cmpq	%rax, %rdx	 ; ivtmp.132, _12
	je	.L78	 ;,
.L74:
 ; D:\TC\src\lib.c:268:         if (string_equal(str, keywordList[i]))
	cmpq	%rbx, (%rax)	 ; str, MEM[(char * *)_11]
	jne	.L79	 ;,
 ; D:\TC\src\lib.c:269:             return true;
	movl	$1, %eax	 ;, <retval>
 ; D:\TC\src\lib.c:271: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L78:
 ; D:\TC\src\lib.c:270:     return false;
	xorl	%eax, %eax	 ; <retval>
 ; D:\TC\src\lib.c:271: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L77:
 ; D:\TC\src\lib.c:266:     if (!initialized) init();
	call	init	 ;
	jmp	.L72	 ;
	.seh_endproc
	.p2align 4
	.globl	string_equal
	.def	string_equal;	.scl	2;	.type	32;	.endef
	.seh_proc	string_equal
string_equal:
	.seh_endprologue
 ; D:\TC\src\lib.c:274:     return a == b;
	cmpq	%rcx, %rdx	 ; tmp88, tmp89
	sete	%al	 ;, tmp87
 ; D:\TC\src\lib.c:275: }
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii "\0"
.LC6:
	.ascii "%zu/%zu bytes\0"
	.align 8
.LC7:
	.ascii "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu\0"
	.text
	.p2align 4
	.globl	get_info
	.def	get_info;	.scl	2;	.type	32;	.endef
	.seh_proc	get_info
get_info:
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
 ; D:\TC\src\lib.c:279:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	 ; all_string_list, current
 ; D:\TC\src\lib.c:278:     size_t stringCount = 0;
	xorl	%ebx, %ebx	 ; stringCount
 ; D:\TC\src\lib.c:280:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	je	.L82	 ;,
	.p2align 4,,10
	.p2align 3
.L83:
 ; D:\TC\src\lib.c:282:         current = current->next;
	movq	16(%rax), %rax	 ; current_78->next, current
 ; D:\TC\src\lib.c:281:         stringCount++;
	addq	$1, %rbx	 ;, stringCount
 ; D:\TC\src\lib.c:280:     while (current != NULL) {
	testq	%rax, %rax	 ; current
	jne	.L83	 ;,
.L82:
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L89	 ;,
.L84:
	leaq	.LC5(%rip), %rsi	 ;, tmp119
	movl	$48, %edx	 ;,
 ; D:\TC\src\lib.c:286:     sprintf(struct_memory_used_str, "%zu/%zu bytes", struct_memory_used + struct_memory->used, struct_memory_count);
	leaq	.LC6(%rip), %r12	 ;, tmp120
	movq	%rsi, %rcx	 ; tmp119,
	call	create_string_check.part.0	 ;
	movq	struct_memory_count(%rip), %r9	 ; struct_memory_count,
	movq	struct_memory_used(%rip), %r8	 ; struct_memory_used, struct_memory_used
	movq	%r12, %rdx	 ; tmp120,
	movq	%rax, %rdi	 ; tmp121, _69
	movq	struct_memory(%rip), %rax	 ; struct_memory, struct_memory
	movq	%rdi, %rcx	 ; _69,
	addq	8(%rax), %r8	 ; struct_memory.42_2->used,
	call	sprintf	 ;
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L90	 ;,
.L85:
	movl	$48, %edx	 ;,
	movq	%rsi, %rcx	 ; tmp119,
	call	create_string_check.part.0	 ;
 ; D:\TC\src\lib.c:289:     sprintf(string_memory_used_str, "%zu/%zu bytes", string_memory_used + string_memory->used, string_memory_count);
	movq	string_memory_count(%rip), %r9	 ; string_memory_count,
	movq	string_memory_used(%rip), %r8	 ; string_memory_used, string_memory_used
	movq	%r12, %rdx	 ; tmp120,
	movq	%rax, %rbp	 ; tmp122, _54
	movq	string_memory(%rip), %rax	 ; string_memory, string_memory
	movq	%rbp, %rcx	 ; _54,
	addq	8(%rax), %r8	 ; string_memory.45_7->used,
	call	sprintf	 ;
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	 ;, initialized
	je	.L91	 ;,
.L86:
	movq	%rsi, %rcx	 ; tmp119,
	movl	$240, %edx	 ;,
	call	create_string_check.part.0	 ;
 ; D:\TC\src\lib.c:292:     sprintf(info, "Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu", PLATFORM, struct_memory_used_str, string_memory_used_str, stringCount, memoryBlockCount);
	movq	%rbx, 40(%rsp)	 ; stringCount,
	movq	%rdi, %r9	 ; _69,
	movl	$2, %r8d	 ;,
	movq	%rax, %rsi	 ; tmp123, <retval>
	movq	memoryBlockCount(%rip), %rax	 ; memoryBlockCount, memoryBlockCount
	movq	%rbp, 32(%rsp)	 ; _54,
	leaq	.LC7(%rip), %rdx	 ;, tmp117
	movq	%rsi, %rcx	 ; <retval>,
	movq	%rax, 48(%rsp)	 ; memoryBlockCount,
	call	sprintf	 ;
 ; D:\TC\src\lib.c:294: }
	movq	%rsi, %rax	 ; <retval>,
	addq	$64, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L89:
 ; D:\TC\src\lib.c:128:     if (!initialized) init();
	call	init	 ;
	jmp	.L84	 ;
	.p2align 4,,10
	.p2align 3
.L91:
	call	init	 ;
	jmp	.L86	 ;
	.p2align 4,,10
	.p2align 3
.L90:
	call	init	 ;
	jmp	.L85	 ;
	.seh_endproc
	.section .rdata,"dr"
	.align 8
__func__.0:
	.ascii "alloc_memory\0"
.lcomm memoryBlockCount,8,8
.lcomm string_memory_count,8,8
.lcomm struct_memory_count,8,8
.lcomm string_memory_used,8,8
.lcomm struct_memory_used,8,8
	.globl	builtin_scope
	.bss
	.align 8
builtin_scope:
	.space 8
	.globl	name_bool
	.align 8
name_bool:
	.space 8
	.globl	name_string
	.align 8
name_string:
	.space 8
	.globl	name_float
	.align 8
name_float:
	.space 8
	.globl	name_int
	.align 8
name_int:
	.space 8
	.globl	name_void
	.align 8
name_void:
	.space 8
	.globl	OR_SYMBOL
	.align 8
OR_SYMBOL:
	.space 8
	.globl	AND_SYMBOL
	.align 8
AND_SYMBOL:
	.space 8
	.globl	MOD_ASSIGN_SYMBOL
	.align 8
MOD_ASSIGN_SYMBOL:
	.space 8
	.globl	DIV_ASSIGN_SYMBOL
	.align 8
DIV_ASSIGN_SYMBOL:
	.space 8
	.globl	MUL_ASSIGN_SYMBOL
	.align 8
MUL_ASSIGN_SYMBOL:
	.space 8
	.globl	SUB_ASSIGN_SYMBOL
	.align 8
SUB_ASSIGN_SYMBOL:
	.space 8
	.globl	ADD_ASSIGN_SYMBOL
	.align 8
ADD_ASSIGN_SYMBOL:
	.space 8
	.globl	GE_SYMBOL
	.align 8
GE_SYMBOL:
	.space 8
	.globl	LE_SYMBOL
	.align 8
LE_SYMBOL:
	.space 8
	.globl	NE_SYMBOL
	.align 8
NE_SYMBOL:
	.space 8
	.globl	EQ_SYMBOL
	.align 8
EQ_SYMBOL:
	.space 8
	.globl	ASSIGN_SYMBOL
	.align 8
ASSIGN_SYMBOL:
	.space 8
	.globl	GT_SYMBOL
	.align 8
GT_SYMBOL:
	.space 8
	.globl	LT_SYMBOL
	.align 8
LT_SYMBOL:
	.space 8
	.globl	MOD_SYMBOL
	.align 8
MOD_SYMBOL:
	.space 8
	.globl	DIV_SYMBOL
	.align 8
DIV_SYMBOL:
	.space 8
	.globl	MUL_SYMBOL
	.align 8
MUL_SYMBOL:
	.space 8
	.globl	SUB_SYMBOL
	.align 8
SUB_SYMBOL:
	.space 8
	.globl	ADD_SYMBOL
	.align 8
ADD_SYMBOL:
	.space 8
	.globl	UNDERLINE_SYMBOL
	.align 8
UNDERLINE_SYMBOL:
	.space 8
	.globl	SEMICOLON_SYMBOL
	.align 8
SEMICOLON_SYMBOL:
	.space 8
	.globl	R_BRACKET_SYMBOL
	.align 8
R_BRACKET_SYMBOL:
	.space 8
	.globl	L_BRACKET_SYMBOL
	.align 8
L_BRACKET_SYMBOL:
	.space 8
	.globl	DOT_SYMBOL
	.align 8
DOT_SYMBOL:
	.space 8
	.globl	NOT_SYMBOL
	.align 8
NOT_SYMBOL:
	.space 8
	.globl	COMMA_SYMBOL
	.align 8
COMMA_SYMBOL:
	.space 8
	.globl	R_BRACE_SYMBOL
	.align 8
R_BRACE_SYMBOL:
	.space 8
	.globl	L_BRACE_SYMBOL
	.align 8
L_BRACE_SYMBOL:
	.space 8
	.globl	R_PAREN_SYMBOL
	.align 8
R_PAREN_SYMBOL:
	.space 8
	.globl	L_PAREN_SYMBOL
	.align 8
L_PAREN_SYMBOL:
	.space 8
	.globl	VAR_KEYWORD
	.align 8
VAR_KEYWORD:
	.space 8
	.globl	VOID_KEYWORD
	.align 8
VOID_KEYWORD:
	.space 8
	.globl	BOOL_KEYWORD
	.align 8
BOOL_KEYWORD:
	.space 8
	.globl	STRING_KEYWORD
	.align 8
STRING_KEYWORD:
	.space 8
	.globl	FLOAT_KEYWORD
	.align 8
FLOAT_KEYWORD:
	.space 8
	.globl	INT_KEYWORD
	.align 8
INT_KEYWORD:
	.space 8
	.globl	CONTINUE_KEYWORD
	.align 8
CONTINUE_KEYWORD:
	.space 8
	.globl	BREAK_KEYWORD
	.align 8
BREAK_KEYWORD:
	.space 8
	.globl	RETURN_KEYWORD
	.align 8
RETURN_KEYWORD:
	.space 8
	.globl	FALSE_KEYWORD
	.align 8
FALSE_KEYWORD:
	.space 8
	.globl	TRUE_KEYWORD
	.align 8
TRUE_KEYWORD:
	.space 8
	.globl	FOR_KEYWORD
	.align 8
FOR_KEYWORD:
	.space 8
	.globl	WHILE_KEYWORD
	.align 8
WHILE_KEYWORD:
	.space 8
	.globl	ELSE_KEYWORD
	.align 8
ELSE_KEYWORD:
	.space 8
	.globl	ELIF_KEYWORD
	.align 8
ELIF_KEYWORD:
	.space 8
	.globl	IF_KEYWORD
	.align 8
IF_KEYWORD:
	.space 8
	.globl	SELF_KEYWORD
	.align 8
SELF_KEYWORD:
	.space 8
	.globl	METHOD_KEYWORD
	.align 8
METHOD_KEYWORD:
	.space 8
	.globl	CLASS_KEYWORD
	.align 8
CLASS_KEYWORD:
	.space 8
	.globl	FUNC_KEYWORD
	.align 8
FUNC_KEYWORD:
	.space 8
	.globl	FROM_KEYWORD
	.align 8
FROM_KEYWORD:
	.space 8
	.globl	IMPORT_KEYWORD
	.align 8
IMPORT_KEYWORD:
	.space 8
	.globl	all_string_list
	.align 8
all_string_list:
	.space 8
	.globl	initialized
initialized:
	.space 1
	.globl	string_memory
	.align 8
string_memory:
	.space 8
	.globl	struct_memory
	.align 8
struct_memory:
	.space 8
	.globl	symbolList
	.align 32
symbolList:
	.space 240
	.section .rdata,"dr"
.LC8:
	.ascii "(\0"
.LC9:
	.ascii ")\0"
.LC10:
	.ascii "{\0"
.LC11:
	.ascii "}\0"
.LC12:
	.ascii ",\0"
.LC13:
	.ascii "!\0"
.LC14:
	.ascii ".\0"
.LC15:
	.ascii "[\0"
.LC16:
	.ascii "]\0"
.LC17:
	.ascii ";\0"
.LC18:
	.ascii "_\0"
.LC19:
	.ascii "+\0"
.LC20:
	.ascii "-\0"
.LC21:
	.ascii "*\0"
.LC22:
	.ascii "/\0"
.LC23:
	.ascii "%\0"
.LC24:
	.ascii "<\0"
.LC25:
	.ascii ">\0"
.LC26:
	.ascii "=\0"
.LC27:
	.ascii "==\0"
.LC28:
	.ascii "!=\0"
.LC29:
	.ascii "<=\0"
.LC30:
	.ascii ">=\0"
.LC31:
	.ascii "+=\0"
.LC32:
	.ascii "-=\0"
.LC33:
	.ascii "*=\0"
.LC34:
	.ascii "/=\0"
.LC35:
	.ascii "%=\0"
.LC36:
	.ascii "&&\0"
.LC37:
	.ascii "||\0"
	.align 32
symbolStrings:
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.globl	keywordList
	.bss
	.align 32
keywordList:
	.space 176
	.section .rdata,"dr"
.LC38:
	.ascii "import\0"
.LC39:
	.ascii "from\0"
.LC40:
	.ascii "func\0"
.LC41:
	.ascii "class\0"
.LC42:
	.ascii "method\0"
.LC43:
	.ascii "self\0"
.LC44:
	.ascii "if\0"
.LC45:
	.ascii "elif\0"
.LC46:
	.ascii "else\0"
.LC47:
	.ascii "while\0"
.LC48:
	.ascii "for\0"
.LC49:
	.ascii "true\0"
.LC50:
	.ascii "false\0"
.LC51:
	.ascii "return\0"
.LC52:
	.ascii "break\0"
.LC53:
	.ascii "continue\0"
.LC54:
	.ascii "int\0"
.LC55:
	.ascii "float\0"
.LC56:
	.ascii "string\0"
.LC57:
	.ascii "bool\0"
.LC58:
	.ascii "void\0"
.LC59:
	.ascii "var\0"
	.align 32
keywordStrings:
	.quad	.LC38
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.quad	.LC45
	.quad	.LC46
	.quad	.LC47
	.quad	.LC48
	.quad	.LC49
	.quad	.LC50
	.quad	.LC51
	.quad	.LC52
	.quad	.LC53
	.quad	.LC54
	.quad	.LC55
	.quad	.LC56
	.quad	.LC57
	.quad	.LC58
	.quad	.LC59
	.align 16
.LC1:
	.quad	1024
	.quad	0
	.ident	"GCC: (GNU) 13.2.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	__assert_func;	.scl	2;	.type	32;	.endef
	.def	strncmp;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef

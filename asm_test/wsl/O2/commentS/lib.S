	.file	"lib.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Fatal: Cannot allocate memory\n"
	.text
	.p2align 4
	.type	increase_memory_size, @function
increase_memory_size:
.LFB65:
	.cfi_startproc
	pushq	%rbp	;
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp	; tmp109, for_struct
; src/lib.c:79:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
; src/lib.c:78: static void increase_memory_size(bool for_struct) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 32
; src/lib.c:79:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	call	malloc@PLT	;
; src/lib.c:80:     if (new_block == NULL) {
	testq	%rax, %rax	; new_block
	je	.L13	;,
; src/lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	movq	%rax, %rbx	; tmp110, new_block
	call	malloc@PLT	;
; src/lib.c:93:     new_block->size = defaultMemorySize;
	movdqa	.LC1(%rip), %xmm0	;, tmp106
; src/lib.c:95:     new_block->next = NULL;
	movq	$0, 16(%rbx)	;, new_block_21->next
; src/lib.c:92:     new_block->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; tmp111, new_block_21->block
; src/lib.c:93:     new_block->size = defaultMemorySize;
	movups	%xmm0, (%rbx)	; tmp106, MEM <vector(2) long unsigned int> [(long unsigned int *)new_block_21]
; src/lib.c:96:     if (for_struct) {
	testb	%bpl, %bpl	; for_struct
	jne	.L14	;,
; src/lib.c:105:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	; string_memory, struct_memory.13_4
; src/lib.c:108:         string_memory_count += defaultMemorySize;
	addq	$1024, string_memory_count(%rip)	;, string_memory_count
; src/lib.c:107:         string_memory = new_block;
	movq	%rbx, string_memory(%rip)	; new_block, string_memory
; src/lib.c:105:         string_memory_used += string_memory->used;
	movq	8(%rax), %rdx	; string_memory.17_10->used, string_memory.17_10->used
	movq	%rax, 16(%rbx)	; struct_memory.13_4, new_block_21->next
	addq	%rdx, string_memory_used(%rip)	; string_memory.17_10->used, string_memory_used
; src/lib.c:113: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L14:
	.cfi_restore_state
; src/lib.c:97:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.13_4
; src/lib.c:100:         struct_memory_count += defaultMemorySize;
	addq	$1024, struct_memory_count(%rip)	;, struct_memory_count
; src/lib.c:99:         struct_memory = new_block;
	movq	%rbx, struct_memory(%rip)	; new_block, struct_memory
; src/lib.c:97:         struct_memory_used += struct_memory->used;
	movq	8(%rax), %rdx	; struct_memory.13_4->used, struct_memory.13_4->used
	movq	%rax, 16(%rbx)	; struct_memory.13_4, new_block_21->next
	addq	%rdx, struct_memory_used(%rip)	; struct_memory.13_4->used, struct_memory_used
; src/lib.c:113: }
	addq	$8, %rsp	;,
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx	;
	.cfi_def_cfa_offset 16
	popq	%rbp	;
	.cfi_def_cfa_offset 8
	ret	
.L13:
	.cfi_restore_state
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp103
	call	fwrite@PLT	;
; src/lib.c:82:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rbx	; string_memory, next
; src/lib.c:83:         while (current != NULL) {
	testq	%rbx, %rbx	; next
	je	.L3	;,
.L4:
	movq	%rbx, %rbp	; next, current
; src/lib.c:84:             MemoryBlock* next = current->next;
	movq	16(%rbx), %rbx	; current_45->next, next
; src/lib.c:85:             free(current->block);
	movq	24(%rbp), %rdi	; current_47->block, current_47->block
	call	free@PLT	;
; src/lib.c:86:             free(current);
	movq	%rbp, %rdi	; current,
	call	free@PLT	;
; src/lib.c:83:         while (current != NULL) {
	testq	%rbx, %rbx	; next
	jne	.L4	;,
.L3:
; src/lib.c:90:         exit(1);
	movl	$1, %edi	;,
; src/lib.c:89:         initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:90:         exit(1);
	call	exit@PLT	;
	.cfi_endproc
.LFE65:
	.size	increase_memory_size, .-increase_memory_size
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"src/lib.c"
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"struct_memory->used % ALIGN_SIZE == 0"
	.text
	.p2align 4
	.globl	alloc_memory
	.type	alloc_memory, @function
alloc_memory:
.LFB70:
	.cfi_startproc
	endbr64	
; src/lib.c:254:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	;, initialized
; src/lib.c:253: pointer alloc_memory(size_t size) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
; src/lib.c:253: pointer alloc_memory(size_t size) {
	movq	%rdi, %rbx	; tmp106, size
; src/lib.c:254:     if (!initialized) init();
	je	.L20	;,
.L16:
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rdx	; struct_memory, struct_memory.37_2
	movq	8(%rdx), %rcx	; struct_memory.37_2->used, _3
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	leaq	(%rcx,%rbx), %rax	;, tmp97
; src/lib.c:255:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	(%rdx), %rax	; struct_memory.37_2->size, tmp97
	jnb	.L21	;,
.L17:
; src/lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	addq	$7, %rbx	;, _6
; src/lib.c:257:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	andq	$-8, %rbx	;, size
; src/lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	testb	$7, %cl	;, _3
	jne	.L22	;,
; src/lib.c:260:     struct_memory->used += size;
	addq	%rcx, %rbx	; _3, tmp104
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	%rcx, %rax	; _3, tmp102
; src/lib.c:261:     ++memoryBlockCount;
	addq	$1, memoryBlockCount(%rip)	;, memoryBlockCount
; src/lib.c:260:     struct_memory->used += size;
	movq	%rbx, 8(%rdx)	; tmp104, prephitmp_33->used
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	andq	$-8, %rax	;, tmp102
; src/lib.c:263: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 8
; src/lib.c:259:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	addq	24(%rdx), %rax	; prephitmp_33->block, <retval>
; src/lib.c:263: }
	ret	
	.p2align 4,,10
	.p2align 3
.L20:
	.cfi_restore_state
	call	init.part.0	;
	jmp	.L16	;
	.p2align 4,,10
	.p2align 3
.L21:
; src/lib.c:256:         increase_memory_size(true);
	movl	$1, %edi	;,
	call	increase_memory_size	;
; src/lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	movq	struct_memory(%rip), %rdx	; struct_memory, struct_memory.37_2
	movq	8(%rdx), %rcx	; pretmp_32->used, _3
	jmp	.L17	;
.L22:
; src/lib.c:258:     assert(struct_memory->used % ALIGN_SIZE == 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp99
	movl	$258, %edx	;,
	leaq	.LC2(%rip), %rsi	;, tmp100
	leaq	.LC3(%rip), %rdi	;, tmp101
	call	__assert_fail@PLT	;
	.cfi_endproc
.LFE70:
	.size	alloc_memory, .-alloc_memory
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"Info: Allocate big memory block of size %zu bytes\n"
	.text
	.p2align 4
	.type	create_string_check, @function
create_string_check:
.LFB67:
	.cfi_startproc
; src/lib.c:128:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	;, initialized
; src/lib.c:127: static string create_string_check(const char* data, size_t length, bool check) {
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13	; tmp127, data
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rsi, %rbp	; tmp128, length
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/lib.c:127: static string create_string_check(const char* data, size_t length, bool check) {
	movl	%edx, %ebx	; tmp129, check
; src/lib.c:128:     if (!initialized) init();
	je	.L42	;,
.L24:
; src/lib.c:129:     if (data == NULL || length == 0) return 0;
	testq	%r13, %r13	; data
	je	.L32	;,
	testq	%rbp, %rbp	; length
	je	.L32	;,
; src/lib.c:130:     if (check) {
	testb	%bl, %bl	; check
	je	.L26	;,
; src/lib.c:131:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %rbx	; all_string_list, current
; src/lib.c:133:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L26	;,
; src/lib.c:132:         string existing = NULL;
	xorl	%r12d, %r12d	; <retval>
	jmp	.L28	;
	.p2align 4,,10
	.p2align 3
.L27:
; src/lib.c:136:             current = current->next;
	movq	16(%rbx), %rbx	; current_51->next, current
; src/lib.c:133:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L43	;,
.L28:
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	cmpq	%rbp, 8(%rbx)	; length, current_51->length
	jne	.L27	;,
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	(%rbx), %r14	; current_51->str, _6
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	testq	%r14, %r14	; _6
	je	.L27	;,
; src/lib.c:134:             if (current->length == length && current->str != 0 && strncmp(current->str, data, length) == 0)
	movq	%rbp, %rdx	; length,
	movq	%r13, %rsi	; data,
	movq	%r14, %rdi	; _6,
	call	strncmp@PLT	;
; src/lib.c:136:             current = current->next;
	movq	16(%rbx), %rbx	; current_51->next, current
; src/lib.c:135:                 existing = current->str;
	testl	%eax, %eax	; tmp130
	cmove	%r14, %r12	; <retval>,, _6, <retval>
; src/lib.c:133:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	jne	.L28	;,
.L43:
; src/lib.c:138:         if (existing != NULL)
	testq	%r12, %r12	; <retval>
	jne	.L23	;,
.L26:
; src/lib.c:142:     if (length >= defaultMemorySize - 1)
	cmpq	$1022, %rbp	;, length
	ja	.L44	;,
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	; string_memory, string_memory.1_10
	movq	8(%rax), %rdx	; string_memory.1_10->used, _11
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	leaq	(%rdx,%rbp), %rcx	;, tmp121
; src/lib.c:145:         if (string_memory->used + length >= string_memory->size)
	cmpq	(%rax), %rcx	; string_memory.1_10->size, tmp121
	jnb	.L45	;,
.L31:
; src/lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	24(%rax), %r12	; prephitmp_69->block, <retval>
	addq	%rdx, %r12	; _11, <retval>
; src/lib.c:148:         string_memory->used += length + 1;
	leaq	1(%rdx,%rbp), %rdx	;, tmp124
	movq	%rdx, 8(%rax)	; tmp124, prephitmp_69->used
.L30:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%rbp, %rdx	; length,
	movq	%r13, %rsi	; data,
	movq	%r12, %rdi	; <retval>,
	call	strncpy@PLT	;
; src/lib.c:151:     str[length] = '\0';
	movb	$0, (%r12,%rbp)	;, *_19
; src/lib.c:152:     StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
	movl	$24, %edi	;,
	call	alloc_memory	;
; src/lib.c:155:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rdx	; all_string_list, all_string_list
; src/lib.c:153:     new_str->str = str;
	movq	%r12, (%rax)	; <retval>, new_str_44->str
; src/lib.c:154:     new_str->length = length;
	movq	%rbp, 8(%rax)	; length, new_str_44->length
; src/lib.c:155:     new_str->next = all_string_list;
	movq	%rdx, 16(%rax)	; all_string_list, new_str_44->next
; src/lib.c:156:     all_string_list = new_str;
	movq	%rax, all_string_list(%rip)	; new_str, all_string_list
.L23:
; src/lib.c:158: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r12, %rax	; <retval>,
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
.L42:
	.cfi_restore_state
	call	init.part.0	;
	jmp	.L24	;
	.p2align 4,,10
	.p2align 3
.L44:
; src/lib.c:143:         str = alloc_big_memory(length + 1);
	leaq	1(%rbp), %rbx	;, _9
; src/lib.c:116:     string_memory_count += size;
	addq	%rbx, string_memory_count(%rip)	; _9, string_memory_count
; src/lib.c:118:     char* block = (char*)malloc(size);
	movq	%rbx, %rdi	; _9,
; src/lib.c:117:     string_memory_used += size;
	addq	%rbx, string_memory_used(%rip)	; _9, string_memory_used
; src/lib.c:118:     char* block = (char*)malloc(size);
	call	malloc@PLT	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%rbx, %rcx	; _9,
	leaq	.LC4(%rip), %rdx	;, tmp118
; src/lib.c:118:     char* block = (char*)malloc(size);
	movq	%rax, %r12	; tmp131, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	__fprintf_chk@PLT	;
; src/lib.c:120:     if (block == NULL) {
	testq	%r12, %r12	; <retval>
	jne	.L30	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp120
	call	fwrite@PLT	;
; src/lib.c:122:         exit(1);
	movl	$1, %edi	;,
	call	exit@PLT	;
	.p2align 4,,10
	.p2align 3
.L32:
; src/lib.c:129:     if (data == NULL || length == 0) return 0;
	xorl	%r12d, %r12d	; <retval>
; src/lib.c:158: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp	;
	.cfi_def_cfa_offset 32
	movq	%r12, %rax	; <retval>,
	popq	%r12	;
	.cfi_def_cfa_offset 24
	popq	%r13	;
	.cfi_def_cfa_offset 16
	popq	%r14	;
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
; src/lib.c:146:             increase_memory_size(false);
	xorl	%edi, %edi	;
	call	increase_memory_size	;
; src/lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rax	; string_memory, string_memory.1_10
; src/lib.c:147:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	8(%rax), %rdx	; pretmp_68->used, _11
	jmp	.L31	;
	.cfi_endproc
.LFE67:
	.size	create_string_check, .-create_string_check
	.p2align 4
	.globl	create_string
	.type	create_string, @function
create_string:
.LFB68:
	.cfi_startproc
	endbr64	
; src/lib.c:161:     return create_string_check(data, length, true);
	movl	$1, %edx	;,
	jmp	create_string_check	;
	.cfi_endproc
.LFE68:
	.size	create_string, .-create_string
	.p2align 4
	.type	init.part.0, @function
init.part.0:
.LFB74:
	.cfi_startproc
; src/lib.c:166:     if (struct_memory == NULL) {
	cmpq	$0, struct_memory(%rip)	;, struct_memory
; src/lib.c:164: void init(void) {
	pushq	%r12	;
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp	;
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx	;
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
; src/lib.c:166:     if (struct_memory == NULL) {
	je	.L58	;,
; src/lib.c:179:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	;, string_memory
	je	.L59	;,
.L50:
	leaq	keywordStrings(%rip), %rbx	;, ivtmp.122
; src/lib.c:192:     initialized = true;
	movb	$1, initialized(%rip)	;, initialized
	movl	$6, %esi	;, _14
	leaq	keywordList(%rip), %rbp	;, ivtmp.124
	leaq	176(%rbx), %r12	;, _185
	jmp	.L54	;
	.p2align 4,,10
	.p2align 3
.L52:
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	(%rbx), %rdi	; MEM[(const char * *)_186], MEM[(const char * *)_186]
	call	strlen@PLT	;
	movq	%rax, %rsi	; tmp291, _14
.L54:
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	(%rbx), %rdi	; MEM[(const char * *)_182], MEM[(const char * *)_182]
	xorl	%edx, %edx	;
; src/lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rbx	;, ivtmp.122
	addq	$8, %rbp	;, ivtmp.124
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	call	create_string_check	;
; src/lib.c:194:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	%rax, -8(%rbp)	; tmp290, MEM[(char * *)_183]
; src/lib.c:193:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	%r12, %rbx	; _185, ivtmp.122
	jne	.L52	;,
	leaq	symbolStrings(%rip), %rbx	;, ivtmp.101
	leaq	symbolList(%rip), %rbp	;, ivtmp.103
	movl	$1, %esi	;, prephitmp_156
	leaq	240(%rbx), %r12	;, _174
	jmp	.L53	;
	.p2align 4,,10
	.p2align 3
.L60:
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	(%rbx), %rdi	; MEM[(const char * *)_175], MEM[(const char * *)_175]
	call	strlen@PLT	;
	movq	%rax, %rsi	; tmp293, prephitmp_156
.L53:
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	(%rbx), %rdi	; MEM[(const char * *)_171], MEM[(const char * *)_171]
	xorl	%edx, %edx	;
; src/lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$8, %rbx	;, ivtmp.101
	addq	$8, %rbp	;, ivtmp.103
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	call	create_string_check	;
; src/lib.c:196:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	%rax, -8(%rbp)	; tmp292, MEM[(char * *)_172]
; src/lib.c:195:     for (size_t i = 0; i < symbolCount; ++i)
	cmpq	%r12, %rbx	; _174, ivtmp.101
	jne	.L60	;,
; src/lib.c:197:     IMPORT_KEYWORD = keywordList[0];
	movq	keywordList(%rip), %rax	; keywordList[0], keywordList[0]
	movq	%rax, IMPORT_KEYWORD(%rip)	; keywordList[0], IMPORT_KEYWORD
; src/lib.c:198:     FROM_KEYWORD = keywordList[1];
	movq	8+keywordList(%rip), %rax	; keywordList[1], keywordList[1]
	movq	%rax, FROM_KEYWORD(%rip)	; keywordList[1], FROM_KEYWORD
; src/lib.c:199:     FUNC_KEYWORD = keywordList[2];
	movq	16+keywordList(%rip), %rax	; keywordList[2], keywordList[2]
	movq	%rax, FUNC_KEYWORD(%rip)	; keywordList[2], FUNC_KEYWORD
; src/lib.c:200:     CLASS_KEYWORD = keywordList[3];
	movq	24+keywordList(%rip), %rax	; keywordList[3], keywordList[3]
	movq	%rax, CLASS_KEYWORD(%rip)	; keywordList[3], CLASS_KEYWORD
; src/lib.c:201:     METHOD_KEYWORD = keywordList[4];
	movq	32+keywordList(%rip), %rax	; keywordList[4], keywordList[4]
	movq	%rax, METHOD_KEYWORD(%rip)	; keywordList[4], METHOD_KEYWORD
; src/lib.c:202:     SELF_KEYWORD = keywordList[5];
	movq	40+keywordList(%rip), %rax	; keywordList[5], keywordList[5]
	movq	%rax, SELF_KEYWORD(%rip)	; keywordList[5], SELF_KEYWORD
; src/lib.c:203:     IF_KEYWORD = keywordList[6];
	movq	48+keywordList(%rip), %rax	; keywordList[6], keywordList[6]
	movq	%rax, IF_KEYWORD(%rip)	; keywordList[6], IF_KEYWORD
; src/lib.c:204:     ELIF_KEYWORD = keywordList[7];
	movq	56+keywordList(%rip), %rax	; keywordList[7], keywordList[7]
	movq	%rax, ELIF_KEYWORD(%rip)	; keywordList[7], ELIF_KEYWORD
; src/lib.c:205:     ELSE_KEYWORD = keywordList[8];
	movq	64+keywordList(%rip), %rax	; keywordList[8], keywordList[8]
	movq	%rax, ELSE_KEYWORD(%rip)	; keywordList[8], ELSE_KEYWORD
; src/lib.c:206:     WHILE_KEYWORD = keywordList[9];
	movq	72+keywordList(%rip), %rax	; keywordList[9], keywordList[9]
	movq	%rax, WHILE_KEYWORD(%rip)	; keywordList[9], WHILE_KEYWORD
; src/lib.c:207:     FOR_KEYWORD = keywordList[10];
	movq	80+keywordList(%rip), %rax	; keywordList[10], keywordList[10]
	movq	%rax, FOR_KEYWORD(%rip)	; keywordList[10], FOR_KEYWORD
; src/lib.c:208:     TRUE_KEYWORD = keywordList[11];
	movq	88+keywordList(%rip), %rax	; keywordList[11], keywordList[11]
	movq	%rax, TRUE_KEYWORD(%rip)	; keywordList[11], TRUE_KEYWORD
; src/lib.c:209:     FALSE_KEYWORD = keywordList[12];
	movq	96+keywordList(%rip), %rax	; keywordList[12], keywordList[12]
	movq	%rax, FALSE_KEYWORD(%rip)	; keywordList[12], FALSE_KEYWORD
; src/lib.c:210:     RETURN_KEYWORD = keywordList[13];
	movq	104+keywordList(%rip), %rax	; keywordList[13], keywordList[13]
	movq	%rax, RETURN_KEYWORD(%rip)	; keywordList[13], RETURN_KEYWORD
; src/lib.c:211:     BREAK_KEYWORD = keywordList[14];
	movq	112+keywordList(%rip), %rax	; keywordList[14], keywordList[14]
	movq	%rax, BREAK_KEYWORD(%rip)	; keywordList[14], BREAK_KEYWORD
; src/lib.c:212:     CONTINUE_KEYWORD = keywordList[15];
	movq	120+keywordList(%rip), %rax	; keywordList[15], keywordList[15]
	movq	%rax, CONTINUE_KEYWORD(%rip)	; keywordList[15], CONTINUE_KEYWORD
; src/lib.c:213:     INT_KEYWORD = keywordList[16];
	movq	128+keywordList(%rip), %rax	; keywordList[16], keywordList[16]
	movq	%rax, INT_KEYWORD(%rip)	; keywordList[16], INT_KEYWORD
; src/lib.c:214:     FLOAT_KEYWORD = keywordList[17];
	movq	136+keywordList(%rip), %rax	; keywordList[17], keywordList[17]
	movq	%rax, FLOAT_KEYWORD(%rip)	; keywordList[17], FLOAT_KEYWORD
; src/lib.c:215:     STRING_KEYWORD = keywordList[18];
	movq	144+keywordList(%rip), %rax	; keywordList[18], keywordList[18]
	movq	%rax, STRING_KEYWORD(%rip)	; keywordList[18], STRING_KEYWORD
; src/lib.c:216:     BOOL_KEYWORD = keywordList[19];
	movq	152+keywordList(%rip), %rax	; keywordList[19], keywordList[19]
	movq	%rax, BOOL_KEYWORD(%rip)	; keywordList[19], BOOL_KEYWORD
; src/lib.c:217:     VOID_KEYWORD = keywordList[20];
	movq	160+keywordList(%rip), %rax	; keywordList[20], keywordList[20]
	movq	%rax, VOID_KEYWORD(%rip)	; keywordList[20], VOID_KEYWORD
; src/lib.c:218:     VAR_KEYWORD = keywordList[21];
	movq	168+keywordList(%rip), %rax	; keywordList[21], keywordList[21]
	movq	%rax, VAR_KEYWORD(%rip)	; keywordList[21], VAR_KEYWORD
; src/lib.c:219:     L_PAREN_SYMBOL = symbolList[0];
	movq	symbolList(%rip), %rax	; symbolList[0], symbolList[0]
	movq	%rax, L_PAREN_SYMBOL(%rip)	; symbolList[0], L_PAREN_SYMBOL
; src/lib.c:220:     R_PAREN_SYMBOL = symbolList[1];
	movq	8+symbolList(%rip), %rax	; symbolList[1], symbolList[1]
	movq	%rax, R_PAREN_SYMBOL(%rip)	; symbolList[1], R_PAREN_SYMBOL
; src/lib.c:221:     L_BRACE_SYMBOL = symbolList[2];
	movq	16+symbolList(%rip), %rax	; symbolList[2], symbolList[2]
	movq	%rax, L_BRACE_SYMBOL(%rip)	; symbolList[2], L_BRACE_SYMBOL
; src/lib.c:222:     R_BRACE_SYMBOL = symbolList[3];
	movq	24+symbolList(%rip), %rax	; symbolList[3], symbolList[3]
	movq	%rax, R_BRACE_SYMBOL(%rip)	; symbolList[3], R_BRACE_SYMBOL
; src/lib.c:223:     COMMA_SYMBOL = symbolList[4];
	movq	32+symbolList(%rip), %rax	; symbolList[4], symbolList[4]
	movq	%rax, COMMA_SYMBOL(%rip)	; symbolList[4], COMMA_SYMBOL
; src/lib.c:224:     NOT_SYMBOL = symbolList[5];
	movq	40+symbolList(%rip), %rax	; symbolList[5], symbolList[5]
	movq	%rax, NOT_SYMBOL(%rip)	; symbolList[5], NOT_SYMBOL
; src/lib.c:225:     DOT_SYMBOL = symbolList[6];
	movq	48+symbolList(%rip), %rax	; symbolList[6], symbolList[6]
	movq	%rax, DOT_SYMBOL(%rip)	; symbolList[6], DOT_SYMBOL
; src/lib.c:226:     L_BRACKET_SYMBOL = symbolList[7];
	movq	56+symbolList(%rip), %rax	; symbolList[7], symbolList[7]
	movq	%rax, L_BRACKET_SYMBOL(%rip)	; symbolList[7], L_BRACKET_SYMBOL
; src/lib.c:227:     R_BRACKET_SYMBOL = symbolList[8];
	movq	64+symbolList(%rip), %rax	; symbolList[8], symbolList[8]
	movq	%rax, R_BRACKET_SYMBOL(%rip)	; symbolList[8], R_BRACKET_SYMBOL
; src/lib.c:228:     SEMICOLON_SYMBOL = symbolList[9];
	movq	72+symbolList(%rip), %rax	; symbolList[9], symbolList[9]
	movq	%rax, SEMICOLON_SYMBOL(%rip)	; symbolList[9], SEMICOLON_SYMBOL
; src/lib.c:229:     UNDERLINE_SYMBOL = symbolList[10];
	movq	80+symbolList(%rip), %rax	; symbolList[10], symbolList[10]
	movq	%rax, UNDERLINE_SYMBOL(%rip)	; symbolList[10], UNDERLINE_SYMBOL
; src/lib.c:230:     ADD_SYMBOL = symbolList[11];
	movq	88+symbolList(%rip), %rax	; symbolList[11], symbolList[11]
	movq	%rax, ADD_SYMBOL(%rip)	; symbolList[11], ADD_SYMBOL
; src/lib.c:231:     SUB_SYMBOL = symbolList[12];
	movq	96+symbolList(%rip), %rax	; symbolList[12], symbolList[12]
	movq	%rax, SUB_SYMBOL(%rip)	; symbolList[12], SUB_SYMBOL
; src/lib.c:232:     MUL_SYMBOL = symbolList[13];
	movq	104+symbolList(%rip), %rax	; symbolList[13], symbolList[13]
	movq	%rax, MUL_SYMBOL(%rip)	; symbolList[13], MUL_SYMBOL
; src/lib.c:233:     DIV_SYMBOL = symbolList[14];
	movq	112+symbolList(%rip), %rax	; symbolList[14], symbolList[14]
	movq	%rax, DIV_SYMBOL(%rip)	; symbolList[14], DIV_SYMBOL
; src/lib.c:234:     MOD_SYMBOL = symbolList[15];
	movq	120+symbolList(%rip), %rax	; symbolList[15], symbolList[15]
	movq	%rax, MOD_SYMBOL(%rip)	; symbolList[15], MOD_SYMBOL
; src/lib.c:235:     LT_SYMBOL = symbolList[16];
	movq	128+symbolList(%rip), %rax	; symbolList[16], symbolList[16]
	movq	%rax, LT_SYMBOL(%rip)	; symbolList[16], LT_SYMBOL
; src/lib.c:236:     GT_SYMBOL = symbolList[17];
	movq	136+symbolList(%rip), %rax	; symbolList[17], symbolList[17]
	movq	%rax, GT_SYMBOL(%rip)	; symbolList[17], GT_SYMBOL
; src/lib.c:237:     ASSIGN_SYMBOL = symbolList[18];
	movq	144+symbolList(%rip), %rax	; symbolList[18], symbolList[18]
	movq	%rax, ASSIGN_SYMBOL(%rip)	; symbolList[18], ASSIGN_SYMBOL
; src/lib.c:238:     EQ_SYMBOL = symbolList[19];
	movq	152+symbolList(%rip), %rax	; symbolList[19], symbolList[19]
	movq	%rax, EQ_SYMBOL(%rip)	; symbolList[19], EQ_SYMBOL
; src/lib.c:239:     NE_SYMBOL = symbolList[20];
	movq	160+symbolList(%rip), %rax	; symbolList[20], symbolList[20]
	movq	%rax, NE_SYMBOL(%rip)	; symbolList[20], NE_SYMBOL
; src/lib.c:240:     LE_SYMBOL = symbolList[21];
	movq	168+symbolList(%rip), %rax	; symbolList[21], symbolList[21]
	movq	%rax, LE_SYMBOL(%rip)	; symbolList[21], LE_SYMBOL
; src/lib.c:241:     GE_SYMBOL = symbolList[22];
	movq	176+symbolList(%rip), %rax	; symbolList[22], symbolList[22]
	movq	%rax, GE_SYMBOL(%rip)	; symbolList[22], GE_SYMBOL
; src/lib.c:242:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	184+symbolList(%rip), %rax	; symbolList[23], symbolList[23]
	movq	%rax, ADD_ASSIGN_SYMBOL(%rip)	; symbolList[23], ADD_ASSIGN_SYMBOL
; src/lib.c:243:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	192+symbolList(%rip), %rax	; symbolList[24], symbolList[24]
	movq	%rax, SUB_ASSIGN_SYMBOL(%rip)	; symbolList[24], SUB_ASSIGN_SYMBOL
; src/lib.c:244:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	200+symbolList(%rip), %rax	; symbolList[25], symbolList[25]
	movq	%rax, MUL_ASSIGN_SYMBOL(%rip)	; symbolList[25], MUL_ASSIGN_SYMBOL
; src/lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	208+symbolList(%rip), %rax	; symbolList[26], symbolList[26]
; src/lib.c:249: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp	;
	.cfi_def_cfa_offset 16
; src/lib.c:245:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	%rax, DIV_ASSIGN_SYMBOL(%rip)	; symbolList[26], DIV_ASSIGN_SYMBOL
; src/lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	216+symbolList(%rip), %rax	; symbolList[27], symbolList[27]
; src/lib.c:249: }
	popq	%r12	;
	.cfi_def_cfa_offset 8
; src/lib.c:246:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	%rax, MOD_ASSIGN_SYMBOL(%rip)	; symbolList[27], MOD_ASSIGN_SYMBOL
; src/lib.c:247:     AND_SYMBOL = symbolList[28];
	movq	224+symbolList(%rip), %rax	; symbolList[28], symbolList[28]
	movq	%rax, AND_SYMBOL(%rip)	; symbolList[28], AND_SYMBOL
; src/lib.c:248:     OR_SYMBOL = symbolList[29];
	movq	232+symbolList(%rip), %rax	; symbolList[29], symbolList[29]
	movq	%rax, OR_SYMBOL(%rip)	; symbolList[29], OR_SYMBOL
; src/lib.c:249: }
	ret	
.L58:
	.cfi_restore_state
; src/lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	malloc@PLT	;
; src/lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, struct_memory(%rip)	; tmp162, struct_memory
; src/lib.c:167:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, %rbx	; tmp286, tmp162
; src/lib.c:168:         if (struct_memory == NULL) {
	testq	%rax, %rax	; tmp162
	je	.L57	;,
; src/lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	malloc@PLT	;
; src/lib.c:174:         struct_memory->size = defaultMemorySize;
	movdqa	.LC1(%rip), %xmm0	;, tmp166
; src/lib.c:179:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	;, string_memory
; src/lib.c:176:         struct_memory->next = NULL;
	movq	$0, 16(%rbx)	;, MEM[(struct MemoryBlock *)_2].next
; src/lib.c:173:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; tmp287, MEM[(struct MemoryBlock *)_2].block
; src/lib.c:177:         struct_memory_count = defaultMemorySize;
	movq	$1024, struct_memory_count(%rip)	;, struct_memory_count
; src/lib.c:174:         struct_memory->size = defaultMemorySize;
	movups	%xmm0, (%rbx)	; tmp166, MEM <vector(2) long unsigned int> [(long unsigned int *)_2]
; src/lib.c:179:     if (string_memory == NULL) {
	jne	.L50	;,
.L59:
; src/lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	malloc@PLT	;
; src/lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, string_memory(%rip)	; tmp167, string_memory
; src/lib.c:180:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, %rbx	; tmp288, tmp167
; src/lib.c:181:         if (string_memory == NULL) {
	testq	%rax, %rax	; tmp167
	je	.L57	;,
; src/lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	malloc@PLT	;
; src/lib.c:187:         string_memory->size = defaultMemorySize;
	movdqa	.LC1(%rip), %xmm0	;, tmp171
; src/lib.c:189:         string_memory->next = NULL;
	movq	$0, 16(%rbx)	;, MEM[(struct MemoryBlock *)_6].next
; src/lib.c:186:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; tmp289, MEM[(struct MemoryBlock *)_6].block
; src/lib.c:190:         string_memory_count = defaultMemorySize;
	movq	$1024, string_memory_count(%rip)	;, string_memory_count
; src/lib.c:187:         string_memory->size = defaultMemorySize;
	movups	%xmm0, (%rbx)	; tmp171, MEM <vector(2) long unsigned int> [(long unsigned int *)_6]
	jmp	.L50	;
.L57:
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rcx	; stderr,
	movl	$30, %edx	;,
	movl	$1, %esi	;,
	leaq	.LC0(%rip), %rdi	;, tmp169
	call	fwrite@PLT	;
; src/lib.c:184:             exit(1);
	movl	$1, %edi	;,
; src/lib.c:183:             initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:184:             exit(1);
	call	exit@PLT	;
	.cfi_endproc
.LFE74:
	.size	init.part.0, .-init.part.0
	.p2align 4
	.globl	init
	.type	init, @function
init:
.LFB69:
	.cfi_startproc
	endbr64	
; src/lib.c:165:     if (initialized) return;
	cmpb	$0, initialized(%rip)	;, initialized
	jne	.L61	;,
	jmp	init.part.0	;
	.p2align 4,,10
	.p2align 3
.L61:
; src/lib.c:249: }
	ret	
	.cfi_endproc
.LFE69:
	.size	init, .-init
	.p2align 4
	.globl	is_keyword
	.type	is_keyword, @function
is_keyword:
.LFB71:
	.cfi_startproc
	endbr64	
; src/lib.c:266:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	;, initialized
; src/lib.c:265: bool is_keyword(const string str) {
	pushq	%rbx	;
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
; src/lib.c:265: bool is_keyword(const string str) {
	movq	%rdi, %rbx	; tmp90, str
; src/lib.c:266:     if (!initialized) init();
	je	.L70	;,
.L64:
	leaq	keywordList(%rip), %rax	;, ivtmp.143
	leaq	176(%rax), %rdx	;, _12
	jmp	.L66	;
	.p2align 4,,10
	.p2align 3
.L72:
; src/lib.c:267:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rax	;, ivtmp.143
	cmpq	%rax, %rdx	; ivtmp.143, _12
	je	.L71	;,
.L66:
; src/lib.c:268:         if (string_equal(str, keywordList[i]))
	cmpq	%rbx, (%rax)	; str, MEM[(char * *)_10]
	jne	.L72	;,
; src/lib.c:269:             return true;
	movl	$1, %eax	;, <retval>
; src/lib.c:271: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L71:
	.cfi_restore_state
; src/lib.c:270:     return false;
	xorl	%eax, %eax	; <retval>
; src/lib.c:271: }
	popq	%rbx	;
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L70:
	.cfi_restore_state
	call	init.part.0	;
	jmp	.L64	;
	.cfi_endproc
.LFE71:
	.size	is_keyword, .-is_keyword
	.p2align 4
	.globl	string_equal
	.type	string_equal, @function
string_equal:
.LFB72:
	.cfi_startproc
	endbr64	
; src/lib.c:274:     return a == b;
	cmpq	%rdi, %rsi	; tmp88, tmp89
	sete	%al	;, tmp87
; src/lib.c:275: }
	ret	
	.cfi_endproc
.LFE72:
	.size	string_equal, .-string_equal
	.section	.rodata.str1.1
.LC5:
	.string	""
.LC6:
	.string	"%zu/%zu bytes"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
	.text
	.p2align 4
	.globl	get_info
	.type	get_info, @function
get_info:
.LFB73:
	.cfi_startproc
	endbr64	
; src/lib.c:279:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	; all_string_list, current
; src/lib.c:277: string get_info(void) {
	pushq	%r14	;
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13	;
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12	;
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp	;
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx	;
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
; src/lib.c:278:     size_t stringCount = 0;
	xorl	%ebx, %ebx	; stringCount
; src/lib.c:280:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L75	;,
	.p2align 4,,10
	.p2align 3
.L76:
; src/lib.c:282:         current = current->next;
	movq	16(%rax), %rax	; current_31->next, current
; src/lib.c:281:         stringCount++;
	addq	$1, %rbx	;, stringCount
; src/lib.c:280:     while (current != NULL) {
	testq	%rax, %rax	; current
	jne	.L76	;,
.L75:
; src/lib.c:285:     string struct_memory_used_str = create_string_check("", 48, false);
	leaq	.LC5(%rip), %rbp	;, tmp98
	xorl	%edx, %edx	;
	movl	$48, %esi	;,
	movq	%rbp, %rdi	; tmp98,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC6(%rip), %r14	;, tmp104
; src/lib.c:285:     string struct_memory_used_str = create_string_check("", 48, false);
	call	create_string_check	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	struct_memory_count(%rip), %r9	; struct_memory_count,
	movq	%r14, %rcx	; tmp104,
	movq	struct_memory_used(%rip), %r8	; struct_memory_used, struct_memory_used
; src/lib.c:285:     string struct_memory_used_str = create_string_check("", 48, false);
	movq	%rax, %r12	; tmp115, struct_memory_used_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; struct_memory_used_str,
	addq	8(%rax), %r8	; struct_memory.47_2->used,
	xorl	%eax, %eax	;
	call	__sprintf_chk@PLT	;
; src/lib.c:288:     string string_memory_used_str = create_string_check("", 48, false);
	movq	%rbp, %rdi	; tmp98,
	xorl	%edx, %edx	;
	movl	$48, %esi	;,
	call	create_string_check	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	string_memory_count(%rip), %r9	; string_memory_count,
	movq	%r14, %rcx	; tmp104,
	movq	string_memory_used(%rip), %r8	; string_memory_used, string_memory_used
; src/lib.c:288:     string string_memory_used_str = create_string_check("", 48, false);
	movq	%rax, %r13	; tmp116, string_memory_used_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	string_memory(%rip), %rax	; string_memory, string_memory
	movq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r13, %rdi	; string_memory_used_str,
	addq	8(%rax), %r8	; string_memory.50_7->used,
	xorl	%eax, %eax	;
	call	__sprintf_chk@PLT	;
; src/lib.c:291:     string info = (string)create_string_check("", 240, false);
	movq	%rbp, %rdi	; tmp98,
	xorl	%edx, %edx	;
	movl	$240, %esi	;,
	call	create_string_check	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	subq	$8, %rsp	;,
	.cfi_def_cfa_offset 56
	movq	%r12, %r9	; struct_memory_used_str,
	pushq	memoryBlockCount(%rip)	; memoryBlockCount
	.cfi_def_cfa_offset 64
	pushq	%rbx	; stringCount
	.cfi_def_cfa_offset 72
; src/lib.c:291:     string info = (string)create_string_check("", 240, false);
	movq	%rax, %rbp	; tmp117, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rax, %rdi	; <retval>,
	movl	$3, %r8d	;,
	pushq	%r13	; string_memory_used_str
	.cfi_def_cfa_offset 80
	leaq	.LC7(%rip), %rcx	;, tmp113
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	movq	$-1, %rdx	;,
	call	__sprintf_chk@PLT	;
; src/lib.c:293:     return info;
	addq	$32, %rsp	;,
	.cfi_def_cfa_offset 48
; src/lib.c:294: }
	movq	%rbp, %rax	; <retval>,
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
	.cfi_endproc
.LFE73:
	.size	get_info, .-get_info
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 13
__PRETTY_FUNCTION__.0:
	.string	"alloc_memory"
	.local	memoryBlockCount
	.comm	memoryBlockCount,8,8
	.local	string_memory_count
	.comm	string_memory_count,8,8
	.local	struct_memory_count
	.comm	struct_memory_count,8,8
	.local	string_memory_used
	.comm	string_memory_used,8,8
	.local	struct_memory_used
	.comm	struct_memory_used,8,8
	.globl	builtin_scope
	.bss
	.align 8
	.type	builtin_scope, @object
	.size	builtin_scope, 8
builtin_scope:
	.zero	8
	.globl	name_bool
	.align 8
	.type	name_bool, @object
	.size	name_bool, 8
name_bool:
	.zero	8
	.globl	name_string
	.align 8
	.type	name_string, @object
	.size	name_string, 8
name_string:
	.zero	8
	.globl	name_float
	.align 8
	.type	name_float, @object
	.size	name_float, 8
name_float:
	.zero	8
	.globl	name_int
	.align 8
	.type	name_int, @object
	.size	name_int, 8
name_int:
	.zero	8
	.globl	name_void
	.align 8
	.type	name_void, @object
	.size	name_void, 8
name_void:
	.zero	8
	.globl	OR_SYMBOL
	.align 8
	.type	OR_SYMBOL, @object
	.size	OR_SYMBOL, 8
OR_SYMBOL:
	.zero	8
	.globl	AND_SYMBOL
	.align 8
	.type	AND_SYMBOL, @object
	.size	AND_SYMBOL, 8
AND_SYMBOL:
	.zero	8
	.globl	MOD_ASSIGN_SYMBOL
	.align 8
	.type	MOD_ASSIGN_SYMBOL, @object
	.size	MOD_ASSIGN_SYMBOL, 8
MOD_ASSIGN_SYMBOL:
	.zero	8
	.globl	DIV_ASSIGN_SYMBOL
	.align 8
	.type	DIV_ASSIGN_SYMBOL, @object
	.size	DIV_ASSIGN_SYMBOL, 8
DIV_ASSIGN_SYMBOL:
	.zero	8
	.globl	MUL_ASSIGN_SYMBOL
	.align 8
	.type	MUL_ASSIGN_SYMBOL, @object
	.size	MUL_ASSIGN_SYMBOL, 8
MUL_ASSIGN_SYMBOL:
	.zero	8
	.globl	SUB_ASSIGN_SYMBOL
	.align 8
	.type	SUB_ASSIGN_SYMBOL, @object
	.size	SUB_ASSIGN_SYMBOL, 8
SUB_ASSIGN_SYMBOL:
	.zero	8
	.globl	ADD_ASSIGN_SYMBOL
	.align 8
	.type	ADD_ASSIGN_SYMBOL, @object
	.size	ADD_ASSIGN_SYMBOL, 8
ADD_ASSIGN_SYMBOL:
	.zero	8
	.globl	GE_SYMBOL
	.align 8
	.type	GE_SYMBOL, @object
	.size	GE_SYMBOL, 8
GE_SYMBOL:
	.zero	8
	.globl	LE_SYMBOL
	.align 8
	.type	LE_SYMBOL, @object
	.size	LE_SYMBOL, 8
LE_SYMBOL:
	.zero	8
	.globl	NE_SYMBOL
	.align 8
	.type	NE_SYMBOL, @object
	.size	NE_SYMBOL, 8
NE_SYMBOL:
	.zero	8
	.globl	EQ_SYMBOL
	.align 8
	.type	EQ_SYMBOL, @object
	.size	EQ_SYMBOL, 8
EQ_SYMBOL:
	.zero	8
	.globl	ASSIGN_SYMBOL
	.align 8
	.type	ASSIGN_SYMBOL, @object
	.size	ASSIGN_SYMBOL, 8
ASSIGN_SYMBOL:
	.zero	8
	.globl	GT_SYMBOL
	.align 8
	.type	GT_SYMBOL, @object
	.size	GT_SYMBOL, 8
GT_SYMBOL:
	.zero	8
	.globl	LT_SYMBOL
	.align 8
	.type	LT_SYMBOL, @object
	.size	LT_SYMBOL, 8
LT_SYMBOL:
	.zero	8
	.globl	MOD_SYMBOL
	.align 8
	.type	MOD_SYMBOL, @object
	.size	MOD_SYMBOL, 8
MOD_SYMBOL:
	.zero	8
	.globl	DIV_SYMBOL
	.align 8
	.type	DIV_SYMBOL, @object
	.size	DIV_SYMBOL, 8
DIV_SYMBOL:
	.zero	8
	.globl	MUL_SYMBOL
	.align 8
	.type	MUL_SYMBOL, @object
	.size	MUL_SYMBOL, 8
MUL_SYMBOL:
	.zero	8
	.globl	SUB_SYMBOL
	.align 8
	.type	SUB_SYMBOL, @object
	.size	SUB_SYMBOL, 8
SUB_SYMBOL:
	.zero	8
	.globl	ADD_SYMBOL
	.align 8
	.type	ADD_SYMBOL, @object
	.size	ADD_SYMBOL, 8
ADD_SYMBOL:
	.zero	8
	.globl	UNDERLINE_SYMBOL
	.align 8
	.type	UNDERLINE_SYMBOL, @object
	.size	UNDERLINE_SYMBOL, 8
UNDERLINE_SYMBOL:
	.zero	8
	.globl	SEMICOLON_SYMBOL
	.align 8
	.type	SEMICOLON_SYMBOL, @object
	.size	SEMICOLON_SYMBOL, 8
SEMICOLON_SYMBOL:
	.zero	8
	.globl	R_BRACKET_SYMBOL
	.align 8
	.type	R_BRACKET_SYMBOL, @object
	.size	R_BRACKET_SYMBOL, 8
R_BRACKET_SYMBOL:
	.zero	8
	.globl	L_BRACKET_SYMBOL
	.align 8
	.type	L_BRACKET_SYMBOL, @object
	.size	L_BRACKET_SYMBOL, 8
L_BRACKET_SYMBOL:
	.zero	8
	.globl	DOT_SYMBOL
	.align 8
	.type	DOT_SYMBOL, @object
	.size	DOT_SYMBOL, 8
DOT_SYMBOL:
	.zero	8
	.globl	NOT_SYMBOL
	.align 8
	.type	NOT_SYMBOL, @object
	.size	NOT_SYMBOL, 8
NOT_SYMBOL:
	.zero	8
	.globl	COMMA_SYMBOL
	.align 8
	.type	COMMA_SYMBOL, @object
	.size	COMMA_SYMBOL, 8
COMMA_SYMBOL:
	.zero	8
	.globl	R_BRACE_SYMBOL
	.align 8
	.type	R_BRACE_SYMBOL, @object
	.size	R_BRACE_SYMBOL, 8
R_BRACE_SYMBOL:
	.zero	8
	.globl	L_BRACE_SYMBOL
	.align 8
	.type	L_BRACE_SYMBOL, @object
	.size	L_BRACE_SYMBOL, 8
L_BRACE_SYMBOL:
	.zero	8
	.globl	R_PAREN_SYMBOL
	.align 8
	.type	R_PAREN_SYMBOL, @object
	.size	R_PAREN_SYMBOL, 8
R_PAREN_SYMBOL:
	.zero	8
	.globl	L_PAREN_SYMBOL
	.align 8
	.type	L_PAREN_SYMBOL, @object
	.size	L_PAREN_SYMBOL, 8
L_PAREN_SYMBOL:
	.zero	8
	.globl	VAR_KEYWORD
	.align 8
	.type	VAR_KEYWORD, @object
	.size	VAR_KEYWORD, 8
VAR_KEYWORD:
	.zero	8
	.globl	VOID_KEYWORD
	.align 8
	.type	VOID_KEYWORD, @object
	.size	VOID_KEYWORD, 8
VOID_KEYWORD:
	.zero	8
	.globl	BOOL_KEYWORD
	.align 8
	.type	BOOL_KEYWORD, @object
	.size	BOOL_KEYWORD, 8
BOOL_KEYWORD:
	.zero	8
	.globl	STRING_KEYWORD
	.align 8
	.type	STRING_KEYWORD, @object
	.size	STRING_KEYWORD, 8
STRING_KEYWORD:
	.zero	8
	.globl	FLOAT_KEYWORD
	.align 8
	.type	FLOAT_KEYWORD, @object
	.size	FLOAT_KEYWORD, 8
FLOAT_KEYWORD:
	.zero	8
	.globl	INT_KEYWORD
	.align 8
	.type	INT_KEYWORD, @object
	.size	INT_KEYWORD, 8
INT_KEYWORD:
	.zero	8
	.globl	CONTINUE_KEYWORD
	.align 8
	.type	CONTINUE_KEYWORD, @object
	.size	CONTINUE_KEYWORD, 8
CONTINUE_KEYWORD:
	.zero	8
	.globl	BREAK_KEYWORD
	.align 8
	.type	BREAK_KEYWORD, @object
	.size	BREAK_KEYWORD, 8
BREAK_KEYWORD:
	.zero	8
	.globl	RETURN_KEYWORD
	.align 8
	.type	RETURN_KEYWORD, @object
	.size	RETURN_KEYWORD, 8
RETURN_KEYWORD:
	.zero	8
	.globl	FALSE_KEYWORD
	.align 8
	.type	FALSE_KEYWORD, @object
	.size	FALSE_KEYWORD, 8
FALSE_KEYWORD:
	.zero	8
	.globl	TRUE_KEYWORD
	.align 8
	.type	TRUE_KEYWORD, @object
	.size	TRUE_KEYWORD, 8
TRUE_KEYWORD:
	.zero	8
	.globl	FOR_KEYWORD
	.align 8
	.type	FOR_KEYWORD, @object
	.size	FOR_KEYWORD, 8
FOR_KEYWORD:
	.zero	8
	.globl	WHILE_KEYWORD
	.align 8
	.type	WHILE_KEYWORD, @object
	.size	WHILE_KEYWORD, 8
WHILE_KEYWORD:
	.zero	8
	.globl	ELSE_KEYWORD
	.align 8
	.type	ELSE_KEYWORD, @object
	.size	ELSE_KEYWORD, 8
ELSE_KEYWORD:
	.zero	8
	.globl	ELIF_KEYWORD
	.align 8
	.type	ELIF_KEYWORD, @object
	.size	ELIF_KEYWORD, 8
ELIF_KEYWORD:
	.zero	8
	.globl	IF_KEYWORD
	.align 8
	.type	IF_KEYWORD, @object
	.size	IF_KEYWORD, 8
IF_KEYWORD:
	.zero	8
	.globl	SELF_KEYWORD
	.align 8
	.type	SELF_KEYWORD, @object
	.size	SELF_KEYWORD, 8
SELF_KEYWORD:
	.zero	8
	.globl	METHOD_KEYWORD
	.align 8
	.type	METHOD_KEYWORD, @object
	.size	METHOD_KEYWORD, 8
METHOD_KEYWORD:
	.zero	8
	.globl	CLASS_KEYWORD
	.align 8
	.type	CLASS_KEYWORD, @object
	.size	CLASS_KEYWORD, 8
CLASS_KEYWORD:
	.zero	8
	.globl	FUNC_KEYWORD
	.align 8
	.type	FUNC_KEYWORD, @object
	.size	FUNC_KEYWORD, 8
FUNC_KEYWORD:
	.zero	8
	.globl	FROM_KEYWORD
	.align 8
	.type	FROM_KEYWORD, @object
	.size	FROM_KEYWORD, 8
FROM_KEYWORD:
	.zero	8
	.globl	IMPORT_KEYWORD
	.align 8
	.type	IMPORT_KEYWORD, @object
	.size	IMPORT_KEYWORD, 8
IMPORT_KEYWORD:
	.zero	8
	.globl	all_string_list
	.align 8
	.type	all_string_list, @object
	.size	all_string_list, 8
all_string_list:
	.zero	8
	.globl	initialized
	.type	initialized, @object
	.size	initialized, 1
initialized:
	.zero	1
	.globl	string_memory
	.align 8
	.type	string_memory, @object
	.size	string_memory, 8
string_memory:
	.zero	8
	.globl	struct_memory
	.align 8
	.type	struct_memory, @object
	.size	struct_memory, 8
struct_memory:
	.zero	8
	.globl	symbolList
	.align 32
	.type	symbolList, @object
	.size	symbolList, 240
symbolList:
	.zero	240
	.section	.rodata.str1.1
.LC8:
	.string	"("
.LC9:
	.string	")"
.LC10:
	.string	"{"
.LC11:
	.string	"}"
.LC12:
	.string	","
.LC13:
	.string	"!"
.LC14:
	.string	"."
.LC15:
	.string	"["
.LC16:
	.string	"]"
.LC17:
	.string	";"
.LC18:
	.string	"_"
.LC19:
	.string	"+"
.LC20:
	.string	"-"
.LC21:
	.string	"*"
.LC22:
	.string	"/"
.LC23:
	.string	"%"
.LC24:
	.string	"<"
.LC25:
	.string	">"
.LC26:
	.string	"="
.LC27:
	.string	"=="
.LC28:
	.string	"!="
.LC29:
	.string	"<="
.LC30:
	.string	">="
.LC31:
	.string	"+="
.LC32:
	.string	"-="
.LC33:
	.string	"*="
.LC34:
	.string	"/="
.LC35:
	.string	"%="
.LC36:
	.string	"&&"
.LC37:
	.string	"||"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	symbolStrings, @object
	.size	symbolStrings, 240
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
	.type	keywordList, @object
	.size	keywordList, 176
keywordList:
	.zero	176
	.section	.rodata.str1.1
.LC38:
	.string	"import"
.LC39:
	.string	"from"
.LC40:
	.string	"func"
.LC41:
	.string	"class"
.LC42:
	.string	"method"
.LC43:
	.string	"self"
.LC44:
	.string	"if"
.LC45:
	.string	"elif"
.LC46:
	.string	"else"
.LC47:
	.string	"while"
.LC48:
	.string	"for"
.LC49:
	.string	"true"
.LC50:
	.string	"false"
.LC51:
	.string	"return"
.LC52:
	.string	"break"
.LC53:
	.string	"continue"
.LC54:
	.string	"int"
.LC55:
	.string	"float"
.LC56:
	.string	"string"
.LC57:
	.string	"bool"
.LC58:
	.string	"void"
.LC59:
	.string	"var"
	.section	.data.rel.ro.local
	.align 32
	.type	keywordStrings, @object
	.size	keywordStrings, 176
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.quad	1024
	.quad	0
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

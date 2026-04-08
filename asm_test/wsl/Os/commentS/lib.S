	.file	"lib.c"
; GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04.1) version 13.3.0 (x86_64-linux-gnu)
;	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
; options passed: -mtune=generic -march=x86-64 -Os -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt -fstack-clash-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Fatal: Cannot allocate memory\n"
	.text
	.type	increase_memory_size, @function
increase_memory_size:
	pushq	%rbp	;
	movl	%edi, %ebp	; tmp109, for_struct
; src/lib.c:84:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
; src/lib.c:83: static void increase_memory_size(bool for_struct) {
	pushq	%rbx	;
	pushq	%rcx	;
; src/lib.c:84:     MemoryBlock* new_block = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	call	*malloc@GOTPCREL(%rip)	;
; src/lib.c:85:     if (new_block == NULL) {
	testq	%rax, %rax	; tmp102
	jne	.L2	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rsi	; stderr,
	leaq	.LC0(%rip), %rdi	;, tmp104
	call	*fputs@GOTPCREL(%rip)	;
; src/lib.c:87:         MemoryBlock* current = string_memory;
	movq	string_memory(%rip), %rbx	; string_memory, current
.L3:
; src/lib.c:88:         while (current != NULL) {
	testq	%rbx, %rbx	; current
	je	.L9	;,
; src/lib.c:89:             MemoryBlock* next = current->next;
	movq	16(%rbx), %rbp	; current_16->next, next
; src/lib.c:90:             free(current->block);
	movq	24(%rbx), %rdi	; current_16->block, current_16->block
	call	*free@GOTPCREL(%rip)	;
; src/lib.c:91:             free(current);
	movq	%rbx, %rdi	; current,
	call	*free@GOTPCREL(%rip)	;
; src/lib.c:92:             current = next;
	movq	%rbp, %rbx	; next, current
	jmp	.L3	;
.L9:
; src/lib.c:94:         initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:95:         exit(1);
	movl	$1, %edi	;,
	call	*exit@GOTPCREL(%rip)	;
.L2:
	movq	%rax, %rbx	; tmp110, tmp102
; src/lib.c:97:     new_block->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	*malloc@GOTPCREL(%rip)	;
; src/lib.c:100:     new_block->next = NULL;
	xorl	%edx, %edx	;
; src/lib.c:98:     new_block->size = defaultMemorySize;
	movq	$1024, (%rbx)	;, new_block_21->size
; src/lib.c:97:     new_block->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; tmp111, new_block_21->block
; src/lib.c:100:     new_block->next = NULL;
	movq	%rdx, 8(%rbx)	;, new_block_21->used
	movq	%rdx, 16(%rbx)	;, new_block_21->next
; src/lib.c:101:     if (for_struct) {
	testb	%bpl, %bpl	; for_struct
	je	.L5	;,
; src/lib.c:102:         struct_memory_used += struct_memory->used;
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.28_4
; src/lib.c:105:         struct_memory_count += defaultMemorySize;
	addq	$1024, struct_memory_count(%rip)	;, struct_memory_count
; src/lib.c:104:         struct_memory = new_block;
	movq	%rbx, struct_memory(%rip)	; tmp102, struct_memory
; src/lib.c:102:         struct_memory_used += struct_memory->used;
	movq	8(%rax), %rdx	; struct_memory.28_4->used, struct_memory.28_4->used
; src/lib.c:103:         new_block->next = struct_memory;
	movq	%rax, 16(%rbx)	; struct_memory.28_4, new_block_21->next
; src/lib.c:102:         struct_memory_used += struct_memory->used;
	addq	%rdx, struct_memory_used(%rip)	; struct_memory.28_4->used, struct_memory_used
	jmp	.L1	;
.L5:
; src/lib.c:107:         string_memory_used += string_memory->used;
	movq	string_memory(%rip), %rax	; string_memory, string_memory.32_10
; src/lib.c:110:         string_memory_count += defaultMemorySize;
	addq	$1024, string_memory_count(%rip)	;, string_memory_count
; src/lib.c:109:         string_memory = new_block;
	movq	%rbx, string_memory(%rip)	; tmp102, string_memory
; src/lib.c:107:         string_memory_used += string_memory->used;
	movq	8(%rax), %rdx	; string_memory.32_10->used, string_memory.32_10->used
	addq	%rdx, string_memory_used(%rip)	; string_memory.32_10->used, string_memory_used
; src/lib.c:108:         new_block->next = string_memory;
	movq	%rax, 16(%rbx)	; string_memory.32_10, new_block_21->next
.L1:
; src/lib.c:112: }
	popq	%rax	;
	popq	%rbx	;
	popq	%rbp	;
	ret	
	.size	increase_memory_size, .-increase_memory_size
	.section	.rodata.str1.1
.LC1:
	.string	"src/lib.c"
.LC2:
	.string	"struct_memory->used % ALIGN_SIZE == 0"
	.text
	.globl	alloc_memory
	.type	alloc_memory, @function
alloc_memory:
; src/lib.c:259:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	;, initialized
; src/lib.c:258: pointer alloc_memory(size_t size) {
	pushq	%rbx	;
; src/lib.c:258: pointer alloc_memory(size_t size) {
	movq	%rdi, %rbx	; tmp109, size
; src/lib.c:259:     if (!initialized) init();
	jne	.L11	;,
; src/lib.c:259:     if (!initialized) init();
	call	init	;
.L11:
; src/lib.c:261:     if (struct_memory->used + size >= struct_memory->size)
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory.37_3
; src/lib.c:260:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	addq	$7, %rbx	;, _2
; src/lib.c:260:     size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
	andq	$-8, %rbx	;, size
; src/lib.c:261:     if (struct_memory->used + size >= struct_memory->size)
	movq	8(%rax), %rdx	; struct_memory.37_3->used, tmp99
	addq	%rbx, %rdx	; size, tmp99
; src/lib.c:261:     if (struct_memory->used + size >= struct_memory->size)
	cmpq	(%rax), %rdx	; struct_memory.37_3->size, tmp99
	jb	.L12	;,
; src/lib.c:262:         increase_memory_size(true);
	movl	$1, %edi	;,
	call	increase_memory_size	;
.L12:
; src/lib.c:263:     assert(struct_memory->used % ALIGN_SIZE == 0);
	movq	struct_memory(%rip), %rcx	; struct_memory, struct_memory.39_7
	movq	8(%rcx), %rdx	; struct_memory.39_7->used, _8
	testb	$7, %dl	;, _8
	je	.L13	;,
; src/lib.c:263:     assert(struct_memory->used % ALIGN_SIZE == 0);
	leaq	__PRETTY_FUNCTION__.0(%rip), %rcx	;, tmp102
	movl	$263, %edx	;,
	leaq	.LC1(%rip), %rsi	;, tmp103
	leaq	.LC2(%rip), %rdi	;, tmp104
	call	*__assert_fail@GOTPCREL(%rip)	;
.L13:
; src/lib.c:264:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	movq	%rdx, %rax	; _8, tmp105
; src/lib.c:265:     struct_memory->used += size;
	addq	%rbx, %rdx	; size, tmp107
; src/lib.c:266:     ++memoryBlockCount;
	incq	memoryBlockCount(%rip)	; memoryBlockCount
; src/lib.c:265:     struct_memory->used += size;
	movq	%rdx, 8(%rcx)	; tmp107, struct_memory.39_7->used
; src/lib.c:264:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	andq	$-8, %rax	;, tmp105
; src/lib.c:268: }
	popq	%rbx	;
; src/lib.c:264:     size_t* ptr = struct_memory->block + (struct_memory->used / ALIGN_SIZE);
	addq	24(%rcx), %rax	; struct_memory.39_7->block, <retval>
; src/lib.c:268: }
	ret	
	.size	alloc_memory, .-alloc_memory
	.section	.rodata.str1.1
.LC3:
	.string	"Info: Allocate big memory block of size %zu bytes\n"
	.text
	.type	create_string_check, @function
create_string_check:
; src/lib.c:127:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	;, initialized
; src/lib.c:126: static string create_string_check(const char* data, size_t length, bool check) {
	pushq	%r14	;
	pushq	%r13	;
	pushq	%r12	;
	movq	%rdi, %r12	; tmp130, data
	pushq	%rbp	;
	movq	%rsi, %rbp	; tmp131, length
	pushq	%rbx	;
; src/lib.c:126: static string create_string_check(const char* data, size_t length, bool check) {
	movl	%edx, %ebx	; tmp132, check
; src/lib.c:127:     if (!initialized) init();
	jne	.L16	;,
; src/lib.c:127:     if (!initialized) init();
	call	init	;
.L16:
; src/lib.c:128:     if (data == NULL || length == 0) return 0;
	testq	%r12, %r12	; data
	je	.L25	;,
	testq	%rbp, %rbp	; length
	je	.L25	;,
; src/lib.c:129:     if (check) {
	testb	%bl, %bl	; check
	je	.L18	;,
; src/lib.c:130:         StringList* current = all_string_list;
	movq	all_string_list(%rip), %r13	; all_string_list, current
; src/lib.c:131:         string existing = NULL;
	xorl	%ebx, %ebx	; <retval>
.L19:
; src/lib.c:132:         while (current != NULL) {
	testq	%r13, %r13	; current
	je	.L31	;,
; src/lib.c:133:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	cmpq	%rbp, 8(%r13)	; length, current_21->length
	jne	.L20	;,
; src/lib.c:133:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	movq	0(%r13), %r14	; current_21->str, _6
; src/lib.c:133:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	testq	%r14, %r14	; _6
	je	.L20	;,
; src/lib.c:133:             if (current->length == length && current->str != NULL && strncmp(current->str, data, length) == 0)
	movq	%rbp, %rdx	; length,
	movq	%r12, %rsi	; data,
	movq	%r14, %rdi	; _6,
	call	*strncmp@GOTPCREL(%rip)	;
; src/lib.c:134:                 existing = current->str;
	testl	%eax, %eax	; tmp133
	cmove	%r14, %rbx	; <retval>,, _6, <retval>
.L20:
; src/lib.c:135:             current = current->next;
	movq	16(%r13), %r13	; current_21->next, current
	jmp	.L19	;
.L31:
; src/lib.c:137:         if (existing != NULL)
	testq	%rbx, %rbx	; <retval>
	jne	.L15	;,
.L18:
; src/lib.c:141:     if (length >= defaultMemorySize - 1)
	cmpq	$1022, %rbp	;, length
	jbe	.L22	;,
; src/lib.c:142:         str = alloc_big_memory(length + 1);
	leaq	1(%rbp), %r13	;, _9
; src/lib.c:115:     string_memory_count += size;
	addq	%r13, string_memory_count(%rip)	; _9, string_memory_count
; src/lib.c:116:     string_memory_used += size;
	addq	%r13, string_memory_used(%rip)	; _9, string_memory_used
; src/lib.c:117:     char* block = (char*)malloc(size);
	movq	%r13, %rdi	; _9,
	call	*malloc@GOTPCREL(%rip)	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movq	stderr(%rip), %rdi	; stderr,
	movq	%r13, %rcx	; _9,
	leaq	.LC3(%rip), %rdx	;, tmp120
; src/lib.c:117:     char* block = (char*)malloc(size);
	movq	%rax, %rbx	; tmp134, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	movl	$2, %esi	;,
	xorl	%eax, %eax	;
	call	*__fprintf_chk@GOTPCREL(%rip)	;
; src/lib.c:119:     if (block == NULL) {
	testq	%rbx, %rbx	; <retval>
	jne	.L23	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC0(%rip), %rdi	;, tmp122
	movq	stderr(%rip), %rsi	; stderr,
	call	*fputs@GOTPCREL(%rip)	;
; src/lib.c:121:         exit(1);
	movl	$1, %edi	;,
	call	*exit@GOTPCREL(%rip)	;
.L22:
; src/lib.c:144:         if (string_memory->used + length >= string_memory->size)
	movq	string_memory(%rip), %rax	; string_memory, string_memory.1_10
; src/lib.c:144:         if (string_memory->used + length >= string_memory->size)
	movq	8(%rax), %rdx	; string_memory.1_10->used, tmp123
	addq	%rbp, %rdx	; length, tmp123
; src/lib.c:144:         if (string_memory->used + length >= string_memory->size)
	cmpq	(%rax), %rdx	; string_memory.1_10->size, tmp123
	jb	.L24	;,
; src/lib.c:145:             increase_memory_size(false);
	xorl	%edi, %edi	;
	call	increase_memory_size	;
.L24:
; src/lib.c:146:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	string_memory(%rip), %rax	; string_memory, string_memory.3_14
; src/lib.c:146:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	8(%rax), %rdx	; string_memory.3_14->used, _16
; src/lib.c:146:         str = &((char*)(string_memory->block))[string_memory->used];
	movq	24(%rax), %rbx	; string_memory.3_14->block, <retval>
	addq	%rdx, %rbx	; _16, <retval>
; src/lib.c:147:         string_memory->used += length + 1;
	leaq	1(%rdx,%rbp), %rdx	;, tmp127
	movq	%rdx, 8(%rax)	; tmp127, string_memory.3_14->used
.L23:
; /usr/include/x86_64-linux-gnu/bits/string_fortified.h:95:   return __builtin___strncpy_chk (__dest, __src, __len,
	movq	%rbp, %rdx	; length,
	movq	%r12, %rsi	; data,
	movq	%rbx, %rdi	; <retval>,
	call	*strncpy@GOTPCREL(%rip)	;
; src/lib.c:150:     str[length] = '\0';
	movb	$0, (%rbx,%rbp)	;, *_19
; src/lib.c:151:     StringList* new_str = (StringList*)alloc_memory(sizeof(StringList));
	movl	$24, %edi	;,
	call	alloc_memory	;
; src/lib.c:154:     new_str->next = all_string_list;
	movq	all_string_list(%rip), %rdx	; all_string_list, all_string_list
; src/lib.c:152:     new_str->str = str;
	movq	%rbx, (%rax)	; <retval>, new_str_44->str
; src/lib.c:153:     new_str->length = length;
	movq	%rbp, 8(%rax)	; length, new_str_44->length
; src/lib.c:154:     new_str->next = all_string_list;
	movq	%rdx, 16(%rax)	; all_string_list, new_str_44->next
; src/lib.c:155:     all_string_list = new_str;
	movq	%rax, all_string_list(%rip)	; new_str, all_string_list
; src/lib.c:156:     return str;
	jmp	.L15	;
.L25:
; src/lib.c:128:     if (data == NULL || length == 0) return 0;
	xorl	%ebx, %ebx	; <retval>
.L15:
; src/lib.c:157: }
	movq	%rbx, %rax	; <retval>,
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	create_string_check, .-create_string_check
	.globl	create_string_not_check
	.type	create_string_not_check, @function
create_string_not_check:
; src/lib.c:160:     return create_string_check(data, length, false);
	xorl	%edx, %edx	;
	jmp	create_string_check	;
	.size	create_string_not_check, .-create_string_not_check
	.section	.rodata.str1.1
.LC4:
	.string	"init"
.LC5:
	.string	"$constructor"
	.text
	.type	init, @function
init:
; src/lib.c:168:     if (initialized) return;
	cmpb	$0, initialized(%rip)	;, initialized
	jne	.L44	;,
; src/lib.c:167: void init(void) {
	pushq	%r13	;
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
	pushq	%rsi	;
; src/lib.c:169:     if (struct_memory == NULL) {
	cmpq	$0, struct_memory(%rip)	;, struct_memory
	jne	.L35	;,
; src/lib.c:170:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	*malloc@GOTPCREL(%rip)	;
; src/lib.c:170:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, struct_memory(%rip)	; tmp161, struct_memory
; src/lib.c:170:         struct_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, %rbx	; tmp281, tmp161
; src/lib.c:171:         if (struct_memory == NULL) {
	testq	%rax, %rax	; tmp161
	jne	.L36	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC0(%rip), %rdi	;, tmp163
	movq	stderr(%rip), %rsi	; stderr,
	call	*fputs@GOTPCREL(%rip)	;
; src/lib.c:173:             initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:174:             exit(1);
	movl	$1, %edi	;,
	call	*exit@GOTPCREL(%rip)	;
.L36:
; src/lib.c:176:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	*malloc@GOTPCREL(%rip)	;
; src/lib.c:179:         struct_memory->next = NULL;
	xorl	%ecx, %ecx	;
; src/lib.c:177:         struct_memory->size = defaultMemorySize;
	movq	$1024, (%rbx)	;, MEM[(struct MemoryBlock *)_6].size
; src/lib.c:176:         struct_memory->block = (size_t*)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; tmp282, MEM[(struct MemoryBlock *)_6].block
; src/lib.c:179:         struct_memory->next = NULL;
	movq	%rcx, 8(%rbx)	;, MEM[(struct MemoryBlock *)_6].used
	movq	%rcx, 16(%rbx)	;, MEM[(struct MemoryBlock *)_6].next
; src/lib.c:180:         struct_memory_count = defaultMemorySize;
	movq	$1024, struct_memory_count(%rip)	;, struct_memory_count
.L35:
; src/lib.c:182:     if (string_memory == NULL) {
	cmpq	$0, string_memory(%rip)	;, string_memory
	jne	.L37	;,
; src/lib.c:183:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movl	$32, %edi	;,
	call	*malloc@GOTPCREL(%rip)	;
; src/lib.c:183:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, string_memory(%rip)	; tmp165, string_memory
; src/lib.c:183:         string_memory = (MemoryBlock*)malloc(sizeof(MemoryBlock));
	movq	%rax, %rbx	; tmp283, tmp165
; src/lib.c:184:         if (string_memory == NULL) {
	testq	%rax, %rax	; tmp165
	jne	.L38	;,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:79:   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
	leaq	.LC0(%rip), %rdi	;, tmp167
	movq	stderr(%rip), %rsi	; stderr,
	call	*fputs@GOTPCREL(%rip)	;
; src/lib.c:186:             initialized = false;
	movb	$0, initialized(%rip)	;, initialized
; src/lib.c:187:             exit(1);
	movl	$1, %edi	;,
	call	*exit@GOTPCREL(%rip)	;
.L38:
; src/lib.c:189:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movl	$1024, %edi	;,
	call	*malloc@GOTPCREL(%rip)	;
; src/lib.c:192:         string_memory->next = NULL;
	xorl	%edx, %edx	;
; src/lib.c:190:         string_memory->size = defaultMemorySize;
	movq	$1024, (%rbx)	;, MEM[(struct MemoryBlock *)_10].size
; src/lib.c:189:         string_memory->block = (pointer)malloc(defaultMemorySize);
	movq	%rax, 24(%rbx)	; tmp284, MEM[(struct MemoryBlock *)_10].block
; src/lib.c:192:         string_memory->next = NULL;
	movq	%rdx, 8(%rbx)	;, MEM[(struct MemoryBlock *)_10].used
	movq	%rdx, 16(%rbx)	;, MEM[(struct MemoryBlock *)_10].next
; src/lib.c:193:         string_memory_count = defaultMemorySize;
	movq	$1024, string_memory_count(%rip)	;, string_memory_count
.L37:
; src/lib.c:195:     initialized = true;
	movb	$1, initialized(%rip)	;, initialized
	leaq	keywordStrings(%rip), %rbx	;, ivtmp.106
	leaq	keywordList(%rip), %rbp	;, ivtmp.107
	leaq	176(%rbx), %r13	;, _188
.L39:
; src/lib.c:197:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	(%rbx), %r12	; MEM[(const char * *)_185], _14
; src/lib.c:196:     for (size_t i = 0; i < keywordCount; ++i)
	addq	$8, %rbx	;, ivtmp.106
	addq	$8, %rbp	;, ivtmp.107
; src/lib.c:197:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	%r12, %rdi	; _14,
	call	*strlen@GOTPCREL(%rip)	;
; src/lib.c:197:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	xorl	%edx, %edx	;
	movq	%r12, %rdi	; _14,
; src/lib.c:197:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	%rax, %rsi	; tmp285, tmp170
; src/lib.c:197:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	call	create_string_check	;
; src/lib.c:197:         keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
	movq	%rax, -8(%rbp)	; tmp286, MEM[(char * *)_186]
; src/lib.c:196:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	%r13, %rbx	; _188, ivtmp.106
	jne	.L39	;,
	leaq	symbolStrings(%rip), %rbx	;, ivtmp.96
	leaq	symbolList(%rip), %rbp	;, ivtmp.97
	leaq	240(%rbx), %r13	;, _178
.L40:
; src/lib.c:199:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	(%rbx), %r12	; MEM[(const char * *)_175], _19
; src/lib.c:198:     for (size_t i = 0; i < symbolCount; ++i)
	addq	$8, %rbx	;, ivtmp.96
	addq	$8, %rbp	;, ivtmp.97
; src/lib.c:199:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	%r12, %rdi	; _19,
	call	*strlen@GOTPCREL(%rip)	;
; src/lib.c:199:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	xorl	%edx, %edx	;
	movq	%r12, %rdi	; _19,
; src/lib.c:199:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	%rax, %rsi	; tmp287, tmp173
; src/lib.c:199:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	call	create_string_check	;
; src/lib.c:199:         symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
	movq	%rax, -8(%rbp)	; tmp288, MEM[(char * *)_176]
; src/lib.c:198:     for (size_t i = 0; i < symbolCount; ++i)
	cmpq	%r13, %rbx	; _178, ivtmp.96
	jne	.L40	;,
; src/lib.c:200:     DEFAULT_INIT_NAME = create_string_check("init", 4, false);
	xorl	%edx, %edx	;
	movl	$4, %esi	;,
	leaq	.LC4(%rip), %rdi	;, tmp175
	call	create_string_check	;
; src/lib.c:201:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, false);
	xorl	%edx, %edx	;
	movl	$13, %esi	;,
	leaq	.LC5(%rip), %rdi	;, tmp176
; src/lib.c:200:     DEFAULT_INIT_NAME = create_string_check("init", 4, false);
	movq	%rax, DEFAULT_INIT_NAME(%rip)	; tmp289, DEFAULT_INIT_NAME
; src/lib.c:201:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, false);
	call	create_string_check	;
; src/lib.c:201:     DEFAULT_CONSTRUCTOR_NAME = create_string_check("$constructor", 13, false);
	movq	%rax, DEFAULT_CONSTRUCTOR_NAME(%rip)	; tmp290, DEFAULT_CONSTRUCTOR_NAME
; src/lib.c:202:     IMPORT_KEYWORD = keywordList[0];
	movq	keywordList(%rip), %rax	; keywordList[0], keywordList[0]
	movq	%rax, IMPORT_KEYWORD(%rip)	; keywordList[0], IMPORT_KEYWORD
; src/lib.c:203:     FROM_KEYWORD = keywordList[1];
	movq	8+keywordList(%rip), %rax	; keywordList[1], keywordList[1]
	movq	%rax, FROM_KEYWORD(%rip)	; keywordList[1], FROM_KEYWORD
; src/lib.c:204:     FUNC_KEYWORD = keywordList[2];
	movq	16+keywordList(%rip), %rax	; keywordList[2], keywordList[2]
	movq	%rax, FUNC_KEYWORD(%rip)	; keywordList[2], FUNC_KEYWORD
; src/lib.c:205:     CLASS_KEYWORD = keywordList[3];
	movq	24+keywordList(%rip), %rax	; keywordList[3], keywordList[3]
	movq	%rax, CLASS_KEYWORD(%rip)	; keywordList[3], CLASS_KEYWORD
; src/lib.c:206:     METHOD_KEYWORD = keywordList[4];
	movq	32+keywordList(%rip), %rax	; keywordList[4], keywordList[4]
	movq	%rax, METHOD_KEYWORD(%rip)	; keywordList[4], METHOD_KEYWORD
; src/lib.c:207:     SELF_KEYWORD = keywordList[5];
	movq	40+keywordList(%rip), %rax	; keywordList[5], keywordList[5]
	movq	%rax, SELF_KEYWORD(%rip)	; keywordList[5], SELF_KEYWORD
; src/lib.c:208:     IF_KEYWORD = keywordList[6];
	movq	48+keywordList(%rip), %rax	; keywordList[6], keywordList[6]
	movq	%rax, IF_KEYWORD(%rip)	; keywordList[6], IF_KEYWORD
; src/lib.c:209:     ELIF_KEYWORD = keywordList[7];
	movq	56+keywordList(%rip), %rax	; keywordList[7], keywordList[7]
	movq	%rax, ELIF_KEYWORD(%rip)	; keywordList[7], ELIF_KEYWORD
; src/lib.c:210:     ELSE_KEYWORD = keywordList[8];
	movq	64+keywordList(%rip), %rax	; keywordList[8], keywordList[8]
	movq	%rax, ELSE_KEYWORD(%rip)	; keywordList[8], ELSE_KEYWORD
; src/lib.c:211:     WHILE_KEYWORD = keywordList[9];
	movq	72+keywordList(%rip), %rax	; keywordList[9], keywordList[9]
	movq	%rax, WHILE_KEYWORD(%rip)	; keywordList[9], WHILE_KEYWORD
; src/lib.c:212:     FOR_KEYWORD = keywordList[10];
	movq	80+keywordList(%rip), %rax	; keywordList[10], keywordList[10]
	movq	%rax, FOR_KEYWORD(%rip)	; keywordList[10], FOR_KEYWORD
; src/lib.c:213:     TRUE_KEYWORD = keywordList[11];
	movq	88+keywordList(%rip), %rax	; keywordList[11], keywordList[11]
	movq	%rax, TRUE_KEYWORD(%rip)	; keywordList[11], TRUE_KEYWORD
; src/lib.c:214:     FALSE_KEYWORD = keywordList[12];
	movq	96+keywordList(%rip), %rax	; keywordList[12], keywordList[12]
	movq	%rax, FALSE_KEYWORD(%rip)	; keywordList[12], FALSE_KEYWORD
; src/lib.c:215:     RETURN_KEYWORD = keywordList[13];
	movq	104+keywordList(%rip), %rax	; keywordList[13], keywordList[13]
	movq	%rax, RETURN_KEYWORD(%rip)	; keywordList[13], RETURN_KEYWORD
; src/lib.c:216:     BREAK_KEYWORD = keywordList[14];
	movq	112+keywordList(%rip), %rax	; keywordList[14], keywordList[14]
	movq	%rax, BREAK_KEYWORD(%rip)	; keywordList[14], BREAK_KEYWORD
; src/lib.c:217:     CONTINUE_KEYWORD = keywordList[15];
	movq	120+keywordList(%rip), %rax	; keywordList[15], keywordList[15]
	movq	%rax, CONTINUE_KEYWORD(%rip)	; keywordList[15], CONTINUE_KEYWORD
; src/lib.c:218:     INT_KEYWORD = keywordList[16];
	movq	128+keywordList(%rip), %rax	; keywordList[16], keywordList[16]
	movq	%rax, INT_KEYWORD(%rip)	; keywordList[16], INT_KEYWORD
; src/lib.c:219:     FLOAT_KEYWORD = keywordList[17];
	movq	136+keywordList(%rip), %rax	; keywordList[17], keywordList[17]
	movq	%rax, FLOAT_KEYWORD(%rip)	; keywordList[17], FLOAT_KEYWORD
; src/lib.c:220:     STRING_KEYWORD = keywordList[18];
	movq	144+keywordList(%rip), %rax	; keywordList[18], keywordList[18]
	movq	%rax, STRING_KEYWORD(%rip)	; keywordList[18], STRING_KEYWORD
; src/lib.c:221:     BOOL_KEYWORD = keywordList[19];
	movq	152+keywordList(%rip), %rax	; keywordList[19], keywordList[19]
	movq	%rax, BOOL_KEYWORD(%rip)	; keywordList[19], BOOL_KEYWORD
; src/lib.c:222:     VOID_KEYWORD = keywordList[20];
	movq	160+keywordList(%rip), %rax	; keywordList[20], keywordList[20]
	movq	%rax, VOID_KEYWORD(%rip)	; keywordList[20], VOID_KEYWORD
; src/lib.c:223:     VAR_KEYWORD = keywordList[21];
	movq	168+keywordList(%rip), %rax	; keywordList[21], keywordList[21]
	movq	%rax, VAR_KEYWORD(%rip)	; keywordList[21], VAR_KEYWORD
; src/lib.c:224:     L_PAREN_SYMBOL = symbolList[0];
	movq	symbolList(%rip), %rax	; symbolList[0], symbolList[0]
	movq	%rax, L_PAREN_SYMBOL(%rip)	; symbolList[0], L_PAREN_SYMBOL
; src/lib.c:225:     R_PAREN_SYMBOL = symbolList[1];
	movq	8+symbolList(%rip), %rax	; symbolList[1], symbolList[1]
	movq	%rax, R_PAREN_SYMBOL(%rip)	; symbolList[1], R_PAREN_SYMBOL
; src/lib.c:226:     L_BRACE_SYMBOL = symbolList[2];
	movq	16+symbolList(%rip), %rax	; symbolList[2], symbolList[2]
	movq	%rax, L_BRACE_SYMBOL(%rip)	; symbolList[2], L_BRACE_SYMBOL
; src/lib.c:227:     R_BRACE_SYMBOL = symbolList[3];
	movq	24+symbolList(%rip), %rax	; symbolList[3], symbolList[3]
	movq	%rax, R_BRACE_SYMBOL(%rip)	; symbolList[3], R_BRACE_SYMBOL
; src/lib.c:228:     COMMA_SYMBOL = symbolList[4];
	movq	32+symbolList(%rip), %rax	; symbolList[4], symbolList[4]
	movq	%rax, COMMA_SYMBOL(%rip)	; symbolList[4], COMMA_SYMBOL
; src/lib.c:229:     NOT_SYMBOL = symbolList[5];
	movq	40+symbolList(%rip), %rax	; symbolList[5], symbolList[5]
	movq	%rax, NOT_SYMBOL(%rip)	; symbolList[5], NOT_SYMBOL
; src/lib.c:230:     DOT_SYMBOL = symbolList[6];
	movq	48+symbolList(%rip), %rax	; symbolList[6], symbolList[6]
	movq	%rax, DOT_SYMBOL(%rip)	; symbolList[6], DOT_SYMBOL
; src/lib.c:231:     L_BRACKET_SYMBOL = symbolList[7];
	movq	56+symbolList(%rip), %rax	; symbolList[7], symbolList[7]
	movq	%rax, L_BRACKET_SYMBOL(%rip)	; symbolList[7], L_BRACKET_SYMBOL
; src/lib.c:232:     R_BRACKET_SYMBOL = symbolList[8];
	movq	64+symbolList(%rip), %rax	; symbolList[8], symbolList[8]
	movq	%rax, R_BRACKET_SYMBOL(%rip)	; symbolList[8], R_BRACKET_SYMBOL
; src/lib.c:233:     SEMICOLON_SYMBOL = symbolList[9];
	movq	72+symbolList(%rip), %rax	; symbolList[9], symbolList[9]
	movq	%rax, SEMICOLON_SYMBOL(%rip)	; symbolList[9], SEMICOLON_SYMBOL
; src/lib.c:234:     UNDERLINE_SYMBOL = symbolList[10];
	movq	80+symbolList(%rip), %rax	; symbolList[10], symbolList[10]
	movq	%rax, UNDERLINE_SYMBOL(%rip)	; symbolList[10], UNDERLINE_SYMBOL
; src/lib.c:235:     ADD_SYMBOL = symbolList[11];
	movq	88+symbolList(%rip), %rax	; symbolList[11], symbolList[11]
	movq	%rax, ADD_SYMBOL(%rip)	; symbolList[11], ADD_SYMBOL
; src/lib.c:236:     SUB_SYMBOL = symbolList[12];
	movq	96+symbolList(%rip), %rax	; symbolList[12], symbolList[12]
	movq	%rax, SUB_SYMBOL(%rip)	; symbolList[12], SUB_SYMBOL
; src/lib.c:237:     MUL_SYMBOL = symbolList[13];
	movq	104+symbolList(%rip), %rax	; symbolList[13], symbolList[13]
	movq	%rax, MUL_SYMBOL(%rip)	; symbolList[13], MUL_SYMBOL
; src/lib.c:238:     DIV_SYMBOL = symbolList[14];
	movq	112+symbolList(%rip), %rax	; symbolList[14], symbolList[14]
	movq	%rax, DIV_SYMBOL(%rip)	; symbolList[14], DIV_SYMBOL
; src/lib.c:239:     MOD_SYMBOL = symbolList[15];
	movq	120+symbolList(%rip), %rax	; symbolList[15], symbolList[15]
	movq	%rax, MOD_SYMBOL(%rip)	; symbolList[15], MOD_SYMBOL
; src/lib.c:240:     LT_SYMBOL = symbolList[16];
	movq	128+symbolList(%rip), %rax	; symbolList[16], symbolList[16]
	movq	%rax, LT_SYMBOL(%rip)	; symbolList[16], LT_SYMBOL
; src/lib.c:241:     GT_SYMBOL = symbolList[17];
	movq	136+symbolList(%rip), %rax	; symbolList[17], symbolList[17]
	movq	%rax, GT_SYMBOL(%rip)	; symbolList[17], GT_SYMBOL
; src/lib.c:242:     ASSIGN_SYMBOL = symbolList[18];
	movq	144+symbolList(%rip), %rax	; symbolList[18], symbolList[18]
	movq	%rax, ASSIGN_SYMBOL(%rip)	; symbolList[18], ASSIGN_SYMBOL
; src/lib.c:243:     EQ_SYMBOL = symbolList[19];
	movq	152+symbolList(%rip), %rax	; symbolList[19], symbolList[19]
	movq	%rax, EQ_SYMBOL(%rip)	; symbolList[19], EQ_SYMBOL
; src/lib.c:244:     NE_SYMBOL = symbolList[20];
	movq	160+symbolList(%rip), %rax	; symbolList[20], symbolList[20]
	movq	%rax, NE_SYMBOL(%rip)	; symbolList[20], NE_SYMBOL
; src/lib.c:245:     LE_SYMBOL = symbolList[21];
	movq	168+symbolList(%rip), %rax	; symbolList[21], symbolList[21]
	movq	%rax, LE_SYMBOL(%rip)	; symbolList[21], LE_SYMBOL
; src/lib.c:246:     GE_SYMBOL = symbolList[22];
	movq	176+symbolList(%rip), %rax	; symbolList[22], symbolList[22]
	movq	%rax, GE_SYMBOL(%rip)	; symbolList[22], GE_SYMBOL
; src/lib.c:247:     ADD_ASSIGN_SYMBOL = symbolList[23];
	movq	184+symbolList(%rip), %rax	; symbolList[23], symbolList[23]
	movq	%rax, ADD_ASSIGN_SYMBOL(%rip)	; symbolList[23], ADD_ASSIGN_SYMBOL
; src/lib.c:248:     SUB_ASSIGN_SYMBOL = symbolList[24];
	movq	192+symbolList(%rip), %rax	; symbolList[24], symbolList[24]
	movq	%rax, SUB_ASSIGN_SYMBOL(%rip)	; symbolList[24], SUB_ASSIGN_SYMBOL
; src/lib.c:249:     MUL_ASSIGN_SYMBOL = symbolList[25];
	movq	200+symbolList(%rip), %rax	; symbolList[25], symbolList[25]
	movq	%rax, MUL_ASSIGN_SYMBOL(%rip)	; symbolList[25], MUL_ASSIGN_SYMBOL
; src/lib.c:250:     DIV_ASSIGN_SYMBOL = symbolList[26];
	movq	208+symbolList(%rip), %rax	; symbolList[26], symbolList[26]
	movq	%rax, DIV_ASSIGN_SYMBOL(%rip)	; symbolList[26], DIV_ASSIGN_SYMBOL
; src/lib.c:251:     MOD_ASSIGN_SYMBOL = symbolList[27];
	movq	216+symbolList(%rip), %rax	; symbolList[27], symbolList[27]
	movq	%rax, MOD_ASSIGN_SYMBOL(%rip)	; symbolList[27], MOD_ASSIGN_SYMBOL
; src/lib.c:252:     AND_SYMBOL = symbolList[28];
	movq	224+symbolList(%rip), %rax	; symbolList[28], symbolList[28]
	movq	%rax, AND_SYMBOL(%rip)	; symbolList[28], AND_SYMBOL
; src/lib.c:253:     OR_SYMBOL = symbolList[29];
	movq	232+symbolList(%rip), %rax	; symbolList[29], symbolList[29]
	movq	%rax, OR_SYMBOL(%rip)	; symbolList[29], OR_SYMBOL
; src/lib.c:254: }
	popq	%rax	;
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	ret	
.L44:
	ret	
	.size	init, .-init
	.globl	create_string
	.type	create_string, @function
create_string:
; src/lib.c:164:     return create_string_check(data, length, true);
	movl	$1, %edx	;,
	jmp	create_string_check	;
	.size	create_string, .-create_string
	.globl	is_keyword
	.type	is_keyword, @function
is_keyword:
; src/lib.c:271:     if (!initialized) init();
	cmpb	$0, initialized(%rip)	;, initialized
; src/lib.c:270: bool is_keyword(const string str) {
	pushq	%rbx	;
; src/lib.c:270: bool is_keyword(const string str) {
	movq	%rdi, %rbx	; tmp89, str
; src/lib.c:271:     if (!initialized) init();
	jne	.L49	;,
; src/lib.c:271:     if (!initialized) init();
	call	init	;
.L49:
; src/lib.c:270: bool is_keyword(const string str) {
	xorl	%eax, %eax	; i
; src/lib.c:273:         if (string_equal(str, keywordList[i]))
	leaq	keywordList(%rip), %rdx	;, tmp87
.L51:
; src/lib.c:273:         if (string_equal(str, keywordList[i]))
	cmpq	%rbx, (%rdx,%rax,8)	; str, MEM[(char * *)&keywordList + i_14 * 8]
	je	.L52	;,
; src/lib.c:272:     for (size_t i = 0; i < keywordCount; ++i)
	incq	%rax	; i
; src/lib.c:272:     for (size_t i = 0; i < keywordCount; ++i)
	cmpq	$22, %rax	;, i
	jne	.L51	;,
; src/lib.c:275:     return false;
	xorl	%eax, %eax	; <retval>
	jmp	.L48	;
.L52:
; src/lib.c:274:             return true;
	movb	$1, %al	;, <retval>
.L48:
; src/lib.c:276: }
	popq	%rbx	;
	ret	
	.size	is_keyword, .-is_keyword
	.globl	string_equal
	.type	string_equal, @function
string_equal:
; src/lib.c:279:     return a == b;
	cmpq	%rdi, %rsi	; tmp88, tmp89
	sete	%al	;, tmp87
; src/lib.c:280: }
	ret	
	.size	string_equal, .-string_equal
	.section	.rodata.str1.1
.LC6:
	.string	""
.LC7:
	.string	"%zu/%zu bytes"
.LC8:
	.string	"Platform: %d, Structure Memory Used: %s, String Memory Used: %s, stringCount: %zu, Memory Block Count: %zu"
	.text
	.globl	get_info
	.type	get_info, @function
get_info:
	pushq	%r14	;
; src/lib.c:284:     StringList* current = all_string_list;
	movq	all_string_list(%rip), %rax	; all_string_list, current
; src/lib.c:282: string get_info(void) {
	pushq	%r13	;
; src/lib.c:283:     size_t stringCount = 0;
	xorl	%r13d, %r13d	; stringCount
; src/lib.c:282: string get_info(void) {
	pushq	%r12	;
	pushq	%rbp	;
	pushq	%rbx	;
.L57:
; src/lib.c:285:     while (current != NULL) {
	testq	%rax, %rax	; current
	je	.L60	;,
; src/lib.c:287:         current = current->next;
	movq	16(%rax), %rax	; current_13->next, current
; src/lib.c:286:         stringCount++;
	incq	%r13	; stringCount
	jmp	.L57	;
.L60:
; src/lib.c:290:     string struct_memory_used_str = create_string_check("", 48, false);
	leaq	.LC6(%rip), %rbx	;, tmp98
	xorl	%edx, %edx	;
	movl	$48, %esi	;,
	movq	%rbx, %rdi	; tmp98,
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	leaq	.LC7(%rip), %r14	;, tmp104
; src/lib.c:290:     string struct_memory_used_str = create_string_check("", 48, false);
	call	create_string_check	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %rcx	; tmp104,
	movq	struct_memory_count(%rip), %r9	; struct_memory_count,
	movq	struct_memory_used(%rip), %r8	; struct_memory_used, struct_memory_used
; src/lib.c:290:     string struct_memory_used_str = create_string_check("", 48, false);
	movq	%rax, %rbp	; tmp115, struct_memory_used_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	struct_memory(%rip), %rax	; struct_memory, struct_memory
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%rbp, %rdi	; struct_memory_used_str,
	addq	8(%rax), %r8	; struct_memory.47_2->used,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/lib.c:293:     string string_memory_used_str = create_string_check("", 48, false);
	movq	%rbx, %rdi	; tmp98,
	xorl	%edx, %edx	;
	movl	$48, %esi	;,
	call	create_string_check	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%r14, %rcx	; tmp104,
	movq	string_memory_count(%rip), %r9	; string_memory_count,
	movq	string_memory_used(%rip), %r8	; string_memory_used, string_memory_used
; src/lib.c:293:     string string_memory_used_str = create_string_check("", 48, false);
	movq	%rax, %r12	; tmp116, string_memory_used_str
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	string_memory(%rip), %rax	; string_memory, string_memory
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	movq	%r12, %rdi	; string_memory_used_str,
	addq	8(%rax), %r8	; string_memory.50_7->used,
	xorl	%eax, %eax	;
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/lib.c:296:     string info = (string)create_string_check("", 240, false);
	movq	%rbx, %rdi	; tmp98,
	xorl	%edx, %edx	;
	movl	$240, %esi	;,
	call	create_string_check	;
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	movq	%rbp, %r9	; struct_memory_used_str,
	movl	$3, %r8d	;,
	leaq	.LC8(%rip), %rcx	;, tmp113
; src/lib.c:296:     string info = (string)create_string_check("", 240, false);
	movq	%rax, %rbx	; tmp117, <retval>
; /usr/include/x86_64-linux-gnu/bits/stdio2.h:30:   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
	pushq	%rax	;
	orq	$-1, %rdx	;,
	movl	$2, %esi	;,
	pushq	memoryBlockCount(%rip)	; memoryBlockCount
	movq	%rbx, %rdi	; <retval>,
	xorl	%eax, %eax	;
	pushq	%r13	; stringCount
	pushq	%r12	; string_memory_used_str
	call	*__sprintf_chk@GOTPCREL(%rip)	;
; src/lib.c:299: }
	movq	%rbx, %rax	; <retval>,
; src/lib.c:298:     return info;
	addq	$32, %rsp	;,
; src/lib.c:299: }
	popq	%rbx	;
	popq	%rbp	;
	popq	%r12	;
	popq	%r13	;
	popq	%r14	;
	ret	
	.size	get_info, .-get_info
	.globl	to_lower
	.type	to_lower, @function
to_lower:
; src/lib.c:302:     return (c >= 'A' && c <= 'Z') ? (c + ('a' - 'A')) : c;
	leal	-65(%rdi), %edx	;, tmp88
; src/lib.c:301: inline char to_lower(char c) {
	movl	%edi, %eax	; c, c
; src/lib.c:302:     return (c >= 'A' && c <= 'Z') ? (c + ('a' - 'A')) : c;
	cmpb	$25, %dl	;, tmp88
	ja	.L62	;,
; src/lib.c:302:     return (c >= 'A' && c <= 'Z') ? (c + ('a' - 'A')) : c;
	leal	32(%rdi), %eax	;, c
.L62:
; src/lib.c:303: }
	ret	
	.size	to_lower, .-to_lower
	.globl	to_upper
	.type	to_upper, @function
to_upper:
; src/lib.c:306:     return (c >= 'a' && c <= 'z') ? (c - ('a' - 'A')) : c;
	leal	-97(%rdi), %edx	;, tmp88
; src/lib.c:305: inline char to_upper(char c) {
	movl	%edi, %eax	; c, c
; src/lib.c:306:     return (c >= 'a' && c <= 'z') ? (c - ('a' - 'A')) : c;
	cmpb	$25, %dl	;, tmp88
	ja	.L64	;,
; src/lib.c:306:     return (c >= 'a' && c <= 'z') ? (c - ('a' - 'A')) : c;
	leal	-32(%rdi), %eax	;, c
.L64:
; src/lib.c:307: }
	ret	
	.size	to_upper, .-to_upper
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
	.globl	DEFAULT_CONSTRUCTOR_NAME
	.align 8
	.type	DEFAULT_CONSTRUCTOR_NAME, @object
	.size	DEFAULT_CONSTRUCTOR_NAME, 8
DEFAULT_CONSTRUCTOR_NAME:
	.zero	8
	.globl	DEFAULT_INIT_NAME
	.align 8
	.type	DEFAULT_INIT_NAME, @object
	.size	DEFAULT_INIT_NAME, 8
DEFAULT_INIT_NAME:
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
.LC9:
	.string	"("
.LC10:
	.string	")"
.LC11:
	.string	"{"
.LC12:
	.string	"}"
.LC13:
	.string	","
.LC14:
	.string	"!"
.LC15:
	.string	"."
.LC16:
	.string	"["
.LC17:
	.string	"]"
.LC18:
	.string	";"
.LC19:
	.string	"_"
.LC20:
	.string	"+"
.LC21:
	.string	"-"
.LC22:
	.string	"*"
.LC23:
	.string	"/"
.LC24:
	.string	"%"
.LC25:
	.string	"<"
.LC26:
	.string	">"
.LC27:
	.string	"="
.LC28:
	.string	"=="
.LC29:
	.string	"!="
.LC30:
	.string	"<="
.LC31:
	.string	">="
.LC32:
	.string	"+="
.LC33:
	.string	"-="
.LC34:
	.string	"*="
.LC35:
	.string	"/="
.LC36:
	.string	"%="
.LC37:
	.string	"&&"
.LC38:
	.string	"||"
	.section	.data.rel.ro.local,"aw"
	.align 32
	.type	symbolStrings, @object
	.size	symbolStrings, 240
symbolStrings:
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
	.quad	.LC38
	.globl	keywordList
	.bss
	.align 32
	.type	keywordList, @object
	.size	keywordList, 176
keywordList:
	.zero	176
	.section	.rodata.str1.1
.LC39:
	.string	"import"
.LC40:
	.string	"from"
.LC41:
	.string	"func"
.LC42:
	.string	"class"
.LC43:
	.string	"method"
.LC44:
	.string	"self"
.LC45:
	.string	"if"
.LC46:
	.string	"elif"
.LC47:
	.string	"else"
.LC48:
	.string	"while"
.LC49:
	.string	"for"
.LC50:
	.string	"true"
.LC51:
	.string	"false"
.LC52:
	.string	"return"
.LC53:
	.string	"break"
.LC54:
	.string	"continue"
.LC55:
	.string	"int"
.LC56:
	.string	"float"
.LC57:
	.string	"string"
.LC58:
	.string	"bool"
.LC59:
	.string	"void"
.LC60:
	.string	"var"
	.section	.data.rel.ro.local
	.align 32
	.type	keywordStrings, @object
	.size	keywordStrings, 176
keywordStrings:
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
	.quad	.LC60
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits

	.file	"file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	getcwd	 ;
 ; D:/TC/src/file.c:11: }
	addq	$40, %rsp	 ;,
	ret	
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp159, path
	movq	%rdx, %rdi	 ; tmp160, base_path
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp161, tmp128
 ; D:/TC/src/file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rbx, %rcx	 ; path,
	call	create_string_not_check	 ;
	movq	%rax, %rbx	 ; tmp162, <retval>
 ; D:/TC/src/file.c:24:     size_t path_len = strlen(path);
	movq	%rax, %rcx	 ; <retval>,
	call	strlen	 ;
	movq	%rax, %rsi	 ; tmp131, path_len
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	 ; tmp131
	je	.L4	 ;,
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	movl	$0, %edx	 ;, i
	jmp	.L11	 ;
.L27:
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	 ;, *_2
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	 ;, i
	jbe	.L24	 ;,
.L6:
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rdx), %rcx	 ;, _6
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rcx)	 ;, *_6
	je	.L25	 ;,
.L10:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rcx	 ;, _14
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rcx)	 ;, *_14
	jne	.L9	 ;,
.L19:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rdx), %rbp	 ;, _16
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rdx)	 ;, *_17
	jne	.L9	 ;,
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rax	 ;, tmp145
 ; D:/TC/src/file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp172
	subq	%rdx, %r8	 ; i, tmp172
	movq	%rax, %rdx	 ; tmp145,
	call	memmove	 ;
 ; D:/TC/src/file.c:34:             path_len--;
	subq	$1, %rsi	 ;, path_len
 ; D:/TC/src/file.c:35:             i--;
	movq	%rbp, %rdx	 ; _16, i
	jmp	.L9	 ;
.L25:
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rdx), %rbp	 ;, _8
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rdx)	 ;, *_9
	jne	.L10	 ;,
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rax	 ;, tmp139
 ; D:/TC/src/file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp171
	subq	%rdx, %r8	 ; i, tmp171
	movq	%rax, %rdx	 ; tmp139,
	call	memmove	 ;
 ; D:/TC/src/file.c:29:             path_len -= 2;
	subq	$2, %rsi	 ;, path_len
 ; D:/TC/src/file.c:30:             i -= 2;
	movq	%rbp, %rdx	 ; _8, i
.L8:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	 ; i
	jne	.L10	 ;,
.L9:
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, %rdx	 ;, i
 ; D:/TC/src/file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rsi, %rdx	 ; path_len, i
	jnb	.L26	 ;,
.L11:
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rdx), %rcx	 ;, _2
	movzbl	(%rcx), %eax	 ; *_2, _3
 ; D:/TC/src/file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	 ;, _3
	je	.L27	 ;,
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	 ;, i
	jbe	.L8	 ;,
 ; D:/TC/src/file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _3
	jne	.L9	 ;,
	jmp	.L6	 ;
.L26:
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpq	$2, %rsi	 ;, path_len
	jbe	.L12	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, (%rbx)	 ;, *path_54
	je	.L28	 ;,
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movzbl	(%rbx), %eax	 ; *path_54, tmp174
	subl	$65, %eax	 ;, tmp157
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp157
	ja	.L4	 ;,
.L18:
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, 1(%rbx)	 ;, MEM[(char *)path_54 + 1B]
	jne	.L4	 ;,
	jmp	.L3	 ;
.L28:
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movzbl	1(%rbx), %eax	 ; MEM[(char *)path_54 + 1B], _23
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	leal	-97(%rax), %edx	 ;, tmp146
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$25, %dl	 ;, tmp146
	ja	.L14	 ;,
 ; D:/TC/src/file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, 2(%rbx)	 ;, MEM[(char *)path_54 + 2B]
	je	.L29	 ;,
.L14:
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	 ;, *path_54
	je	.L3	 ;,
	jmp	.L4	 ;
.L29:
 ; D:/TC/src/file.c:40:         path[0] = to_upper(path[1]);
	movsbl	%al, %ecx	 ; _23, _23
	call	to_upper	 ;
 ; D:/TC/src/file.c:40:         path[0] = to_upper(path[1]);
	movb	%al, (%rbx)	 ; tmp164, *path_54
 ; D:/TC/src/file.c:41:         path[1] = ':';
	movb	$58, 1(%rbx)	 ;, MEM[(char *)path_54 + 1B]
 ; D:/TC/src/file.c:42:         return path;
	jmp	.L3	 ;
.L12:
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	je	.L30	 ;,
 ; D:/TC/src/file.c:55:     if (path_len > 0 && path[0] == '/')
	testq	%rsi, %rsi	 ; path_len
	jne	.L14	 ;,
.L4:
 ; D:/TC/src/file.c:57:     if (base_path == NULL)
	testq	%rdi, %rdi	 ; base_path
	je	.L31	 ;,
.L17:
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%rdi, %rcx	 ; base_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rsi,%rax), %rbp	 ;, total_len
 ; D:/TC/src/file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%rbp, %rdx	 ; total_len,
	leaq	.LC0(%rip), %rcx	 ;, tmp154
	call	create_string_not_check	 ;
	movq	%rax, %rsi	 ; tmp167, abs_path
 ; D:/TC/src/file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rbx, %r9	 ; <retval>,
	movq	%rdi, %r8	 ; base_path,
	leaq	.LC1(%rip), %rdx	 ;, tmp155
	movq	%rax, %rcx	 ; abs_path,
	call	sprintf	 ;
 ; D:/TC/src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	%rbp, %rdx	 ; total_len,
	movq	%rsi, %rcx	 ; abs_path,
	call	create_string	 ;
	movq	%rax, %rcx	 ; tmp168, _38
 ; D:/TC/src/file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movl	$0, %edx	 ;,
	call	absolute_path	 ;
	movq	%rax, %rbx	 ; tmp169, <retval>
.L3:
 ; D:/TC/src/file.c:65: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L30:
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movzbl	(%rbx), %eax	 ; *path_54, tmp173
	subl	$65, %eax	 ;, tmp148
 ; D:/TC/src/file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp148
	jbe	.L18	 ;,
	jmp	.L14	 ;
.L31:
 ; D:/TC/src/file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	getcwd	 ;
	movq	%rax, %rdi	 ; tmp165, base_path
 ; D:/TC/src/file.c:59:     if (base_path == NULL)
	testq	%rax, %rax	 ; base_path
	jne	.L17	 ;,
	jmp	.L3	 ;
.L24:
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	 ; i
	je	.L9	 ;,
 ; D:/TC/src/file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rcx	 ;, _14
	jmp	.L19	 ;
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.align 8
.LC3:
	.ascii "Warning: Path component too long, truncating to %zu characters\12\0"
.LC4:
	.ascii ".\0"
.LC5:
	.ascii "..\0"
	.text
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	andq	$-16, %rsp	 ;,
	subq	$304, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp215, path
 ; D:/TC/src/file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r14	 ; tmp216, <retval>
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	movl	$0, %edx	 ;,
	movq	%rbx, %rcx	 ; path,
	call	absolute_path	 ;
	movq	%rax, %rcx	 ; tmp217, _1
 ; D:/TC/src/file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%r14)	 ; _1, file_4->path
 ; D:/TC/src/file.c:172:     size_t path_len = strlen(file->path);
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp218, tmp146
 ; D:/TC/src/file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	leaq	1(%rax), %rdx	 ;, tmp148
	leaq	.LC0(%rip), %rcx	 ;, tmp149
	call	create_string_not_check	 ;
	movq	%rax, %r13	 ; tmp219, path_copy
 ; D:/TC/src/file.c:176:     strcpy(path_copy, file->path);
	movq	24(%r14), %rdx	 ; file_4->path, file_4->path
	movq	%rax, %rcx	 ; path_copy,
	call	strcpy	 ;
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%rdi, %rdi	 ; tmp146
	je	.L54	 ;,
 ; D:/TC/src/file.c:181:     size_t start = 0;
	movl	$0, %ebx	 ;, start
 ; D:/TC/src/file.c:178:     StrNode* dirs_head = NULL;
	movq	$0, 40(%rsp)	 ;, %sfp
 ; D:/TC/src/file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%r13)	 ;, *path_copy_12
	jne	.L33	 ;,
 ; D:/TC/src/file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp220, node
	movq	%rax, 40(%rsp)	 ; node, %sfp
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp151
	call	create_string	 ;
 ; D:/TC/src/file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%rsi)	 ; tmp221, node_15->dir
 ; D:/TC/src/file.c:200:         node->next = 0;
	movq	$0, 8(%rsi)	 ;, node_15->next
 ; D:/TC/src/file.c:204:         start = 1;
	movl	$1, %ebx	 ;, start
	jmp	.L33	 ;
.L67:
 ; D:/TC/src/file.c:215:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	call	__getreent	 ;
 ; D:/TC/src/file.c:215:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	movq	%r15, %r8	 ; comp_len,
	leaq	.LC3(%rip), %rdx	 ;, tmp153
	call	fprintf	 ;
 ; D:/TC/src/file.c:216:                     comp_len = componentMaxSize - 1;
	movl	$255, %r15d	 ;, comp_len
	jmp	.L37	 ;
.L56:
 ; D:/TC/src/file.c:236:                             StrNode* prev = dirs_head;
	movq	%rsi, %rax	 ; node, prev
	jmp	.L41	 ;
.L57:
 ; D:/TC/src/file.c:238:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _38, prev
.L41:
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L36	 ;,
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_37->next, _38
 ; D:/TC/src/file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	40(%rsp), %rcx	 ; %sfp, node
	cmpq	%rcx, %rdx	 ; node, _38
	jne	.L57	 ;,
 ; D:/TC/src/file.c:241:                                 prev->next = 0;
	movq	$0, 8(%rax)	 ;, prev_37->next
 ; D:/TC/src/file.c:242:                                 dirs_tail = prev;
	movq	%rax, 40(%rsp)	 ; prev, %sfp
	jmp	.L36	 ;
.L40:
 ; D:/TC/src/file.c:245:                     } else if (dirs_head == NULL) {
	testq	%rsi, %rsi	 ; node
	jne	.L36	 ;,
 ; D:/TC/src/file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp228, node
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp173
	call	create_string	 ;
 ; D:/TC/src/file.c:248:                         node->dir = create_string("..", 2);
	movq	%rax, (%rsi)	 ; tmp229, node_39->dir
 ; D:/TC/src/file.c:249:                         node->next = 0;
	movq	$0, 8(%rsi)	 ;, node_39->next
 ; D:/TC/src/file.c:251:                         dirs_tail = node;
	movq	%rsi, 40(%rsp)	 ; node, %sfp
	jmp	.L36	 ;
.L39:
 ; D:/TC/src/file.c:253:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	jne	.L65	 ;,
.L36:
 ; D:/TC/src/file.c:266:             start = i + 1;
	leaq	1(%rbx), %r12	 ;, start
.L35:
 ; D:/TC/src/file.c:268:         i++;
	leaq	1(%rbx), %rax	 ;, i
 ; D:/TC/src/file.c:210:     while (i <= path_len) {
	cmpq	%rbx, %rdi	 ; start, tmp146
	je	.L66	 ;,
	movq	%rax, %rbx	 ; i, start
.L44:
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rbx, %rdi	 ; start, tmp146
	je	.L34	 ;,
 ; D:/TC/src/file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%r13,%rbx)	 ;, MEM[(char *)path_copy_12 + i_152 * 1]
	jne	.L35	 ;,
.L34:
 ; D:/TC/src/file.c:212:             if (i > start) {
	cmpq	%rbx, %r12	 ; start, start
	jnb	.L36	 ;,
 ; D:/TC/src/file.c:213:                 size_t comp_len = i - start;
	movq	%rbx, %r15	 ; start, comp_len
	subq	%r12, %r15	 ; start, comp_len
 ; D:/TC/src/file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, %r15	 ;, comp_len
	ja	.L67	 ;,
.L37:
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	0(%r13,%r12), %rdx	 ;, tmp154
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	%r15, %r8	 ; comp_len,
	movq	32(%rsp), %r12	 ; %sfp, tmp212
	movq	%r12, %rcx	 ; tmp212,
	call	strncpy	 ;
 ; D:/TC/src/file.c:220:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r15)	 ;, component[comp_len_25]
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	leaq	.LC4(%rip), %rdx	 ;,
	movq	%r12, %rcx	 ; tmp212,
	call	strcmp	 ;
 ; D:/TC/src/file.c:222:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; tmp223
	je	.L36	 ;,
 ; D:/TC/src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	leaq	.LC5(%rip), %rdx	 ;,
	movq	%r12, %rcx	 ; tmp212,
	call	strcmp	 ;
 ; D:/TC/src/file.c:224:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; tmp224
	jne	.L39	 ;,
 ; D:/TC/src/file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	movq	40(%rsp), %r15	 ; %sfp, node
	testq	%r15, %r15	 ; node
	je	.L40	 ;,
	cmpq	%rsi, %r15	 ; node, node
	je	.L40	 ;,
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rcx	 ; dirs_tail_154->dir, dirs_tail_154->dir
	leaq	.LC5(%rip), %rdx	 ;, tmp171
	call	strcmp	 ;
 ; D:/TC/src/file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; tmp225
	jne	.L56	 ;,
 ; D:/TC/src/file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp226, node
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp172
	call	create_string	 ;
 ; D:/TC/src/file.c:230:                             node->dir = create_string("..", 2);
	movq	%rax, (%r12)	 ; tmp227, node_35->dir
 ; D:/TC/src/file.c:231:                             node->next = 0;
	movq	$0, 8(%r12)	 ;, node_35->next
 ; D:/TC/src/file.c:232:                             dirs_tail->next = node;
	movq	%r12, 8(%r15)	 ; node, dirs_tail_154->next
 ; D:/TC/src/file.c:233:                             dirs_tail = node;
	movq	%r12, 40(%rsp)	 ; node, %sfp
	jmp	.L36	 ;
.L65:
 ; D:/TC/src/file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r12	 ; tmp230, node
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	leaq	48(%rsp), %rcx	 ;, tmp174
	movq	%r15, %rdx	 ; comp_len,
	call	create_string	 ;
 ; D:/TC/src/file.c:256:                     node->dir = create_string(component, comp_len);
	movq	%rax, (%r12)	 ; tmp231, node_42->dir
 ; D:/TC/src/file.c:257:                     node->next = 0;
	movq	$0, 8(%r12)	 ;, node_42->next
 ; D:/TC/src/file.c:259:                     if (dirs_tail != NULL)
	movq	40(%rsp), %rax	 ; %sfp, node
	testq	%rax, %rax	 ; node
	je	.L43	 ;,
 ; D:/TC/src/file.c:260:                         dirs_tail->next = node;
	movq	%r12, 8(%rax)	 ; node, dirs_tail_154->next
.L43:
 ; D:/TC/src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rsi, %rsi	 ; node
	je	.L58	 ;,
 ; D:/TC/src/file.c:262:                     dirs_tail = node;
	movq	%r12, 40(%rsp)	 ; node, %sfp
	jmp	.L36	 ;
.L58:
	movq	%r12, 40(%rsp)	 ; node, %sfp
 ; D:/TC/src/file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	%r12, %rsi	 ; node, node
	jmp	.L36	 ;
.L66:
 ; D:/TC/src/file.c:272:     file->dirs = dirs_head;
	movq	%rsi, (%r14)	 ; node, file_4->dirs
 ; D:/TC/src/file.c:275:     if (dirs_tail != NULL) {
	movq	40(%rsp), %rax	 ; %sfp, node
	testq	%rax, %rax	 ; node
	je	.L45	 ;,
 ; D:/TC/src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%rax), %rdi	 ; dirs_tail_87->dir, _46
 ; D:/TC/src/file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%rdi, %rcx	 ; _46,
	call	strrchr	 ;
	movq	%rax, %rbx	 ; tmp232, dot
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	 ; dot
	je	.L46	 ;,
	cmpq	%rax, %rdi	 ; dot, _46
	je	.L46	 ;,
 ; D:/TC/src/file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
	subq	%rdi, %rdx	 ; _46, name_len
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rdi, %rcx	 ; _46,
	call	create_string	 ;
 ; D:/TC/src/file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%r14)	 ; tmp233, file_4->name
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rcx	 ; dot,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp234, tmp181
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rcx	 ; dot,
	call	create_string	 ;
	movq	%rax, 40(%rsp)	 ; tmp235, %sfp
 ; D:/TC/src/file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L47	 ;
.L46:
 ; D:/TC/src/file.c:285:             file->name = dirs_tail->dir;
	movq	%rdi, 16(%r14)	 ; _46, file_4->name
	movq	$0, 40(%rsp)	 ;, %sfp
.L47:
 ; D:/TC/src/file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	40(%rsp), %rax	 ; %sfp, node
	movq	%rax, 8(%r14)	 ; node, file_4->extension
 ; D:/TC/src/file.c:298:     while (current != NULL) {
	testq	%rsi, %rsi	 ; node
	je	.L48	 ;,
 ; D:/TC/src/file.c:295:     StrNode* current = dirs_head;
	movq	%rsi, %rbx	 ; node, current
 ; D:/TC/src/file.c:296:     size_t node_count = 0;
	movl	$0, %edi	 ;, node_count
 ; D:/TC/src/file.c:294:     size_t full_path_len = 0;
	movl	$0, %r12d	 ;, full_path_len
.L49:
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	movq	(%rbx), %rcx	 ; current_158->dir, current_158->dir
	call	strlen	 ;
 ; D:/TC/src/file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, %r12	 ; tmp236, full_path_len
	movq	%rdi, %rax	 ; node_count, node_count
 ; D:/TC/src/file.c:300:         node_count++;
	addq	$1, %rdi	 ;, node_count
 ; D:/TC/src/file.c:301:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_158->next, current
 ; D:/TC/src/file.c:298:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	jne	.L49	 ;,
 ; D:/TC/src/file.c:306:         full_path_len += (node_count - 1);
	addq	%r12, %rax	 ; full_path_len, tmp205
	cmpq	$1, %rdi	 ;, node_count
	cmova	%rax, %r12	 ; tmp205,, full_path_len
 ; D:/TC/src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	leaq	1(%r12), %rdx	 ;, tmp201
	leaq	.LC0(%rip), %rcx	 ;, tmp202
	call	create_string_not_check	 ;
	movq	%rax, %rbx	 ; tmp237, full_path
 ; D:/TC/src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_53
	movl	$1, %eax	 ;, is_first
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %r12	 ;, tmp210
	movl	$0, %edi	 ;, is_first
	jmp	.L52	 ;
.L45:
 ; D:/TC/src/file.c:289:         file->name = NULL;
	movq	$0, 16(%r14)	 ;, file_4->name
	jmp	.L47	 ;
.L51:
 ; D:/TC/src/file.c:320:         strcat(full_path, current->dir);
	movq	(%rsi), %rdx	 ; current_164->dir, current_164->dir
	movq	%rbx, %rcx	 ; full_path,
	call	strcat	 ;
 ; D:/TC/src/file.c:322:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_164->next, node
	movl	%edi, %eax	 ; is_first, is_first
 ; D:/TC/src/file.c:313:     while (current != NULL) {
	testq	%rsi, %rsi	 ; node
	je	.L53	 ;,
.L52:
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	 ; is_first
	jne	.L51	 ;,
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rsi), %rcx	 ; current_164->dir, current_164->dir
	movq	%r12, %rdx	 ; tmp210,
	call	strcmp	 ;
 ; D:/TC/src/file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; tmp238
	je	.L51	 ;,
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rbx)	 ;, MEM[(const char *)full_path_53]
	je	.L51	 ;,
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rbx, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rbx,%rax)	 ;, *_73
	je	.L51	 ;,
 ; D:/TC/src/file.c:317:                 strcat(full_path, "/");
	movw	$47, (%rbx,%rax)	 ;, MEM <char[1:2]> [(void *)_75]
	jmp	.L51	 ;
.L48:
 ; D:/TC/src/file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp200
	call	create_string_not_check	 ;
	movq	%rax, %rbx	 ; tmp242, full_path
 ; D:/TC/src/file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_131
.L53:
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rcx	 ; full_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp240, tmp197
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rcx	 ; full_path,
	call	create_string	 ;
 ; D:/TC/src/file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%r14)	 ; tmp241, file_4->path
 ; D:/TC/src/file.c:20: }
	movq	%r14, %rax	 ; <retval>,
	leaq	-56(%rbp), %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
.L54:
 ; D:/TC/src/file.c:181:     size_t start = 0;
	movq	%rdi, %rbx	 ; tmp146, start
 ; D:/TC/src/file.c:178:     StrNode* dirs_head = NULL;
	movq	$0, 40(%rsp)	 ;, %sfp
.L33:
	movq	40(%rsp), %rsi	 ; %sfp, node
	movq	%rbx, %r12	 ; start, start
 ; D:/TC/src/file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %rax	 ;, tmp212
	movq	%rax, 32(%rsp)	 ; tmp212, %sfp
	jmp	.L44	 ;
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
 ; D:/TC/src/file.c:68:     return path->name;
	movq	16(%rcx), %rax	 ; path_2(D)->name, path_2(D)->name
 ; D:/TC/src/file.c:69: }
	ret	
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
 ; D:/TC/src/file.c:72:     return path->extension;
	movq	8(%rcx), %rax	 ; path_2(D)->extension, path_2(D)->extension
 ; D:/TC/src/file.c:73: }
	ret	
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	(%rcx), %rax	 ; path_31(D)->dirs, _1
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rax, %rax	 ; _1
	je	.L78	 ;,
	movq	%rcx, %rbp	 ; tmp130, path
 ; D:/TC/src/file.c:80:     size_t node_count = 0;
	movl	$0, %edi	 ;, node_count
 ; D:/TC/src/file.c:79:     size_t total_len = 0;
	movl	$0, %esi	 ;, total_len
	jmp	.L73	 ;
.L81:
 ; D:/TC/src/file.c:84:             size_t dir_len = strlen(current->dir);
	movq	(%rax), %rcx	 ; current_57->dir, current_57->dir
	call	strlen	 ;
 ; D:/TC/src/file.c:85:             total_len += dir_len;
	addq	%rax, %rsi	 ; tmp131, total_len
 ; D:/TC/src/file.c:86:             node_count++;
	addq	$1, %rdi	 ;, node_count
	movq	%rbx, %rax	 ; <retval>, _1
.L73:
 ; D:/TC/src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rax), %rbx	 ; current_57->next, <retval>
 ; D:/TC/src/file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	 ; <retval>
	jne	.L81	 ;,
 ; D:/TC/src/file.c:91:     if (node_count == 0) return NULL;
	testq	%rdi, %rdi	 ; node_count
	je	.L70	 ;,
 ; D:/TC/src/file.c:95:         total_len += node_count - 1;
	leaq	-1(%rsi,%rdi), %rax	 ;, tmp125
	cmpq	$1, %rdi	 ;, node_count
	cmova	%rax, %rsi	 ; tmp125,, total_len
 ; D:/TC/src/file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	leaq	1(%rsi), %rdx	 ;, tmp109
	leaq	.LC0(%rip), %rcx	 ;, tmp110
	call	create_string_not_check	 ;
	movq	%rax, %rsi	 ; tmp132, dir_path
 ; D:/TC/src/file.c:99:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_35
 ; D:/TC/src/file.c:101:     current = path->dirs;
	movq	0(%rbp), %rbx	 ; path_31(D)->dirs, current
 ; D:/TC/src/file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L75	 ;,
 ; D:/TC/src/file.c:102:     bool first = true;
	movl	$1, %eax	 ;, first
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rbp	 ;, tmp128
	movl	$0, %edi	 ;, first
	jmp	.L77	 ;
.L76:
 ; D:/TC/src/file.c:110:             strcat(dir_path, current->dir);
	movq	(%rbx), %rdx	 ; current_58->dir, current_58->dir
	movq	%rsi, %rcx	 ; dir_path,
	call	strcat	 ;
 ; D:/TC/src/file.c:113:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_58->next, current
	movl	%edi, %eax	 ; first, first
 ; D:/TC/src/file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L75	 ;,
.L77:
 ; D:/TC/src/file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_58->next
	je	.L75	 ;,
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	 ; first
	jne	.L76	 ;,
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rcx	 ; current_58->dir, current_58->dir
	movq	%rbp, %rdx	 ; tmp128,
	call	strcmp	 ;
 ; D:/TC/src/file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; tmp133
	je	.L76	 ;,
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rsi)	 ;, MEM[(const char *)dir_path_35]
	je	.L76	 ;,
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:/TC/src/file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rsi,%rax)	 ;, *_12
	je	.L76	 ;,
 ; D:/TC/src/file.c:108:                     strcat(dir_path, "/");
	movw	$47, (%rsi,%rax)	 ;, MEM <char[1:2]> [(void *)_40]
	jmp	.L76	 ;
.L75:
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp135, tmp121
 ; D:/TC/src/file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	create_string	 ;
	movq	%rax, %rbx	 ; tmp136, <retval>
.L70:
 ; D:/TC/src/file.c:117: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L78:
 ; D:/TC/src/file.c:76:     if (path->dirs == NULL) return 0;
	movq	%rax, %rbx	 ; _1, <retval>
	jmp	.L70	 ;
	.section .rdata,"dr"
.LC6:
	.ascii "%s/%s%s\0"
.LC7:
	.ascii "%s%s\0"
	.text
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$48, %rsp	 ;,
	movq	%rcx, %rbx	 ; tmp133, file
 ; D:/TC/src/file.c:124:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
	movq	%rax, %rsi	 ; tmp134, dir
 ; D:/TC/src/file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	leaq	.LC0(%rip), %rbp	 ;, tmp132
	cmovne	%rax, %rbp	 ; dir,, iftmp.1_14
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r12	 ; file_18(D)->extension, _1
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r12, %r12	 ; _1
	je	.L93	 ;,
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rbp, %rcx	 ; iftmp.1_14,
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp138, tmp114
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdi	 ;, path_len
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; _1,
	call	strlen	 ;
 ; D:/TC/src/file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	leaq	(%rax,%rdi), %rdx	 ;, path_len
.L88:
 ; D:/TC/src/file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	addq	$1, %rdx	 ;, tmp104
	leaq	.LC0(%rip), %rcx	 ;, tmp105
	call	create_string_not_check	 ;
	movq	%rax, %rdi	 ; tmp135, new_path
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rsi, %rsi	 ; dir
	je	.L86	 ;,
 ; D:/TC/src/file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%rbp)	 ;, MEM[(const char *)iftmp.1_14]
	jne	.L94	 ;,
.L86:
 ; D:/TC/src/file.c:135:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	%r12, %r9	 ; _1,
	movq	16(%rbx), %r8	 ; file_18(D)->name,
	leaq	.LC7(%rip), %rdx	 ;, tmp109
	movq	%rdi, %rcx	 ; new_path,
	call	sprintf	 ;
.L87:
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp136, tmp111
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	create_string	 ;
 ; D:/TC/src/file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp137, file_18(D)->path
 ; D:/TC/src/file.c:138: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L94:
 ; D:/TC/src/file.c:133:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	%r12, 32(%rsp)	 ; _1,
	movq	16(%rbx), %r9	 ; file_18(D)->name,
	movq	%rbp, %r8	 ; iftmp.1_14,
	leaq	.LC6(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L87	 ;
.L93:
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rbp, %rcx	 ; iftmp.1_14,
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp141, tmp125
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:/TC/src/file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdx	 ;, path_len
 ; D:/TC/src/file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r12	 ;, _1
	jmp	.L88	 ;
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
 ; D:/TC/src/file.c:120:     return path->path;
	movq	24(%rcx), %rax	 ; path_2(D)->path, path_2(D)->path
 ; D:/TC/src/file.c:121: }
	ret	
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	subq	$40, %rsp	 ;,
 ; D:/TC/src/file.c:141:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; tmp85, file_2(D)->extension
 ; D:/TC/src/file.c:142:     rebuild_full_path(file);
	call	rebuild_full_path	 ;
 ; D:/TC/src/file.c:143: }
	addq	$40, %rsp	 ;,
	ret	
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
	movq	%rcx, %rsi	 ; tmp109, file
	movq	%rdx, %rdi	 ; tmp110, new_name
 ; D:/TC/src/file.c:146:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_13(D)->name
 ; D:/TC/src/file.c:149:     if (file->dirs != NULL) {
	movq	(%rcx), %rax	 ; file_13(D)->dirs, _2
 ; D:/TC/src/file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	 ; _2
	je	.L100	 ;,
.L99:
	movq	%rax, %rbx	 ; _2, current
 ; D:/TC/src/file.c:153:             if (current->next == NULL) {
	movq	8(%rax), %rax	 ; current_8->next, _2
 ; D:/TC/src/file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	 ; _2
	jne	.L99	 ;,
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rsi), %r12	 ; file_13(D)->extension, _3
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r12, %r12	 ; _3
	je	.L109	 ;,
 ; D:/TC/src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp114, tmp101
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; _3,
	call	strlen	 ;
 ; D:/TC/src/file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	leaq	(%rax,%rbp), %rdx	 ;, full_name_len
.L104:
 ; D:/TC/src/file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	addq	$1, %rdx	 ;, tmp94
	leaq	.LC0(%rip), %rcx	 ;, tmp95
	call	create_string_not_check	 ;
	movq	%rax, %rbp	 ; tmp111, full_name
 ; D:/TC/src/file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%r12, %r9	 ; _3,
	movq	%rdi, %r8	 ; new_name,
	leaq	.LC7(%rip), %rdx	 ;, tmp96
	movq	%rax, %rcx	 ; full_name,
	call	sprintf	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp112, tmp98
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
	call	create_string	 ;
 ; D:/TC/src/file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%rbx)	 ; tmp113, current_26->dir
.L100:
 ; D:/TC/src/file.c:168:     rebuild_full_path(file);
	movq	%rsi, %rcx	 ; file,
	call	rebuild_full_path	 ;
 ; D:/TC/src/file.c:169: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L109:
 ; D:/TC/src/file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp116, full_name_len
 ; D:/TC/src/file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r12	 ;, _3
	jmp	.L104	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	to_upper;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef

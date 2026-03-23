	.file	"D:\\TC\\src\\file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
	.text
	.p2align 4
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
get_cwd:
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	jmp	getcwd	 ;
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.p2align 4
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
absolute_path:
	pushq	%r14	 ;
	pushq	%r13	 ;
 ; D:\TC\src\file.c:62:     string abs_path = create_string_not_check("", total_len);
	leaq	.LC0(%rip), %r13	 ;, tmp155
 ; D:\TC\src\file.c:22: string absolute_path(string path, string base_path) {
	pushq	%r12	 ;
	movq	%rdx, %r12	 ; tmp157, base_path
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp156, path
	subq	$32, %rsp	 ;,
	.p2align 4,,10
	.p2align 3
.L23:
 ; D:\TC\src\file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rbx, %rcx	 ; path,
	call	strlen	 ;
 ; D:\TC\src\file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rbx, %rcx	 ; path,
 ; D:\TC\src\file.c:25:     for (size_t i = 0; i < path_len; i++) {
	xorl	%ebx, %ebx	 ; i
 ; D:\TC\src\file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rax, %rdx	 ; tmp158, tmp124
 ; D:\TC\src\file.c:23:     path = create_string_not_check(path, strlen(path));
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:24:     size_t path_len = strlen(path);
	movq	%rax, %rcx	 ; <retval>,
 ; D:\TC\src\file.c:23:     path = create_string_not_check(path, strlen(path));
	movq	%rax, %rdi	 ; tmp159, <retval>
 ; D:\TC\src\file.c:24:     size_t path_len = strlen(path);
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp160, path_len
 ; D:\TC\src\file.c:25:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	 ; path_len
	jne	.L4	 ;,
	jmp	.L21	 ;
	.p2align 4,,10
	.p2align 3
.L6:
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	 ;, i
	jbe	.L11	 ;,
 ; D:\TC\src\file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx), %rdx	 ;, i
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %cl	 ;, _3
	je	.L12	 ;,
.L28:
	movq	%rdx, %rbx	 ; i, i
.L13:
 ; D:\TC\src\file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rbx	 ; path_len, i
	jnb	.L44	 ;,
.L4:
 ; D:\TC\src\file.c:26:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rdi,%rbx), %rsi	 ;, _2
	movzbl	(%rsi), %ecx	 ; *_2, _3
 ; D:\TC\src\file.c:26:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %cl	 ;, _3
	jne	.L6	 ;,
 ; D:\TC\src\file.c:26:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rsi)	 ;, *_2
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	 ;, i
	jbe	.L11	 ;,
	leaq	1(%rbx), %rdx	 ;, i
.L12:
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rdi,%rbx), %rcx	 ;, _7
	movzbl	(%rcx), %eax	 ; *_7, _8
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	 ;, _8
	je	.L45	 ;,
.L9:
 ; D:\TC\src\file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _8
	jne	.L28	 ;,
 ; D:\TC\src\file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rbp, %r8	 ; path_len, tmp167
 ; D:\TC\src\file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	addq	%rdi, %rdx	 ; <retval>, tmp139
 ; D:\TC\src\file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %rcx	 ; _2,
 ; D:\TC\src\file.c:34:             path_len--;
	subq	$1, %rbp	 ;, path_len
 ; D:\TC\src\file.c:33:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rbx, %r8	 ; i, tmp167
	call	memmove	 ;
 ; D:\TC\src\file.c:25:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rbx	 ; path_len, i
	jb	.L4	 ;,
	.p2align 4,,10
	.p2align 3
.L44:
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpq	$2, %rbp	 ;, path_len
	jbe	.L15	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movzbl	(%rdi), %eax	 ; *path_57, _23
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, %al	 ;, _23
	je	.L46	 ;,
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	subl	$65, %eax	 ;, tmp150
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %al	 ;, tmp150
	ja	.L5	 ;,
.L24:
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$58, 1(%rdi)	 ;, MEM[(char *)path_57 + 1B]
	je	.L3	 ;,
.L5:
 ; D:\TC\src\file.c:57:     if (base_path == NULL)
	testq	%r12, %r12	 ; base_path
	je	.L47	 ;,
.L22:
 ; D:\TC\src\file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	movq	%r12, %rcx	 ; base_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%r13, %rcx	 ; tmp155,
 ; D:\TC\src\file.c:61:     size_t total_len = strlen(base_path) + 1 + path_len + 1;
	leaq	2(%rbp,%rax), %rsi	 ;, total_len
 ; D:\TC\src\file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%rsi, %rdx	 ; total_len,
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%r12, %r8	 ; base_path,
	movq	%rdi, %r9	 ; <retval>,
	leaq	.LC1(%rip), %rdx	 ;, tmp149
 ; D:\TC\src\file.c:62:     string abs_path = create_string_not_check("", total_len);
	movq	%rax, %rbx	 ; tmp163, abs_path
 ; D:\TC\src\file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	movq	%rax, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	xorl	%r12d, %r12d	 ; base_path
 ; D:\TC\src\file.c:63:     sprintf(abs_path, "%s/%s", base_path, path);
	call	sprintf	 ;
 ; D:\TC\src\file.c:64:     return absolute_path(create_string(abs_path, total_len), NULL);
	movq	%rbx, %rcx	 ; abs_path,
	movq	%rsi, %rdx	 ; total_len,
	call	create_string	 ;
	movq	%rax, %rbx	 ; tmp164, path
	jmp	.L23	 ;
	.p2align 4,,10
	.p2align 3
.L45:
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rbx), %r14	 ;, _9
	leaq	(%rdi,%r14), %rsi	 ;, _2
 ; D:\TC\src\file.c:27:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, (%rsi)	 ;, *_10
	jne	.L28	 ;,
 ; D:\TC\src\file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rbp, %r8	 ; path_len, tmp166
 ; D:\TC\src\file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	addq	%rdi, %rdx	 ; <retval>, tmp135
 ; D:\TC\src\file.c:29:             path_len -= 2;
	subq	$2, %rbp	 ;, path_len
 ; D:\TC\src\file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rbx, %r8	 ; i, tmp166
 ; D:\TC\src\file.c:30:             i -= 2;
	movq	%r14, %rbx	 ; _9, i
 ; D:\TC\src\file.c:28:             memmove(path + i - 1, path + i + 1, path_len - i);
	call	memmove	 ;
	.p2align 4,,10
	.p2align 3
.L11:
 ; D:\TC\src\file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rbx, %rbx	 ; i
	jne	.L48	 ;,
	movl	$1, %ebx	 ;, i
	jmp	.L13	 ;
	.p2align 4,,10
	.p2align 3
.L15:
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	je	.L49	 ;,
 ; D:\TC\src\file.c:55:     if (path_len > 0 && path[0] == '/')
	testq	%rbp, %rbp	 ; path_len
	jne	.L50	 ;,
.L21:
	xorl	%ebp, %ebp	 ; path_len
 ; D:\TC\src\file.c:57:     if (base_path == NULL)
	testq	%r12, %r12	 ; base_path
	jne	.L22	 ;,
.L47:
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	getcwd	 ;
	movq	%rax, %r12	 ; tmp161, base_path
 ; D:\TC\src\file.c:59:     if (base_path == NULL)
	testq	%rax, %rax	 ; base_path
	jne	.L22	 ;,
.L3:
 ; D:\TC\src\file.c:65: }
	addq	$32, %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
.L50:
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movzbl	(%rdi), %eax	 ; *path_57, _35
.L19:
 ; D:\TC\src\file.c:55:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, %al	 ;, _35
	jne	.L5	 ;,
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L46:
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	movzbl	1(%rdi), %eax	 ; MEM[(char *)path_57 + 1B], _126
	leal	-97(%rax), %edx	 ;, tmp140
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$25, %dl	 ;, tmp140
	ja	.L3	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 2 && path[0] == '/' && (path[1] >= 'a' && path[1] <= 'z') && path[2] == '/') {
	cmpb	$47, 2(%rdi)	 ;, MEM[(char *)path_57 + 2B]
	jne	.L3	 ;,
 ; D:\TC\src\file.c:40:         path[0] = path[1] - ('a' - 'A');
	subl	$32, %eax	 ;, tmp141
 ; D:\TC\src\file.c:41:         path[1] = ':';
	movb	$58, 1(%rdi)	 ;, MEM[(char *)path_57 + 1B]
 ; D:\TC\src\file.c:40:         path[0] = path[1] - ('a' - 'A');
	movb	%al, (%rdi)	 ; tmp141, *path_57
 ; D:\TC\src\file.c:42:         return path;
	jmp	.L3	 ;
	.p2align 4,,10
	.p2align 3
.L49:
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	movzbl	(%rdi), %eax	 ; *path_57, _35
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	leal	-65(%rax), %edx	 ;, tmp143
 ; D:\TC\src\file.c:53:     if (path_len > 1 && (path[0] >= 'A' && path[0] <= 'Z') && path[1] == ':')
	cmpb	$25, %dl	 ;, tmp143
	jbe	.L24	 ;,
	jmp	.L19	 ;
.L48:
 ; D:\TC\src\file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rsi)	 ;, *prephitmp_131
 ; D:\TC\src\file.c:25:     for (size_t i = 0; i < path_len; i++) {
	leaq	1(%rbx), %rdx	 ;, i
 ; D:\TC\src\file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L28	 ;,
 ; D:\TC\src\file.c:32:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movzbl	-1(%rdi,%rbx), %eax	 ; *_135, _8
	jmp	.L9	 ;
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
	.p2align 4
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = NULL;
	xorl	%r13d, %r13d	 ; node
 ; D:\TC\src\file.c:15: File* create_file(const string path) {
	pushq	%r12	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
 ; D:\TC\src\file.c:181:     size_t start = 0;
	xorl	%esi, %esi	 ; ivtmp.33
 ; D:\TC\src\file.c:15: File* create_file(const string path) {
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp206, path
 ; D:\TC\src\file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\file.c:15: File* create_file(const string path) {
	andq	$-16, %rsp	 ;,
	subq	$304, %rsp	 ;,
 ; D:\TC\src\file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:17:     file->path = absolute_path(path, NULL);
	xorl	%edx, %edx	 ;
	movq	%rbx, %rcx	 ; path,
 ; D:\TC\src\file.c:16:     File* file = (File*)alloc_memory(sizeof(File));
	movq	%rax, %rdi	 ; tmp207, <retval>
 ; D:\TC\src\file.c:17:     file->path = absolute_path(path, NULL);
	call	absolute_path	 ;
 ; D:\TC\src\file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, 24(%rdi)	 ; _1, file_4->path
 ; D:\TC\src\file.c:17:     file->path = absolute_path(path, NULL);
	movq	%rax, %rcx	 ; tmp208, _1
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	call	strlen	 ;
 ; D:\TC\src\file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	leaq	.LC0(%rip), %rcx	 ;,
	leaq	1(%rax), %rdx	 ;, tmp149
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r12	 ; tmp209, tmp147
 ; D:\TC\src\file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	24(%rdi), %rdx	 ; file_4->path, file_4->path
	movq	%rax, %rcx	 ; path_copy,
 ; D:\TC\src\file.c:175:     string path_copy = create_string_not_check("", path_len + 1);
	movq	%rax, %r14	 ; tmp210, path_copy
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	call	strcpy	 ;
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r12, %r12	 ; tmp147
	je	.L52	 ;,
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r14)	 ;, *path_copy_12
	je	.L119	 ;,
.L52:
 ; D:\TC\src\file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %rax	 ;, tmp205
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = NULL;
	movq	%r13, %rbx	 ; node, node
	movq	%rsi, %r15	 ; ivtmp.33, start
 ; D:\TC\src\file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	%rax, 32(%rsp)	 ; tmp205, %sfp
	jmp	.L69	 ;
	.p2align 4,,10
	.p2align 3
.L56:
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	cmpq	%rsi, %r12	 ; ivtmp.33, tmp147
	jb	.L55	 ;,
.L69:
	movq	%rsi, %rdx	 ; ivtmp.33, ivtmp.33
 ; D:\TC\src\file.c:266:             start = i + 1;
	addq	$1, %rsi	 ;, ivtmp.33
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rdx, %r12	 ; ivtmp.33, tmp147
	je	.L120	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r14,%rdx)	 ;, MEM[(char *)path_copy_12 + ivtmp.33_137 * 1]
	jne	.L56	 ;,
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%rdx, %r15	 ; ivtmp.33, start
	jnb	.L57	 ;,
.L54:
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	subq	%r15, %rdx	 ; start, ivtmp.33
	movq	%rdx, %r8	 ; ivtmp.33, comp_len
 ; D:\TC\src\file.c:214:                 if (comp_len >= componentMaxSize) {
	cmpq	$255, %rdx	 ;, comp_len
	ja	.L121	 ;,
.L58:
 ; D:\TC\src\file.c:219:                 strncpy(component, path_copy + start, comp_len);
	leaq	(%r14,%r15), %rdx	 ;, tmp155
 ; D:\TC\src\file.c:219:                 strncpy(component, path_copy + start, comp_len);
	movq	32(%rsp), %r15	 ; %sfp, tmp205
	movq	%r8, 40(%rsp)	 ; comp_len, %sfp
	movq	%r15, %rcx	 ; tmp205,
	call	strncpy	 ;
 ; D:\TC\src\file.c:220:                 component[comp_len] = '\0';
	movq	40(%rsp), %r8	 ; %sfp, comp_len
	movb	$0, 48(%rsp,%r8)	 ;, component[comp_len_25]
 ; D:\TC\src\file.c:222:                 if (strcmp(component, ".") == 0) {
	cmpw	$46, (%r15)	 ;, MEM <char[1:2]> [(void *)&component]
	je	.L57	 ;,
 ; D:\TC\src\file.c:224:                 } else if (strcmp(component, "..") == 0) {
	cmpw	$11822, (%r15)	 ;, MEM <char[1:3]> [(void *)&component]
	je	.L122	 ;,
.L62:
 ; D:\TC\src\file.c:253:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	jne	.L123	 ;,
	.p2align 4,,10
	.p2align 3
.L57:
 ; D:\TC\src\file.c:266:             start = i + 1;
	movq	%rsi, %r15	 ; ivtmp.33, start
	jmp	.L56	 ;
	.p2align 4,,10
	.p2align 3
.L120:
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%r12, %r15	 ; tmp147, start
	jb	.L54	 ;,
.L55:
 ; D:\TC\src\file.c:272:     file->dirs = dirs_head;
	movq	%rbx, (%rdi)	 ; node, file_4->dirs
 ; D:\TC\src\file.c:275:     if (dirs_tail != NULL) {
	testq	%r13, %r13	 ; node
	je	.L70	 ;,
 ; D:\TC\src\file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movq	0(%r13), %r13	 ; dirs_tail_156->dir, node
 ; D:\TC\src\file.c:276:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%r13, %rcx	 ; node,
	call	strrchr	 ;
	movq	%rax, %rsi	 ; tmp220, dot
 ; D:\TC\src\file.c:278:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %r13	 ; dot, node
	je	.L70	 ;,
	testq	%rax, %rax	 ; dot
	je	.L70	 ;,
 ; D:\TC\src\file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
 ; D:\TC\src\file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r13, %rcx	 ; node,
 ; D:\TC\src\file.c:280:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r13, %rdx	 ; node, name_len
 ; D:\TC\src\file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rsi, %rcx	 ; dot,
 ; D:\TC\src\file.c:281:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%rdi)	 ; tmp221, file_4->name
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	strlen	 ;
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rsi, %rcx	 ; dot,
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rdx	 ; tmp222, tmp178
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	call	create_string	 ;
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, 8(%rdi)	 ; _55, file_4->extension
 ; D:\TC\src\file.c:298:     while (current != NULL) {
	testq	%rbx, %rbx	 ; node
	je	.L72	 ;,
.L125:
 ; D:\TC\src\file.c:295:     StrNode* current = dirs_head;
	movq	%rbx, %rsi	 ; node, current
 ; D:\TC\src\file.c:296:     size_t node_count = 0;
	xorl	%r14d, %r14d	 ; node_count
 ; D:\TC\src\file.c:294:     size_t full_path_len = 0;
	xorl	%r12d, %r12d	 ; full_path_len
	.p2align 4,,10
	.p2align 3
.L73:
 ; D:\TC\src\file.c:299:         full_path_len += strlen(current->dir);
	movq	(%rsi), %rcx	 ; current_159->dir, current_159->dir
 ; D:\TC\src\file.c:300:         node_count++;
	addq	$1, %r14	 ;, node_count
 ; D:\TC\src\file.c:299:         full_path_len += strlen(current->dir);
	call	strlen	 ;
 ; D:\TC\src\file.c:301:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_159->next, current
 ; D:\TC\src\file.c:299:         full_path_len += strlen(current->dir);
	addq	%rax, %r12	 ; tmp224, full_path_len
 ; D:\TC\src\file.c:298:     while (current != NULL) {
	testq	%rsi, %rsi	 ; current
	jne	.L73	 ;,
 ; D:\TC\src\file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	leaq	1(%r12), %rax	 ;, tmp203
	leaq	(%r12,%r14), %rdx	 ;, tmp202
	cmpq	$1, %r14	 ;, node_count
	cmovbe	%rax, %rdx	 ; tmp202,, tmp203, _66
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_70
 ; D:\TC\src\file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rsi	 ;* node, pretmp_103
 ; D:\TC\src\file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	%rax, %r12	 ; tmp226, full_path
	.p2align 4,,10
	.p2align 3
.L79:
	movq	%r12, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:320:         strcat(full_path, current->dir);
	movq	%rsi, %rdx	 ; pretmp_103,
	leaq	(%r12,%rax), %rcx	 ;, tmp190
	call	stpcpy	 ;
 ; D:\TC\src\file.c:322:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_68->next, node
 ; D:\TC\src\file.c:313:     while (current != NULL) {
	testq	%rbx, %rbx	 ; node
	je	.L75	 ;,
 ; D:\TC\src\file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rsi	 ; current_82->dir, pretmp_103
 ; D:\TC\src\file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$47, (%rsi)	 ;, MEM <char[1:2]> [(void *)pretmp_134]
	je	.L124	 ;,
.L82:
 ; D:\TC\src\file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%r12)	 ;, MEM[(const char *)full_path_70]
	je	.L79	 ;,
 ; D:\TC\src\file.c:316:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rax)	 ;, *_78
	je	.L79	 ;,
 ; D:\TC\src\file.c:317:                 strcat(full_path, "/");
	movl	$47, %edx	 ;,
	movw	%dx, (%rax)	 ;, MEM <char[1:2]> [(void *)_158]
 ; D:\TC\src\file.c:320:         strcat(full_path, current->dir);
	movq	(%rbx), %rsi	 ;* node, pretmp_103
	jmp	.L79	 ;
	.p2align 4,,10
	.p2align 3
.L121:
 ; D:\TC\src\file.c:216:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	call	__getreent	 ;
 ; D:\TC\src\file.c:216:                     fprintf(stderr, "Warning: Path component too long, truncating to %zu characters\n", comp_len);
	movl	$255, %r8d	 ;,
	leaq	.LC3(%rip), %rdx	 ;, tmp154
	movq	24(%rax), %rcx	 ; _22->_stderr, _22->_stderr
	call	fprintf	 ;
 ; D:\TC\src\file.c:215:                     comp_len = componentMaxSize - 1;
	movl	$255, %r8d	 ;, comp_len
	jmp	.L58	 ;
	.p2align 4,,10
	.p2align 3
.L70:
 ; D:\TC\src\file.c:285:             file->name = dirs_tail->dir;
	xorl	%eax, %eax	 ; _55
	movq	%r13, 16(%rdi)	 ; node, file_4->name
 ; D:\TC\src\file.c:282:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, 8(%rdi)	 ; _55, file_4->extension
 ; D:\TC\src\file.c:298:     while (current != NULL) {
	testq	%rbx, %rbx	 ; node
	jne	.L125	 ;,
.L72:
 ; D:\TC\src\file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:309:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_94
 ; D:\TC\src\file.c:308:     string full_path = create_string_not_check("", full_path_len + 1);
	movq	%rax, %r12	 ; tmp225, full_path
.L75:
 ; D:\TC\src\file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rcx	 ; full_path,
 ; D:\TC\src\file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rdx	 ; tmp229, tmp196
 ; D:\TC\src\file.c:325:     file->path = create_string(full_path, strlen(full_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:325:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rdi)	 ; tmp230, file_4->path
 ; D:\TC\src\file.c:20: }
	leaq	-56(%rbp), %rsp	 ;,
	movq	%rdi, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L124:
 ; D:\TC\src\file.c:314:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 1(%rsi)	 ;, MEM <char[1:2]> [(void *)pretmp_134]
	je	.L79	 ;,
	jmp	.L82	 ;
	.p2align 4,,10
	.p2align 3
.L122:
 ; D:\TC\src\file.c:224:                 } else if (strcmp(component, "..") == 0) {
	movq	32(%rsp), %rax	 ; %sfp, tmp205
	cmpb	$0, 2(%rax)	 ;, MEM <char[1:3]> [(void *)&component]
	jne	.L62	 ;,
 ; D:\TC\src\file.c:226:                     if (dirs_tail != NULL && dirs_tail != dirs_head) {
	testq	%r13, %r13	 ; node
	je	.L65	 ;,
	cmpq	%rbx, %r13	 ; node, node
	je	.L65	 ;,
 ; D:\TC\src\file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	0(%r13), %rax	 ; dirs_tail_155->dir, dirs_tail_155->dir
	cmpb	$46, (%rax)	 ;, MEM <char[1:3]> [(void *)_33]
	je	.L126	 ;,
.L85:
 ; D:\TC\src\file.c:236:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	 ; node, prev
	jmp	.L67	 ;
	.p2align 4,,10
	.p2align 3
.L86:
 ; D:\TC\src\file.c:238:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _38, prev
.L67:
 ; D:\TC\src\file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L57	 ;,
 ; D:\TC\src\file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_37->next, _38
 ; D:\TC\src\file.c:237:                             while (prev != NULL && prev->next != dirs_tail)
	cmpq	%r13, %rdx	 ; node, _38
	jne	.L86	 ;,
 ; D:\TC\src\file.c:241:                                 prev->next = 0;
	movq	$0, 8(%rax)	 ;, prev_37->next
 ; D:\TC\src\file.c:242:                                 dirs_tail = prev;
	movq	%rax, %r13	 ; prev, node
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L119:
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\file.c:204:         start = 1;
	movl	$1, %esi	 ;, ivtmp.33
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp152
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r13	 ; tmp211, node
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:200:         node->next = 0;
	movq	$0, 8(%r13)	 ;, node_15->next
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, 0(%r13)	 ; tmp212, node_15->dir
	jmp	.L52	 ;
	.p2align 4,,10
	.p2align 3
.L65:
 ; D:\TC\src\file.c:245:                     } else if (dirs_head == NULL) {
	testq	%rbx, %rbx	 ; node
	jne	.L57	 ;,
 ; D:\TC\src\file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:248:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp170
 ; D:\TC\src\file.c:247:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp216, node
 ; D:\TC\src\file.c:248:                         node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:251:                         dirs_tail = node;
	movq	%rbx, %r13	 ; node, node
 ; D:\TC\src\file.c:249:                         node->next = 0;
	movq	$0, 8(%rbx)	 ;, node_40->next
 ; D:\TC\src\file.c:248:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	 ; tmp217, node_40->dir
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L123:
 ; D:\TC\src\file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	movq	%r8, 40(%rsp)	 ; comp_len, %sfp
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:256:                     node->dir = create_string(component, comp_len);
	movq	40(%rsp), %rdx	 ; %sfp,
	movq	32(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\file.c:255:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	 ; tmp218, node
 ; D:\TC\src\file.c:256:                     node->dir = create_string(component, comp_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:257:                     node->next = 0;
	movq	$0, 8(%r15)	 ;, node_43->next
 ; D:\TC\src\file.c:256:                     node->dir = create_string(component, comp_len);
	movq	%rax, (%r15)	 ; tmp219, node_43->dir
 ; D:\TC\src\file.c:259:                     if (dirs_tail != NULL)
	testq	%r13, %r13	 ; node
	je	.L68	 ;,
 ; D:\TC\src\file.c:260:                         dirs_tail->next = node;
	movq	%r15, 8(%r13)	 ; node, dirs_tail_155->next
.L68:
 ; D:\TC\src\file.c:262:                     dirs_tail = node;
	movq	%r15, %r13	 ; node, node
 ; D:\TC\src\file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	testq	%rbx, %rbx	 ; node
	jne	.L57	 ;,
 ; D:\TC\src\file.c:262:                     dirs_tail = node;
	movq	%r15, %rbx	 ; node, node
 ; D:\TC\src\file.c:263:                     if (dirs_head == NULL) dirs_head = node;
	movq	%r15, %r13	 ; node, node
	jmp	.L57	 ;
	.p2align 4,,10
	.p2align 3
.L126:
 ; D:\TC\src\file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$46, 1(%rax)	 ;, MEM <char[1:3]> [(void *)_33]
	jne	.L85	 ;,
 ; D:\TC\src\file.c:228:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$0, 2(%rax)	 ;, MEM <char[1:3]> [(void *)_33]
	jne	.L85	 ;,
 ; D:\TC\src\file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:230:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC5(%rip), %rcx	 ;, tmp169
 ; D:\TC\src\file.c:229:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	 ; tmp214, node
 ; D:\TC\src\file.c:230:                             node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:231:                             node->next = 0;
	movq	$0, 8(%r15)	 ;, node_35->next
 ; D:\TC\src\file.c:230:                             node->dir = create_string("..", 2);
	movq	%rax, (%r15)	 ; tmp215, node_35->dir
 ; D:\TC\src\file.c:232:                             dirs_tail->next = node;
	movq	%r15, 8(%r13)	 ; node, dirs_tail_155->next
 ; D:\TC\src\file.c:233:                             dirs_tail = node;
	movq	%r15, %r13	 ; node, node
	jmp	.L57	 ;
	.p2align 4
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
 ; D:\TC\src\file.c:68:     return path->name;
	movq	16(%rcx), %rax	 ; path_2(D)->name, path_2(D)->name
 ; D:\TC\src\file.c:69: }
	ret	
	.p2align 4
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
 ; D:\TC\src\file.c:72:     return path->extension;
	movq	8(%rcx), %rax	 ; path_2(D)->extension, path_2(D)->extension
 ; D:\TC\src\file.c:73: }
	ret	
	.p2align 4
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
 ; D:\TC\src\file.c:76:     if (path->dirs == NULL) return 0;
	movq	(%rcx), %rdx	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:76:     if (path->dirs == NULL) return 0;
	testq	%rdx, %rdx	 ; current
	je	.L156	 ;,
 ; D:\TC\src\file.c:75: string get_file_dir(File* path) {
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp128, path
	pushq	%rdi	 ;
 ; D:\TC\src\file.c:80:     size_t node_count = 0;
	xorl	%edi, %edi	 ; node_count
 ; D:\TC\src\file.c:75: string get_file_dir(File* path) {
	pushq	%rsi	 ;
 ; D:\TC\src\file.c:79:     size_t total_len = 0;
	xorl	%esi, %esi	 ; total_len
 ; D:\TC\src\file.c:75: string get_file_dir(File* path) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rdx), %rbx	 ; _1->next, <retval>
 ; D:\TC\src\file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	 ; <retval>
	je	.L129	 ;,
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:\TC\src\file.c:84:             size_t dir_len = strlen(current->dir);
	movq	(%rdx), %rcx	 ; current_7->dir, current_7->dir
 ; D:\TC\src\file.c:86:             node_count++;
	addq	$1, %rdi	 ;, node_count
 ; D:\TC\src\file.c:84:             size_t dir_len = strlen(current->dir);
	call	strlen	 ;
	movq	%rbx, %rdx	 ; <retval>, current
 ; D:\TC\src\file.c:85:             total_len += dir_len;
	addq	%rax, %rsi	 ; tmp129, total_len
 ; D:\TC\src\file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	movq	8(%rbx), %rax	 ; _16->next, _2
 ; D:\TC\src\file.c:83:         if (current->next != NULL) {  // Not the last element (which is the filename)
	testq	%rax, %rax	 ; _2
	je	.L160	 ;,
	movq	%rax, %rbx	 ; _2, <retval>
	jmp	.L131	 ;
	.p2align 4,,10
	.p2align 3
.L160:
 ; D:\TC\src\file.c:91:     if (node_count == 0) return NULL;
	testq	%rdi, %rdi	 ; node_count
	je	.L129	 ;,
 ; D:\TC\src\file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	leaq	1(%rsi), %rax	 ;, tmp127
	leaq	(%rsi,%rdi), %rdx	 ;, tmp126
	cmpq	$1, %rdi	 ;, node_count
	cmove	%rax, %rdx	 ; tmp126,, tmp127, _4
	leaq	.LC0(%rip), %rcx	 ;, tmp112
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:99:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_36
 ; D:\TC\src\file.c:101:     current = path->dirs;
	movq	0(%rbp), %rbx	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:98:     string dir_path = create_string_not_check("", total_len + 1);
	movq	%rax, %rsi	 ; tmp130, dir_path
 ; D:\TC\src\file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L137	 ;,
 ; D:\TC\src\file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_38->next
	je	.L137	 ;,
.L159:
 ; D:\TC\src\file.c:110:             strcat(dir_path, current->dir);
	movq	(%rbx), %rdi	 ;* current, pretmp_28
.L139:
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:110:             strcat(dir_path, current->dir);
	movq	%rdi, %rdx	 ; pretmp_28,
	leaq	(%rsi,%rax), %rcx	 ;, tmp120
	call	stpcpy	 ;
 ; D:\TC\src\file.c:113:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_51->next, current
 ; D:\TC\src\file.c:103:     while (current != NULL) {
	testq	%rbx, %rbx	 ; current
	je	.L137	 ;,
 ; D:\TC\src\file.c:104:         if (current->next != NULL) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_45->next
	je	.L137	 ;,
 ; D:\TC\src\file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rdi	 ; current_45->dir, pretmp_28
 ; D:\TC\src\file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$47, (%rdi)	 ;, MEM <char[1:2]> [(void *)pretmp_28]
	je	.L161	 ;,
.L142:
 ; D:\TC\src\file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rsi)	 ;, MEM[(const char *)dir_path_36]
	je	.L139	 ;,
 ; D:\TC\src\file.c:107:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rax)	 ;, *_12
	je	.L139	 ;,
 ; D:\TC\src\file.c:108:                     strcat(dir_path, "/");
	movl	$47, %edx	 ;,
	movw	%dx, (%rax)	 ;, MEM <char[1:2]> [(void *)_60]
	jmp	.L159	 ;
	.p2align 4,,10
	.p2align 3
.L137:
 ; D:\TC\src\file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:117: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
 ; D:\TC\src\file.c:117: }
	popq	%rbx	 ;
 ; D:\TC\src\file.c:116:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rdx	 ; tmp131, tmp114
 ; D:\TC\src\file.c:117: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\file.c:116:     return create_string(dir_path, strlen(dir_path));
	jmp	create_string	 ;
	.p2align 4,,10
	.p2align 3
.L161:
 ; D:\TC\src\file.c:105:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, 1(%rdi)	 ;, MEM <char[1:2]> [(void *)pretmp_28]
	je	.L139	 ;,
	jmp	.L142	 ;
.L129:
 ; D:\TC\src\file.c:117: }
	addq	$40, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L156:
	xorl	%eax, %eax	 ;
	ret	
	.section .rdata,"dr"
.LC6:
	.ascii "%s/%s%s\0"
.LC7:
	.ascii "%s%s\0"
	.text
	.p2align 4
	.def	rebuild_full_path;	.scl	3;	.type	32;	.endef
rebuild_full_path:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp133, file
	subq	$56, %rsp	 ;,
 ; D:\TC\src\file.c:124:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
	movq	%rax, %rsi	 ; tmp134, dir
 ; D:\TC\src\file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	je	.L163	 ;,
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rcx	 ; dir,
 ; D:\TC\src\file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rsi, %r13	 ; dir, iftmp.1_55
	leaq	.LC0(%rip), %r12	 ;, tmp132
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
 ; D:\TC\src\file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %rbp	 ; file_18(D)->extension, _54
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rdi	 ; tmp135, tmp105
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%rdi, %rax	 ; tmp105, _52
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %rdi	 ;, _53
 ; D:\TC\src\file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rbp, %rbp	 ; _54
	je	.L174	 ;,
.L170:
 ; D:\TC\src\file.c:129:     if (file->extension != NULL) path_len += strlen(ext_cstr);
	movq	%rbp, %rcx	 ; _54,
	call	strlen	 ;
 ; D:\TC\src\file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	%r12, %rcx	 ; tmp132,
	leaq	1(%rdi,%rax), %rdx	 ;, tmp122
	call	create_string_not_check	 ;
	movq	%rax, %rdi	 ; tmp140, new_path
 ; D:\TC\src\file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rsi, %rsi	 ; dir
	je	.L166	 ;,
 ; D:\TC\src\file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.1_55]
	jne	.L175	 ;,
.L166:
 ; D:\TC\src\file.c:135:         sprintf(new_path, "%s%s", file->name, ext_cstr);
	movq	16(%rbx), %r8	 ; file_18(D)->name,
	movq	%rbp, %r9	 ; _54,
	leaq	.LC7(%rip), %rdx	 ;, tmp114
	movq	%rdi, %rcx	 ; new_path,
	call	sprintf	 ;
.L167:
 ; D:\TC\src\file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
 ; D:\TC\src\file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rdx	 ; tmp137, tmp116
 ; D:\TC\src\file.c:137:     file->path = create_string(new_path, strlen(new_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:137:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp138, file_18(D)->path
 ; D:\TC\src\file.c:138: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L174:
 ; D:\TC\src\file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	leaq	2(%rax), %rdx	 ;, tmp130
	movq	%r12, %rcx	 ; tmp132,
 ; D:\TC\src\file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r12, %rbp	 ; tmp132, _54
 ; D:\TC\src\file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.1_55]
 ; D:\TC\src\file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	movq	%rax, %rdi	 ; tmp143, new_path
 ; D:\TC\src\file.c:132:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L166	 ;,
.L175:
 ; D:\TC\src\file.c:133:         sprintf(new_path, "%s/%s%s", dir_cstr, file->name, ext_cstr);
	movq	%rbp, 32(%rsp)	 ; _54,
	movq	16(%rbx), %r9	 ; file_18(D)->name,
	movq	%r13, %r8	 ; iftmp.1_55,
	movq	%rdi, %rcx	 ; new_path,
	leaq	.LC6(%rip), %rdx	 ;, tmp112
	call	sprintf	 ;
	jmp	.L167	 ;
	.p2align 4,,10
	.p2align 3
.L163:
 ; D:\TC\src\file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %rbp	 ; file_18(D)->extension, _54
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:\TC\src\file.c:126:     string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rbp, %rbp	 ; _54
	je	.L169	 ;,
 ; D:\TC\src\file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r12	 ;, tmp132
 ; D:\TC\src\file.c:128:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %rdi	 ;, _53
 ; D:\TC\src\file.c:125:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r12, %r13	 ; tmp132, iftmp.1_55
	jmp	.L170	 ;
	.p2align 4,,10
	.p2align 3
.L169:
 ; D:\TC\src\file.c:131:     string new_path = create_string_not_check("", path_len + 1);
	leaq	.LC0(%rip), %rbp	 ;, tmp125
	leaq	2(%rax), %rdx	 ;, tmp124
	movq	%rbp, %rcx	 ; tmp125,
	call	create_string_not_check	 ;
	movq	%rax, %rdi	 ; tmp141, new_path
	jmp	.L166	 ;
	.p2align 4
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
 ; D:\TC\src\file.c:120:     return path->path;
	movq	24(%rcx), %rax	 ; path_2(D)->path, path_2(D)->path
 ; D:\TC\src\file.c:121: }
	ret	
	.p2align 4
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
 ; D:\TC\src\file.c:141:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; tmp85, file_2(D)->extension
 ; D:\TC\src\file.c:142:     rebuild_full_path(file);
	jmp	rebuild_full_path	 ;
	.p2align 4
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	movq	%rdx, %rdi	 ; tmp107, new_name
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp106, file
	pushq	%rbx	 ;
	subq	$32, %rsp	 ;,
 ; D:\TC\src\file.c:149:     if (file->dirs != NULL) {
	movq	(%rcx), %rax	 ; file_13(D)->dirs, _2
 ; D:\TC\src\file.c:146:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_13(D)->name
 ; D:\TC\src\file.c:149:     if (file->dirs != NULL) {
	testq	%rax, %rax	 ; _2
	je	.L180	 ;,
	.p2align 4,,10
	.p2align 3
.L179:
	movq	%rax, %rbx	 ; _2, current
 ; D:\TC\src\file.c:153:             if (current->next == NULL) {
	movq	8(%rax), %rax	 ; current_8->next, _2
 ; D:\TC\src\file.c:153:             if (current->next == NULL) {
	testq	%rax, %rax	 ; _2
	jne	.L179	 ;,
 ; D:\TC\src\file.c:156:                 size_t full_name_len = strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rsi), %r12	 ; file_13(D)->extension, _3
 ; D:\TC\src\file.c:156:                 size_t full_name_len = strlen(new_name);
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp108, full_name_len
 ; D:\TC\src\file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r12, %r12	 ; _3
	je	.L183	 ;,
 ; D:\TC\src\file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; _3,
	call	strlen	 ;
	leaq	.LC0(%rip), %rcx	 ;, tmp105
 ; D:\TC\src\file.c:157:                 if (file->extension != NULL) full_name_len += strlen(ext_cstr);
	addq	%rax, %rbp	 ; tmp109, full_name_len
.L181:
 ; D:\TC\src\file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	leaq	1(%rbp), %rdx	 ;, tmp99
	call	create_string_not_check	 ;
 ; D:\TC\src\file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%r12, %r9	 ; _3,
	movq	%rdi, %r8	 ; new_name,
	leaq	.LC7(%rip), %rdx	 ;, tmp101
 ; D:\TC\src\file.c:159:                 string full_name = create_string_not_check("", full_name_len + 1);
	movq	%rax, %rbp	 ; tmp110, full_name
 ; D:\TC\src\file.c:160:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%rax, %rcx	 ; full_name,
	call	sprintf	 ;
 ; D:\TC\src\file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
	call	strlen	 ;
 ; D:\TC\src\file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
 ; D:\TC\src\file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rdx	 ; tmp111, tmp103
 ; D:\TC\src\file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	call	create_string	 ;
 ; D:\TC\src\file.c:161:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%rbx)	 ; tmp112, current_17->dir
.L180:
 ; D:\TC\src\file.c:169: }
	addq	$32, %rsp	 ;,
 ; D:\TC\src\file.c:168:     rebuild_full_path(file);
	movq	%rsi, %rcx	 ; file,
 ; D:\TC\src\file.c:169: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\file.c:168:     rebuild_full_path(file);
	jmp	rebuild_full_path	 ;
	.p2align 4,,10
	.p2align 3
.L183:
 ; D:\TC\src\file.c:155:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rcx	 ;, tmp105
	movq	%rcx, %r12	 ; tmp105, _3
	jmp	.L181	 ;
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	create_string_not_check;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	stpcpy;	.scl	2;	.type	32;	.endef
	.def	__getreent;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef

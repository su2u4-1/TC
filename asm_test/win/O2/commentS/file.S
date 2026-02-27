	.file	"D:\\TC\\src\\file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O2 -fno-asynchronous-unwind-tables -fno-stack-protector -fcf-protection=none -fno-plt
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
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp134, path
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:21:     size_t path_len = strlen(path);
	call	strlen	 ;
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	 ; path_len
	je	.L4	 ;,
	movq	%rax, %rdi	 ; tmp135, path_len
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	xorl	%ebx, %ebx	 ; i
	jmp	.L14	 ;
	.p2align 4,,10
	.p2align 3
.L5:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	 ;, i
	jbe	.L10	 ;,
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx), %rdx	 ;, i
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %cl	 ;, _2
	je	.L11	 ;,
.L20:
	movq	%rdx, %rbx	 ; i, i
.L12:
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rdi, %rbx	 ; path_len, i
	jnb	.L36	 ;,
.L14:
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rsi,%rbx), %r10	 ;, _1
	movzbl	(%r10), %ecx	 ; *_1, _2
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %cl	 ;, _2
	jne	.L5	 ;,
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%r10)	 ;, *_1
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	 ;, i
	jbe	.L10	 ;,
	leaq	1(%rbx), %rdx	 ;, i
.L11:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rsi,%rbx), %rcx	 ;, _6
	movzbl	(%rcx), %eax	 ; *_6, _7
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	 ;, _7
	je	.L37	 ;,
.L8:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _7
	jne	.L20	 ;,
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rdi, %r8	 ; path_len, tmp141
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	addq	%rsi, %rdx	 ; path, tmp124
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%r10, %rcx	 ; _1,
 ; D:\TC\src\file.c:31:             path_len--;
	subq	$1, %rdi	 ;, path_len
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rbx, %r8	 ; i, tmp141
	call	memmove	 ;
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rdi, %rbx	 ; path_len, i
	jb	.L14	 ;,
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%rdi, %rdi	 ; path_len
	je	.L4	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rsi)	 ;, *path_38(D)
	je	.L25	 ;,
.L15:
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	getcwd	 ;
	movq	%rax, %rbx	 ; tmp136, _54
 ; D:\TC\src\file.c:43:     if (cwd == NULL)
	testq	%rax, %rax	 ; _54
	je	.L25	 ;,
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%rax, %rcx	 ; _54,
	call	strlen	 ;
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	leaq	.LC0(%rip), %rcx	 ;, tmp129
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%rdi,%rax), %rbp	 ;, total_len
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rbp, %rdx	 ; total_len,
	call	create_string	 ;
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	movq	%rsi, %r9	 ; path,
	movq	%rbx, %r8	 ; _54,
	leaq	.LC1(%rip), %rdx	 ;, tmp130
	movq	%rax, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rax, %rdi	 ; tmp138, abs_path
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	call	sprintf	 ;
 ; D:\TC\src\file.c:48:     free(cwd);
	movq	%rbx, %rcx	 ; _54,
	call	free	 ;
 ; D:\TC\src\file.c:50: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	movq	%rbp, %rdx	 ; total_len,
	movq	%rdi, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:50: }
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	jmp	create_string	 ;
	.p2align 4,,10
	.p2align 3
.L37:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rsi,%rbx)	 ;, *_9
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rbx), %rbp	 ;, _8
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L20	 ;,
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rdi, %r8	 ; path_len, tmp140
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	addq	%rsi, %rdx	 ; path, tmp120
 ; D:\TC\src\file.c:26:             path_len -= 2;
	subq	$2, %rdi	 ;, path_len
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rbx, %r8	 ; i, tmp140
 ; D:\TC\src\file.c:27:             i -= 2;
	movq	%rbp, %rbx	 ; _8, i
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	call	memmove	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rbx, %rbx	 ; i
	jne	.L38	 ;,
	movl	$1, %ebx	 ;, i
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L25:
 ; D:\TC\src\file.c:50: }
	addq	$40, %rsp	 ;,
	movq	%rsi, %rax	 ; path,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%edi, %edi	 ; path_len
	jmp	.L15	 ;
.L38:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rsi,%rbx), %r10	 ;, _1
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	leaq	1(%rbx), %rdx	 ;, i
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%r10)	 ;, *_14
	jne	.L20	 ;,
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movzbl	-1(%rsi,%rbx), %eax	 ; *_56, _7
	jmp	.L8	 ;
	.p2align 4
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
get_file_name:
 ; D:\TC\src\file.c:53:     return path->name;
	movq	16(%rcx), %rax	 ; path_2(D)->name, path_2(D)->name
 ; D:\TC\src\file.c:54: }
	ret	
	.p2align 4
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
get_file_extension:
 ; D:\TC\src\file.c:57:     return path->extension;
	movq	8(%rcx), %rax	 ; path_2(D)->extension, path_2(D)->extension
 ; D:\TC\src\file.c:58: }
	ret	
	.p2align 4
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
get_file_dir:
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	movq	(%rcx), %rdx	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	testq	%rdx, %rdx	 ; current
	je	.L68	 ;,
 ; D:\TC\src\file.c:60: string get_file_dir(File* path) {
	pushq	%rbp	 ;
	movq	%rcx, %rbp	 ; tmp128, path
	pushq	%rdi	 ;
 ; D:\TC\src\file.c:65:     size_t node_count = 0;
	xorl	%edi, %edi	 ; node_count
 ; D:\TC\src\file.c:60: string get_file_dir(File* path) {
	pushq	%rsi	 ;
 ; D:\TC\src\file.c:64:     size_t total_len = 0;
	xorl	%esi, %esi	 ; total_len
 ; D:\TC\src\file.c:60: string get_file_dir(File* path) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rdx), %rbx	 ; _1->next, <retval>
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	 ; <retval>
	je	.L41	 ;,
	.p2align 4,,10
	.p2align 3
.L43:
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rdx), %rcx	 ; current_22->dir, current_22->dir
 ; D:\TC\src\file.c:71:             node_count++;
	addq	$1, %rdi	 ;, node_count
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	call	strlen	 ;
	movq	%rbx, %rdx	 ; <retval>, current
 ; D:\TC\src\file.c:70:             total_len += dir_len;
	addq	%rax, %rsi	 ; tmp129, total_len
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rbx), %rax	 ; _54->next, _2
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rax, %rax	 ; _2
	je	.L72	 ;,
	movq	%rax, %rbx	 ; _2, <retval>
	jmp	.L43	 ;
	.p2align 4,,10
	.p2align 3
.L72:
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	testq	%rdi, %rdi	 ; node_count
	je	.L41	 ;,
 ; D:\TC\src\file.c:83:     string dir_path = create_string("", total_len + 1);
	leaq	1(%rsi), %rax	 ;, tmp127
	leaq	(%rsi,%rdi), %rdx	 ;, tmp126
	cmpq	$1, %rdi	 ;, node_count
	cmove	%rax, %rdx	 ; tmp126,, tmp127, _4
	leaq	.LC0(%rip), %rcx	 ;, tmp112
	call	create_string	 ;
 ; D:\TC\src\file.c:84:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_36
 ; D:\TC\src\file.c:86:     current = path->dirs;
	movq	0(%rbp), %rbx	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:83:     string dir_path = create_string("", total_len + 1);
	movq	%rax, %rsi	 ; tmp130, dir_path
 ; D:\TC\src\file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L49	 ;,
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_38->next
	je	.L49	 ;,
.L71:
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	(%rbx), %rdi	 ;* current, pretmp_14
.L51:
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	%rdi, %rdx	 ; pretmp_14,
	leaq	(%rsi,%rax), %rcx	 ;, tmp120
	call	stpcpy	 ;
 ; D:\TC\src\file.c:98:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_51->next, current
 ; D:\TC\src\file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L49	 ;,
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_45->next
	je	.L49	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rdi	 ; current_45->dir, pretmp_14
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$47, (%rdi)	 ;, MEM <char[1:2]> [(void *)pretmp_14]
	je	.L73	 ;,
.L54:
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rsi)	 ;, MEM[(const char *)dir_path_36]
	je	.L51	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rax)	 ;, *_12
	je	.L51	 ;,
 ; D:\TC\src\file.c:93:                     strcat(dir_path, "/");
	movl	$47, %edx	 ;,
	movw	%dx, (%rax)	 ;, MEM <char[1:2]> [(void *)_60]
	jmp	.L71	 ;
	.p2align 4,,10
	.p2align 3
.L49:
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:102: }
	addq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
 ; D:\TC\src\file.c:102: }
	popq	%rbx	 ;
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rdx	 ; tmp131, tmp114
 ; D:\TC\src\file.c:102: }
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	jmp	create_string	 ;
	.p2align 4,,10
	.p2align 3
.L73:
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, 1(%rdi)	 ;, MEM <char[1:2]> [(void *)pretmp_14]
	je	.L51	 ;,
	jmp	.L54	 ;
.L41:
 ; D:\TC\src\file.c:102: }
	addq	$40, %rsp	 ;,
	xorl	%eax, %eax	 ;
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L68:
	xorl	%eax, %eax	 ;
	ret	
	.p2align 4
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
get_full_path:
 ; D:\TC\src\file.c:105:     return path->path;
	movq	24(%rcx), %rax	 ; path_2(D)->path, path_2(D)->path
 ; D:\TC\src\file.c:106: }
	ret	
	.p2align 4
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
change_file_extension:
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp137, new_extension
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp136, file
	subq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:109:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; new_extension, file_18(D)->extension
 ; D:\TC\src\file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
	movq	%rax, %rbp	 ; tmp138, dir
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	je	.L76	 ;,
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rcx	 ; dir,
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rbp, %r13	 ; dir, iftmp.0_52
	leaq	.LC0(%rip), %r12	 ;, tmp135
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rdi	 ; tmp139, tmp107
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%rdi, %rax	 ; tmp107, _50
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %rdi	 ;, _51
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rsi, %rsi	 ; new_extension
	je	.L94	 ;,
.L86:
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	%rsi, %rcx	 ; new_extension,
	call	strlen	 ;
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%r12, %rcx	 ; tmp135,
	leaq	1(%rdi,%rax), %rdx	 ;, tmp124
	call	create_string	 ;
	movq	%rax, %rdi	 ; tmp144, new_path
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	 ; dir
	je	.L95	 ;,
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.0_52]
	jne	.L96	 ;,
.L79:
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	movq	16(%rbx), %rdx	 ; file_18(D)->name, file_18(D)->name
	movq	%rdi, %rcx	 ; new_path,
	call	strcpy	 ;
.L80:
 ; D:\TC\src\file.c:125:     if (new_extension != 0)
	testq	%rsi, %rsi	 ; new_extension
	je	.L82	 ;,
.L81:
 ; D:\TC\src\file.c:126:         strcat(new_path, new_extension);
	movq	%rsi, %rdx	 ; new_extension,
	movq	%rdi, %rcx	 ; new_path,
	call	strcat	 ;
.L82:
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rdx	 ; tmp141, tmp118
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp142, file_18(D)->path
 ; D:\TC\src\file.c:129: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L94:
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rdx	 ;, tmp133
	movq	%r12, %rcx	 ; tmp135,
	call	create_string	 ;
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.0_52]
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %rdi	 ; tmp147, new_path
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	je	.L79	 ;,
.L96:
 ; D:\TC\src\file.c:121:         sprintf(new_path, "%s/%s", dir_cstr, file->name);
	movq	16(%rbx), %r9	 ; file_18(D)->name,
	movq	%r13, %r8	 ; iftmp.0_52,
	leaq	.LC1(%rip), %rdx	 ;, tmp114
	movq	%rdi, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L80	 ;
	.p2align 4,,10
	.p2align 3
.L76:
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rsi, %rsi	 ; new_extension
	je	.L85	 ;,
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r12	 ;, tmp135
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %rdi	 ;, _51
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r12, %r13	 ; tmp135, iftmp.0_52
	jmp	.L86	 ;
	.p2align 4,,10
	.p2align 3
.L85:
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rdx	 ;, tmp126
	leaq	.LC0(%rip), %rcx	 ;, tmp127
	call	create_string	 ;
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	movq	16(%rbx), %rdx	 ; file_18(D)->name, file_18(D)->name
	movq	%rax, %rcx	 ; new_path,
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %rdi	 ; tmp145, new_path
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	call	strcpy	 ;
	jmp	.L82	 ;
	.p2align 4,,10
	.p2align 3
.L95:
	movq	16(%rbx), %rdx	 ; file_18(D)->name, file_18(D)->name
	movq	%rdi, %rcx	 ; new_path,
	call	strcpy	 ;
	jmp	.L81	 ;
	.section .rdata,"dr"
.LC2:
	.ascii "%s%s\0"
.LC3:
	.ascii "%s/%s%s\0"
	.text
	.p2align 4
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
change_file_name:
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	leaq	.LC0(%rip), %r12	 ;, iftmp.3_70
	pushq	%rbp	 ;
	pushq	%rdi	 ;
	pushq	%rsi	 ;
	movq	%rdx, %rsi	 ; tmp148, new_name
	pushq	%rbx	 ;
	movq	%rcx, %rbx	 ; tmp147, file
	subq	$48, %rsp	 ;,
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	movq	(%rcx), %rax	 ; file_26(D)->dirs, _2
 ; D:\TC\src\file.c:132:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_26(D)->name
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	 ; _2
	je	.L99	 ;,
	.p2align 4,,10
	.p2align 3
.L98:
	movq	%rax, %rdi	 ; _2, current
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	 ; current_17->next, _2
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	 ; _2
	jne	.L98	 ;,
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r13	 ; file_26(D)->extension, _3
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp149, full_name_len
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r13, %r13	 ; _3
	je	.L110	 ;,
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	%r13, %rcx	 ; _3,
	leaq	.LC0(%rip), %r12	 ;, iftmp.3_70
	call	strlen	 ;
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	addq	%rax, %rbp	 ; tmp150, full_name_len
.L100:
 ; D:\TC\src\file.c:145:                 string full_name = create_string("", full_name_len + 1);
	leaq	1(%rbp), %rdx	 ;, tmp116
	movq	%r12, %rcx	 ; iftmp.3_70,
	call	create_string	 ;
 ; D:\TC\src\file.c:146:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%r13, %r9	 ; _3,
	movq	%rsi, %r8	 ; new_name,
	leaq	.LC2(%rip), %rdx	 ;, tmp118
 ; D:\TC\src\file.c:145:                 string full_name = create_string("", full_name_len + 1);
	movq	%rax, %rbp	 ; tmp151, full_name
 ; D:\TC\src\file.c:146:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%rax, %rcx	 ; full_name,
	call	sprintf	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
	call	strlen	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rdx	 ; tmp152, tmp120
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	call	create_string	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%rdi)	 ; tmp153, current_67->dir
.L99:
 ; D:\TC\src\file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rcx	 ; file,
	call	get_file_dir	 ;
	movq	%rax, %rdi	 ; tmp154, dir
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	je	.L102	 ;,
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rax, %rcx	 ; dir,
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rdi, %r14	 ; dir, iftmp.3_70
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r13	 ; file_26(D)->extension, _69
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rax, %rbp	 ; tmp155, tmp123
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	0(%rbp,%rax), %rdx	 ;, _53
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rdx), %rbp	 ;, _54
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r13, %r13	 ; _69
	je	.L115	 ;,
.L109:
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	%r13, %rcx	 ; _69,
	call	strlen	 ;
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	movq	%r12, %rcx	 ; iftmp.3_70,
	leaq	1(%rbp,%rax), %rdx	 ;, tmp137
	call	create_string	 ;
	movq	%rax, %rbp	 ; tmp160, new_path
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rdi, %rdi	 ; dir
	je	.L105	 ;,
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	 ;, MEM[(const char *)iftmp.3_70]
	jne	.L116	 ;,
.L105:
 ; D:\TC\src\file.c:166:         sprintf(new_path, "%s%s", new_name, ext_cstr);
	movq	%r13, %r9	 ; _69,
	movq	%rsi, %r8	 ; new_name,
	leaq	.LC2(%rip), %rdx	 ;, tmp129
	movq	%rbp, %rcx	 ; new_path,
	call	sprintf	 ;
.L106:
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rbp, %rcx	 ; new_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rbp, %rcx	 ; new_path,
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rdx	 ; tmp157, tmp131
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp158, file_26(D)->path
 ; D:\TC\src\file.c:169: }
	addq	$48, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L115:
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	addq	$2, %rdx	 ;, tmp139
	movq	%r12, %rcx	 ; iftmp.3_70,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r13	 ;, _69
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	 ;, MEM[(const char *)iftmp.3_70]
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	movq	%rax, %rbp	 ; tmp161, new_path
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	je	.L105	 ;,
.L116:
 ; D:\TC\src\file.c:164:         sprintf(new_path, "%s/%s%s", dir_cstr, new_name, ext_cstr);
	movq	%r13, 32(%rsp)	 ; _69,
	movq	%rsi, %r9	 ; new_name,
	movq	%r14, %r8	 ; iftmp.3_70,
	movq	%rbp, %rcx	 ; new_path,
	leaq	.LC3(%rip), %rdx	 ;, tmp128
	call	sprintf	 ;
	jmp	.L106	 ;
	.p2align 4,,10
	.p2align 3
.L110:
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r12	 ;, iftmp.3_70
	movq	%r12, %r13	 ; iftmp.3_70, _3
	jmp	.L100	 ;
	.p2align 4,,10
	.p2align 3
.L102:
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r13	 ; file_26(D)->extension, _69
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r14	 ;, iftmp.3_70
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rax), %rbp	 ;, _54
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r13, %r13	 ; _69
	jne	.L109	 ;,
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rdx	 ;, tmp141
	movq	%r12, %rcx	 ; iftmp.3_70,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r13	 ;, _69
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	call	create_string	 ;
	movq	%rax, %rbp	 ; tmp162, new_path
	jmp	.L105	 ;
	.section .rdata,"dr"
.LC4:
	.ascii "/\0"
.LC5:
	.ascii ".\0"
.LC6:
	.ascii "..\0"
	.text
	.p2align 4
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
normalize_path:
	pushq	%rbp	 ;
	movq	%rsp, %rbp	 ;,
	pushq	%r15	 ;
	pushq	%r14	 ;
	pushq	%r13	 ;
	pushq	%r12	 ;
	pushq	%rdi	 ;
	movq	%rcx, %rdi	 ; tmp201, file
	pushq	%rsi	 ;
 ; D:\TC\src\file.c:181:     size_t start = 0;
	xorl	%esi, %esi	 ; ivtmp.58
 ; D:\TC\src\file.c:171: void normalize_path(File* file) {
	pushq	%rbx	 ;
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	xorl	%ebx, %ebx	 ; node
 ; D:\TC\src\file.c:171: void normalize_path(File* file) {
	andq	$-16, %rsp	 ;,
	subq	$304, %rsp	 ;,
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rcx), %rcx	 ; file_74(D)->path, file_74(D)->path
	call	strlen	 ;
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	.LC0(%rip), %rcx	 ;,
	leaq	1(%rax), %rdx	 ;, tmp147
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r14	 ; tmp202, tmp145
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	24(%rdi), %rdx	 ; file_74(D)->path, file_74(D)->path
	movq	%rax, %rcx	 ; path_copy,
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	movq	%rax, %r15	 ; tmp203, path_copy
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	call	strcpy	 ;
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r14, %r14	 ; tmp145
	je	.L118	 ;,
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r15)	 ;, *path_copy_77
	je	.L184	 ;,
.L118:
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	movq	%rsi, %rax	 ; ivtmp.58, start
	movq	%rbx, %r13	 ; node, dirs_tail
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %r10	 ;, tmp200
	jmp	.L134	 ;
	.p2align 4,,10
	.p2align 3
.L122:
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	cmpq	%rsi, %r14	 ; ivtmp.58, tmp145
	jb	.L121	 ;,
.L134:
	movq	%rsi, %rdx	 ; ivtmp.58, ivtmp.58
 ; D:\TC\src\file.c:262:             start = i + 1;
	addq	$1, %rsi	 ;, ivtmp.58
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rdx, %r14	 ; ivtmp.58, tmp145
	je	.L185	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r15,%rdx)	 ;, MEM[(char *)path_copy_77 + ivtmp.58_85 * 1]
	jne	.L122	 ;,
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%rdx, %rax	 ; ivtmp.58, start
	jb	.L120	 ;,
.L123:
 ; D:\TC\src\file.c:262:             start = i + 1;
	movq	%rsi, %rax	 ; ivtmp.58, start
	jmp	.L122	 ;
	.p2align 4,,10
	.p2align 3
.L185:
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%r14, %rax	 ; tmp145, start
	jb	.L120	 ;,
.L121:
 ; D:\TC\src\file.c:268:     file->dirs = dirs_head;
	movq	%rbx, (%rdi)	 ; node, file_74(D)->dirs
 ; D:\TC\src\file.c:271:     if (dirs_tail != 0) {
	testq	%r13, %r13	 ; dirs_tail
	je	.L135	 ;,
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	0(%r13), %r13	 ; dirs_tail_140->dir, dirs_tail
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%r13, %rcx	 ; dirs_tail,
	call	strrchr	 ;
	movq	%rax, %rsi	 ; tmp212, dot
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	 ; dot
	je	.L135	 ;,
	cmpq	%rax, %r13	 ; dot, dirs_tail
	je	.L135	 ;,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r13, %rcx	 ; dirs_tail,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r13, %rdx	 ; dirs_tail, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rsi, %rcx	 ; dot,
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%rdi)	 ; tmp213, file_74(D)->name
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	strlen	 ;
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rsi, %rcx	 ; dot,
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rdx	 ; tmp214, tmp174
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	create_string	 ;
 ; D:\TC\src\file.c:282:             file->extension = 0;
	movq	%rax, 8(%rdi)	 ; _27, file_74(D)->extension
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	 ; node
	je	.L137	 ;,
.L188:
 ; D:\TC\src\file.c:291:     StrNode* current = dirs_head;
	movq	%rbx, %rsi	 ; node, current
 ; D:\TC\src\file.c:292:     size_t node_count = 0;
	xorl	%r14d, %r14d	 ; node_count
 ; D:\TC\src\file.c:290:     size_t full_path_len = 0;
	xorl	%r12d, %r12d	 ; full_path_len
	.p2align 4,,10
	.p2align 3
.L138:
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	movq	(%rsi), %rcx	 ; current_151->dir, current_151->dir
 ; D:\TC\src\file.c:296:         node_count++;
	addq	$1, %r14	 ;, node_count
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	call	strlen	 ;
 ; D:\TC\src\file.c:297:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_151->next, current
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %r12	 ; tmp216, full_path_len
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rsi, %rsi	 ; current
	jne	.L138	 ;,
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%r12), %rax	 ;, tmp198
	leaq	(%r12,%r14), %rdx	 ;, tmp197
	cmpq	$1, %r14	 ;, node_count
	cmovbe	%rax, %rdx	 ; tmp197,, tmp198, _31
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string	 ;
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_97
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rsi	 ;* node, pretmp_92
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %r12	 ; tmp218, full_path
	.p2align 4,,10
	.p2align 3
.L144:
	movq	%r12, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	%rsi, %rdx	 ; pretmp_92,
	leaq	(%r12,%rax), %rcx	 ;, tmp186
	call	stpcpy	 ;
 ; D:\TC\src\file.c:318:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_6->next, node
 ; D:\TC\src\file.c:309:     while (current != 0) {
	testq	%rbx, %rbx	 ; node
	je	.L140	 ;,
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rsi	 ; current_104->dir, pretmp_92
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$47, (%rsi)	 ;, MEM <char[1:2]> [(void *)pretmp_92]
	je	.L186	 ;,
.L147:
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%r12)	 ;, MEM[(const char *)full_path_97]
	je	.L144	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rax)	 ;, *_38
	je	.L144	 ;,
 ; D:\TC\src\file.c:313:                 strcat(full_path, "/");
	movl	$47, %edx	 ;,
	movw	%dx, (%rax)	 ;, MEM <char[1:2]> [(void *)_144]
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	(%rbx), %rsi	 ;* node, pretmp_92
	jmp	.L144	 ;
	.p2align 4,,10
	.p2align 3
.L120:
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	subq	%rax, %rdx	 ; start, ivtmp.58
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%r10, %rcx	 ; tmp200,
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	movq	%rdx, %r12	 ; ivtmp.58, comp_len
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	leaq	(%r15,%rax), %rdx	 ;, tmp151
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%r12, %r8	 ; comp_len,
	call	strncpy	 ;
 ; D:\TC\src\file.c:216:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r12)	 ;, component[comp_len_108]
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	cmpw	$46, (%rax)	 ;, MEM <char[1:2]> [(void *)&component]
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%rax, %r10	 ;, tmp200
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	je	.L123	 ;,
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	cmpw	$11822, (%rax)	 ;, MEM <char[1:3]> [(void *)&component]
	je	.L187	 ;,
.L127:
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	je	.L123	 ;,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	movq	%r10, 40(%rsp)	 ; tmp200, %sfp
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r12, %rdx	 ; comp_len,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 32(%rsp)	 ; node, %sfp
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	32(%rsp), %r8	 ; %sfp, node
 ; D:\TC\src\file.c:255:                     if (dirs_tail != 0)
	testq	%r13, %r13	 ; dirs_tail
	movq	40(%rsp), %r10	 ; %sfp, tmp200
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	%rax, (%r8)	 ; tmp211, node_112->dir
 ; D:\TC\src\file.c:253:                     node->next = 0;
	movq	$0, 8(%r8)	 ;, node_112->next
 ; D:\TC\src\file.c:255:                     if (dirs_tail != 0)
	je	.L133	 ;,
 ; D:\TC\src\file.c:256:                         (dirs_tail)->next = node;
	movq	%r8, 8(%r13)	 ; node, dirs_tail_145->next
.L133:
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	%r8, %r13	 ; node, dirs_tail
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rbx, %rbx	 ; node
	jne	.L123	 ;,
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	%r8, %rbx	 ; node, node
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	movq	%r8, %r13	 ; node, dirs_tail
	jmp	.L123	 ;
	.p2align 4,,10
	.p2align 3
.L135:
 ; D:\TC\src\file.c:281:             file->name = dirs_tail->dir;
	xorl	%eax, %eax	 ; _27
	movq	%r13, 16(%rdi)	 ; dirs_tail, file_74(D)->name
 ; D:\TC\src\file.c:282:             file->extension = 0;
	movq	%rax, 8(%rdi)	 ; _27, file_74(D)->extension
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	 ; node
	jne	.L188	 ;,
.L137:
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string	 ;
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_64
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %r12	 ; tmp217, full_path
.L140:
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%r12, %rcx	 ; full_path,
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rdx	 ; tmp221, tmp192
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rdi)	 ; tmp222, file_74(D)->path
 ; D:\TC\src\file.c:322: }
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
	.p2align 4,,10
	.p2align 3
.L186:
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 1(%rsi)	 ;, MEM <char[1:2]> [(void *)pretmp_92]
	je	.L144	 ;,
	jmp	.L147	 ;
	.p2align 4,,10
	.p2align 3
.L187:
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	cmpb	$0, 2(%rax)	 ;, MEM <char[1:3]> [(void *)&component]
	jne	.L127	 ;,
 ; D:\TC\src\file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r13, %r13	 ; dirs_tail
	je	.L130	 ;,
	cmpq	%r13, %rbx	 ; dirs_tail, node
	je	.L130	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	0(%r13), %rax	 ; dirs_tail_145->dir, dirs_tail_145->dir
	cmpb	$46, (%rax)	 ;, MEM <char[1:3]> [(void *)_14]
	je	.L189	 ;,
.L150:
 ; D:\TC\src\file.c:232:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	 ; node, prev
	jmp	.L132	 ;
	.p2align 4,,10
	.p2align 3
.L151:
 ; D:\TC\src\file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _17, prev
.L132:
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L123	 ;,
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_57->next, _17
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r13, %rdx	 ; dirs_tail, _17
	jne	.L151	 ;,
 ; D:\TC\src\file.c:237:                                 prev->next = 0;
	movq	$0, 8(%rax)	 ;, prev_57->next
 ; D:\TC\src\file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r13	 ; prev, dirs_tail
	jmp	.L123	 ;
	.p2align 4,,10
	.p2align 3
.L184:
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\file.c:204:         start = 1;
	movl	$1, %esi	 ;, ivtmp.58
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC4(%rip), %rcx	 ;, tmp150
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp204, node
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:200:         node->next = 0;
	movq	$0, 8(%rbx)	 ;, node_80->next
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%rbx)	 ; tmp205, node_80->dir
	jmp	.L118	 ;
	.p2align 4,,10
	.p2align 3
.L130:
 ; D:\TC\src\file.c:241:                     } else if (dirs_head == 0) {
	testq	%rbx, %rbx	 ; node
	jne	.L123	 ;,
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	movq	%r10, 40(%rsp)	 ; tmp200, %sfp
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp166
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp208, node
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:247:                         dirs_tail = node;
	movq	%rbx, %r13	 ; node, dirs_tail
	movq	40(%rsp), %r10	 ; %sfp, tmp200
 ; D:\TC\src\file.c:245:                         node->next = 0;
	movq	$0, 8(%rbx)	 ;, node_118->next
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	 ; tmp209, node_118->dir
	jmp	.L123	 ;
.L189:
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$46, 1(%rax)	 ;, MEM <char[1:3]> [(void *)_14]
	jne	.L150	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$0, 2(%rax)	 ;, MEM <char[1:3]> [(void *)_14]
	jne	.L150	 ;,
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	movq	%r10, 40(%rsp)	 ; tmp200, %sfp
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp165
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r12	 ; tmp206, node
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	call	create_string	 ;
	movq	40(%rsp), %r10	 ; %sfp, tmp200
 ; D:\TC\src\file.c:227:                             node->next = 0;
	movq	$0, 8(%r12)	 ;, node_125->next
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movq	%rax, (%r12)	 ; tmp207, node_125->dir
 ; D:\TC\src\file.c:228:                             dirs_tail->next = node;
	movq	%r12, 8(%r13)	 ; node, dirs_tail_145->next
 ; D:\TC\src\file.c:229:                             dirs_tail = node;
	movq	%r12, %r13	 ; node, dirs_tail
	jmp	.L123	 ;
	.p2align 4
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
create_file:
	pushq	%rsi	 ;
	movq	%rcx, %rsi	 ; tmp86, path
 ; D:\TC\src\file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
 ; D:\TC\src\file.c:13: File* create_file(const string path) {
	pushq	%rbx	 ;
	subq	$40, %rsp	 ;,
 ; D:\TC\src\file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	movq	%rsi, %rcx	 ; path,
 ; D:\TC\src\file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	call	absolute_path	 ;
 ; D:\TC\src\file.c:16:     normalize_path(file);
	movq	%rbx, %rcx	 ; <retval>,
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	movq	%rax, 24(%rbx)	 ; tmp88, file_4->path
 ; D:\TC\src\file.c:16:     normalize_path(file);
	call	normalize_path	 ;
 ; D:\TC\src\file.c:18: }
	addq	$40, %rsp	 ;,
	movq	%rbx, %rax	 ; <retval>,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	stpcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef

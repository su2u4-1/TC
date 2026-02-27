	.file	"D:\\TC\\src\\file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O3
	.text
	.p2align 4
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cwd
get_cwd:
	.seh_endprologue
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\file.c:11: }
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	jmp	getcwd	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC0:
	.ascii "\0"
.LC1:
	.ascii "%s/%s\0"
	.text
	.p2align 4
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.seh_proc	absolute_path
absolute_path:
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
 ; D:\TC\src\file.c:20: string absolute_path(string path) {
	movq	%rcx, %rdi	 ; tmp133, path
 ; D:\TC\src\file.c:21:     size_t path_len = strlen(path);
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp134, path_len
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	 ; path_len
	je	.L4	 ;,
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
	cmpq	%rbp, %rbx	 ; path_len, i
	jnb	.L35	 ;,
.L14:
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rdi,%rbx), %rsi	 ;, _1
	movzbl	(%rsi), %ecx	 ; *_1, _2
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %cl	 ;, _2
	jne	.L5	 ;,
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rsi)	 ;, *_1
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rbx	 ;, i
	jbe	.L10	 ;,
	leaq	1(%rbx), %rdx	 ;, i
.L11:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rdi,%rbx), %rcx	 ;, _6
	movzbl	(%rcx), %eax	 ; *_6, _7
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	 ;, _7
	je	.L36	 ;,
.L8:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _7
	jne	.L20	 ;,
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rbp, %r8	 ; path_len, tmp140
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	addq	%rdi, %rdx	 ; path, tmp123
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %rcx	 ; _1,
 ; D:\TC\src\file.c:31:             path_len--;
	subq	$1, %rbp	 ;, path_len
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rbx, %r8	 ; i, tmp140
	call	memmove	 ;
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rbp, %rbx	 ; path_len, i
	jb	.L14	 ;,
	.p2align 4,,10
	.p2align 3
.L35:
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%rbp, %rbp	 ; path_len
	je	.L4	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rdi)	 ;, *path_38(D)
	je	.L25	 ;,
.L15:
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	xorl	%edx, %edx	 ;
	xorl	%ecx, %ecx	 ;
	call	getcwd	 ;
	movq	%rax, %rbx	 ; tmp135, _54
 ; D:\TC\src\file.c:43:     if (cwd == NULL)
	testq	%rax, %rax	 ; _54
	je	.L25	 ;,
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%rax, %rcx	 ; _54,
	call	strlen	 ;
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	leaq	.LC0(%rip), %rcx	 ;, tmp128
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%rbp,%rax), %rbp	 ;, total_len
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rbp, %rdx	 ; total_len,
	call	create_string	 ;
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	movq	%rdi, %r9	 ; path,
	movq	%rbx, %r8	 ; _54,
	leaq	.LC1(%rip), %rdx	 ;, tmp129
	movq	%rax, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rax, %rsi	 ; tmp137, abs_path
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	call	sprintf	 ;
 ; D:\TC\src\file.c:48:     free(cwd);
	movq	%rbx, %rcx	 ; _54,
	call	free	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	movq	%rbp, %rdx	 ; total_len,
	movq	%rsi, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:50: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	jmp	create_string	 ;
	.p2align 4,,10
	.p2align 3
.L36:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rbx), %r12	 ;, _8
	leaq	(%rdi,%r12), %rsi	 ;, _1
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, (%rsi)	 ;, *_9
	jne	.L20	 ;,
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rbp, %r8	 ; path_len, tmp139
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	addq	%rdi, %rdx	 ; path, tmp119
 ; D:\TC\src\file.c:26:             path_len -= 2;
	subq	$2, %rbp	 ;, path_len
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rbx, %r8	 ; i, tmp139
 ; D:\TC\src\file.c:27:             i -= 2;
	movq	%r12, %rbx	 ; _8, i
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	call	memmove	 ;
	.p2align 4,,10
	.p2align 3
.L10:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rbx, %rbx	 ; i
	jne	.L37	 ;,
	movl	$1, %ebx	 ;, i
	jmp	.L12	 ;
	.p2align 4,,10
	.p2align 3
.L25:
 ; D:\TC\src\file.c:50: }
	movq	%rdi, %rax	 ; path,
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
	.p2align 4,,10
	.p2align 3
.L4:
	xorl	%ebp, %ebp	 ; path_len
	jmp	.L15	 ;
.L37:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rsi)	 ;, *prephitmp_56
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	leaq	1(%rbx), %rdx	 ;, i
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L20	 ;,
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movzbl	-1(%rdi,%rbx), %eax	 ; *_66, _7
	jmp	.L8	 ;
	.seh_endproc
	.p2align 4
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_name
get_file_name:
	.seh_endprologue
 ; D:\TC\src\file.c:53:     return path->name;
	movq	16(%rcx), %rax	 ; path_2(D)->name, path_2(D)->name
 ; D:\TC\src\file.c:54: }
	ret	
	.seh_endproc
	.p2align 4
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_extension
get_file_extension:
	.seh_endprologue
 ; D:\TC\src\file.c:57:     return path->extension;
	movq	8(%rcx), %rax	 ; path_2(D)->extension, path_2(D)->extension
 ; D:\TC\src\file.c:58: }
	ret	
	.seh_endproc
	.p2align 4
	.globl	get_file_dir
	.def	get_file_dir;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_dir
get_file_dir:
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
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	movq	(%rcx), %rdx	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:60: string get_file_dir(File* path) {
	movq	%rcx, %rbp	 ; tmp128, path
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	testq	%rdx, %rdx	 ; current
	je	.L40	 ;,
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rdx), %rbx	 ; _1->next, <retval>
 ; D:\TC\src\file.c:65:     size_t node_count = 0;
	xorl	%edi, %edi	 ; node_count
 ; D:\TC\src\file.c:64:     size_t total_len = 0;
	xorl	%esi, %esi	 ; total_len
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	 ; <retval>
	je	.L40	 ;,
	.p2align 4,,10
	.p2align 3
.L42:
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rdx), %rcx	 ; current_7->dir, current_7->dir
 ; D:\TC\src\file.c:71:             node_count++;
	addq	$1, %rdi	 ;, node_count
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	call	strlen	 ;
	movq	%rbx, %rdx	 ; <retval>, current
 ; D:\TC\src\file.c:70:             total_len += dir_len;
	addq	%rax, %rsi	 ; tmp129, total_len
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rbx), %rax	 ; _16->next, _2
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rax, %rax	 ; _2
	je	.L67	 ;,
	movq	%rax, %rbx	 ; _2, <retval>
	jmp	.L42	 ;
	.p2align 4,,10
	.p2align 3
.L67:
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	testq	%rdi, %rdi	 ; node_count
	je	.L40	 ;,
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
	je	.L48	 ;,
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_38->next
	je	.L48	 ;,
.L66:
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	(%rbx), %rdi	 ;* current, pretmp_28
.L50:
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	%rdi, %rdx	 ; pretmp_28,
	leaq	(%rsi,%rax), %rcx	 ;, tmp120
	call	stpcpy	 ;
 ; D:\TC\src\file.c:98:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_51->next, current
 ; D:\TC\src\file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L48	 ;,
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_45->next
	je	.L48	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rdi	 ; current_45->dir, pretmp_28
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$47, (%rdi)	 ;, MEM <char[1:2]> [(void *)pretmp_28]
	je	.L68	 ;,
.L53:
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rsi)	 ;, MEM[(const char *)dir_path_36]
	je	.L50	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rax)	 ;, *_12
	je	.L50	 ;,
 ; D:\TC\src\file.c:93:                     strcat(dir_path, "/");
	movl	$47, %edx	 ;,
	movw	%dx, (%rax)	 ;, MEM <char[1:2]> [(void *)_60]
	jmp	.L66	 ;
	.p2align 4,,10
	.p2align 3
.L48:
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rdx	 ; tmp131, tmp114
 ; D:\TC\src\file.c:102: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	jmp	create_string	 ;
	.p2align 4,,10
	.p2align 3
.L68:
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, 1(%rdi)	 ;, MEM <char[1:2]> [(void *)pretmp_28]
	je	.L50	 ;,
	jmp	.L53	 ;
.L40:
 ; D:\TC\src\file.c:102: }
	xorl	%eax, %eax	 ;
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.p2align 4
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.seh_proc	get_full_path
get_full_path:
	.seh_endprologue
 ; D:\TC\src\file.c:105:     return path->path;
	movq	24(%rcx), %rax	 ; path_2(D)->path, path_2(D)->path
 ; D:\TC\src\file.c:106: }
	ret	
	.seh_endproc
	.p2align 4
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_extension
change_file_extension:
	pushq	%r13	 ;
	.seh_pushreg	%r13
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
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\file.c:109:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; new_extension, file_18(D)->extension
 ; D:\TC\src\file.c:108: void change_file_extension(File* file, const string new_extension) {
	movq	%rcx, %rbx	 ; tmp136, file
	movq	%rdx, %rsi	 ; tmp137, new_extension
 ; D:\TC\src\file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
	movq	%rax, %rbp	 ; tmp138, dir
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	je	.L71	 ;,
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
	je	.L88	 ;,
.L81:
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
	je	.L89	 ;,
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.0_52]
	jne	.L90	 ;,
.L74:
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	movq	16(%rbx), %rdx	 ; file_18(D)->name, file_18(D)->name
	movq	%rdi, %rcx	 ; new_path,
	call	strcpy	 ;
.L75:
 ; D:\TC\src\file.c:125:     if (new_extension != 0)
	testq	%rsi, %rsi	 ; new_extension
	je	.L77	 ;,
.L76:
 ; D:\TC\src\file.c:126:         strcat(new_path, new_extension);
	movq	%rsi, %rdx	 ; new_extension,
	movq	%rdi, %rcx	 ; new_path,
	call	strcat	 ;
.L77:
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
.L88:
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rdx	 ;, tmp133
	movq	%r12, %rcx	 ; tmp135,
	call	create_string	 ;
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.0_52]
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %rdi	 ; tmp147, new_path
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	je	.L74	 ;,
.L90:
 ; D:\TC\src\file.c:121:         sprintf(new_path, "%s/%s", dir_cstr, file->name);
	movq	16(%rbx), %r9	 ; file_18(D)->name,
	movq	%r13, %r8	 ; iftmp.0_52,
	leaq	.LC1(%rip), %rdx	 ;, tmp114
	movq	%rdi, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L75	 ;
	.p2align 4,,10
	.p2align 3
.L71:
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rsi, %rsi	 ; new_extension
	je	.L80	 ;,
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r12	 ;, tmp135
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rax), %rdi	 ;, _51
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r12, %r13	 ; tmp135, iftmp.0_52
	jmp	.L81	 ;
	.p2align 4,,10
	.p2align 3
.L80:
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
	jmp	.L77	 ;
	.p2align 4,,10
	.p2align 3
.L89:
	movq	16(%rbx), %rdx	 ; file_18(D)->name, file_18(D)->name
	movq	%rdi, %rcx	 ; new_path,
	call	strcpy	 ;
	jmp	.L76	 ;
	.seh_endproc
	.section .rdata,"dr"
.LC2:
	.ascii "%s%s\0"
.LC3:
	.ascii "%s/%s%s\0"
	.text
	.p2align 4
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_name
change_file_name:
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
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
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	leaq	.LC0(%rip), %r12	 ;, iftmp.3_70
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	movq	(%rcx), %rax	 ; file_26(D)->dirs, _2
 ; D:\TC\src\file.c:132:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_26(D)->name
 ; D:\TC\src\file.c:131: void change_file_name(File* file, const string new_name) {
	movq	%rcx, %rbx	 ; tmp147, file
	movq	%rdx, %rsi	 ; tmp148, new_name
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	 ; _2
	je	.L93	 ;,
	.p2align 4,,10
	.p2align 3
.L92:
	movq	%rax, %rdi	 ; _2, current
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	 ; current_17->next, _2
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	 ; _2
	jne	.L92	 ;,
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r13	 ; file_26(D)->extension, _3
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp149, full_name_len
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r13, %r13	 ; _3
	je	.L104	 ;,
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	%r13, %rcx	 ; _3,
	leaq	.LC0(%rip), %r12	 ;, iftmp.3_70
	call	strlen	 ;
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	addq	%rax, %rbp	 ; tmp150, full_name_len
.L94:
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
.L93:
 ; D:\TC\src\file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rcx	 ; file,
	call	get_file_dir	 ;
	movq	%rax, %rdi	 ; tmp154, dir
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	je	.L96	 ;,
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
	leaq	0(%rbp,%rax), %rdx	 ;, _48
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rdx), %rbp	 ;, _20
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r13, %r13	 ; _69
	je	.L108	 ;,
.L103:
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
	je	.L99	 ;,
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r14)	 ;, MEM[(const char *)iftmp.3_70]
	jne	.L109	 ;,
.L99:
 ; D:\TC\src\file.c:166:         sprintf(new_path, "%s%s", new_name, ext_cstr);
	movq	%r13, %r9	 ; _69,
	movq	%rsi, %r8	 ; new_name,
	leaq	.LC2(%rip), %rdx	 ;, tmp129
	movq	%rbp, %rcx	 ; new_path,
	call	sprintf	 ;
.L100:
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
.L108:
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
	je	.L99	 ;,
.L109:
 ; D:\TC\src\file.c:164:         sprintf(new_path, "%s/%s%s", dir_cstr, new_name, ext_cstr);
	movq	%r13, 32(%rsp)	 ; _69,
	movq	%rsi, %r9	 ; new_name,
	movq	%r14, %r8	 ; iftmp.3_70,
	movq	%rbp, %rcx	 ; new_path,
	leaq	.LC3(%rip), %rdx	 ;, tmp128
	call	sprintf	 ;
	jmp	.L100	 ;
	.p2align 4,,10
	.p2align 3
.L104:
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r12	 ;, iftmp.3_70
	movq	%r12, %r13	 ; iftmp.3_70, _3
	jmp	.L94	 ;
	.p2align 4,,10
	.p2align 3
.L96:
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r13	 ; file_26(D)->extension, _69
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %r14	 ;, iftmp.3_70
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rax), %rbp	 ;, _20
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r13, %r13	 ; _69
	jne	.L103	 ;,
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	leaq	2(%rax), %rdx	 ;, tmp141
	movq	%r12, %rcx	 ; iftmp.3_70,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r13	 ;, _69
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	call	create_string	 ;
	movq	%rax, %rbp	 ; tmp162, new_path
	jmp	.L99	 ;
	.seh_endproc
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
	.seh_proc	normalize_path
normalize_path:
	pushq	%r15	 ;
	.seh_pushreg	%r15
	pushq	%r14	 ;
	.seh_pushreg	%r14
	pushq	%r13	 ;
	.seh_pushreg	%r13
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
	subq	$312, %rsp	 ;,
	.seh_stackalloc	312
	.seh_endprologue
 ; D:\TC\src\file.c:181:     size_t start = 0;
	xorl	%esi, %esi	 ; ivtmp.59
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	xorl	%ebx, %ebx	 ; node
 ; D:\TC\src\file.c:171: void normalize_path(File* file) {
	movq	%rcx, %rdi	 ; tmp201, file
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rcx), %rcx	 ; file_74(D)->path, file_74(D)->path
	call	strlen	 ;
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	.LC0(%rip), %rcx	 ;,
	leaq	1(%rax), %rdx	 ;, tmp147
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %r13	 ; tmp202, tmp145
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	24(%rdi), %rdx	 ; file_74(D)->path, file_74(D)->path
	movq	%rax, %rcx	 ; path_copy,
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	movq	%rax, %r14	 ; tmp203, path_copy
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	call	strcpy	 ;
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%r13, %r13	 ; tmp145
	je	.L111	 ;,
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r14)	 ;, *path_copy_77
	je	.L176	 ;,
.L111:
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	movq	%rsi, %rax	 ; ivtmp.59, start
	movq	%rbx, %r15	 ; node, dirs_tail
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %r12	 ;, tmp200
	jmp	.L127	 ;
	.p2align 4,,10
	.p2align 3
.L115:
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	cmpq	%rsi, %r13	 ; ivtmp.59, tmp145
	jb	.L114	 ;,
.L127:
	movq	%rsi, %rdx	 ; ivtmp.59, ivtmp.59
 ; D:\TC\src\file.c:262:             start = i + 1;
	addq	$1, %rsi	 ;, ivtmp.59
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rdx, %r13	 ; ivtmp.59, tmp145
	je	.L177	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r14,%rdx)	 ;, MEM[(char *)path_copy_77 + ivtmp.59_85 * 1]
	jne	.L115	 ;,
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%rdx, %rax	 ; ivtmp.59, start
	jb	.L113	 ;,
.L116:
 ; D:\TC\src\file.c:262:             start = i + 1;
	movq	%rsi, %rax	 ; ivtmp.59, start
	jmp	.L115	 ;
	.p2align 4,,10
	.p2align 3
.L177:
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%r13, %rax	 ; tmp145, start
	jb	.L113	 ;,
.L114:
 ; D:\TC\src\file.c:268:     file->dirs = dirs_head;
	movq	%rbx, (%rdi)	 ; node, file_74(D)->dirs
 ; D:\TC\src\file.c:271:     if (dirs_tail != 0) {
	testq	%r15, %r15	 ; dirs_tail
	je	.L128	 ;,
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%r15), %r15	 ; dirs_tail_55->dir, dirs_tail
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%r15, %rcx	 ; dirs_tail,
	call	strrchr	 ;
	movq	%rax, %rsi	 ; tmp212, dot
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	 ; dot
	je	.L128	 ;,
	cmpq	%rax, %r15	 ; dot, dirs_tail
	je	.L128	 ;,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r15, %rcx	 ; dirs_tail,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r15, %rdx	 ; dirs_tail, name_len
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
	je	.L130	 ;,
.L180:
 ; D:\TC\src\file.c:291:     StrNode* current = dirs_head;
	movq	%rbx, %rsi	 ; node, current
 ; D:\TC\src\file.c:292:     size_t node_count = 0;
	xorl	%r13d, %r13d	 ; node_count
 ; D:\TC\src\file.c:290:     size_t full_path_len = 0;
	xorl	%ebp, %ebp	 ; full_path_len
	.p2align 4,,10
	.p2align 3
.L131:
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	movq	(%rsi), %rcx	 ; current_151->dir, current_151->dir
 ; D:\TC\src\file.c:296:         node_count++;
	addq	$1, %r13	 ;, node_count
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	call	strlen	 ;
 ; D:\TC\src\file.c:297:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_151->next, current
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %rbp	 ; tmp216, full_path_len
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rsi, %rsi	 ; current
	jne	.L131	 ;,
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%rbp), %rax	 ;, tmp198
	leaq	0(%rbp,%r13), %rdx	 ;, tmp197
	cmpq	$1, %r13	 ;, node_count
	cmovbe	%rax, %rdx	 ; tmp197,, tmp198, _31
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string	 ;
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_97
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rsi	 ;* node, pretmp_92
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %rbp	 ; tmp218, full_path
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%rbp, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	%rsi, %rdx	 ; pretmp_92,
	leaq	0(%rbp,%rax), %rcx	 ;, tmp186
	call	stpcpy	 ;
 ; D:\TC\src\file.c:318:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_94->next, node
 ; D:\TC\src\file.c:309:     while (current != 0) {
	testq	%rbx, %rbx	 ; node
	je	.L133	 ;,
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rsi	 ; current_104->dir, pretmp_92
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$47, (%rsi)	 ;, MEM <char[1:2]> [(void *)pretmp_92]
	je	.L178	 ;,
.L140:
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, 0(%rbp)	 ;, MEM[(const char *)full_path_97]
	je	.L137	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rax)	 ;, *_38
	je	.L137	 ;,
 ; D:\TC\src\file.c:313:                 strcat(full_path, "/");
	movl	$47, %edx	 ;,
	movw	%dx, (%rax)	 ;, MEM <char[1:2]> [(void *)_146]
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	(%rbx), %rsi	 ;* node, pretmp_92
	jmp	.L137	 ;
	.p2align 4,,10
	.p2align 3
.L113:
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	subq	%rax, %rdx	 ; start, ivtmp.59
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%r12, %rcx	 ; tmp200,
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	movq	%rdx, %rbp	 ; ivtmp.59, comp_len
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	leaq	(%r14,%rax), %rdx	 ;, tmp151
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%rbp, %r8	 ; comp_len,
	call	strncpy	 ;
 ; D:\TC\src\file.c:216:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%rbp)	 ;, component[comp_len_108]
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	cmpw	$46, (%r12)	 ;, MEM <char[1:2]> [(void *)&component]
	je	.L116	 ;,
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	cmpw	$11822, (%r12)	 ;, MEM <char[1:3]> [(void *)&component]
	je	.L179	 ;,
.L120:
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	je	.L116	 ;,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	%rbp, %rdx	 ; comp_len,
	movq	%r12, %rcx	 ; tmp200,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, 40(%rsp)	 ; node, %sfp
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	40(%rsp), %r8	 ; %sfp, node
	movq	%rax, (%r8)	 ; tmp211, node_112->dir
 ; D:\TC\src\file.c:253:                     node->next = 0;
	movq	$0, 8(%r8)	 ;, node_112->next
 ; D:\TC\src\file.c:255:                     if (dirs_tail != 0)
	testq	%r15, %r15	 ; dirs_tail
	je	.L126	 ;,
 ; D:\TC\src\file.c:256:                         (dirs_tail)->next = node;
	movq	%r8, 8(%r15)	 ; node, dirs_tail_145->next
.L126:
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	%r8, %r15	 ; node, dirs_tail
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rbx, %rbx	 ; node
	jne	.L116	 ;,
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	%r8, %rbx	 ; node, node
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	movq	%r8, %r15	 ; node, dirs_tail
	jmp	.L116	 ;
	.p2align 4,,10
	.p2align 3
.L128:
 ; D:\TC\src\file.c:281:             file->name = dirs_tail->dir;
	xorl	%eax, %eax	 ; _27
	movq	%r15, 16(%rdi)	 ; dirs_tail, file_74(D)->name
 ; D:\TC\src\file.c:282:             file->extension = 0;
	movq	%rax, 8(%rdi)	 ; _27, file_74(D)->extension
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	 ; node
	jne	.L180	 ;,
.L130:
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string	 ;
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_64
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %rbp	 ; tmp217, full_path
.L133:
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbp, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbp, %rcx	 ; full_path,
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rdx	 ; tmp221, tmp192
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rdi)	 ; tmp222, file_74(D)->path
 ; D:\TC\src\file.c:322: }
	addq	$312, %rsp	 ;,
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
.L178:
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 1(%rsi)	 ;, MEM <char[1:2]> [(void *)pretmp_92]
	je	.L137	 ;,
	jmp	.L140	 ;
	.p2align 4,,10
	.p2align 3
.L179:
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	cmpb	$0, 2(%r12)	 ;, MEM <char[1:3]> [(void *)&component]
	jne	.L120	 ;,
 ; D:\TC\src\file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r15, %r15	 ; dirs_tail
	je	.L123	 ;,
	cmpq	%r15, %rbx	 ; dirs_tail, node
	je	.L123	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rax	 ; dirs_tail_145->dir, dirs_tail_145->dir
	cmpb	$46, (%rax)	 ;, MEM <char[1:3]> [(void *)_14]
	je	.L181	 ;,
.L143:
 ; D:\TC\src\file.c:232:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	 ; node, prev
	jmp	.L125	 ;
	.p2align 4,,10
	.p2align 3
.L144:
 ; D:\TC\src\file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _17, prev
.L125:
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L116	 ;,
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_57->next, _17
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r15, %rdx	 ; dirs_tail, _17
	jne	.L144	 ;,
 ; D:\TC\src\file.c:237:                                 prev->next = 0;
	movq	$0, 8(%rax)	 ;, prev_57->next
 ; D:\TC\src\file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r15	 ; prev, dirs_tail
	jmp	.L116	 ;
	.p2align 4,,10
	.p2align 3
.L176:
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
 ; D:\TC\src\file.c:204:         start = 1;
	movl	$1, %esi	 ;, ivtmp.59
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
	jmp	.L111	 ;
	.p2align 4,,10
	.p2align 3
.L123:
 ; D:\TC\src\file.c:241:                     } else if (dirs_head == 0) {
	testq	%rbx, %rbx	 ; node
	jne	.L116	 ;,
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp166
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp208, node
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:247:                         dirs_tail = node;
	movq	%rbx, %r15	 ; node, dirs_tail
 ; D:\TC\src\file.c:245:                         node->next = 0;
	movq	$0, 8(%rbx)	 ;, node_118->next
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	 ; tmp209, node_118->dir
	jmp	.L116	 ;
.L181:
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$46, 1(%rax)	 ;, MEM <char[1:3]> [(void *)_14]
	jne	.L143	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	cmpb	$0, 2(%rax)	 ;, MEM <char[1:3]> [(void *)_14]
	jne	.L143	 ;,
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp165
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbp	 ; tmp206, node
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:227:                             node->next = 0;
	movq	$0, 8(%rbp)	 ;, node_125->next
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movq	%rax, 0(%rbp)	 ; tmp207, node_125->dir
 ; D:\TC\src\file.c:228:                             dirs_tail->next = node;
	movq	%rbp, 8(%r15)	 ; node, dirs_tail_145->next
 ; D:\TC\src\file.c:229:                             dirs_tail = node;
	movq	%rbp, %r15	 ; node, dirs_tail
	jmp	.L116	 ;
	.seh_endproc
	.p2align 4
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
	.seh_proc	create_file
create_file:
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\file.c:13: File* create_file(const string path) {
	movq	%rcx, %rsi	 ; tmp86, path
 ; D:\TC\src\file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
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
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	ret	
	.seh_endproc
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

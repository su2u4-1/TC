	.file	"D:\\TC\\src\\file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -Os
	.text
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
	.globl	absolute_path
	.def	absolute_path;	.scl	2;	.type	32;	.endef
	.seh_proc	absolute_path
absolute_path:
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
 ; D:\TC\src\file.c:20: string absolute_path(string path) {
	movq	%rcx, %rbx	 ; tmp134, path
 ; D:\TC\src\file.c:21:     size_t path_len = strlen(path);
	call	strlen	 ;
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	xorl	%edx, %edx	 ; i
 ; D:\TC\src\file.c:21:     size_t path_len = strlen(path);
	movq	%rax, %rsi	 ; tmp135, path_len
.L3:
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rsi, %rdx	 ; path_len, i
	jnb	.L30	 ;,
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rdx), %rcx	 ;, _1
	movb	(%rcx), %al	 ; *_1, _2
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	 ;, _2
	jne	.L4	 ;,
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	 ;, *_1
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	 ;, i
	jbe	.L9	 ;,
.L10:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rdx), %rcx	 ;, _6
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rcx)	 ;, *_6
	jne	.L11	 ;,
	jmp	.L31	 ;
.L4:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rdx	 ;, i
	jbe	.L9	 ;,
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _2
	jne	.L11	 ;,
	jmp	.L10	 ;
.L31:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rdx)	 ;, *_9
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rdx), %rdi	 ;, _8
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	jne	.L11	 ;,
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rax	 ;, tmp120
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp140
 ; D:\TC\src\file.c:26:             path_len -= 2;
	subq	$2, %rsi	 ;, path_len
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	subq	%rdx, %r8	 ; i, tmp140
	movq	%rax, %rdx	 ; tmp120,
	call	memmove	 ;
 ; D:\TC\src\file.c:27:             i -= 2;
	movq	%rdi, %rdx	 ; _8, i
.L9:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rdx, %rdx	 ; i
	je	.L12	 ;,
.L11:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rdx), %rcx	 ;, _14
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rcx)	 ;, *_14
	jne	.L12	 ;,
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rdx)	 ;, *_17
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rdx), %rdi	 ;, _16
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	jne	.L12	 ;,
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rdx), %rax	 ;, tmp126
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp141
 ; D:\TC\src\file.c:31:             path_len--;
	decq	%rsi	 ; path_len
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	subq	%rdx, %r8	 ; i, tmp141
	movq	%rax, %rdx	 ; tmp126,
	call	memmove	 ;
 ; D:\TC\src\file.c:32:             i--;
	movq	%rdi, %rdx	 ; _16, i
.L12:
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	incq	%rdx	 ; i
	jmp	.L3	 ;
.L30:
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%rsi, %rsi	 ; path_len
	je	.L14	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	 ;, *path_38(D)
	je	.L15	 ;,
.L14:
 ; D:\TC\src\file.c:42:     string cwd = get_cwd();
	call	get_cwd	 ;
	movq	%rax, %rdi	 ; tmp136, cwd
 ; D:\TC\src\file.c:43:     if (cwd == NULL)
	testq	%rax, %rax	 ; cwd
	je	.L15	 ;,
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%rax, %rcx	 ; cwd,
	call	strlen	 ;
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	leaq	.LC0(%rip), %rcx	 ;, tmp131
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%rsi,%rax), %rbp	 ;, total_len
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rbp, %rdx	 ; total_len,
	call	create_string	 ;
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	movq	%rbx, %r9	 ; path,
	movq	%rdi, %r8	 ; cwd,
	leaq	.LC1(%rip), %rdx	 ;, tmp132
	movq	%rax, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rax, %rsi	 ; tmp138, abs_path
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	call	sprintf	 ;
 ; D:\TC\src\file.c:48:     free(cwd);
	movq	%rdi, %rcx	 ; cwd,
	call	free	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	movq	%rbp, %rdx	 ; total_len,
	movq	%rsi, %rcx	 ; abs_path,
 ; D:\TC\src\file.c:50: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	jmp	create_string	 ;
.L15:
 ; D:\TC\src\file.c:50: }
	movq	%rbx, %rax	 ; path,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.section .rdata,"dr"
.LC2:
	.ascii "/\0"
	.text
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
	movq	(%rcx), %rax	 ; path_31(D)->dirs, <retval>
 ; D:\TC\src\file.c:60: string get_file_dir(File* path) {
	movq	%rcx, %rdi	 ; tmp124, path
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	testq	%rax, %rax	 ; <retval>
	je	.L34	 ;,
 ; D:\TC\src\file.c:65:     size_t node_count = 0;
	xorl	%esi, %esi	 ; node_count
 ; D:\TC\src\file.c:64:     size_t total_len = 0;
	xorl	%ebx, %ebx	 ; total_len
.L37:
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rax), %rbp	 ; current_53->next, _2
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rbp, %rbp	 ; _2
	je	.L36	 ;,
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rax), %rcx	 ; current_53->dir,
 ; D:\TC\src\file.c:71:             node_count++;
	incq	%rsi	 ; node_count
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	call	strlen	 ;
 ; D:\TC\src\file.c:70:             total_len += dir_len;
	addq	%rax, %rbx	 ; tmp125, total_len
 ; D:\TC\src\file.c:71:             node_count++;
	movq	%rbp, %rax	 ; _2, <retval>
	jmp	.L37	 ;
.L36:
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	testq	%rsi, %rsi	 ; node_count
	je	.L34	 ;,
 ; D:\TC\src\file.c:79:     if (node_count > 1)
	cmpq	$1, %rsi	 ;, node_count
	je	.L38	 ;,
 ; D:\TC\src\file.c:80:         total_len += node_count - 1;
	leaq	-1(%rbx,%rsi), %rbx	 ;, total_len
.L38:
 ; D:\TC\src\file.c:83:     string dir_path = create_string("", total_len + 1);
	leaq	1(%rbx), %rdx	 ;, tmp107
	leaq	.LC0(%rip), %rcx	 ;, tmp108
	call	create_string	 ;
 ; D:\TC\src\file.c:84:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_36
 ; D:\TC\src\file.c:83:     string dir_path = create_string("", total_len + 1);
	movq	%rax, %rbx	 ; tmp126, dir_path
 ; D:\TC\src\file.c:86:     current = path->dirs;
	movq	(%rdi), %rsi	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:87:     bool first = true;
	movb	$1, %al	 ;, first
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rdi	 ;, tmp123
.L39:
 ; D:\TC\src\file.c:88:     while (current != 0) {
	testq	%rsi, %rsi	 ; current
	je	.L54	 ;,
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rsi)	 ;, current_22->next
	je	.L40	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	 ; first
	jne	.L41	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rsi), %rcx	 ; current_22->dir,
	movq	%rdi, %rdx	 ; tmp123,
	call	strcmp	 ;
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; tmp127
	je	.L41	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rbx)	 ;, MEM[(const char *)dir_path_36]
	je	.L41	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rbx, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rbx,%rax)	 ;, *_12
	je	.L41	 ;,
 ; D:\TC\src\file.c:93:                     strcat(dir_path, "/");
	movq	%rdi, %rdx	 ; tmp123,
	movq	%rbx, %rcx	 ; dir_path,
	call	strcat	 ;
.L41:
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	(%rsi), %rdx	 ; current_22->dir,
	movq	%rbx, %rcx	 ; dir_path,
	call	strcat	 ;
 ; D:\TC\src\file.c:96:             first = false;
	xorl	%eax, %eax	 ; first
.L40:
 ; D:\TC\src\file.c:98:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_22->next, current
	jmp	.L39	 ;
.L54:
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rbx, %rcx	 ; dir_path,
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rax, %rdx	 ; tmp129, tmp117
 ; D:\TC\src\file.c:102: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	jmp	create_string	 ;
.L34:
 ; D:\TC\src\file.c:102: }
	xorl	%eax, %eax	 ;
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
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
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_extension
change_file_extension:
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
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC0(%rip), %r13	 ;, iftmp.0_13
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r13, %r12	 ; iftmp.0_13, iftmp.0_13
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	movq	%r13, %r14	 ; iftmp.0_13, iftmp.1_14
 ; D:\TC\src\file.c:109:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; new_extension, file_18(D)->extension
 ; D:\TC\src\file.c:108: void change_file_extension(File* file, const string new_extension) {
	movq	%rdx, %rbx	 ; tmp130, new_extension
	movq	%rcx, %rsi	 ; tmp129, file
 ; D:\TC\src\file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
 ; D:\TC\src\file.c:112:     string dir = get_file_dir(file);
	movq	%rax, %rbp	 ; tmp131, dir
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r12	 ; dir,, iftmp.0_13
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rbx, %rbx	 ; new_extension
	cmovne	%rbx, %r14	 ; new_extension,, iftmp.1_14
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r12, %rcx	 ; iftmp.0_13,
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rsi), %rcx	 ; file_18(D)->name, file_18(D)->name
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rdi	 ; tmp132, tmp101
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdi	 ;, path_len
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	testq	%rbx, %rbx	 ; new_extension
	je	.L59	 ;,
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	%r14, %rcx	 ; iftmp.1_14,
	call	strlen	 ;
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	addq	%rax, %rdi	 ; tmp134, path_len
.L59:
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	leaq	1(%rdi), %rdx	 ;, tmp111
	movq	%r13, %rcx	 ; iftmp.0_13,
	call	create_string	 ;
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	 ; dir
	movq	16(%rsi), %r9	 ; file_18(D)->name, file_18(D)->name
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	movq	%rax, %rdi	 ; tmp135, new_path
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	je	.L60	 ;,
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, (%r12)	 ;, MEM[(const char *)iftmp.0_13]
	je	.L60	 ;,
 ; D:\TC\src\file.c:121:         sprintf(new_path, "%s/%s", dir_cstr, file->name);
	movq	%r12, %r8	 ; iftmp.0_13,
	leaq	.LC1(%rip), %rdx	 ;, tmp114
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L61	 ;
.L60:
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	movq	%r9, %rdx	 ; file_18(D)->name,
	movq	%rdi, %rcx	 ; new_path,
	call	strcpy	 ;
.L61:
 ; D:\TC\src\file.c:125:     if (new_extension != 0)
	testq	%rbx, %rbx	 ; new_extension
	je	.L62	 ;,
 ; D:\TC\src\file.c:126:         strcat(new_path, new_extension);
	movq	%rbx, %rdx	 ; new_extension,
	movq	%rdi, %rcx	 ; new_path,
	call	strcat	 ;
.L62:
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rdx	 ; tmp136, tmp117
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rsi)	 ; tmp137, file_18(D)->path
 ; D:\TC\src\file.c:129: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%s%s\0"
.LC4:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_name
change_file_name:
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
	subq	$56, %rsp	 ;,
	.seh_stackalloc	56
	.seh_endprologue
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	movq	(%rcx), %rax	 ; file_26(D)->dirs, _1
 ; D:\TC\src\file.c:132:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_26(D)->name
 ; D:\TC\src\file.c:131: void change_file_name(File* file, const string new_name) {
	movq	%rcx, %rbx	 ; tmp151, file
	movq	%rdx, %rsi	 ; tmp152, new_name
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	 ; _1
	je	.L76	 ;,
.L75:
	movq	%rax, %rbp	 ; _1, current
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	 ; current_17->next, _1
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	 ; _1
	jne	.L75	 ;,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r14	 ; file_26(D)->extension, _3
	leaq	.LC0(%rip), %r13	 ;, iftmp.2_20
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%r13, %r12	 ; iftmp.2_20, iftmp.2_20
	testq	%r14, %r14	 ; _3
	cmovne	%r14, %r12	 ; _3,, iftmp.2_20
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp153, full_name_len
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	testq	%r14, %r14	 ; _3
	je	.L78	 ;,
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; iftmp.2_20,
	call	strlen	 ;
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	addq	%rax, %rdi	 ; tmp154, full_name_len
.L78:
 ; D:\TC\src\file.c:145:                 string full_name = create_string("", full_name_len + 1);
	leaq	1(%rdi), %rdx	 ;, tmp114
	movq	%r13, %rcx	 ; iftmp.2_20,
	call	create_string	 ;
 ; D:\TC\src\file.c:146:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%r12, %r9	 ; iftmp.2_20,
	movq	%rsi, %r8	 ; new_name,
	leaq	.LC3(%rip), %rdx	 ;, tmp116
 ; D:\TC\src\file.c:145:                 string full_name = create_string("", full_name_len + 1);
	movq	%rax, %rdi	 ; tmp155, full_name
 ; D:\TC\src\file.c:146:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%rax, %rcx	 ; full_name,
	call	sprintf	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rdi, %rcx	 ; full_name,
	call	strlen	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rdi, %rcx	 ; full_name,
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, %rdx	 ; tmp156, tmp118
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	call	create_string	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, 0(%rbp)	 ; tmp157, current_48->dir
.L76:
 ; D:\TC\src\file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rcx	 ; file,
	leaq	.LC0(%rip), %r14	 ;, iftmp.3_21
	call	get_file_dir	 ;
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	movq	%r14, %r13	 ; iftmp.3_21, iftmp.3_21
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r15	 ; file_26(D)->extension, _8
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	%r14, %r12	 ; iftmp.3_21, iftmp.4_22
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
 ; D:\TC\src\file.c:155:     string dir = get_file_dir(file);
	movq	%rax, %rbp	 ; tmp158, dir
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	cmovne	%rax, %r13	 ; dir,, iftmp.3_21
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r15, %r15	 ; _8
	cmovne	%r15, %r12	 ; _8,, iftmp.4_22
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r13, %rcx	 ; iftmp.3_21,
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rsi, %rcx	 ; new_name,
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rax, %rdi	 ; tmp159, tmp121
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rdi,%rax), %rdi	 ;, path_len
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	testq	%r15, %r15	 ; _8
	je	.L82	 ;,
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; iftmp.4_22,
	call	strlen	 ;
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	addq	%rax, %rdi	 ; tmp161, path_len
.L82:
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	leaq	1(%rdi), %rdx	 ;, tmp130
	movq	%r14, %rcx	 ; iftmp.3_21,
	call	create_string	 ;
	movq	%rax, %rdi	 ; tmp162, new_path
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	 ; dir
	je	.L83	 ;,
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, 0(%r13)	 ;, MEM[(const char *)iftmp.3_21]
	je	.L83	 ;,
 ; D:\TC\src\file.c:164:         sprintf(new_path, "%s/%s%s", dir_cstr, new_name, ext_cstr);
	movq	%r12, 32(%rsp)	 ; iftmp.4_22,
	movq	%rsi, %r9	 ; new_name,
	movq	%r13, %r8	 ; iftmp.3_21,
	movq	%rax, %rcx	 ; new_path,
	leaq	.LC4(%rip), %rdx	 ;, tmp132
	call	sprintf	 ;
	jmp	.L84	 ;
.L83:
 ; D:\TC\src\file.c:166:         sprintf(new_path, "%s%s", new_name, ext_cstr);
	movq	%r12, %r9	 ; iftmp.4_22,
	movq	%rsi, %r8	 ; new_name,
	leaq	.LC3(%rip), %rdx	 ;, tmp133
	movq	%rdi, %rcx	 ; new_path,
	call	sprintf	 ;
.L84:
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, %rdx	 ; tmp163, tmp135
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp164, file_26(D)->path
 ; D:\TC\src\file.c:169: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	popq	%r14	 ;
	popq	%r15	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC5:
	.ascii ".\0"
.LC6:
	.ascii "..\0"
	.text
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
 ; D:\TC\src\file.c:171: void normalize_path(File* file) {
	movq	%rcx, %rsi	 ; tmp200, file
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rcx), %rcx	 ; file_74(D)->path, file_74(D)->path
	call	strlen	 ;
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	.LC0(%rip), %rcx	 ;,
	leaq	1(%rax), %rdx	 ;, tmp144
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %rbp	 ; tmp201, tmp142
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	24(%rsi), %rdx	 ; file_74(D)->path, file_74(D)->path
	movq	%rax, %rcx	 ; path_copy,
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	movq	%rax, %r12	 ; tmp202, path_copy
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	call	strcpy	 ;
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%rbp, %rbp	 ; tmp142
	je	.L119	 ;,
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, (%r12)	 ;, *path_copy_77
	jne	.L119	 ;,
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp147
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r15	 ; tmp203, node
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	call	create_string	 ;
 ; D:\TC\src\file.c:200:         node->next = 0;
	xorl	%r9d, %r9d	 ;
 ; D:\TC\src\file.c:204:         start = 1;
	movl	$1, %edx	 ;, start
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%r15)	 ; tmp204, node_80->dir
 ; D:\TC\src\file.c:200:         node->next = 0;
	movq	%r9, 8(%r15)	 ;, node_80->next
	jmp	.L99	 ;
.L119:
 ; D:\TC\src\file.c:181:     size_t start = 0;
	xorl	%edx, %edx	 ; start
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	xorl	%r15d, %r15d	 ; node
.L99:
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %rax	 ;, tmp198
 ; D:\TC\src\file.c:209:     size_t i = start;
	movq	%rdx, %rdi	 ; start, i
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	movq	%r15, %rbx	 ; node, node
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%rax, 40(%rsp)	 ; tmp198, %sfp
.L100:
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	cmpq	%rdi, %rbp	 ; i, tmp142
	jb	.L151	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rbp, %rdi	 ; tmp142, i
	je	.L101	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, (%r12,%rdi)	 ;, MEM[(char *)path_copy_77 + i_56 * 1]
	jne	.L102	 ;,
.L101:
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%rdi, %rdx	 ; i, start
	jnb	.L103	 ;,
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	movq	%rdi, %r14	 ; i, comp_len
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	40(%rsp), %rcx	 ; %sfp,
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	subq	%rdx, %r14	 ; start, comp_len
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	addq	%r12, %rdx	 ; path_copy, tmp148
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%r14, %r8	 ; comp_len,
	call	strncpy	 ;
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	movq	40(%rsp), %rcx	 ; %sfp,
	leaq	.LC5(%rip), %rdx	 ;,
 ; D:\TC\src\file.c:216:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r14)	 ;, component[comp_len_108]
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	call	strcmp	 ;
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; tmp205
	je	.L103	 ;,
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	leaq	.LC6(%rip), %r13	 ;, tmp157
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r13, %rdx	 ; tmp157,
	call	strcmp	 ;
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; tmp206
	jne	.L105	 ;,
 ; D:\TC\src\file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r15, %r15	 ; node
	je	.L106	 ;,
	cmpq	%r15, %rbx	 ; node, node
	je	.L106	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	(%r15), %rcx	 ; dirs_tail_52->dir,
	movq	%r13, %rdx	 ; tmp157,
	call	strcmp	 ;
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; tmp207
	jne	.L120	 ;,
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	movq	%r13, %rcx	 ; tmp157,
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r14	 ; tmp208, node
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:227:                             node->next = 0;
	xorl	%r8d, %r8d	 ;
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movq	%rax, (%r14)	 ; tmp209, node_124->dir
 ; D:\TC\src\file.c:227:                             node->next = 0;
	movq	%r8, 8(%r14)	 ;, node_124->next
 ; D:\TC\src\file.c:228:                             dirs_tail->next = node;
	movq	%r14, 8(%r15)	 ; node, dirs_tail_52->next
 ; D:\TC\src\file.c:229:                             dirs_tail = node;
	movq	%r14, %r15	 ; node, node
	jmp	.L103	 ;
.L120:
 ; D:\TC\src\file.c:232:                             StrNode* prev = dirs_head;
	movq	%rbx, %rax	 ; node, prev
.L107:
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L103	 ;,
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_57->next, _17
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r15, %rdx	 ; node, _17
	je	.L152	 ;,
 ; D:\TC\src\file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _17, prev
	jmp	.L107	 ;
.L152:
 ; D:\TC\src\file.c:237:                                 prev->next = 0;
	xorl	%ecx, %ecx	 ;
 ; D:\TC\src\file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r15	 ; prev, node
 ; D:\TC\src\file.c:237:                                 prev->next = 0;
	movq	%rcx, 8(%rax)	 ;, prev_57->next
	jmp	.L103	 ;
.L106:
 ; D:\TC\src\file.c:241:                     } else if (dirs_head == 0) {
	testq	%rbx, %rbx	 ; node
	jne	.L103	 ;,
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	movq	%r13, %rcx	 ; tmp157,
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %rbx	 ; tmp210, node
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	call	create_string	 ;
 ; D:\TC\src\file.c:245:                         node->next = 0;
	xorl	%edx, %edx	 ;
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, (%rbx)	 ; tmp211, node_118->dir
 ; D:\TC\src\file.c:245:                         node->next = 0;
	movq	%rdx, 8(%rbx)	 ;, node_118->next
	jmp	.L150	 ;
.L105:
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	je	.L103	 ;,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	40(%rsp), %rcx	 ; %sfp,
	movq	%r14, %rdx	 ; comp_len,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movq	%rax, %r13	 ; tmp212, node
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	%rax, 0(%r13)	 ; tmp213, node_112->dir
 ; D:\TC\src\file.c:253:                     node->next = 0;
	xorl	%eax, %eax	 ;
	movq	%rax, 8(%r13)	 ;, node_112->next
 ; D:\TC\src\file.c:255:                     if (dirs_tail != 0)
	testq	%r15, %r15	 ; node
	je	.L108	 ;,
 ; D:\TC\src\file.c:256:                         (dirs_tail)->next = node;
	movq	%r13, 8(%r15)	 ; node, dirs_tail_52->next
.L108:
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	%r13, %r15	 ; node, node
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rbx, %rbx	 ; node
	jne	.L103	 ;,
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	%r13, %rbx	 ; node, node
.L150:
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	movq	%rbx, %r15	 ; node, node
.L103:
 ; D:\TC\src\file.c:262:             start = i + 1;
	leaq	1(%rdi), %rdx	 ;, start
.L102:
 ; D:\TC\src\file.c:264:         i++;
	incq	%rdi	 ; i
	jmp	.L100	 ;
.L151:
 ; D:\TC\src\file.c:268:     file->dirs = dirs_head;
	movq	%rbx, (%rsi)	 ; node, file_74(D)->dirs
 ; D:\TC\src\file.c:271:     if (dirs_tail != 0) {
	testq	%r15, %r15	 ; node
	je	.L110	 ;,
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	(%r15), %r15	 ; dirs_tail_52->dir, node
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%r15, %rcx	 ; node,
	call	strrchr	 ;
	movq	%rax, %rdi	 ; tmp214, dot
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	testq	%rax, %rax	 ; dot
	je	.L110	 ;,
	cmpq	%rax, %r15	 ; dot, node
	je	.L110	 ;,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%r15, %rcx	 ; node,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	subq	%r15, %rdx	 ; node, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	call	create_string	 ;
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rdi, %rcx	 ; dot,
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%rsi)	 ; tmp215, file_74(D)->name
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	strlen	 ;
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rdi, %rcx	 ; dot,
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rax, %rdx	 ; tmp216, tmp174
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	call	create_string	 ;
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L111	 ;
.L110:
 ; D:\TC\src\file.c:281:             file->name = dirs_tail->dir;
	movq	%r15, 16(%rsi)	 ; node, file_74(D)->name
	xorl	%eax, %eax	 ; _33
.L111:
 ; D:\TC\src\file.c:282:             file->extension = 0;
	movq	%rax, 8(%rsi)	 ; _33, file_74(D)->extension
 ; D:\TC\src\file.c:291:     StrNode* current = dirs_head;
	movq	%rbx, %r12	 ; node, current
 ; D:\TC\src\file.c:292:     size_t node_count = 0;
	xorl	%ebp, %ebp	 ; node_count
 ; D:\TC\src\file.c:290:     size_t full_path_len = 0;
	xorl	%edi, %edi	 ; full_path_len
.L112:
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%r12, %r12	 ; current
	je	.L153	 ;,
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	movq	(%r12), %rcx	 ; current_60->dir,
 ; D:\TC\src\file.c:296:         node_count++;
	incq	%rbp	 ; node_count
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	call	strlen	 ;
 ; D:\TC\src\file.c:297:         current = current->next;
	movq	8(%r12), %r12	 ; current_60->next, current
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %rdi	 ; tmp218, full_path_len
	jmp	.L112	 ;
.L153:
 ; D:\TC\src\file.c:301:     if (node_count > 1)
	cmpq	$1, %rbp	 ;, node_count
	jbe	.L114	 ;,
 ; D:\TC\src\file.c:302:         full_path_len += (node_count - 1);
	leaq	-1(%rdi,%rbp), %rdi	 ;, full_path_len
.L114:
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%rdi), %rdx	 ;, tmp179
	leaq	.LC0(%rip), %rcx	 ;,
	call	create_string	 ;
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %rbp	 ;, tmp196
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_98
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	%rax, %rdi	 ; tmp219, full_path
 ; D:\TC\src\file.c:308:     bool is_first = true;
	movb	$1, %al	 ;, is_first
.L115:
 ; D:\TC\src\file.c:309:     while (current != 0) {
	testq	%rbx, %rbx	 ; node
	je	.L154	 ;,
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	 ; is_first
	jne	.L116	 ;,
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rbx), %rcx	 ; current_61->dir,
	movq	%rbp, %rdx	 ; tmp196,
	call	strcmp	 ;
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; tmp220
	je	.L116	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rdi)	 ;, MEM[(const char *)full_path_98]
	je	.L116	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rdi, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rdi,%rax)	 ;, *_38
	je	.L116	 ;,
 ; D:\TC\src\file.c:313:                 strcat(full_path, "/");
	movq	%rbp, %rdx	 ; tmp196,
	movq	%rdi, %rcx	 ; full_path,
	call	strcat	 ;
.L116:
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	(%rbx), %rdx	 ; current_61->dir,
	movq	%rdi, %rcx	 ; full_path,
	call	strcat	 ;
 ; D:\TC\src\file.c:318:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_61->next, node
 ; D:\TC\src\file.c:317:         is_first = false;
	xorl	%eax, %eax	 ; is_first
	jmp	.L115	 ;
.L154:
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rdi, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rdi, %rcx	 ; full_path,
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, %rdx	 ; tmp222, tmp189
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	call	create_string	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%rsi)	 ; tmp223, file_74(D)->path
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
	.seh_endproc
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
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef

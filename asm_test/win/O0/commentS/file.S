	.file	"D:\\TC\\src\\file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O0
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cwd
get_cwd:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$32, %rsp	 ;,
	.seh_stackalloc	32
	.seh_endprologue
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	getcwd	 ;
 ; D:\TC\src\file.c:11: }
	addq	$32, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	create_file
	.def	create_file;	.scl	2;	.type	32;	.endef
	.seh_proc	create_file
create_file:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$48, %rsp	 ;,
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:\TC\src\file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, -8(%rbp)	 ; tmp85, file
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	movq	16(%rbp), %rax	 ; path, tmp86
	movq	%rax, %rcx	 ; tmp86,
	call	absolute_path	 ;
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	movq	-8(%rbp), %rdx	 ; file, tmp87
	movq	%rax, 24(%rdx)	 ; _1, file_4->path
 ; D:\TC\src\file.c:16:     normalize_path(file);
	movq	-8(%rbp), %rax	 ; file, tmp88
	movq	%rax, %rcx	 ; tmp88,
	call	normalize_path	 ;
 ; D:\TC\src\file.c:17:     return file;
	movq	-8(%rbp), %rax	 ; file, _9
 ; D:\TC\src\file.c:18: }
	addq	$48, %rsp	 ;,
	popq	%rbp	 ;
	ret	
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
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:\TC\src\file.c:21:     size_t path_len = strlen(path);
	movq	16(%rbp), %rax	 ; path, tmp112
	movq	%rax, %rcx	 ; tmp112,
	call	strlen	 ;
	movq	%rax, -8(%rbp)	 ; tmp113, path_len
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	movq	$0, -16(%rbp)	 ;, i
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	jmp	.L6	 ;
.L10:
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movq	16(%rbp), %rdx	 ; path, tmp114
	movq	-16(%rbp), %rax	 ; i, tmp115
	addq	%rdx, %rax	 ; tmp114, _1
	movzbl	(%rax), %eax	 ; *_1, _2
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %al	 ;, _2
	jne	.L7	 ;,
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movq	16(%rbp), %rdx	 ; path, tmp116
	movq	-16(%rbp), %rax	 ; i, tmp117
	addq	%rdx, %rax	 ; tmp116, _3
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rax)	 ;, *_3
.L7:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, -16(%rbp)	 ;, i
	jbe	.L8	 ;,
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	16(%rbp), %rdx	 ; path, tmp118
	movq	-16(%rbp), %rax	 ; i, tmp119
	addq	%rdx, %rax	 ; tmp118, _4
	movzbl	(%rax), %eax	 ; *_4, _5
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _5
	jne	.L8	 ;,
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-16(%rbp), %rax	 ; i, tmp120
	leaq	-1(%rax), %rdx	 ;, _6
	movq	16(%rbp), %rax	 ; path, tmp121
	addq	%rdx, %rax	 ; _6, _7
	movzbl	(%rax), %eax	 ; *_7, _8
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, %al	 ;, _8
	jne	.L8	 ;,
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	movq	-16(%rbp), %rax	 ; i, tmp122
	leaq	-2(%rax), %rdx	 ;, _9
	movq	16(%rbp), %rax	 ; path, tmp123
	addq	%rdx, %rax	 ; _9, _10
	movzbl	(%rax), %eax	 ; *_10, _11
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %al	 ;, _11
	jne	.L8	 ;,
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-8(%rbp), %rax	 ; path_len, tmp124
	subq	-16(%rbp), %rax	 ; i, tmp124
	movq	%rax, %rcx	 ; tmp124, _12
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-16(%rbp), %rax	 ; i, tmp125
	leaq	1(%rax), %rdx	 ;, _13
	movq	16(%rbp), %rax	 ; path, tmp126
	addq	%rax, %rdx	 ; tmp126, _14
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	-16(%rbp), %rax	 ; i, tmp127
	leaq	-1(%rax), %r8	 ;, _15
	movq	16(%rbp), %rax	 ; path, tmp128
	addq	%r8, %rax	 ; _15, _16
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rcx, %r8	 ; _12,
	movq	%rax, %rcx	 ; _16,
	call	memmove	 ;
 ; D:\TC\src\file.c:26:             path_len -= 2;
	subq	$2, -8(%rbp)	 ;, path_len
 ; D:\TC\src\file.c:27:             i -= 2;
	subq	$2, -16(%rbp)	 ;, i
.L8:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpq	$0, -16(%rbp)	 ;, i
	je	.L9	 ;,
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movq	16(%rbp), %rdx	 ; path, tmp129
	movq	-16(%rbp), %rax	 ; i, tmp130
	addq	%rdx, %rax	 ; tmp129, _17
	movzbl	(%rax), %eax	 ; *_17, _18
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _18
	jne	.L9	 ;,
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	movq	-16(%rbp), %rax	 ; i, tmp131
	leaq	-1(%rax), %rdx	 ;, _19
	movq	16(%rbp), %rax	 ; path, tmp132
	addq	%rdx, %rax	 ; _19, _20
	movzbl	(%rax), %eax	 ; *_20, _21
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, %al	 ;, _21
	jne	.L9	 ;,
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	-8(%rbp), %rax	 ; path_len, tmp133
	subq	-16(%rbp), %rax	 ; i, tmp133
	movq	%rax, %r8	 ; tmp133, _22
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	-16(%rbp), %rax	 ; i, tmp134
	leaq	1(%rax), %rdx	 ;, _23
	movq	16(%rbp), %rax	 ; path, tmp135
	addq	%rax, %rdx	 ; tmp135, _24
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	16(%rbp), %rcx	 ; path, tmp136
	movq	-16(%rbp), %rax	 ; i, tmp137
	addq	%rcx, %rax	 ; tmp136, _25
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rax, %rcx	 ; _25,
	call	memmove	 ;
 ; D:\TC\src\file.c:31:             path_len--;
	subq	$1, -8(%rbp)	 ;, path_len
 ; D:\TC\src\file.c:32:             i--;
	subq	$1, -16(%rbp)	 ;, i
.L9:
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, -16(%rbp)	 ;, i
.L6:
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	movq	-16(%rbp), %rax	 ; i, tmp138
	cmpq	-8(%rbp), %rax	 ; path_len, tmp138
	jb	.L10	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpq	$0, -8(%rbp)	 ;, path_len
	je	.L11	 ;,
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	movq	16(%rbp), %rax	 ; path, tmp139
	movzbl	(%rax), %eax	 ; *path_42(D), _26
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, %al	 ;, _26
	jne	.L11	 ;,
 ; D:\TC\src\file.c:40:         return path;
	movq	16(%rbp), %rax	 ; path, _35
	jmp	.L12	 ;
.L11:
 ; D:\TC\src\file.c:42:     string cwd = get_cwd();
	call	get_cwd	 ;
	movq	%rax, -24(%rbp)	 ; tmp140, cwd
 ; D:\TC\src\file.c:43:     if (cwd == NULL)
	cmpq	$0, -24(%rbp)	 ;, cwd
	jne	.L13	 ;,
 ; D:\TC\src\file.c:44:         return path;
	movq	16(%rbp), %rax	 ; path, _35
	jmp	.L12	 ;
.L13:
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	-24(%rbp), %rax	 ; cwd, tmp141
	movq	%rax, %rcx	 ; tmp141,
	call	strlen	 ;
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	-8(%rbp), %rdx	 ; path_len, tmp142
	addq	%rdx, %rax	 ; tmp142, _28
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	addq	$2, %rax	 ;, tmp143
	movq	%rax, -32(%rbp)	 ; tmp143, total_len
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	-32(%rbp), %rax	 ; total_len, tmp144
	movq	%rax, %rdx	 ; tmp144,
	leaq	.LC0(%rip), %rax	 ;, tmp145
	movq	%rax, %rcx	 ; tmp145,
	call	create_string	 ;
	movq	%rax, -40(%rbp)	 ; tmp146, abs_path
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	movq	16(%rbp), %rcx	 ; path, tmp147
	movq	-24(%rbp), %rdx	 ; cwd, tmp148
	movq	-40(%rbp), %rax	 ; abs_path, tmp149
	movq	%rcx, %r9	 ; tmp147,
	movq	%rdx, %r8	 ; tmp148,
	leaq	.LC1(%rip), %rdx	 ;, tmp150
	movq	%rax, %rcx	 ; tmp149,
	call	sprintf	 ;
 ; D:\TC\src\file.c:48:     free(cwd);
	movq	-24(%rbp), %rax	 ; cwd, tmp151
	movq	%rax, %rcx	 ; tmp151,
	call	free	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	movq	-32(%rbp), %rdx	 ; total_len, tmp152
	movq	-40(%rbp), %rax	 ; abs_path, tmp153
	movq	%rax, %rcx	 ; tmp153,
	call	create_string	 ;
.L12:
 ; D:\TC\src\file.c:50: }
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	get_file_name
	.def	get_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_name
get_file_name:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:\TC\src\file.c:53:     return path->name;
	movq	16(%rbp), %rax	 ; path, tmp84
	movq	16(%rax), %rax	 ; path_2(D)->name, _3
 ; D:\TC\src\file.c:54: }
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	get_file_extension
	.def	get_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	get_file_extension
get_file_extension:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:\TC\src\file.c:57:     return path->extension;
	movq	16(%rbp), %rax	 ; path, tmp84
	movq	8(%rax), %rax	 ; path_2(D)->extension, _3
 ; D:\TC\src\file.c:58: }
	popq	%rbp	 ;
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
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	subq	$80, %rsp	 ;,
	.seh_stackalloc	80
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	movq	16(%rbp), %rax	 ; path, tmp101
	movq	(%rax), %rax	 ; path_31(D)->dirs, _1
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	testq	%rax, %rax	 ; _1
	jne	.L19	 ;,
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	movl	$0, %eax	 ;, _25
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	jmp	.L20	 ;
.L19:
 ; D:\TC\src\file.c:64:     size_t total_len = 0;
	movq	$0, -8(%rbp)	 ;, total_len
 ; D:\TC\src\file.c:65:     size_t node_count = 0;
	movq	$0, -16(%rbp)	 ;, node_count
 ; D:\TC\src\file.c:66:     StrNode* current = path->dirs;
	movq	16(%rbp), %rax	 ; path, tmp102
	movq	(%rax), %rax	 ; path_31(D)->dirs, tmp103
	movq	%rax, -24(%rbp)	 ; tmp103, current
 ; D:\TC\src\file.c:67:     while (current != 0) {
	jmp	.L21	 ;
.L23:
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	-24(%rbp), %rax	 ; current, tmp104
	movq	8(%rax), %rax	 ; current_21->next, _2
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rax, %rax	 ; _2
	je	.L22	 ;,
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	movq	-24(%rbp), %rax	 ; current, tmp105
	movq	(%rax), %rax	 ; current_21->dir, _3
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	movq	%rax, %rcx	 ; _3,
	call	strlen	 ;
	movq	%rax, -48(%rbp)	 ; tmp106, dir_len
 ; D:\TC\src\file.c:70:             total_len += dir_len;
	movq	-48(%rbp), %rax	 ; dir_len, tmp107
	addq	%rax, -8(%rbp)	 ; tmp107, total_len
 ; D:\TC\src\file.c:71:             node_count++;
	addq	$1, -16(%rbp)	 ;, node_count
.L22:
 ; D:\TC\src\file.c:73:         current = current->next;
	movq	-24(%rbp), %rax	 ; current, tmp108
	movq	8(%rax), %rax	 ; current_21->next, tmp109
	movq	%rax, -24(%rbp)	 ; tmp109, current
.L21:
 ; D:\TC\src\file.c:67:     while (current != 0) {
	cmpq	$0, -24(%rbp)	 ;, current
	jne	.L23	 ;,
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	cmpq	$0, -16(%rbp)	 ;, node_count
	jne	.L24	 ;,
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	movl	$0, %eax	 ;, _25
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	jmp	.L20	 ;
.L24:
 ; D:\TC\src\file.c:79:     if (node_count > 1)
	cmpq	$1, -16(%rbp)	 ;, node_count
	jbe	.L25	 ;,
 ; D:\TC\src\file.c:80:         total_len += node_count - 1;
	movq	-16(%rbp), %rdx	 ; node_count, tmp110
	movq	-8(%rbp), %rax	 ; total_len, tmp111
	addq	%rdx, %rax	 ; tmp110, _4
	subq	$1, %rax	 ;, tmp112
	movq	%rax, -8(%rbp)	 ; tmp112, total_len
.L25:
 ; D:\TC\src\file.c:83:     string dir_path = create_string("", total_len + 1);
	movq	-8(%rbp), %rax	 ; total_len, tmp113
	addq	$1, %rax	 ;, _5
	movq	%rax, %rdx	 ; _5,
	leaq	.LC0(%rip), %rax	 ;, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	create_string	 ;
	movq	%rax, -40(%rbp)	 ; tmp115, dir_path
 ; D:\TC\src\file.c:84:     dir_path[0] = '\0';
	movq	-40(%rbp), %rax	 ; dir_path, tmp116
	movb	$0, (%rax)	 ;, *dir_path_37
 ; D:\TC\src\file.c:86:     current = path->dirs;
	movq	16(%rbp), %rax	 ; path, tmp117
	movq	(%rax), %rax	 ; path_31(D)->dirs, tmp118
	movq	%rax, -24(%rbp)	 ; tmp118, current
 ; D:\TC\src\file.c:87:     bool first = true;
	movb	$1, -25(%rbp)	 ;, first
 ; D:\TC\src\file.c:88:     while (current != 0) {
	jmp	.L26	 ;
.L29:
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	movq	-24(%rbp), %rax	 ; current, tmp119
	movq	8(%rax), %rax	 ; current_22->next, _6
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	testq	%rax, %rax	 ; _6
	je	.L27	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	cmpb	$0, -25(%rbp)	 ;, first
	jne	.L28	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	-24(%rbp), %rax	 ; current, tmp120
	movq	(%rax), %rax	 ; current_22->dir, _7
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rdx	 ;, tmp121
	movq	%rax, %rcx	 ; _7,
	call	strcmp	 ;
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; _8
	je	.L28	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	-40(%rbp), %rax	 ; dir_path, tmp122
	movzbl	(%rax), %eax	 ; MEM[(const char *)dir_path_37], _9
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	testb	%al, %al	 ; _9
	je	.L28	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	-40(%rbp), %rax	 ; dir_path, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	strlen	 ;
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	leaq	-1(%rax), %rdx	 ;, _11
	movq	-40(%rbp), %rax	 ; dir_path, tmp124
	addq	%rdx, %rax	 ; _11, _12
	movzbl	(%rax), %eax	 ; *_12, _13
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, %al	 ;, _13
	je	.L28	 ;,
 ; D:\TC\src\file.c:93:                     strcat(dir_path, "/");
	movq	-40(%rbp), %rax	 ; dir_path, tmp126
	movq	%rax, %rcx	 ; tmp126,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp128, _43
 ; D:\TC\src\file.c:93:                     strcat(dir_path, "/");
	movq	-40(%rbp), %rax	 ; dir_path, tmp129
	addq	%rdx, %rax	 ; _43, _44
	movw	$47, (%rax)	 ;, MEM <char[1:2]> [(void *)_44]
.L28:
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	-24(%rbp), %rax	 ; current, tmp130
	movq	(%rax), %rdx	 ; current_22->dir, _14
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	-40(%rbp), %rax	 ; dir_path, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	strcat	 ;
 ; D:\TC\src\file.c:96:             first = false;
	movb	$0, -25(%rbp)	 ;, first
.L27:
 ; D:\TC\src\file.c:98:         current = current->next;
	movq	-24(%rbp), %rax	 ; current, tmp132
	movq	8(%rax), %rax	 ; current_22->next, tmp133
	movq	%rax, -24(%rbp)	 ; tmp133, current
.L26:
 ; D:\TC\src\file.c:88:     while (current != 0) {
	cmpq	$0, -24(%rbp)	 ;, current
	jne	.L29	 ;,
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	-40(%rbp), %rax	 ; dir_path, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _15
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	-40(%rbp), %rax	 ; dir_path, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	create_string	 ;
.L20:
 ; D:\TC\src\file.c:102: }
	addq	$80, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.globl	get_full_path
	.def	get_full_path;	.scl	2;	.type	32;	.endef
	.seh_proc	get_full_path
get_full_path:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	movq	%rsp, %rbp	 ;,
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movq	%rcx, 16(%rbp)	 ; path, path
 ; D:\TC\src\file.c:105:     return path->path;
	movq	16(%rbp), %rax	 ; path, tmp84
	movq	24(%rax), %rax	 ; path_2(D)->path, _3
 ; D:\TC\src\file.c:106: }
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC3:
	.ascii "%s\0"
	.text
	.globl	change_file_extension
	.def	change_file_extension;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_extension
change_file_extension:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$88, %rsp	 ;,
	.seh_stackalloc	88
	leaq	80(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 80
	.seh_endprologue
	movq	%rcx, 32(%rbp)	 ; file, file
	movq	%rdx, 40(%rbp)	 ; new_extension, new_extension
 ; D:\TC\src\file.c:109:     file->extension = new_extension;
	movq	32(%rbp), %rax	 ; file, tmp95
	movq	40(%rbp), %rdx	 ; new_extension, tmp96
	movq	%rdx, 8(%rax)	 ; tmp96, file_18(D)->extension
 ; D:\TC\src\file.c:112:     string dir = get_file_dir(file);
	movq	32(%rbp), %rax	 ; file, tmp97
	movq	%rax, %rcx	 ; tmp97,
	call	get_file_dir	 ;
	movq	%rax, -16(%rbp)	 ; tmp98, dir
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	cmpq	$0, -16(%rbp)	 ;, dir
	je	.L33	 ;,
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	-16(%rbp), %rax	 ; dir, iftmp.0_13
	jmp	.L34	 ;
.L33:
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.0_13
.L34:
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rax, -24(%rbp)	 ; iftmp.0_13, dir_cstr
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	cmpq	$0, 40(%rbp)	 ;, new_extension
	je	.L35	 ;,
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	movq	40(%rbp), %rax	 ; new_extension, iftmp.1_14
	jmp	.L36	 ;
.L35:
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.1_14
.L36:
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	movq	%rax, -32(%rbp)	 ; iftmp.1_14, ext_cstr
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	-24(%rbp), %rax	 ; dir_cstr, tmp99
	movq	%rax, %rcx	 ; tmp99,
	call	strlen	 ;
	movq	%rax, %rbx	 ;, _1
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	32(%rbp), %rax	 ; file, tmp100
	movq	16(%rax), %rax	 ; file_18(D)->name, _2
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%rax, %rcx	 ; _2,
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	%rbx, %rax	 ; _1, _4
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	addq	$1, %rax	 ;, tmp101
	movq	%rax, -8(%rbp)	 ; tmp101, path_len
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	cmpq	$0, 40(%rbp)	 ;, new_extension
	je	.L37	 ;,
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	-32(%rbp), %rax	 ; ext_cstr, tmp102
	movq	%rax, %rcx	 ; tmp102,
	call	strlen	 ;
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	addq	%rax, -8(%rbp)	 ; _5, path_len
.L37:
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	movq	-8(%rbp), %rax	 ; path_len, tmp103
	addq	$1, %rax	 ;, _6
	movq	%rax, %rdx	 ; _6,
	leaq	.LC0(%rip), %rax	 ;, tmp104
	movq	%rax, %rcx	 ; tmp104,
	call	create_string	 ;
	movq	%rax, -40(%rbp)	 ; tmp105, new_path
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpq	$0, -16(%rbp)	 ;, dir
	je	.L38	 ;,
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	movq	-24(%rbp), %rax	 ; dir_cstr, tmp106
	movzbl	(%rax), %eax	 ; MEM[(const char *)dir_cstr_25], _7
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testb	%al, %al	 ; _7
	je	.L38	 ;,
 ; D:\TC\src\file.c:121:         sprintf(new_path, "%s/%s", dir_cstr, file->name);
	movq	32(%rbp), %rax	 ; file, tmp107
	movq	16(%rax), %rcx	 ; file_18(D)->name, _8
	movq	-24(%rbp), %rdx	 ; dir_cstr, tmp108
	movq	-40(%rbp), %rax	 ; new_path, tmp109
	movq	%rcx, %r9	 ; _8,
	movq	%rdx, %r8	 ; tmp108,
	leaq	.LC1(%rip), %rdx	 ;, tmp110
	movq	%rax, %rcx	 ; tmp109,
	call	sprintf	 ;
	jmp	.L39	 ;
.L38:
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	movq	32(%rbp), %rax	 ; file, tmp111
	movq	16(%rax), %rdx	 ; file_18(D)->name, _9
	movq	-40(%rbp), %rax	 ; new_path, tmp112
	movq	%rdx, %r8	 ; _9,
	leaq	.LC3(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; tmp112,
	call	sprintf	 ;
.L39:
 ; D:\TC\src\file.c:125:     if (new_extension != 0)
	cmpq	$0, 40(%rbp)	 ;, new_extension
	je	.L40	 ;,
 ; D:\TC\src\file.c:126:         strcat(new_path, new_extension);
	movq	40(%rbp), %rdx	 ; new_extension, tmp114
	movq	-40(%rbp), %rax	 ; new_path, tmp115
	movq	%rax, %rcx	 ; tmp115,
	call	strcat	 ;
.L40:
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	-40(%rbp), %rax	 ; new_path, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _10
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	-40(%rbp), %rax	 ; new_path, tmp117
	movq	%rax, %rcx	 ; tmp117,
	call	create_string	 ;
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	32(%rbp), %rdx	 ; file, tmp118
	movq	%rax, 24(%rdx)	 ; _11, file_18(D)->path
 ; D:\TC\src\file.c:129: }
	nop	
	addq	$88, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC4:
	.ascii "%s%s\0"
.LC5:
	.ascii "%s/%s%s\0"
	.text
	.globl	change_file_name
	.def	change_file_name;	.scl	2;	.type	32;	.endef
	.seh_proc	change_file_name
change_file_name:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$136, %rsp	 ;,
	.seh_stackalloc	136
	leaq	128(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 32(%rbp)	 ; file, file
	movq	%rdx, 40(%rbp)	 ; new_name, new_name
 ; D:\TC\src\file.c:132:     file->name = new_name;
	movq	32(%rbp), %rax	 ; file, tmp103
	movq	40(%rbp), %rdx	 ; new_name, tmp104
	movq	%rdx, 16(%rax)	 ; tmp104, file_28(D)->name
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	movq	32(%rbp), %rax	 ; file, tmp105
	movq	(%rax), %rax	 ; file_28(D)->dirs, _1
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	 ; _1
	je	.L42	 ;,
 ; D:\TC\src\file.c:136:         StrNode* current = file->dirs;
	movq	32(%rbp), %rax	 ; file, tmp106
	movq	(%rax), %rax	 ; file_28(D)->dirs, tmp107
	movq	%rax, -8(%rbp)	 ; tmp107, current
 ; D:\TC\src\file.c:138:         while (current != 0) {
	jmp	.L43	 ;
.L48:
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	movq	-8(%rbp), %rax	 ; current, tmp108
	movq	8(%rax), %rax	 ; current_19->next, _2
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	 ; _2
	jne	.L44	 ;,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	32(%rbp), %rax	 ; file, tmp109
	movq	8(%rax), %rax	 ; file_28(D)->extension, _3
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%rax, %rax	 ; _3
	je	.L45	 ;,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	32(%rbp), %rax	 ; file, tmp110
	movq	8(%rax), %rax	 ; file_28(D)->extension, iftmp.2_22
	jmp	.L46	 ;
.L45:
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.2_22
.L46:
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	%rax, -32(%rbp)	 ; iftmp.2_22, ext_cstr
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	40(%rbp), %rax	 ; new_name, tmp111
	movq	%rax, %rcx	 ; tmp111,
	call	strlen	 ;
	movq	%rax, -16(%rbp)	 ; tmp112, full_name_len
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	32(%rbp), %rax	 ; file, tmp113
	movq	8(%rax), %rax	 ; file_28(D)->extension, _4
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	testq	%rax, %rax	 ; _4
	je	.L47	 ;,
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	-32(%rbp), %rax	 ; ext_cstr, tmp114
	movq	%rax, %rcx	 ; tmp114,
	call	strlen	 ;
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	addq	%rax, -16(%rbp)	 ; _5, full_name_len
.L47:
 ; D:\TC\src\file.c:145:                 string full_name = create_string("", full_name_len + 1);
	movq	-16(%rbp), %rax	 ; full_name_len, tmp115
	addq	$1, %rax	 ;, _6
	movq	%rax, %rdx	 ; _6,
	leaq	.LC0(%rip), %rax	 ;, tmp116
	movq	%rax, %rcx	 ; tmp116,
	call	create_string	 ;
	movq	%rax, -40(%rbp)	 ; tmp117, full_name
 ; D:\TC\src\file.c:146:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	-32(%rbp), %rcx	 ; ext_cstr, tmp118
	movq	40(%rbp), %rdx	 ; new_name, tmp119
	movq	-40(%rbp), %rax	 ; full_name, tmp120
	movq	%rcx, %r9	 ; tmp118,
	movq	%rdx, %r8	 ; tmp119,
	leaq	.LC4(%rip), %rdx	 ;, tmp121
	movq	%rax, %rcx	 ; tmp120,
	call	sprintf	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-40(%rbp), %rax	 ; full_name, tmp122
	movq	%rax, %rcx	 ; tmp122,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _7
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-40(%rbp), %rax	 ; full_name, tmp123
	movq	%rax, %rcx	 ; tmp123,
	call	create_string	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	-8(%rbp), %rdx	 ; current, tmp124
	movq	%rax, (%rdx)	 ; _8, current_19->dir
 ; D:\TC\src\file.c:148:                 break;
	jmp	.L42	 ;
.L44:
 ; D:\TC\src\file.c:150:             current = current->next;
	movq	-8(%rbp), %rax	 ; current, tmp125
	movq	8(%rax), %rax	 ; current_19->next, tmp126
	movq	%rax, -8(%rbp)	 ; tmp126, current
.L43:
 ; D:\TC\src\file.c:138:         while (current != 0) {
	cmpq	$0, -8(%rbp)	 ;, current
	jne	.L48	 ;,
.L42:
 ; D:\TC\src\file.c:155:     string dir = get_file_dir(file);
	movq	32(%rbp), %rax	 ; file, tmp127
	movq	%rax, %rcx	 ; tmp127,
	call	get_file_dir	 ;
	movq	%rax, -48(%rbp)	 ; tmp128, dir
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	cmpq	$0, -48(%rbp)	 ;, dir
	je	.L49	 ;,
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	movq	-48(%rbp), %rax	 ; dir, iftmp.3_23
	jmp	.L50	 ;
.L49:
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.3_23
.L50:
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	movq	%rax, -56(%rbp)	 ; iftmp.3_23, dir_cstr
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	32(%rbp), %rax	 ; file, tmp129
	movq	8(%rax), %rax	 ; file_28(D)->extension, _9
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%rax, %rax	 ; _9
	je	.L51	 ;,
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	32(%rbp), %rax	 ; file, tmp130
	movq	8(%rax), %rax	 ; file_28(D)->extension, iftmp.4_24
	jmp	.L52	 ;
.L51:
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %rax	 ;, iftmp.4_24
.L52:
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	%rax, -64(%rbp)	 ; iftmp.4_24, ext_cstr
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	-56(%rbp), %rax	 ; dir_cstr, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	strlen	 ;
	movq	%rax, %rbx	 ;, _10
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	40(%rbp), %rax	 ; new_name, tmp132
	movq	%rax, %rcx	 ; tmp132,
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	addq	%rbx, %rax	 ; _10, _12
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	addq	$1, %rax	 ;, tmp133
	movq	%rax, -24(%rbp)	 ; tmp133, path_len
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	32(%rbp), %rax	 ; file, tmp134
	movq	8(%rax), %rax	 ; file_28(D)->extension, _13
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	testq	%rax, %rax	 ; _13
	je	.L53	 ;,
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	-64(%rbp), %rax	 ; ext_cstr, tmp135
	movq	%rax, %rcx	 ; tmp135,
	call	strlen	 ;
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	addq	%rax, -24(%rbp)	 ; _14, path_len
.L53:
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	movq	-24(%rbp), %rax	 ; path_len, tmp136
	addq	$1, %rax	 ;, _15
	movq	%rax, %rdx	 ; _15,
	leaq	.LC0(%rip), %rax	 ;, tmp137
	movq	%rax, %rcx	 ; tmp137,
	call	create_string	 ;
	movq	%rax, -72(%rbp)	 ; tmp138, new_path
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpq	$0, -48(%rbp)	 ;, dir
	je	.L54	 ;,
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	movq	-56(%rbp), %rax	 ; dir_cstr, tmp139
	movzbl	(%rax), %eax	 ; MEM[(const char *)dir_cstr_47], _16
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testb	%al, %al	 ; _16
	je	.L54	 ;,
 ; D:\TC\src\file.c:164:         sprintf(new_path, "%s/%s%s", dir_cstr, new_name, ext_cstr);
	movq	40(%rbp), %r8	 ; new_name, tmp140
	movq	-56(%rbp), %rcx	 ; dir_cstr, tmp141
	movq	-72(%rbp), %rax	 ; new_path, tmp142
	movq	-64(%rbp), %rdx	 ; ext_cstr, tmp143
	movq	%rdx, 32(%rsp)	 ; tmp143,
	movq	%r8, %r9	 ; tmp140,
	movq	%rcx, %r8	 ; tmp141,
	leaq	.LC5(%rip), %rdx	 ;, tmp144
	movq	%rax, %rcx	 ; tmp142,
	call	sprintf	 ;
	jmp	.L55	 ;
.L54:
 ; D:\TC\src\file.c:166:         sprintf(new_path, "%s%s", new_name, ext_cstr);
	movq	-64(%rbp), %rcx	 ; ext_cstr, tmp145
	movq	40(%rbp), %rdx	 ; new_name, tmp146
	movq	-72(%rbp), %rax	 ; new_path, tmp147
	movq	%rcx, %r9	 ; tmp145,
	movq	%rdx, %r8	 ; tmp146,
	leaq	.LC4(%rip), %rdx	 ;, tmp148
	movq	%rax, %rcx	 ; tmp147,
	call	sprintf	 ;
.L55:
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	-72(%rbp), %rax	 ; new_path, tmp149
	movq	%rax, %rcx	 ; tmp149,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _17
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	-72(%rbp), %rax	 ; new_path, tmp150
	movq	%rax, %rcx	 ; tmp150,
	call	create_string	 ;
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	32(%rbp), %rdx	 ; file, tmp151
	movq	%rax, 24(%rdx)	 ; _18, file_28(D)->path
 ; D:\TC\src\file.c:169: }
	nop	
	addq	$136, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.section .rdata,"dr"
.LC6:
	.ascii ".\0"
.LC7:
	.ascii "..\0"
	.text
	.globl	normalize_path
	.def	normalize_path;	.scl	2;	.type	32;	.endef
	.seh_proc	normalize_path
normalize_path:
	pushq	%rbp	 ;
	.seh_pushreg	%rbp
	subq	$448, %rsp	 ;,
	.seh_stackalloc	448
	leaq	128(%rsp), %rbp	 ;,
	.seh_setframe	%rbp, 128
	.seh_endprologue
	movq	%rcx, 336(%rbp)	 ; file, file
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	336(%rbp), %rax	 ; file, tmp125
	movq	24(%rax), %rax	 ; file_79(D)->path, _1
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	%rax, %rcx	 ; _1,
	call	strlen	 ;
	movq	%rax, 240(%rbp)	 ; tmp126, path_len
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	movq	240(%rbp), %rax	 ; path_len, tmp127
	addq	$1, %rax	 ;, _2
	movq	%rax, %rdx	 ; _2,
	leaq	.LC0(%rip), %rax	 ;, tmp128
	movq	%rax, %rcx	 ; tmp128,
	call	create_string	 ;
	movq	%rax, 232(%rbp)	 ; tmp129, path_copy
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	336(%rbp), %rax	 ; file, tmp130
	movq	24(%rax), %rdx	 ; file_79(D)->path, _3
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	232(%rbp), %rax	 ; path_copy, tmp131
	movq	%rax, %rcx	 ; tmp131,
	call	strcpy	 ;
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	movq	$0, 312(%rbp)	 ;, dirs_head
 ; D:\TC\src\file.c:179:     StrNode* dirs_tail = 0;
	movq	$0, 304(%rbp)	 ;, dirs_tail
 ; D:\TC\src\file.c:181:     size_t start = 0;
	movq	$0, 296(%rbp)	 ;, start
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpq	$0, 240(%rbp)	 ;, path_len
	je	.L57	 ;,
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	movq	232(%rbp), %rax	 ; path_copy, tmp132
	movzbl	(%rax), %eax	 ; *path_copy_82, _4
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, %al	 ;, _4
	jne	.L57	 ;,
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 224(%rbp)	 ; tmp133, node
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rax	 ;, tmp134
	movq	%rax, %rcx	 ; tmp134,
	call	create_string	 ;
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movq	224(%rbp), %rdx	 ; node, tmp135
	movq	%rax, (%rdx)	 ; _5, node_88->dir
 ; D:\TC\src\file.c:200:         node->next = 0;
	movq	224(%rbp), %rax	 ; node, tmp136
	movq	$0, 8(%rax)	 ;, node_88->next
 ; D:\TC\src\file.c:202:         dirs_head = node;
	movq	224(%rbp), %rax	 ; node, tmp137
	movq	%rax, 312(%rbp)	 ; tmp137, dirs_head
 ; D:\TC\src\file.c:203:         dirs_tail = node;
	movq	224(%rbp), %rax	 ; node, tmp138
	movq	%rax, 304(%rbp)	 ; tmp138, dirs_tail
 ; D:\TC\src\file.c:204:         start = 1;
	movq	$1, 296(%rbp)	 ;, start
.L57:
 ; D:\TC\src\file.c:209:     size_t i = start;
	movq	296(%rbp), %rax	 ; start, tmp139
	movq	%rax, 288(%rbp)	 ; tmp139, i
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	jmp	.L58	 ;
.L72:
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	288(%rbp), %rax	 ; i, tmp140
	cmpq	240(%rbp), %rax	 ; path_len, tmp140
	je	.L59	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	movq	232(%rbp), %rdx	 ; path_copy, tmp141
	movq	288(%rbp), %rax	 ; i, tmp142
	addq	%rdx, %rax	 ; tmp141, _6
	movzbl	(%rax), %eax	 ; *_6, _7
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, %al	 ;, _7
	jne	.L60	 ;,
.L59:
 ; D:\TC\src\file.c:212:             if (i > start) {
	movq	288(%rbp), %rax	 ; i, tmp143
	cmpq	%rax, 296(%rbp)	 ; tmp143, start
	jnb	.L61	 ;,
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	movq	288(%rbp), %rax	 ; i, tmp147
	subq	296(%rbp), %rax	 ; start, tmp146
	movq	%rax, 192(%rbp)	 ; tmp146, comp_len
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	232(%rbp), %rdx	 ; path_copy, tmp148
	movq	296(%rbp), %rax	 ; start, tmp149
	addq	%rax, %rdx	 ; tmp149, _8
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	192(%rbp), %rcx	 ; comp_len, tmp150
	leaq	-96(%rbp), %rax	 ;, tmp151
	movq	%rcx, %r8	 ; tmp150,
	movq	%rax, %rcx	 ; tmp151,
	call	strncpy	 ;
 ; D:\TC\src\file.c:216:                 component[comp_len] = '\0';
	leaq	-96(%rbp), %rdx	 ;, tmp152
	movq	192(%rbp), %rax	 ; comp_len, tmp154
	addq	%rdx, %rax	 ; tmp152, tmp153
	movb	$0, (%rax)	 ;, component[comp_len_127]
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	leaq	-96(%rbp), %rax	 ;, tmp155
	leaq	.LC6(%rip), %rdx	 ;, tmp156
	movq	%rax, %rcx	 ; tmp155,
	call	strcmp	 ;
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; _9
	je	.L61	 ;,
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	leaq	-96(%rbp), %rax	 ;, tmp157
	leaq	.LC7(%rip), %rdx	 ;, tmp158
	movq	%rax, %rcx	 ; tmp157,
	call	strcmp	 ;
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; _10
	jne	.L63	 ;,
 ; D:\TC\src\file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	cmpq	$0, 304(%rbp)	 ;, dirs_tail
	je	.L64	 ;,
 ; D:\TC\src\file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	movq	304(%rbp), %rax	 ; dirs_tail, tmp159
	cmpq	312(%rbp), %rax	 ; dirs_head, tmp159
	je	.L64	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	304(%rbp), %rax	 ; dirs_tail, tmp160
	movq	(%rax), %rax	 ; dirs_tail_54->dir, _11
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	leaq	.LC7(%rip), %rdx	 ;, tmp161
	movq	%rax, %rcx	 ; _11,
	call	strcmp	 ;
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; _12
	jne	.L65	 ;,
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 176(%rbp)	 ; tmp162, node
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp163
	movq	%rax, %rcx	 ; tmp163,
	call	create_string	 ;
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movq	176(%rbp), %rdx	 ; node, tmp164
	movq	%rax, (%rdx)	 ; _13, node_143->dir
 ; D:\TC\src\file.c:227:                             node->next = 0;
	movq	176(%rbp), %rax	 ; node, tmp165
	movq	$0, 8(%rax)	 ;, node_143->next
 ; D:\TC\src\file.c:228:                             dirs_tail->next = node;
	movq	304(%rbp), %rax	 ; dirs_tail, tmp166
	movq	176(%rbp), %rdx	 ; node, tmp167
	movq	%rdx, 8(%rax)	 ; tmp167, dirs_tail_54->next
 ; D:\TC\src\file.c:229:                             dirs_tail = node;
	movq	176(%rbp), %rax	 ; node, tmp168
	movq	%rax, 304(%rbp)	 ; tmp168, dirs_tail
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	jmp	.L83	 ;
.L65:
 ; D:\TC\src\file.c:232:                             StrNode* prev = dirs_head;
	movq	312(%rbp), %rax	 ; dirs_head, tmp169
	movq	%rax, 280(%rbp)	 ; tmp169, prev
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	jmp	.L67	 ;
.L69:
 ; D:\TC\src\file.c:234:                                 prev = prev->next;
	movq	280(%rbp), %rax	 ; prev, tmp170
	movq	8(%rax), %rax	 ; prev_59->next, tmp171
	movq	%rax, 280(%rbp)	 ; tmp171, prev
.L67:
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	$0, 280(%rbp)	 ;, prev
	je	.L68	 ;,
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	280(%rbp), %rax	 ; prev, tmp172
	movq	8(%rax), %rax	 ; prev_59->next, _14
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%rax, 304(%rbp)	 ; _14, dirs_tail
	jne	.L69	 ;,
.L68:
 ; D:\TC\src\file.c:236:                             if (prev != 0) {
	cmpq	$0, 280(%rbp)	 ;, prev
	je	.L83	 ;,
 ; D:\TC\src\file.c:237:                                 prev->next = 0;
	movq	280(%rbp), %rax	 ; prev, tmp173
	movq	$0, 8(%rax)	 ;, prev_59->next
 ; D:\TC\src\file.c:238:                                 dirs_tail = prev;
	movq	280(%rbp), %rax	 ; prev, tmp174
	movq	%rax, 304(%rbp)	 ; tmp174, dirs_tail
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	jmp	.L83	 ;
.L64:
 ; D:\TC\src\file.c:241:                     } else if (dirs_head == 0) {
	cmpq	$0, 312(%rbp)	 ;, dirs_head
	jne	.L61	 ;,
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 168(%rbp)	 ; tmp175, node
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC7(%rip), %rax	 ;, tmp176
	movq	%rax, %rcx	 ; tmp176,
	call	create_string	 ;
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movq	168(%rbp), %rdx	 ; node, tmp177
	movq	%rax, (%rdx)	 ; _15, node_150->dir
 ; D:\TC\src\file.c:245:                         node->next = 0;
	movq	168(%rbp), %rax	 ; node, tmp178
	movq	$0, 8(%rax)	 ;, node_150->next
 ; D:\TC\src\file.c:246:                         dirs_head = node;
	movq	168(%rbp), %rax	 ; node, tmp179
	movq	%rax, 312(%rbp)	 ; tmp179, dirs_head
 ; D:\TC\src\file.c:247:                         dirs_tail = node;
	movq	168(%rbp), %rax	 ; node, tmp180
	movq	%rax, 304(%rbp)	 ; tmp180, dirs_tail
	jmp	.L61	 ;
.L63:
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	leaq	-96(%rbp), %rax	 ;, component.5_16
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	movzbl	(%rax), %eax	 ; MEM[(const char *)component.5_16], _17
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	testb	%al, %al	 ; _17
	je	.L61	 ;,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 184(%rbp)	 ; tmp181, node
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	192(%rbp), %rdx	 ; comp_len, tmp182
	leaq	-96(%rbp), %rax	 ;, tmp183
	movq	%rax, %rcx	 ; tmp183,
	call	create_string	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	184(%rbp), %rdx	 ; node, tmp184
	movq	%rax, (%rdx)	 ; _18, node_131->dir
 ; D:\TC\src\file.c:253:                     node->next = 0;
	movq	184(%rbp), %rax	 ; node, tmp185
	movq	$0, 8(%rax)	 ;, node_131->next
 ; D:\TC\src\file.c:255:                     if (dirs_tail != 0)
	cmpq	$0, 304(%rbp)	 ;, dirs_tail
	je	.L71	 ;,
 ; D:\TC\src\file.c:256:                         (dirs_tail)->next = node;
	movq	304(%rbp), %rax	 ; dirs_tail, tmp186
	movq	184(%rbp), %rdx	 ; node, tmp187
	movq	%rdx, 8(%rax)	 ; tmp187, dirs_tail_54->next
.L71:
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	184(%rbp), %rax	 ; node, tmp188
	movq	%rax, 304(%rbp)	 ; tmp188, dirs_tail
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	cmpq	$0, 312(%rbp)	 ;, dirs_head
	jne	.L61	 ;,
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	movq	184(%rbp), %rax	 ; node, tmp189
	movq	%rax, 312(%rbp)	 ; tmp189, dirs_head
	jmp	.L61	 ;
.L83:
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	nop	
.L61:
 ; D:\TC\src\file.c:262:             start = i + 1;
	movq	288(%rbp), %rax	 ; i, tmp193
	addq	$1, %rax	 ;, tmp192
	movq	%rax, 296(%rbp)	 ; tmp192, start
.L60:
 ; D:\TC\src\file.c:264:         i++;
	addq	$1, 288(%rbp)	 ;, i
.L58:
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	movq	288(%rbp), %rax	 ; i, tmp194
	cmpq	%rax, 240(%rbp)	 ; tmp194, path_len
	jnb	.L72	 ;,
 ; D:\TC\src\file.c:268:     file->dirs = dirs_head;
	movq	336(%rbp), %rax	 ; file, tmp195
	movq	312(%rbp), %rdx	 ; dirs_head, tmp196
	movq	%rdx, (%rax)	 ; tmp196, file_79(D)->dirs
 ; D:\TC\src\file.c:271:     if (dirs_tail != 0) {
	cmpq	$0, 304(%rbp)	 ;, dirs_tail
	je	.L73	 ;,
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	304(%rbp), %rax	 ; dirs_tail, tmp197
	movq	(%rax), %rax	 ; dirs_tail_54->dir, _19
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%rax, %rcx	 ; _19,
	call	strrchr	 ;
	movq	%rax, 216(%rbp)	 ; tmp198, dot
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	$0, 216(%rbp)	 ;, dot
	je	.L74	 ;,
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	movq	304(%rbp), %rax	 ; dirs_tail, tmp199
	movq	(%rax), %rax	 ; dirs_tail_54->dir, _20
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, 216(%rbp)	 ; _20, dot
	je	.L74	 ;,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	304(%rbp), %rax	 ; dirs_tail, tmp200
	movq	(%rax), %rax	 ; dirs_tail_54->dir, _21
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	216(%rbp), %rdx	 ; dot, tmp201
	subq	%rax, %rdx	 ; _21, _22
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rdx, 208(%rbp)	 ; _22, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	304(%rbp), %rax	 ; dirs_tail, tmp202
	movq	(%rax), %rax	 ; dirs_tail_54->dir, _23
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	208(%rbp), %rdx	 ; name_len, tmp203
	movq	%rax, %rcx	 ; _23,
	call	create_string	 ;
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	336(%rbp), %rdx	 ; file, tmp204
	movq	%rax, 16(%rdx)	 ; _24, file_79(D)->name
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	216(%rbp), %rax	 ; dot, tmp205
	movq	%rax, %rcx	 ; tmp205,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _25
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	216(%rbp), %rax	 ; dot, tmp206
	movq	%rax, %rcx	 ; tmp206,
	call	create_string	 ;
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	336(%rbp), %rdx	 ; file, tmp207
	movq	%rax, 8(%rdx)	 ; _26, file_79(D)->extension
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L76	 ;
.L74:
 ; D:\TC\src\file.c:281:             file->name = dirs_tail->dir;
	movq	304(%rbp), %rax	 ; dirs_tail, tmp208
	movq	(%rax), %rdx	 ; dirs_tail_54->dir, _27
 ; D:\TC\src\file.c:281:             file->name = dirs_tail->dir;
	movq	336(%rbp), %rax	 ; file, tmp209
	movq	%rdx, 16(%rax)	 ; _27, file_79(D)->name
 ; D:\TC\src\file.c:282:             file->extension = 0;
	movq	336(%rbp), %rax	 ; file, tmp210
	movq	$0, 8(%rax)	 ;, file_79(D)->extension
	jmp	.L76	 ;
.L73:
 ; D:\TC\src\file.c:285:         file->name = 0;
	movq	336(%rbp), %rax	 ; file, tmp211
	movq	$0, 16(%rax)	 ;, file_79(D)->name
 ; D:\TC\src\file.c:286:         file->extension = 0;
	movq	336(%rbp), %rax	 ; file, tmp212
	movq	$0, 8(%rax)	 ;, file_79(D)->extension
.L76:
 ; D:\TC\src\file.c:290:     size_t full_path_len = 0;
	movq	$0, 272(%rbp)	 ;, full_path_len
 ; D:\TC\src\file.c:291:     StrNode* current = dirs_head;
	movq	312(%rbp), %rax	 ; dirs_head, tmp213
	movq	%rax, 264(%rbp)	 ; tmp213, current
 ; D:\TC\src\file.c:292:     size_t node_count = 0;
	movq	$0, 256(%rbp)	 ;, node_count
 ; D:\TC\src\file.c:294:     while (current != 0) {
	jmp	.L77	 ;
.L78:
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	movq	264(%rbp), %rax	 ; current, tmp214
	movq	(%rax), %rax	 ; current_62->dir, _28
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	movq	%rax, %rcx	 ; _28,
	call	strlen	 ;
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, 272(%rbp)	 ; _29, full_path_len
 ; D:\TC\src\file.c:296:         node_count++;
	addq	$1, 256(%rbp)	 ;, node_count
 ; D:\TC\src\file.c:297:         current = current->next;
	movq	264(%rbp), %rax	 ; current, tmp215
	movq	8(%rax), %rax	 ; current_62->next, tmp216
	movq	%rax, 264(%rbp)	 ; tmp216, current
.L77:
 ; D:\TC\src\file.c:294:     while (current != 0) {
	cmpq	$0, 264(%rbp)	 ;, current
	jne	.L78	 ;,
 ; D:\TC\src\file.c:301:     if (node_count > 1)
	cmpq	$1, 256(%rbp)	 ;, node_count
	jbe	.L79	 ;,
 ; D:\TC\src\file.c:302:         full_path_len += (node_count - 1);
	movq	256(%rbp), %rdx	 ; node_count, tmp217
	movq	272(%rbp), %rax	 ; full_path_len, tmp218
	addq	%rdx, %rax	 ; tmp217, _30
	subq	$1, %rax	 ;, tmp219
	movq	%rax, 272(%rbp)	 ; tmp219, full_path_len
.L79:
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movq	272(%rbp), %rax	 ; full_path_len, tmp220
	addq	$1, %rax	 ;, _31
	movq	%rax, %rdx	 ; _31,
	leaq	.LC0(%rip), %rax	 ;, tmp221
	movq	%rax, %rcx	 ; tmp221,
	call	create_string	 ;
	movq	%rax, 200(%rbp)	 ; tmp222, full_path
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movq	200(%rbp), %rax	 ; full_path, tmp223
	movb	$0, (%rax)	 ;, *full_path_112
 ; D:\TC\src\file.c:307:     current = dirs_head;
	movq	312(%rbp), %rax	 ; dirs_head, tmp224
	movq	%rax, 264(%rbp)	 ; tmp224, current
 ; D:\TC\src\file.c:308:     bool is_first = true;
	movb	$1, 255(%rbp)	 ;, is_first
 ; D:\TC\src\file.c:309:     while (current != 0) {
	jmp	.L80	 ;
.L82:
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	cmpb	$0, 255(%rbp)	 ;, is_first
	jne	.L81	 ;,
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	264(%rbp), %rax	 ; current, tmp225
	movq	(%rax), %rax	 ; current_63->dir, _32
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %rdx	 ;, tmp226
	movq	%rax, %rcx	 ; _32,
	call	strcmp	 ;
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; _33
	je	.L81	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	200(%rbp), %rax	 ; full_path, tmp227
	movzbl	(%rax), %eax	 ; MEM[(const char *)full_path_112], _34
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	testb	%al, %al	 ; _34
	je	.L81	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	200(%rbp), %rax	 ; full_path, tmp228
	movq	%rax, %rcx	 ; tmp228,
	call	strlen	 ;
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	leaq	-1(%rax), %rdx	 ;, _36
	movq	200(%rbp), %rax	 ; full_path, tmp229
	addq	%rdx, %rax	 ; _36, _37
	movzbl	(%rax), %eax	 ; *_37, _38
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, %al	 ;, _38
	je	.L81	 ;,
 ; D:\TC\src\file.c:313:                 strcat(full_path, "/");
	movq	200(%rbp), %rax	 ; full_path, tmp231
	movq	%rax, %rcx	 ; tmp231,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp233, _118
 ; D:\TC\src\file.c:313:                 strcat(full_path, "/");
	movq	200(%rbp), %rax	 ; full_path, tmp234
	addq	%rdx, %rax	 ; _118, _119
	movw	$47, (%rax)	 ;, MEM <char[1:2]> [(void *)_119]
.L81:
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	264(%rbp), %rax	 ; current, tmp235
	movq	(%rax), %rdx	 ; current_63->dir, _39
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	200(%rbp), %rax	 ; full_path, tmp236
	movq	%rax, %rcx	 ; tmp236,
	call	strcat	 ;
 ; D:\TC\src\file.c:317:         is_first = false;
	movb	$0, 255(%rbp)	 ;, is_first
 ; D:\TC\src\file.c:318:         current = current->next;
	movq	264(%rbp), %rax	 ; current, tmp237
	movq	8(%rax), %rax	 ; current_63->next, tmp238
	movq	%rax, 264(%rbp)	 ; tmp238, current
.L80:
 ; D:\TC\src\file.c:309:     while (current != 0) {
	cmpq	$0, 264(%rbp)	 ;, current
	jne	.L82	 ;,
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	200(%rbp), %rax	 ; full_path, tmp239
	movq	%rax, %rcx	 ; tmp239,
	call	strlen	 ;
	movq	%rax, %rdx	 ;, _40
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	200(%rbp), %rax	 ; full_path, tmp240
	movq	%rax, %rcx	 ; tmp240,
	call	create_string	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	336(%rbp), %rdx	 ; file, tmp241
	movq	%rax, 24(%rdx)	 ; _41, file_79(D)->path
 ; D:\TC\src\file.c:322: }
	nop	
	addq	$448, %rsp	 ;,
	popq	%rbp	 ;
	ret	
	.seh_endproc
	.ident	"GCC: (GNU) 13.2.0"
	.def	getcwd;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	memmove;	.scl	2;	.type	32;	.endef
	.def	create_string;	.scl	2;	.type	32;	.endef
	.def	sprintf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strlen;	.scl	2;	.type	32;	.endef
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef

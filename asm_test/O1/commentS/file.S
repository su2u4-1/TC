	.file	"D:\\TC\\src\\file.c"
 ; GNU C17 (GCC) version 13.2.0 (x86_64-pc-msys)
 ;	compiled by GNU C version 13.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

 ; GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 ; options passed: -mtune=generic -march=nocona -O1
	.text
	.globl	get_cwd
	.def	get_cwd;	.scl	2;	.type	32;	.endef
	.seh_proc	get_cwd
get_cwd:
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
 ; D:\TC\src\file.c:7:     return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
	movl	$0, %edx	 ;,
	movl	$0, %ecx	 ;,
	call	getcwd	 ;
 ; D:\TC\src\file.c:11: }
	addq	$40, %rsp	 ;,
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
	pushq	%rdi	 ;
	.seh_pushreg	%rdi
	pushq	%rsi	 ;
	.seh_pushreg	%rsi
	pushq	%rbx	 ;
	.seh_pushreg	%rbx
	subq	$40, %rsp	 ;,
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx	 ; tmp134, path
 ; D:\TC\src\file.c:21:     size_t path_len = strlen(path);
	call	strlen	 ;
	movq	%rax, %rsi	 ; tmp112, path_len
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	testq	%rax, %rax	 ; tmp112
	je	.L3	 ;,
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	movl	$0, %eax	 ;, i
	jmp	.L10	 ;
.L21:
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	movb	$47, (%rcx)	 ;, *_1
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	 ;, i
	jbe	.L18	 ;,
.L5:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-1(%rbx,%rax), %rcx	 ;, _5
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$46, (%rcx)	 ;, *_5
	je	.L19	 ;,
.L9:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rcx	 ;, _13
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, (%rcx)	 ;, *_13
	jne	.L8	 ;,
.L12:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	-1(%rax), %rdi	 ;, _15
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	cmpb	$47, -1(%rbx,%rax)	 ;, *_16
	jne	.L8	 ;,
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rdx	 ;, tmp126
 ; D:\TC\src\file.c:30:             memmove(path + i, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp142
	subq	%rax, %r8	 ; i, tmp142
	call	memmove	 ;
 ; D:\TC\src\file.c:31:             path_len--;
	subq	$1, %rsi	 ;, path_len
 ; D:\TC\src\file.c:32:             i--;
	movq	%rdi, %rax	 ; _15, i
	jmp	.L8	 ;
.L19:
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	leaq	-2(%rax), %rdi	 ;, _7
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, -2(%rbx,%rax)	 ;, *_8
	jne	.L9	 ;,
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	leaq	1(%rbx,%rax), %rdx	 ;, tmp120
 ; D:\TC\src\file.c:25:             memmove(path + i - 1, path + i + 1, path_len - i);
	movq	%rsi, %r8	 ; path_len, tmp141
	subq	%rax, %r8	 ; i, tmp141
	call	memmove	 ;
 ; D:\TC\src\file.c:26:             path_len -= 2;
	subq	$2, %rsi	 ;, path_len
 ; D:\TC\src\file.c:27:             i -= 2;
	movq	%rdi, %rax	 ; _7, i
.L7:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	 ; i
	jne	.L9	 ;,
.L8:
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	addq	$1, %rax	 ;, i
 ; D:\TC\src\file.c:22:     for (size_t i = 0; i < path_len; i++) {
	cmpq	%rsi, %rax	 ; path_len, i
	jnb	.L20	 ;,
.L10:
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	leaq	(%rbx,%rax), %rcx	 ;, _1
	movzbl	(%rcx), %edx	 ; *_1, _2
 ; D:\TC\src\file.c:23:         if (path[i] == '\\') path[i] = '/';
	cmpb	$92, %dl	 ;, _2
	je	.L21	 ;,
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpq	$1, %rax	 ;, i
	jbe	.L7	 ;,
 ; D:\TC\src\file.c:24:         if (i > 1 && path[i] == '/' && path[i - 1] == '.' && path[i - 2] == '/') {
	cmpb	$47, %dl	 ;, _2
	jne	.L8	 ;,
	jmp	.L5	 ;
.L20:
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	testq	%rsi, %rsi	 ; path_len
	je	.L3	 ;,
 ; D:\TC\src\file.c:40:         return path;
	movq	%rbx, %rax	 ; path, <retval>
 ; D:\TC\src\file.c:39:     if (path_len > 0 && path[0] == '/')
	cmpb	$47, (%rbx)	 ;, *path_37(D)
	je	.L2	 ;,
.L3:
 ; D:\TC\src\file.c:42:     string cwd = get_cwd();
	call	get_cwd	 ;
	movq	%rax, %rdi	 ; tmp136, cwd
 ; D:\TC\src\file.c:44:         return path;
	movq	%rbx, %rax	 ; path, <retval>
 ; D:\TC\src\file.c:43:     if (cwd == NULL)
	testq	%rdi, %rdi	 ; cwd
	je	.L2	 ;,
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	movq	%rdi, %rcx	 ; cwd,
	call	strlen	 ;
 ; D:\TC\src\file.c:45:     size_t total_len = strlen(cwd) + 1 + path_len + 1;
	leaq	2(%rsi,%rax), %rbp	 ;, total_len
 ; D:\TC\src\file.c:46:     string abs_path = create_string("", total_len);
	movq	%rbp, %rdx	 ; total_len,
	leaq	.LC0(%rip), %rcx	 ;, tmp131
	call	create_string	 ;
	movq	%rax, %rsi	 ; tmp138, abs_path
 ; D:\TC\src\file.c:47:     sprintf(abs_path, "%s/%s", cwd, path);
	movq	%rbx, %r9	 ; path,
	movq	%rdi, %r8	 ; cwd,
	leaq	.LC1(%rip), %rdx	 ;, tmp132
	movq	%rax, %rcx	 ; abs_path,
	call	sprintf	 ;
 ; D:\TC\src\file.c:48:     free(cwd);
	movq	%rdi, %rcx	 ; cwd,
	call	free	 ;
 ; D:\TC\src\file.c:49:     return create_string(abs_path, total_len);
	movq	%rbp, %rdx	 ; total_len,
	movq	%rsi, %rcx	 ; abs_path,
	call	create_string	 ;
.L2:
 ; D:\TC\src\file.c:50: }
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L18:
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	testq	%rax, %rax	 ; i
	je	.L8	 ;,
 ; D:\TC\src\file.c:29:         if (i > 0 && path[i] == '/' && path[i - 1] == '/') {
	leaq	(%rbx,%rax), %rcx	 ;, _13
	jmp	.L12	 ;
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
	movq	%rcx, %rbp	 ; tmp130, path
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	movq	(%rcx), %rax	 ; path_31(D)->dirs, _1
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	testq	%rax, %rax	 ; _1
	je	.L32	 ;,
 ; D:\TC\src\file.c:65:     size_t node_count = 0;
	movl	$0, %edi	 ;, node_count
 ; D:\TC\src\file.c:64:     size_t total_len = 0;
	movl	$0, %esi	 ;, total_len
	jmp	.L27	 ;
.L34:
 ; D:\TC\src\file.c:69:             size_t dir_len = strlen((current->dir));
	movq	(%rax), %rcx	 ; current_57->dir, current_57->dir
	call	strlen	 ;
 ; D:\TC\src\file.c:70:             total_len += dir_len;
	addq	%rax, %rsi	 ; tmp131, total_len
 ; D:\TC\src\file.c:71:             node_count++;
	addq	$1, %rdi	 ;, node_count
	movq	%rbx, %rax	 ; <retval>, _1
.L27:
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	movq	8(%rax), %rbx	 ; current_57->next, <retval>
 ; D:\TC\src\file.c:68:         if (current->next != 0) {  // Not the last element (which is the filename)
	testq	%rbx, %rbx	 ; <retval>
	jne	.L34	 ;,
 ; D:\TC\src\file.c:76:     if (node_count == 0) return 0;
	testq	%rdi, %rdi	 ; node_count
	je	.L24	 ;,
 ; D:\TC\src\file.c:80:         total_len += node_count - 1;
	leaq	-1(%rsi,%rdi), %rax	 ;, tmp125
	cmpq	$1, %rdi	 ;, node_count
	cmova	%rax, %rsi	 ; tmp125,, total_len
 ; D:\TC\src\file.c:83:     string dir_path = create_string("", total_len + 1);
	leaq	1(%rsi), %rdx	 ;, tmp109
	leaq	.LC0(%rip), %rcx	 ;, tmp110
	call	create_string	 ;
	movq	%rax, %rsi	 ; tmp132, dir_path
 ; D:\TC\src\file.c:84:     dir_path[0] = '\0';
	movb	$0, (%rax)	 ;, *dir_path_35
 ; D:\TC\src\file.c:86:     current = path->dirs;
	movq	0(%rbp), %rbx	 ; path_31(D)->dirs, current
 ; D:\TC\src\file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L29	 ;,
 ; D:\TC\src\file.c:87:     bool first = true;
	movl	$1, %eax	 ;, first
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	leaq	.LC2(%rip), %rbp	 ;, tmp128
	movl	$0, %edi	 ;, first
	jmp	.L31	 ;
.L30:
 ; D:\TC\src\file.c:95:             strcat(dir_path, current->dir);
	movq	(%rbx), %rdx	 ; current_58->dir, current_58->dir
	movq	%rsi, %rcx	 ; dir_path,
	call	strcat	 ;
 ; D:\TC\src\file.c:98:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_58->next, current
	movl	%edi, %eax	 ; first, first
 ; D:\TC\src\file.c:88:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	je	.L29	 ;,
.L31:
 ; D:\TC\src\file.c:89:         if (current->next != 0) {  // Not the last element
	cmpq	$0, 8(%rbx)	 ;, current_58->next
	je	.L29	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testb	%al, %al	 ; first
	jne	.L30	 ;,
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	movq	(%rbx), %rcx	 ; current_58->dir, current_58->dir
	movq	%rbp, %rdx	 ; tmp128,
	call	strcmp	 ;
 ; D:\TC\src\file.c:90:             if (!first && strcmp(current->dir, "/") != 0)
	testl	%eax, %eax	 ; tmp133
	je	.L30	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$0, (%rsi)	 ;, MEM[(const char *)dir_path_35]
	je	.L30	 ;,
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:92:                 if (strlen(dir_path) > 0 && dir_path[strlen(dir_path) - 1] != '/')
	cmpb	$47, -1(%rsi,%rax)	 ;, *_12
	je	.L30	 ;,
 ; D:\TC\src\file.c:93:                     strcat(dir_path, "/");
	movw	$47, (%rsi,%rax)	 ;, MEM <char[1:2]> [(void *)_40]
	jmp	.L30	 ;
.L29:
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp135, tmp121
 ; D:\TC\src\file.c:101:     return create_string(dir_path, strlen(dir_path));
	movq	%rsi, %rcx	 ; dir_path,
	call	create_string	 ;
	movq	%rax, %rbx	 ; tmp136, <retval>
.L24:
 ; D:\TC\src\file.c:102: }
	movq	%rbx, %rax	 ; <retval>,
	addq	$40, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	ret	
.L32:
 ; D:\TC\src\file.c:61:     if (path->dirs == 0) return 0;
	movq	%rax, %rbx	 ; _1, <retval>
	jmp	.L24	 ;
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
	movq	%rcx, %rbx	 ; tmp132, file
	movq	%rdx, %rsi	 ; tmp133, new_extension
 ; D:\TC\src\file.c:109:     file->extension = new_extension;
	movq	%rdx, 8(%rcx)	 ; new_extension, file_18(D)->extension
 ; D:\TC\src\file.c:112:     string dir = get_file_dir(file);
	call	get_file_dir	 ;
	movq	%rax, %rbp	 ; tmp134, dir
 ; D:\TC\src\file.c:113:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	leaq	.LC0(%rip), %r12	 ;, tmp131
	cmovne	%rax, %r12	 ; dir,, iftmp.0_13
 ; D:\TC\src\file.c:114:     string ext_cstr = new_extension != NULL ? new_extension : "";
	testq	%rsi, %rsi	 ; new_extension
	je	.L47	 ;,
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r12, %rcx	 ; iftmp.0_13,
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp138, tmp113
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdi	 ;, path_len
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	movq	%rsi, %rcx	 ; new_extension,
	call	strlen	 ;
 ; D:\TC\src\file.c:117:     if (new_extension != 0) path_len += strlen(ext_cstr);
	leaq	(%rax,%rdi), %rdx	 ;, path_len
.L43:
 ; D:\TC\src\file.c:119:     string new_path = create_string("", path_len + 1);
	addq	$1, %rdx	 ;, tmp104
	leaq	.LC0(%rip), %rcx	 ;, tmp105
	call	create_string	 ;
	movq	%rax, %rdi	 ; tmp135, new_path
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	testq	%rbp, %rbp	 ; dir
	je	.L40	 ;,
 ; D:\TC\src\file.c:120:     if (dir != 0 && strlen(dir_cstr) > 0)
	cmpb	$0, (%r12)	 ;, MEM[(const char *)iftmp.0_13]
	jne	.L48	 ;,
.L40:
 ; D:\TC\src\file.c:123:         sprintf(new_path, "%s", file->name);
	movq	16(%rbx), %rdx	 ; file_18(D)->name, file_18(D)->name
	movq	%rdi, %rcx	 ; new_path,
	call	strcpy	 ;
.L41:
 ; D:\TC\src\file.c:125:     if (new_extension != 0)
	testq	%rsi, %rsi	 ; new_extension
	je	.L42	 ;,
 ; D:\TC\src\file.c:126:         strcat(new_path, new_extension);
	movq	%rsi, %rdx	 ; new_extension,
	movq	%rdi, %rcx	 ; new_path,
	call	strcat	 ;
.L42:
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp136, tmp110
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rdi, %rcx	 ; new_path,
	call	create_string	 ;
 ; D:\TC\src\file.c:128:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp137, file_18(D)->path
 ; D:\TC\src\file.c:129: }
	addq	$32, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	ret	
.L48:
 ; D:\TC\src\file.c:121:         sprintf(new_path, "%s/%s", dir_cstr, file->name);
	movq	16(%rbx), %r9	 ; file_18(D)->name,
	movq	%r12, %r8	 ; iftmp.0_13,
	leaq	.LC1(%rip), %rdx	 ;, tmp107
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L41	 ;
.L47:
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	%r12, %rcx	 ; iftmp.0_13,
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp141, tmp124
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	movq	16(%rbx), %rcx	 ; file_18(D)->name, file_18(D)->name
	call	strlen	 ;
 ; D:\TC\src\file.c:116:     size_t path_len = strlen(dir_cstr) + 1 + strlen(file->name);
	leaq	1(%rdi,%rax), %rdx	 ;, path_len
	jmp	.L43	 ;
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
	movq	%rcx, %rbx	 ; tmp151, file
	movq	%rdx, %rdi	 ; tmp152, new_name
 ; D:\TC\src\file.c:132:     file->name = new_name;
	movq	%rdx, 16(%rcx)	 ; new_name, file_26(D)->name
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	movq	(%rcx), %rax	 ; file_26(D)->dirs, _2
 ; D:\TC\src\file.c:135:     if (file->dirs != 0) {
	testq	%rax, %rax	 ; _2
	je	.L51	 ;,
.L50:
	movq	%rax, %rsi	 ; _2, current
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	movq	8(%rax), %rax	 ; current_17->next, _2
 ; D:\TC\src\file.c:139:             if (current->next == 0) {
	testq	%rax, %rax	 ; _2
	jne	.L50	 ;,
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	movq	8(%rbx), %r12	 ; file_26(D)->extension, _3
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	testq	%r12, %r12	 ; _3
	je	.L67	 ;,
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp165, tmp142
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	movq	%r12, %rcx	 ; _3,
	call	strlen	 ;
 ; D:\TC\src\file.c:143:                 if (file->extension != 0) full_name_len += strlen(ext_cstr);
	leaq	(%rax,%rbp), %rdx	 ;, full_name_len
.L61:
 ; D:\TC\src\file.c:145:                 string full_name = create_string("", full_name_len + 1);
	addq	$1, %rdx	 ;, tmp111
	leaq	.LC0(%rip), %rcx	 ;, tmp112
	call	create_string	 ;
	movq	%rax, %rbp	 ; tmp153, full_name
 ; D:\TC\src\file.c:146:                 sprintf(full_name, "%s%s", new_name, ext_cstr);
	movq	%r12, %r9	 ; _3,
	movq	%rdi, %r8	 ; new_name,
	leaq	.LC3(%rip), %rdx	 ;, tmp113
	movq	%rax, %rcx	 ; full_name,
	call	sprintf	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp154, tmp115
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rbp, %rcx	 ; full_name,
	call	create_string	 ;
 ; D:\TC\src\file.c:147:                 current->dir = create_string(full_name, strlen(full_name));
	movq	%rax, (%rsi)	 ; tmp155, current_58->dir
.L51:
 ; D:\TC\src\file.c:155:     string dir = get_file_dir(file);
	movq	%rbx, %rcx	 ; file,
	call	get_file_dir	 ;
	movq	%rax, %rsi	 ; tmp156, dir
 ; D:\TC\src\file.c:156:     string dir_cstr = dir != NULL ? dir : "";
	testq	%rax, %rax	 ; dir
	leaq	.LC0(%rip), %r12	 ;, tmp150
	cmovne	%rax, %r12	 ; dir,, iftmp.3_21
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	movq	8(%rbx), %r13	 ; file_26(D)->extension, _8
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	testq	%r13, %r13	 ; _8
	je	.L68	 ;,
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r12, %rcx	 ; iftmp.3_21,
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp160, tmp125
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rbp,%rax), %rbp	 ;, path_len
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	movq	%r13, %rcx	 ; _8,
	call	strlen	 ;
 ; D:\TC\src\file.c:160:     if (file->extension != 0) path_len += strlen(ext_cstr);
	leaq	(%rax,%rbp), %rdx	 ;, path_len
.L60:
 ; D:\TC\src\file.c:162:     string new_path = create_string("", path_len + 1);
	addq	$1, %rdx	 ;, tmp117
	leaq	.LC0(%rip), %rcx	 ;, tmp118
	call	create_string	 ;
	movq	%rax, %rbp	 ; tmp157, new_path
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	testq	%rsi, %rsi	 ; dir
	je	.L58	 ;,
 ; D:\TC\src\file.c:163:     if (dir != NULL && strlen(dir_cstr) > 0)
	cmpb	$0, (%r12)	 ;, MEM[(const char *)iftmp.3_21]
	jne	.L69	 ;,
.L58:
 ; D:\TC\src\file.c:166:         sprintf(new_path, "%s%s", new_name, ext_cstr);
	movq	%r13, %r9	 ; _8,
	movq	%rdi, %r8	 ; new_name,
	leaq	.LC3(%rip), %rdx	 ;, tmp120
	movq	%rbp, %rcx	 ; new_path,
	call	sprintf	 ;
.L59:
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rbp, %rcx	 ; new_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp158, tmp122
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rbp, %rcx	 ; new_path,
	call	create_string	 ;
 ; D:\TC\src\file.c:168:     file->path = create_string(new_path, strlen(new_path));
	movq	%rax, 24(%rbx)	 ; tmp159, file_26(D)->path
 ; D:\TC\src\file.c:169: }
	addq	$56, %rsp	 ;,
	popq	%rbx	 ;
	popq	%rsi	 ;
	popq	%rdi	 ;
	popq	%rbp	 ;
	popq	%r12	 ;
	popq	%r13	 ;
	ret	
.L69:
 ; D:\TC\src\file.c:164:         sprintf(new_path, "%s/%s%s", dir_cstr, new_name, ext_cstr);
	movq	%r13, 32(%rsp)	 ; _8,
	movq	%rdi, %r9	 ; new_name,
	movq	%r12, %r8	 ; iftmp.3_21,
	leaq	.LC4(%rip), %rdx	 ;, tmp119
	movq	%rax, %rcx	 ; new_path,
	call	sprintf	 ;
	jmp	.L59	 ;
.L68:
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%r12, %rcx	 ; iftmp.3_21,
	call	strlen	 ;
	movq	%rax, %rbp	 ; tmp163, tmp135
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
	call	strlen	 ;
 ; D:\TC\src\file.c:159:     size_t path_len = strlen(dir_cstr) + 1 + strlen(new_name);
	leaq	1(%rbp,%rax), %rdx	 ;, path_len
 ; D:\TC\src\file.c:157:     string ext_cstr = file->extension != 0 ? (file->extension) : "";
	leaq	.LC0(%rip), %r13	 ;, _8
	jmp	.L60	 ;
.L67:
 ; D:\TC\src\file.c:142:                 size_t full_name_len = strlen(new_name);
	movq	%rdi, %rcx	 ; new_name,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp167, full_name_len
 ; D:\TC\src\file.c:141:                 string ext_cstr = file->extension != NULL ? file->extension : "";
	leaq	.LC0(%rip), %r12	 ;, _3
	jmp	.L61	 ;
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
	movq	%rcx, %r12	 ; tmp209, file
 ; D:\TC\src\file.c:172:     size_t path_len = strlen(file->path);
	movq	24(%rcx), %rcx	 ; file_70(D)->path, file_70(D)->path
	call	strlen	 ;
	movq	%rax, %rdi	 ; tmp210, tmp144
 ; D:\TC\src\file.c:175:     string path_copy = create_string("", path_len + 1);
	leaq	1(%rax), %rdx	 ;, tmp146
	leaq	.LC0(%rip), %rcx	 ;, tmp147
	call	create_string	 ;
	movq	%rax, %rbp	 ; tmp211, path_copy
 ; D:\TC\src\file.c:176:     strcpy(path_copy, file->path);
	movq	24(%r12), %rdx	 ; file_70(D)->path, file_70(D)->path
	movq	%rax, %rcx	 ; path_copy,
	call	strcpy	 ;
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	testq	%rdi, %rdi	 ; tmp144
	je	.L91	 ;,
 ; D:\TC\src\file.c:181:     size_t start = 0;
	movl	$0, %edx	 ;, start
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	movl	$0, %esi	 ;, node
 ; D:\TC\src\file.c:197:     if (path_len > 0 && path_copy[0] == '/') {
	cmpb	$47, 0(%rbp)	 ;, *path_copy_73
	jne	.L71	 ;,
 ; D:\TC\src\file.c:198:         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp212, node
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movl	$1, %edx	 ;,
	leaq	.LC2(%rip), %rcx	 ;, tmp149
	call	create_string	 ;
 ; D:\TC\src\file.c:199:         node->dir = create_string("/", 1);
	movq	%rax, (%rsi)	 ; tmp213, node_76->dir
 ; D:\TC\src\file.c:200:         node->next = 0;
	movq	$0, 8(%rsi)	 ;, node_76->next
 ; D:\TC\src\file.c:204:         start = 1;
	movl	$1, %edx	 ;, start
	jmp	.L71	 ;
.L72:
 ; D:\TC\src\file.c:212:             if (i > start) {
	cmpq	%rbx, %rdx	 ; i, start
	jb	.L101	 ;,
.L74:
 ; D:\TC\src\file.c:262:             start = i + 1;
	leaq	1(%rbx), %rdx	 ;, start
.L73:
 ; D:\TC\src\file.c:264:         i++;
	leaq	1(%rbx), %rax	 ;, i
 ; D:\TC\src\file.c:210:     while (i <= path_len) {
	cmpq	%rbx, %rdi	 ; i, tmp144
	je	.L102	 ;,
	movq	%rax, %rbx	 ; i, i
.L81:
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpq	%rbx, %rdi	 ; i, tmp144
	je	.L72	 ;,
 ; D:\TC\src\file.c:211:         if (i == path_len || path_copy[i] == '/') {
	cmpb	$47, 0(%rbp,%rbx)	 ;, MEM[(char *)path_copy_73 + i_147 * 1]
	jne	.L73	 ;,
	jmp	.L72	 ;
.L101:
 ; D:\TC\src\file.c:213:                 size_t comp_len = i - start;
	movq	%rbx, %r14	 ; i, comp_len
	subq	%rdx, %r14	 ; start, comp_len
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	addq	%rbp, %rdx	 ; path_copy, tmp150
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	movq	%r14, %r8	 ; comp_len,
	movq	%r15, %rcx	 ; tmp207,
	call	strncpy	 ;
 ; D:\TC\src\file.c:216:                 component[comp_len] = '\0';
	movb	$0, 48(%rsp,%r14)	 ;, component[comp_len_104]
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	leaq	.LC5(%rip), %rdx	 ;,
	movq	%r15, %rcx	 ; tmp207,
	call	strcmp	 ;
 ; D:\TC\src\file.c:218:                 if (strcmp(component, ".") == 0) {
	testl	%eax, %eax	 ; tmp214
	je	.L74	 ;,
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	leaq	48(%rsp), %rcx	 ;, tmp158
	leaq	.LC6(%rip), %rdx	 ;, tmp159
	call	strcmp	 ;
 ; D:\TC\src\file.c:220:                 } else if (strcmp(component, "..") == 0) {
	testl	%eax, %eax	 ; tmp215
	jne	.L76	 ;,
 ; D:\TC\src\file.c:222:                     if (dirs_tail != 0 && dirs_tail != dirs_head) {
	testq	%r13, %r13	 ; dirs_tail
	je	.L77	 ;,
	cmpq	%r13, %rsi	 ; dirs_tail, node
	je	.L77	 ;,
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	movq	0(%r13), %rcx	 ; dirs_tail_144->dir, dirs_tail_144->dir
	leaq	.LC6(%rip), %rdx	 ;, tmp167
	call	strcmp	 ;
 ; D:\TC\src\file.c:224:                         if (strcmp(dirs_tail->dir, "..") == 0) {
	testl	%eax, %eax	 ; tmp216
	jne	.L93	 ;,
 ; D:\TC\src\file.c:225:                             StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %r14	 ; tmp217, node
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp168
	call	create_string	 ;
 ; D:\TC\src\file.c:226:                             node->dir = create_string("..", 2);
	movq	%rax, (%r14)	 ; tmp218, node_120->dir
 ; D:\TC\src\file.c:227:                             node->next = 0;
	movq	$0, 8(%r14)	 ;, node_120->next
 ; D:\TC\src\file.c:228:                             dirs_tail->next = node;
	movq	%r14, 8(%r13)	 ; node, dirs_tail_144->next
 ; D:\TC\src\file.c:229:                             dirs_tail = node;
	movq	%r14, %r13	 ; node, dirs_tail
	jmp	.L74	 ;
.L93:
 ; D:\TC\src\file.c:232:                             StrNode* prev = dirs_head;
	movq	%rsi, %rax	 ; node, prev
	jmp	.L78	 ;
.L94:
 ; D:\TC\src\file.c:234:                                 prev = prev->next;
	movq	%rdx, %rax	 ; _17, prev
.L78:
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	testq	%rax, %rax	 ; prev
	je	.L74	 ;,
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	movq	8(%rax), %rdx	 ; prev_53->next, _17
 ; D:\TC\src\file.c:233:                             while (prev != 0 && prev->next != dirs_tail)
	cmpq	%r13, %rdx	 ; dirs_tail, _17
	jne	.L94	 ;,
 ; D:\TC\src\file.c:237:                                 prev->next = 0;
	movq	$0, 8(%rax)	 ;, prev_53->next
 ; D:\TC\src\file.c:238:                                 dirs_tail = prev;
	movq	%rax, %r13	 ; prev, dirs_tail
	jmp	.L74	 ;
.L77:
 ; D:\TC\src\file.c:241:                     } else if (dirs_head == 0) {
	testq	%rsi, %rsi	 ; node
	jne	.L74	 ;,
 ; D:\TC\src\file.c:243:                         StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rsi	 ; tmp219, node
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movl	$2, %edx	 ;,
	leaq	.LC6(%rip), %rcx	 ;, tmp169
	call	create_string	 ;
 ; D:\TC\src\file.c:244:                         node->dir = create_string("..", 2);
	movq	%rax, (%rsi)	 ; tmp220, node_114->dir
 ; D:\TC\src\file.c:245:                         node->next = 0;
	movq	$0, 8(%rsi)	 ;, node_114->next
 ; D:\TC\src\file.c:247:                         dirs_tail = node;
	movq	%rsi, %r13	 ; node, dirs_tail
	jmp	.L74	 ;
.L76:
 ; D:\TC\src\file.c:249:                 } else if (strlen(component) > 0) {
	cmpb	$0, 48(%rsp)	 ;, MEM[(const char *)&component]
	je	.L74	 ;,
 ; D:\TC\src\file.c:251:                     StrNode* node = (StrNode*)alloc_memory(sizeof(StrNode));
	movl	$16, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, 40(%rsp)	 ; tmp221, %sfp
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	leaq	48(%rsp), %rcx	 ;, tmp170
	movq	%r14, %rdx	 ; comp_len,
	call	create_string	 ;
 ; D:\TC\src\file.c:252:                     node->dir = create_string(component, comp_len);
	movq	40(%rsp), %rdx	 ; %sfp, node
	movq	%rax, (%rdx)	 ; tmp222, node_108->dir
 ; D:\TC\src\file.c:253:                     node->next = 0;
	movq	$0, 8(%rdx)	 ;, node_108->next
 ; D:\TC\src\file.c:255:                     if (dirs_tail != 0)
	testq	%r13, %r13	 ; dirs_tail
	je	.L80	 ;,
 ; D:\TC\src\file.c:256:                         (dirs_tail)->next = node;
	movq	%rdx, 8(%r13)	 ; node, dirs_tail_144->next
.L80:
 ; D:\TC\src\file.c:259:                     if (dirs_head == 0) dirs_head = node;
	testq	%rsi, %rsi	 ; node
	je	.L95	 ;,
 ; D:\TC\src\file.c:258:                     dirs_tail = node;
	movq	40(%rsp), %r13	 ; %sfp, dirs_tail
	jmp	.L74	 ;
.L95:
	movq	40(%rsp), %rsi	 ; %sfp, node
	movq	%rsi, %r13	 ; node, dirs_tail
	jmp	.L74	 ;
.L102:
 ; D:\TC\src\file.c:268:     file->dirs = dirs_head;
	movq	%rsi, (%r12)	 ; node, file_70(D)->dirs
 ; D:\TC\src\file.c:271:     if (dirs_tail != 0) {
	testq	%r13, %r13	 ; dirs_tail
	je	.L82	 ;,
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movq	0(%r13), %rdi	 ; dirs_tail_47->dir, _21
 ; D:\TC\src\file.c:272:         string dot = strrchr(dirs_tail->dir, '.');
	movl	$46, %edx	 ;,
	movq	%rdi, %rcx	 ; _21,
	call	strrchr	 ;
	movq	%rax, %rbx	 ; tmp223, dot
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	cmpq	%rax, %rdi	 ; dot, _21
	je	.L83	 ;,
	testq	%rax, %rax	 ; dot
	je	.L83	 ;,
 ; D:\TC\src\file.c:276:             size_t name_len = (size_t)(dot - dirs_tail->dir);
	movq	%rax, %rdx	 ; dot, name_len
	subq	%rdi, %rdx	 ; _21, name_len
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rdi, %rcx	 ; _21,
	call	create_string	 ;
 ; D:\TC\src\file.c:277:             file->name = create_string(dirs_tail->dir, name_len);
	movq	%rax, 16(%r12)	 ; tmp224, file_70(D)->name
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rcx	 ; dot,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp225, tmp177
 ; D:\TC\src\file.c:278:             file->extension = create_string(dot, strlen(dot));
	movq	%rbx, %rcx	 ; dot,
	call	create_string	 ;
	movq	%rax, %r13	 ; tmp226, dirs_tail
 ; D:\TC\src\file.c:274:         if (dot != NULL && dot != dirs_tail->dir) {
	jmp	.L84	 ;
.L83:
 ; D:\TC\src\file.c:281:             file->name = dirs_tail->dir;
	movq	%rdi, 16(%r12)	 ; _21, file_70(D)->name
	movl	$0, %r13d	 ;, dirs_tail
.L84:
 ; D:\TC\src\file.c:282:             file->extension = 0;
	movq	%r13, 8(%r12)	 ; dirs_tail, file_70(D)->extension
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rsi, %rsi	 ; node
	je	.L85	 ;,
 ; D:\TC\src\file.c:291:     StrNode* current = dirs_head;
	movq	%rsi, %rbx	 ; node, current
 ; D:\TC\src\file.c:292:     size_t node_count = 0;
	movl	$0, %edi	 ;, node_count
 ; D:\TC\src\file.c:290:     size_t full_path_len = 0;
	movl	$0, %ebp	 ;, full_path_len
.L86:
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	movq	(%rbx), %rcx	 ; current_150->dir, current_150->dir
	call	strlen	 ;
 ; D:\TC\src\file.c:295:         full_path_len += strlen(current->dir);
	addq	%rax, %rbp	 ; tmp227, full_path_len
	movq	%rdi, %rax	 ; node_count, node_count
 ; D:\TC\src\file.c:296:         node_count++;
	addq	$1, %rdi	 ;, node_count
 ; D:\TC\src\file.c:297:         current = current->next;
	movq	8(%rbx), %rbx	 ; current_150->next, current
 ; D:\TC\src\file.c:294:     while (current != 0) {
	testq	%rbx, %rbx	 ; current
	jne	.L86	 ;,
 ; D:\TC\src\file.c:302:         full_path_len += (node_count - 1);
	addq	%rbp, %rax	 ; full_path_len, tmp200
	cmpq	$1, %rdi	 ;, node_count
	cmova	%rax, %rbp	 ; tmp200,, full_path_len
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	leaq	1(%rbp), %rdx	 ;, tmp196
	leaq	.LC0(%rip), %rcx	 ;, tmp197
	call	create_string	 ;
	movq	%rax, %rbx	 ; tmp228, full_path
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_56
	movl	$1, %eax	 ;, is_first
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	leaq	.LC2(%rip), %rbp	 ;, tmp205
	movl	$0, %edi	 ;, is_first
	jmp	.L89	 ;
.L82:
 ; D:\TC\src\file.c:285:         file->name = 0;
	movq	$0, 16(%r12)	 ;, file_70(D)->name
	jmp	.L84	 ;
.L88:
 ; D:\TC\src\file.c:316:         strcat(full_path, current->dir);
	movq	(%rsi), %rdx	 ; current_151->dir, current_151->dir
	movq	%rbx, %rcx	 ; full_path,
	call	strcat	 ;
 ; D:\TC\src\file.c:318:         current = current->next;
	movq	8(%rsi), %rsi	 ; current_151->next, node
	movl	%edi, %eax	 ; is_first, is_first
 ; D:\TC\src\file.c:309:     while (current != 0) {
	testq	%rsi, %rsi	 ; node
	je	.L90	 ;,
.L89:
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testb	%al, %al	 ; is_first
	jne	.L88	 ;,
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	movq	(%rsi), %rcx	 ; current_151->dir, current_151->dir
	movq	%rbp, %rdx	 ; tmp205,
	call	strcmp	 ;
 ; D:\TC\src\file.c:310:         if (!is_first && strcmp(current->dir, "/") != 0) {
	testl	%eax, %eax	 ; tmp229
	je	.L88	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$0, (%rbx)	 ;, MEM[(const char *)full_path_56]
	je	.L88	 ;,
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	movq	%rbx, %rcx	 ; full_path,
	call	strlen	 ;
 ; D:\TC\src\file.c:312:             if (strlen(full_path) > 0 && full_path[strlen(full_path) - 1] != '/') {
	cmpb	$47, -1(%rbx,%rax)	 ;, *_35
	je	.L88	 ;,
 ; D:\TC\src\file.c:313:                 strcat(full_path, "/");
	movw	$47, (%rbx,%rax)	 ;, MEM <char[1:2]> [(void *)_97]
	jmp	.L88	 ;
.L85:
 ; D:\TC\src\file.c:304:     string full_path = create_string("", full_path_len + 1);
	movl	$1, %edx	 ;,
	leaq	.LC0(%rip), %rcx	 ;, tmp195
	call	create_string	 ;
	movq	%rax, %rbx	 ; tmp233, full_path
 ; D:\TC\src\file.c:305:     full_path[0] = '\0';
	movb	$0, (%rax)	 ;, *full_path_82
.L90:
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rcx	 ; full_path,
	call	strlen	 ;
	movq	%rax, %rdx	 ; tmp231, tmp193
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rbx, %rcx	 ; full_path,
	call	create_string	 ;
 ; D:\TC\src\file.c:321:     file->path = create_string(full_path, strlen(full_path));
	movq	%rax, 24(%r12)	 ; tmp232, file_70(D)->path
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
.L91:
 ; D:\TC\src\file.c:181:     size_t start = 0;
	movq	%rdi, %rdx	 ; tmp144, start
 ; D:\TC\src\file.c:178:     StrNode* dirs_head = 0;
	movl	$0, %esi	 ;, node
.L71:
 ; D:\TC\src\file.c:209:     size_t i = start;
	movq	%rdx, %rbx	 ; start, i
	movq	%rsi, %r13	 ; node, dirs_tail
 ; D:\TC\src\file.c:215:                 strncpy(component, path_copy + start, comp_len);
	leaq	48(%rsp), %r15	 ;, tmp207
	jmp	.L81	 ;
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
	movq	%rcx, %rsi	 ; tmp86, path
 ; D:\TC\src\file.c:14:     File* file = (File*)alloc_memory(sizeof(File));
	movl	$32, %ecx	 ;,
	call	alloc_memory	 ;
	movq	%rax, %rbx	 ; tmp87, <retval>
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	movq	%rsi, %rcx	 ; path,
	call	absolute_path	 ;
 ; D:\TC\src\file.c:15:     file->path = absolute_path(path);
	movq	%rax, 24(%rbx)	 ; tmp88, file_4->path
 ; D:\TC\src\file.c:16:     normalize_path(file);
	movq	%rbx, %rcx	 ; <retval>,
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
	.def	strcat;	.scl	2;	.type	32;	.endef
	.def	strcmp;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	strcpy;	.scl	2;	.type	32;	.endef
	.def	alloc_memory;	.scl	2;	.type	32;	.endef
	.def	strncpy;	.scl	2;	.type	32;	.endef
	.def	strrchr;	.scl	2;	.type	32;	.endef

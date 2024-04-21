	.file	"sort.c"
	.section .rdata,"dr"
LC0:
	.ascii "i: %d\12\0"
LC1:
	.ascii "%d %d\12\0"
	.text
	.globl	_sort
	.def	_sort;	.scl	2;	.type	32;	.endef
_sort:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
/APP
 # 7 "sort.c" 1
	movl 12(%ebp), %eax
	testl %eax, %eax
	je 1f
	movl $0, -12(%ebp)
	0:
	movl 12(%ebp), %eax
	movl 8(%ebp),%edx
	leal (%edx,%eax,4),%ecx
	subl $4, %ecx
	2:
	movl (%edx), %eax
	addl %eax, -20(%ebp)
	addl $4,%edx
	movl (%edx), %eax
	cmpl -20(%ebp), %eax
	jna 3f
	movl %eax, -24(%ebp)
	movl -20(%ebp), %eax
	movl %eax, (%edx)
	subl $4, %edx
	movl -24(%ebp), %eax
	movl %eax, (%edx)
	addl $4, %edx
	jmp 3f
	3:
	cmpl %ecx,%edx
	jb 2b
	add $1, -12(%ebp)
	movl -12(%ebp), %eax
	subl 12(%ebp), %eax
	jb 1f
	1:
	
 # 0 "" 2
/NO_APP
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	-24(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC2:
	.ascii "\12\12\0"
LC3:
	.ascii "%d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	call	___main
	movl	$20, (%esp)
	call	_malloc
	movl	%eax, 24(%esp)
	movl	24(%esp), %eax
	movl	$2, (%eax)
	movl	24(%esp), %eax
	addl	$4, %eax
	movl	$1, (%eax)
	movl	24(%esp), %eax
	addl	$8, %eax
	movl	$3, (%eax)
	movl	24(%esp), %eax
	addl	$12, %eax
	movl	$4, (%eax)
	movl	24(%esp), %eax
	addl	$16, %eax
	movl	$5, (%eax)
	movl	$5, 4(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	_sort
	movl	$LC2, (%esp)
	call	_puts
	movl	$0, 28(%esp)
	jmp	L3
L4:
	movl	28(%esp), %eax
	leal	0(,%eax,4), %edx
	movl	24(%esp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
	addl	$1, 28(%esp)
L3:
	cmpl	$4, 28(%esp)
	jle	L4
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_malloc;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef

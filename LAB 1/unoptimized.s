	.file	"testprog.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.globl	a
	.bss
	.align 32
	.type	a, @object
	.size	a, 200000
a:
	.zero	200000
	.globl	b
	.align 32
	.type	b, @object
	.size	b, 200000
b:
	.zero	200000
	.section	.rodata
.LC0:
	.string	" %d %d %d %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64	
	pushq	%rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp	#,
	.cfi_def_cfa_register 6
	subq	$32, %rsp	#,
# testprog.c:7:   for ( int k = 0;  k < 100; k++) 
	movl	$0, -20(%rbp)	#, k
# testprog.c:7:   for ( int k = 0;  k < 100; k++) 
	jmp	.L2	#
.L7:
# testprog.c:8:   { for (int i = 0 ; i < 10000; i++)
	movl	$0, -16(%rbp)	#, i
# testprog.c:8:   { for (int i = 0 ; i < 10000; i++)
	jmp	.L3	#
.L6:
# testprog.c:9:     { a[i] = 5*i;
	movl	-16(%rbp), %edx	# i, tmp93
	movl	%edx, %eax	# tmp93, tmp94
	sall	$2, %eax	#, tmp94
	leal	(%rax,%rdx), %ecx	#, _1
# testprog.c:9:     { a[i] = 5*i;
	movl	-16(%rbp), %eax	# i, tmp96
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp97
	leaq	a(%rip), %rax	#, tmp98
	movl	%ecx, (%rdx,%rax)	# _1, a[i_11]
# testprog.c:10:       for (int j = 0; j < 10000; j++)
	movl	$0, -12(%rbp)	#, j
# testprog.c:10:       for (int j = 0; j < 10000; j++)
	jmp	.L4	#
.L5:
# testprog.c:11:        { b[j] =  j*j;}
	movl	-12(%rbp), %eax	# j, tmp99
	imull	%eax, %eax	# tmp99, _2
# testprog.c:11:        { b[j] =  j*j;}
	movl	-12(%rbp), %edx	# j, tmp101
	movslq	%edx, %rdx	# tmp101, tmp100
	leaq	0(,%rdx,4), %rcx	#, tmp102
	leaq	b(%rip), %rdx	#, tmp103
	movl	%eax, (%rcx,%rdx)	# _2, b[j_12]
# testprog.c:10:       for (int j = 0; j < 10000; j++)
	addl	$1, -12(%rbp)	#, j
.L4:
# testprog.c:10:       for (int j = 0; j < 10000; j++)
	cmpl	$9999, -12(%rbp)	#, j
	jle	.L5	#,
# testprog.c:12:       a[i] = a[i]+ b[i];
	movl	-16(%rbp), %eax	# i, tmp105
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp106
	leaq	a(%rip), %rax	#, tmp107
	movl	(%rdx,%rax), %edx	# a[i_11], _3
# testprog.c:12:       a[i] = a[i]+ b[i];
	movl	-16(%rbp), %eax	# i, tmp109
	cltq
	leaq	0(,%rax,4), %rcx	#, tmp110
	leaq	b(%rip), %rax	#, tmp111
	movl	(%rcx,%rax), %eax	# b[i_11], _4
# testprog.c:12:       a[i] = a[i]+ b[i];
	leal	(%rdx,%rax), %ecx	#, _5
# testprog.c:12:       a[i] = a[i]+ b[i];
	movl	-16(%rbp), %eax	# i, tmp113
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp114
	leaq	a(%rip), %rax	#, tmp115
	movl	%ecx, (%rdx,%rax)	# _5, a[i_11]
# testprog.c:8:   { for (int i = 0 ; i < 10000; i++)
	addl	$1, -16(%rbp)	#, i
.L3:
# testprog.c:8:   { for (int i = 0 ; i < 10000; i++)
	cmpl	$9999, -16(%rbp)	#, i
	jle	.L6	#,
# testprog.c:7:   for ( int k = 0;  k < 100; k++) 
	addl	$1, -20(%rbp)	#, k
.L2:
# testprog.c:7:   for ( int k = 0;  k < 100; k++) 
	cmpl	$99, -20(%rbp)	#, k
	jle	.L7	#,
# testprog.c:17:   index1 = rand()%10000;
	call	rand@PLT	#
# testprog.c:17:   index1 = rand()%10000;
	movslq	%eax, %rdx	# _6, tmp116
	imulq	$1759218605, %rdx, %rdx	#, tmp116, tmp117
	shrq	$32, %rdx	#, tmp118
	sarl	$12, %edx	#, tmp119
	movl	%eax, %ecx	# _6, tmp120
	sarl	$31, %ecx	#, tmp120
	subl	%ecx, %edx	# tmp120, tmp121
	movl	%edx, -8(%rbp)	# tmp121, index1
	movl	-8(%rbp), %edx	# index1, tmp123
	imull	$10000, %edx, %edx	#, tmp123, tmp122
	subl	%edx, %eax	# tmp122, tmp124
	movl	%eax, -8(%rbp)	# tmp124, index1
# testprog.c:18:   index2 = rand()%10000;
	call	rand@PLT	#
# testprog.c:18:   index2 = rand()%10000;
	movslq	%eax, %rdx	# _7, tmp125
	imulq	$1759218605, %rdx, %rdx	#, tmp125, tmp126
	shrq	$32, %rdx	#, tmp127
	sarl	$12, %edx	#, tmp128
	movl	%eax, %ecx	# _7, tmp129
	sarl	$31, %ecx	#, tmp129
	subl	%ecx, %edx	# tmp129, tmp130
	movl	%edx, -4(%rbp)	# tmp130, index2
	movl	-4(%rbp), %edx	# index2, tmp132
	imull	$10000, %edx, %edx	#, tmp132, tmp131
	subl	%edx, %eax	# tmp131, tmp133
	movl	%eax, -4(%rbp)	# tmp133, index2
# testprog.c:19:   printf(" %d %d %d %d \n", index1, a[index1], index2, b[index2]); 
	movl	-4(%rbp), %eax	# index2, tmp135
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp136
	leaq	b(%rip), %rax	#, tmp137
	movl	(%rdx,%rax), %esi	# b[index2_21], _8
	movl	-8(%rbp), %eax	# index1, tmp139
	cltq
	leaq	0(,%rax,4), %rdx	#, tmp140
	leaq	a(%rip), %rax	#, tmp141
	movl	(%rdx,%rax), %edx	# a[index1_19], _9
	movl	-4(%rbp), %ecx	# index2, tmp142
	movl	-8(%rbp), %eax	# index1, tmp143
	movl	%esi, %r8d	# _8,
	movl	%eax, %esi	# tmp143,
	leaq	.LC0(%rip), %rax	#, tmp144
	movq	%rax, %rdi	# tmp144,
	movl	$0, %eax	#,
	call	printf@PLT	#
# testprog.c:20:   return 0;
	movl	$0, %eax	#, _23
# testprog.c:21: }
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
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

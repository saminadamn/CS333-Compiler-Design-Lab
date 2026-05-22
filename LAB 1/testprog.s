	.file	"testprog.c"
# GNU C17 (Ubuntu 13.3.0-6ubuntu2~24.04) version 13.3.0 (x86_64-linux-gnu)
#	compiled by GNU C version 13.3.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -mtune=generic -march=x86-64 -O2 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	" %d %d %d %d \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64	
	pushq	%r12	#
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movdqa	.LC0(%rip), %xmm4	#, vect_vec_iv_.7
# testprog.c:9:     { a[i] = 5*i;
	movl	$100, %edi	#, ivtmp_10
# testprog.c:6: { 
	pushq	%rbp	#
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movdqa	.LC1(%rip), %xmm3	#, tmp142
	leaq	a(%rip), %rbp	#, tmp143
	pushq	%rbx	#
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	leaq	b(%rip), %rbx	#, tmp144
	leaq	40000(%rbx), %rdx	#, _14
.L2:
# testprog.c:6: { 
	xorl	%ecx, %ecx	# ivtmp.20
	.p2align 4,,10
	.p2align 3
.L4:
# testprog.c:9:     { a[i] = 5*i;
	leal	(%rcx,%rcx,4), %esi	#, tmp105
	leaq	b(%rip), %rax	#, ivtmp.16
	movdqa	%xmm4, %xmm2	# vect_vec_iv_.7, vect_vec_iv_.7
	.p2align 4,,10
	.p2align 3
.L3:
	movdqa	%xmm2, %xmm0	# vect_vec_iv_.7, vect_vec_iv_.7
	addq	$16, %rax	#, ivtmp.16
	paddd	%xmm3, %xmm2	# tmp142, vect_vec_iv_.7
# testprog.c:11:        { b[j] =  j*j;}
	movdqa	%xmm0, %xmm1	# vect_vec_iv_.7, tmp110
	pmuludq	%xmm0, %xmm1	# vect_vec_iv_.7, tmp110
	psrlq	$32, %xmm0	#, tmp112
	pmuludq	%xmm0, %xmm0	# tmp112, tmp111
	pshufd	$8, %xmm1, %xmm1	#, tmp110, tmp108
	pshufd	$8, %xmm0, %xmm0	#, tmp111, tmp109
	punpckldq	%xmm0, %xmm1	# tmp109, vect__2.8
# testprog.c:11:        { b[j] =  j*j;}
	movaps	%xmm1, -16(%rax)	# vect__2.8, MEM <vector(4) int> [(int *)_2]
	cmpq	%rax, %rdx	# ivtmp.16, _14
	jne	.L3	#,
# testprog.c:12:       a[i] = a[i]+ b[i];
	movl	(%rbx,%rcx,4), %eax	# MEM[(int *)&b + ivtmp.20_20 * 4], tmp105
	addl	%esi, %eax	# tmp105, tmp105
# testprog.c:12:       a[i] = a[i]+ b[i];
	movl	%eax, 0(%rbp,%rcx,4)	# tmp118, MEM[(int *)&a + ivtmp.20_20 * 4]
# testprog.c:8:   { for (int i = 0 ; i < 10000; i++)
	addq	$1, %rcx	#, ivtmp.20
	cmpq	$10000, %rcx	#, ivtmp.20
	jne	.L4	#,
# testprog.c:7:   for ( int k = 0;  k < 100; k++) 
	subl	$1, %edi	#, ivtmp_10
	jne	.L2	#,
# testprog.c:17:   index1 = rand()%10000;
	call	rand@PLT	#
# testprog.c:17:   index1 = rand()%10000;
	movslq	%eax, %rdx	# _5, _5
	movl	%eax, %ecx	# _5, tmp124
	imulq	$1759218605, %rdx, %rdx	#, _5, tmp121
	sarl	$31, %ecx	#, tmp124
	sarq	$44, %rdx	#, tmp123
	subl	%ecx, %edx	# tmp124, tmp123
	imull	$10000, %edx, %ecx	#, index1, tmp125
	subl	%ecx, %eax	# tmp125, _5
	movl	%eax, %r12d	# _5, index1
# testprog.c:18:   index2 = rand()%10000;
	call	rand@PLT	#
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	%r12d, %edx	# index1,
	movl	$2, %edi	#,
	leaq	.LC2(%rip), %rsi	#, tmp138
# testprog.c:18:   index2 = rand()%10000;
	movslq	%eax, %r8	# _6, _6
	movl	%eax, %ecx	# _6, tmp130
	imulq	$1759218605, %r8, %r8	#, _6, tmp127
	sarl	$31, %ecx	#, tmp130
	sarq	$44, %r8	#, tmp129
	subl	%ecx, %r8d	# tmp130, index2
	imull	$10000, %r8d, %ecx	#, index2, tmp131
	subl	%ecx, %eax	# tmp131, _6
# testprog.c:19:   printf(" %d %d %d %d \n", index1, a[index1], index2, b[index2]); 
	movslq	%r12d, %rcx	# index1, index1
# testprog.c:18:   index2 = rand()%10000;
	movl	%eax, %r8d	# _6, index2
# testprog.c:19:   printf(" %d %d %d %d \n", index1, a[index1], index2, b[index2]); 
	cltq
# /usr/include/x86_64-linux-gnu/bits/stdio2.h:86:   return __printf_chk (__USE_FORTIFY_LEVEL - 1, __fmt, __va_arg_pack ());
	movl	0(%rbp,%rcx,4), %ecx	# a[index1_17], a[index1_17]
	movl	(%rbx,%rax,4), %r9d	# b[index2_19],
	xorl	%eax, %eax	#
	call	__printf_chk@PLT	#
# testprog.c:21: }
	popq	%rbx	#
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax	#
	popq	%rbp	#
	.cfi_def_cfa_offset 16
	popq	%r12	#
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.globl	b
	.bss
	.align 32
	.type	b, @object
	.size	b, 200000
b:
	.zero	200000
	.globl	a
	.align 32
	.type	a, @object
	.size	a, 200000
a:
	.zero	200000
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
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

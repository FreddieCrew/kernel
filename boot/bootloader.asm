.section .bootstrap_stack
stack_bottom:
.skip 16384
stack_top:

.section .text
.global _start
_start:
	movl $stack_top, %esp
	push %ebx
	call kmain
	cli

hang:
	hlt
	jmp hang

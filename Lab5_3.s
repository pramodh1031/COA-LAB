	.data
arr: .word 2 10 5 4 50 12 54 3
end:
result:	.asciiz "even sum is "
	.text
	.globl main
main:
	li $t0, 0	# int evensum = 0
	la $t1, arr	# arr
	la $t2, end	# end
	subu $t2, $t2, $t1
	srl $t2, $t2, 2	# length of array
	li $t5, 0	# int i = 0
loop:	bge $t5, $t2, exit
	mul $t4, $t5, 4
	add $t3, $t4, $t1
	lw $t6, 0($t3)
	andi $t7, $t6, 1
	bne $t7, $0, looplast
	add $t0, $t0, $t6
looplast:
	addi $t5, $t5, 1
	b loop
exit:	la $a0, result
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
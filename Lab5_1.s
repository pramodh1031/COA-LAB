	.data
x:	.asciiz "x = "
y:	.asciiz "\ny = "
	.text
	.globl main
main:
	li $t3, 1	# int x = 1
	li $t4, 0	# int y = 0
	beq $t3, $0, zero	# if(x == 0)
	li $t1, 1
	beq $t3, $t1, one	# else if(x == 1)
	li $t4, 100	# y = 100
	b exit
one:	addi $t4, $t4, -1	# y--
	b exit
zero:	addi $t4, $t4, 1	# y++
exit:	la $a0, x
	li $v0, 4
	syscall
	move $a0, $t3
	li $v0, 1
	syscall
	la $a0, y
	li $v0, 4
	syscall
	move $a0, $t4
	li $v0, 1
	syscall
	li $v0, 10
	syscall
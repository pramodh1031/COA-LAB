	.data
first:	.asciiz "a = "
second:	.asciiz "\nb = "
third:	.asciiz "\nm = "
	.text
	.globl main
main:
	li $t6, 2	# int a = 2
	li $t7, 10	# int b = 10
	li $t0, 0	# int m = 0
loop:	ble $t6, $0, exit	# while (a > 0)
	add $t0, $t0, $t7	# m += b
	addi $t6, $t6, -1	# a -= 1
	b loop		# loop
exit:	la $a0, first
	li $v0, 4
	syscall
	move $a0, $t6
	li $v0, 1
	syscall
	la $a0, second
	li $v0, 4
	syscall
	move $a0, $t7
	li $v0, 1
	syscall
	la $a0, third
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
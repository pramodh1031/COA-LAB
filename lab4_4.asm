
	.data
n:	.word 7
	
	.text
 	.globl main
main:	li $t0,1
	li $t1,1
	lw $t2,n
	beq $t2,1,ap
	beq $t2,2,bp
	addiu $t3,$t2,-1
loop:	add $t4,$t0,$t1
	move $t0,$t1
	move $t1,$t4
	addiu $t3,$t3,-1
	beq $t3,1,Exit
	j loop
ap:	move $a0,$t0
	j Exit
bp:	move $a0,$t1
Exit:	move $a0,$t4
	li $v0,1
	syscall
	jr $ra
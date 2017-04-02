# Realizar a opera��o for(i=0;i<5000;i++){printf("%d\n", i);}
.data
	i: .word 0 # Inicializa a vari�vel i com o valor 0
	lenght: .word 5000 # Determina o valor da condi��o de parada do loop
	space: .asciiz "\n"
.text
	main:
	lw $t0, i # Carrega da mem�ria para o registrador $t0
	lw $t1, lenght # Carrega da mem�ria para o registrador $t1
	la $s4, space

	Loop:
	slt $t2, $t0, $t1 # Verifica se i � menor do que lenght e coloca 1 em $t2 se realmente for
	bne $t2, 1, Exit # Se tiver 1 em $t2, que corresponde a i < 10, pula para a proxima intru��o, caso contrario encerra o loop (break?)
	
	jal Print # Chama a fun��o para imprimir o inteiro juntamente com a quebra de linha
	
	addi $t0, $t0, 1 # Realiza a opera��o do loop: i = i + 1
	j Loop # Retorna ao Label Loop

	Exit:	
	li $v0, 10 # Padr�o para finalizar o programa
	syscall # Chamada ao sistema
	
	Print:
	li $v0, 1 # Padr�o para a impress�o de inteiros
	add $a0, $zero, $t0 # Colocar o endere�o do conte�do a ser impresso em $a0
	syscall # Chamada ao sistema
	
	li $v0, 4 # Padr�o para a impress�o de strings
	add $a0, $zero, $s4 # Colocar o endere�o do conte�do a ser impresso em $a0
	syscall # Chamada ao sistema
	
	jr $ra # Retornar uma instru��o ap�s a fun��o ser chamada
# Realizar a operação for(i=0;i<5000;i++){printf("%d\n", i);}
.data
	i: .word 0 # Inicializa a variável i com o valor 0
	lenght: .word 5000 # Determina o valor da condição de parada do loop
	space: .asciiz "\n"
.text
	main:
	lw $t0, i # Carrega da memória para o registrador $t0
	lw $t1, lenght # Carrega da memória para o registrador $t1
	la $s4, space

	Loop:
	slt $t2, $t0, $t1 # Verifica se i é menor do que lenght e coloca 1 em $t2 se realmente for
	bne $t2, 1, Exit # Se tiver 1 em $t2, que corresponde a i < 10, pula para a proxima intrução, caso contrario encerra o loop (break?)
	
	jal Print # Chama a função para imprimir o inteiro juntamente com a quebra de linha
	
	addi $t0, $t0, 1 # Realiza a operação do loop: i = i + 1
	j Loop # Retorna ao Label Loop

	Exit:	
	li $v0, 10 # Padrão para finalizar o programa
	syscall # Chamada ao sistema
	
	Print:
	li $v0, 1 # Padrão para a impressão de inteiros
	add $a0, $zero, $t0 # Colocar o endereço do conteúdo a ser impresso em $a0
	syscall # Chamada ao sistema
	
	li $v0, 4 # Padrão para a impressão de strings
	add $a0, $zero, $s4 # Colocar o endereço do conteúdo a ser impresso em $a0
	syscall # Chamada ao sistema
	
	jr $ra # Retornar uma instrução após a função ser chamada
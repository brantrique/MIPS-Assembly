.data
	nomeArquivo: .asciiz "db.txt"
	msgUsuario: .asciiz "MENU\n1-Cadastrar\n2-Editar\n3-Excluir\n4-Consultar\n5-Encerrar\nOpção: "
	msgCadastrar: .asciiz "Você selecionou a opção de cadastro!\n"
	msgEditar: .asciiz "Você selecionou a opção de edição!\n"
	msgExcluir: .asciiz "Você selecionou a opção de exclusão!\n"
	msgConsultar: .asciiz "Você selecionou a opção de consulta!\n"
	msgEncerrar: .asciiz "\nPrograma encerrado...\n"
	quebraCampo: .asciiz ";"
	quebraLinha: "\n"
	
	nomeCad: .asciiz "Nome: "
	
	nome: .asciiz
	telefone: .asciiz
.text
.globl main
main:
	menu:
	
######### Imprime o Menu ################################################################################
	li $v0, 4
	la $a0, msgUsuario
	syscall

	li  $v0, 5
	syscall
	
	beq $v0, 1, cadastrar
	beq $v0, 2, editar
	beq $v0, 3, excluir
	beq $v0, 4, consultar
	beq $v0, 5, encerrar
	 
##########################################################################################################
	cadastrar:
		li $v0, 4
		la $a0, msgCadastrar
		syscall
		
############### Criação do arquivo txt $ Verifica se já está aberto #######################################
		li $v0, 13
		la $a0, nomeArquivo
		li $a1, 1
		li $a2, 0
		syscall
		move $s6, $v0
############### Adicionando dados ao arquivo txt criado ###################################################
		
		li $v0, 4
		la $a0, nomeCad
		syscall
		
		li $v0, 8
		la $a0, nome
		li $a1, 30
		syscall

		li $v0, 15
		move $a0, $s6
		la $a1, nome
		li $a2, 24
		syscall
		
		li $v0, 15
		move $a0, $s6
		la $a1, quebraCampo # ;
		li $a2, 1
		syscall
		
		li $v0, 15
		move $a0, $s6
		la $a1, quebraLinha # \n
		li $a2, 1
		syscall
	
############### Fechar o arquivo ############################################################################
 		li   $v0, 16
		move $a0, $s6  
 		syscall           
		
		j encerrar
###########################################################################################################
	editar:
		li $v0, 4
		la $a0, msgEditar
		syscall
		
		j encerrar

	excluir:
		li $v0, 4
		la $a0, msgExcluir
		syscall
		
		j encerrar

	consultar:
		li $v0, 4
		la $a0, msgConsultar
		syscall
		
		j encerrar
		
	encerrar:
		li $v0, 4
		la $a0, msgEncerrar
		syscall
		
		li $v0, 10
		syscall

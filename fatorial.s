	.data
	#Declaracao de variaveis
	inicialMsg: .asciiz "Digite o numero para o calculo do fatorial: \n"
	resultMsg:  .asciiz "Resultado do fatorial: "
		
	.text
main:	
	#Solicita ao usuario o numero para calcular o fatorial
	li 		$v0, 4 
	la 		$a0, inicialMsg
	syscall

	# Le o numero inteiro digitado
	li 		$v0, 5 
	syscall
	
	addi 	$s0, $v0, 0 	# Grava o numero digitado no registrador $s0	
	addi 	$s1, $s0, 0 	# O registrador s1 tambem recebe o valor digitado
	
	sub  	$s2, $s0, 1     # Recebe n - 1 
	Ifor:
		sgt  $t0, $s2, 1  	# Se N - 1 > 1
		beq  $t0, 0, Ffor 	# Se 0 (false), jump Ffor
		mul  $s1, $s1, $s2  # Multiplicar com o antecessor
		
		sub  $s2, $s2, 1    # $S2 = $S2 - 1
	j Ifor
	Ffor:
	
	#Impressao da mensagem de resultado
	li $v0, 4 
	la $a0, resultMsg
	syscall
	
	#Impressao do resultado
	li $v0, 1
	la $a0, ($s1)	
	syscall	

	jr $ra
	
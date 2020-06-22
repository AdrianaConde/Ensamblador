;Adriana Conde
;multiplicacion estatica
;15 de junio de 2020

section .data
	resultado db "El resultado es: ", 10
	len equ $-resultado
	new_line db "",10
	len_new_line equ $-new_line

section .bss
	multiplicacion resb 1

section .text
	global_start
_star:
	mov eax, 3
	mov ebx, 2
	mul ebx		;eax=eax*ebx
	add eax, '0'	
	mov [multiplicacion], eax	

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len 
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, multiplicacion
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h

	mov eax,1 
	int 80h
; Adriana Conde
; suma de dos numero estaticos, no ingresados por teclado
; 10 de junio de2020

section .data
	resultado db "El resultado es: ", 10
	len equ $-resultado
	new_line db "",10
	len_new_line $-new_line

section .bss
	suma resb 1

section .text
	global_start
_star:
	mov eax, 6
	mov ebx, 2
	add eax, ebx	; eax= eax+ebx
	add eax, '0'	; establecer ajuste
	mov [suma], eax	;respaldar el valor de a suma
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len 
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, suma
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h

	mov eax,1 
	int 80h
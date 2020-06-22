;Adriana Conde
;division estatica
;15 de junio de 2020

section .data
	resultado db "El resultado es: ", 10
	len equ $-resultado
	res_residuo db "El resto es: ", 10
	new_line db "",10
	len_new_line equ $-new_line	
	len_residuo equ $-res_residuo
	new_line2 db "",10
	len_new_line2 equ $-new_line2

section .bss
	residuo resb 1
    cociente resb 1

section .text
	global_start
_star:
	mov al, 6
	mov bh, 2
	div bh
	add al, '0'	
	mov [cociente], al
	add ah, '0'	
	mov [residuo], ah		

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, len 
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, cociente
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, res_residuo
	mov edx, len_residuo
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, residuo
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line2
	mov edx, len_new_line2
	int 80h

	mov eax,1 
	int 80h

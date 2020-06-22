; Adriana Conde
; imprimir la suma de numeros ingresados por teclado
;  10 de juniio de 2020
section .data
	; mensajes 1
	num db 'Ingrese primer numero '
	len_num equ $-num
	; mensaje 2
	numb db 'Ingrese segundo numero'
	len_num equ $-num
	
	mensaje db 'El numero  es ', 10
	len_mensaje equ $-mensaje
	new_line db "",10
	len_new_line equ $-new_line


section .bss
	a resb 1
	b resb 1
	suma resb 1

section .text
	global_start
_start:
	;-------imprimir el valor mnsaje 1-----
	mov eax,4
	mov ebx,1	
	mov ecx, num
	mov edx, len_num
	int 80h
	;-------leer el valor mnsaje 1-----
	mov eax,3
	mov ebx,2	
	mov ecx,a
	mov edx,2
	int 80h

	;-------imprimir el valor mnsaje 2-----
	mov eax, 3
	mov ebx, 2
	mov ecx, numb	
	mov edx, len_numb
	int 80h 
	;-------leer el valor mnsaje 2-----
	mov eax,3
	mov ebx,2	
	mov ecx,b
	mov edx,2
	int 80h

	mov ax, [a]
	mov bx, [b]
	;sub resta de valor
	sub ax, '0'	; valores transformados en digitos
	sub bx, '0'	; valores transformados en digitos
	add ax, bx	; ax= ax+bx
	add ax, '0'	; establecer ajuste

	mov [suma], ax	;respaldar el valor de a suma

	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_mensaje
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h

	mov eax,1 
	int 80h
	
	
	

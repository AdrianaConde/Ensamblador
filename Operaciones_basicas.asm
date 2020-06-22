;Adriana Conde
;17 de Junio de 2020

section .data
	resultado_s db "El resultado de la suma es: ", 10
	len_s equ $-resultado_s
	resultado_r db "El resultado de la resta es: ", 10
	len_r equ $-resultado_r
	resultado_m db "El resultado de la multiplicacion es: ", 10
	len_m equ $-resultado_m
		resultado_d db "El resultado de la division es: ", 10
	len_d equ $-resultado_d
	res_residuo db "El resto es: ", 10
	len_residuo equ $-res_residuo
	new_line db "",10
	len_new_line equ $-new_line


section .bss
	; ***SUMA*****
	suma resb 1
	; ***RESTA****
	resta resb 1
	; **MULTIPLICACION***
	multiplicacion resb 1
	;******DIVISION****
	residuo resb 1
   	cociente resb 1

section .text
	global_start
_star:
;************SUMA*************************
	mov eax, 4
	mov ebx, 2
	add eax, ebx	; eax= eax+ebx
	add eax, '0'	; establecer ajuste
	mov [suma], eax	;respaldar el valor de a suma
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_s
	mov edx, len_s 
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

;*******RESTA********
	mov eax, 4
	mov ebx, 2
	sub eax, ebx	
	add eax, '0'	
	mov [resta], eax	

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_r
	mov edx, len_r 
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, resta
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h


;*********MULTIPLICACION****
	mov eax, 4
	mov ebx, 2
	mul ebx		;eax=eax*ebx
	add eax, '0'	
	mov [multiplicacion], eax	

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_m
	mov edx, len_m
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

;**********DIVISION**********
	mov al, 4
	mov bh, 2
	div bh
	add al, '0'	
	mov [cociente], al
	add ah, '0'	
	mov [residuo], ah		

	mov eax, 4
	mov ebx, 1
	mov ecx, resultado_d
	mov edx, len_d 
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
	mov ecx, new_line
	mov edx, len_new_line
	int 80h

	mov eax,1 
	int 80h

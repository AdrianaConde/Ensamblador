;Adriana Conde
;17 de Junio de 2020

%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%1
	int 80h
%endmacro

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
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	residuo resb 1
   	cociente resb 1

section .text
	global_start
_star:
;************SUMA*************************
	mov al, 4
	mov bl, 2
	add al, bl	
	add al, '0'	
	mov [suma], al	
	
	imprimir resultado_s, len_s
	imprimir suma, 1

;*******RESTA********
	mov al, 4
	mov bl, 2
	sub al, bl	
	add al, '0'	
	mov [resta], al	

	imprimir resultado_r, len_r
	imprimir resta, 1

;*********MULTIPLICACION****
	mov al, 4
	mov bl, 2
	mul bl		;eax=eax*ebx
	add al, '0'	
	mov [multiplicacion], al	

	imprimir resultado_m, len_m
	imprimir multiplicacion, 1

;**********DIVISION**********
	mov al, 4
	mov bh, 2
	div bh
	add al, '0'	
	mov [cociente], al
	add ah, '0'	
	mov [residuo], ah
		
	imprimir resultado_d, len_d
	imprimir cociente, 1
	imprimir residuo, 1

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, len_new_line
	int 80h

	mov eax,1 
	int 80h
	

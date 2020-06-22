;Adriana Conde
; 22 de Junio de 2020
%macro leer 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

%macro imprimir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%1
	int 80h
%endmacro

section .data
;------------------------------------------
	num1 db 'Ingrese primer numero ',10
	len_num1 equ $-num1
	
	num2 db 'Ingrese segundo numero ',10
	len_num2 equ $-num2
;------------------------------------------
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
	a resb 1
	b resb 1
	suma resb 1
	resta resb 1
	multiplicacion resb 1
	residuo resb 1
   	cociente resb 1

section .text
	global _start 
_start:
;*********ingesar numeros*****************
	imprimir num1,len_num1
	leer a,2
	imprimir num2, len_num2
	leer b,2
;************SUMA***********	
	mov al, [a]
	sub al,'0' 	;convertir cadea a entero
	mov bl, [b]
	sub bl,'0'

	add al, bl	
	add al, '0'	
	mov [suma], al	
	
	imprimir resultado_s, len_s
	imprimir suma, 1

;*******RESTA********
	mov al, [a]
	sub al,'0' 	;convertir cadea a entero
	mov bl, [b]
	sub bl,'0'

	sub al, bl	
	add al, '0'	
	mov [resta], al	

	imprimir resultado_r, len_r
	imprimir resta, 1

;*********MULTIPLICACION****
	mov al, [a]
	sub al,'0' 	;convertir cadea a entero
	mov bl, [b]
	sub bl,'0'

	mul bl		;eax=eax*ebx
	add al, '0'	
	mov [multiplicacion], al	

	imprimir resultado_m, len_m
	imprimir multiplicacion, 1

;**********DIVISION**********
	mov al, [a]
	sub al,'0' 	;convertir cadea a entero
	mov bl, [b]
	sub bl,'0'

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
	

;Adriana Conde
;Clase3 Miercoles 10 de Junio

section .data
	mensaje db 'Ingrese un numero', 10
	len_mensaje equ $-mensaje
	mensaje_presentacion db 'El numero ingresado es',10
	len_mensaje_presentacion equ $-mensaje_presentacion

section .bss
	numero resb 5
section .text
	global_start
_star:
	;************imprime mensaje***********
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje
	mov edx, len_mensaje
	int 80h

	;*****asignacion de un numero en variable*****
;---- se puede hacer pero el valor que da es ASCII
	mov ebx,55 		; registro de proposito general (codig ASCII)
	mov [numero],ebx	; para asignar el valor
;----como debe ser 
	mov ebx, 7
	add ebx, '0'
	mov [numero],ebx

	;*******imprime mensaje presentacion*******
	mov eax, 4
	mov ebx, 1
	mov ecx, mensaje_presentacion
	mov edx, len_mensaje_presentacion
	int 80h

	; ************imprime numero**************
	mov eax, 4	; define tipo de operacion
	mov ebx, 1	; estandar de entrada
	mov ecx, numero	;lo que captura el teclado
	mov edx, 5	; numero de caracteres
	int 80h		; interrupcion de gnu linux

	; ************salir del sistema**************
	mov eax, 1
	int 80h

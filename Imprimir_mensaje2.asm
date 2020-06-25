;Adriana Conde
;Clase2 08/06 Lunes

section.data
	li db "089988"		;1byte(+4 caaracteres)
	len EQU $-li		;calcular n caracteres

section.bss
	nombre resb 2 			; usa 2 carateres: el 2 y el enter

section .text
	global_start:
		mov eax,4	;subrutina
		mov ebx,0	;estandar
		mov ecx,li	;variable o constante
		mov edx,len	; n caracteres
		int 80h		;interrupcion
;cierre de programa
		mov eax,1
		mov ebx,0
		int 80h

;(no hay segmento de pila)
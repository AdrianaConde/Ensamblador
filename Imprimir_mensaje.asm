;Adriana Conde
;Clase1 (01/06/2020)

;Proceso de compilacion y ejecucion
section .data				       ; agrupa constantes
	mensaje db "Mi primera vez con NASM"  ; constante en un byte de memoria
	longitud equ $-mensaje		      ; longitud que calcula# caracteres de mensaje
;section .bss 				      ; establece todas las variables

section .text
	global _start (Windows global _main)
_start:
	; *****imprimir el mensaje*****
	mov eax, 4 	  ; tipo de subrutina => escritura, salida
	mov ebx, 1 	  ; tipo de estandar, (1) por teclado, tipo de salida
	mov ecx, mensaje  ; registro ecx almacena la referencia a imprimir "mensaje"
	mov edx, longitud ; registro edx almacena la referencia a imprimir por # caracteres
	int 80h		  ; interrupcion de sw para el softw.linux

	mov eax, 1	  ; salida del programa, system_exit, sys_exit
	mov ebx, 0	  ; si el remoto es 0 (200 en la web) => ok
	int 80h


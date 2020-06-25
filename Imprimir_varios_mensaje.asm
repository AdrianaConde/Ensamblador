;Adriana Conde
;Clase2 08/06 Lunes

;Proceso de compilacion y ejecucion
section .data				       
	nombre db "Adriana",10
	len_nombre equ $-nombre	

	apellidos db "Conde",10
	len_apellido equ $-apellidos      				      
	
	materia db "Ensamblador",10
	len_materia equ $-Ensamblador

	genero db "F",10
	len_genero equ $-F

section .text
	global _start
_start:
	; *****imprimir el mensaje*****
	mov eax, 4 	  ; subrutina
	mov ebx, 0	  ; estandar
	mov ecx, nombre  ; imprimir "mensaje"
	mov edx, len_nombre ; imprimir por # caracteres
	int 80h		  ; interrupcion

	mov eax, 4 	  ; subrutina
	mov ebx, 0	  ; estandar
	mov ecx, apellido; imprimir "mensaje"
	mov edx, len_apellido ; imprimir por # caracteres
	int 80h		  ; interrupcion

	mov eax, 4 	  ; subrutina
	mov ebx, 0	  ; estandar
	mov ecx, materia ; imprimir "mensaje"
	mov edx, len_materia ; imprimir por # caracteres
	int 80h		  ; interrupcion

	mov eax, 4 	  ; subrutina
	mov ebx, 0	  ; estandar
	mov ecx, genero  ; imprimir "mensaje"
	mov edx, len_genero ; imprimir por # caracteres
	int 80h		  ; interrupcion

	mov eax, 1	  ; salida del programa, system_exit, sys_exit
	mov ebx, 0	  ; si el remoto es 0 (200 en la web) => ok
	int 80h
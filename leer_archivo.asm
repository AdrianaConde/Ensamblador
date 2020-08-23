;Adriana Conde
;Clase 19 de agosto de 2020

%macro escribir 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

segment .data
	msj1 db "Leer el archivo", 10
	len_msj1 equ $-msj1

	archivo db "/home/ac/Documents/6To/archivo.txt"

segment .bss
	texto resb 30
	id_archiv resd 1

segment .text
	global _start

_start:
	; ************* abrir archivo ***********
	mov eax, 5		;operacion de abrir
	mov ebx, archivo	; direccion del archivo
	mov ecx, 0		
	mov edx, 777h
	int 80h
	
	test eax, eax		
	jz salir	
	
	mov dword [id_archiv], eax

	escribir msj1, len_msj1
	
	; ********** leer archivo *************
	mov eax, 3
	mov ebx, [id_archiv]	
	mov ecx, texto		
	mov edx, 15
	int 80h
	
	escribir texto, 15
	
	; *********** cerrar archivo *******
	mov ebx, [id_archiv]	
	mov ecx, 0		
	mov edx, 0
	int 80h
	
salir:
	mov eax, 1
	int 80h
	
	

;Adriana Conde
;Clase 19 de agosto de 2020
; 

%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

segment .data
	msj1 db "Ingrese datos en el archivo", 10
	len1 equ $-msj1

	archivo db"/home/ac/Documents/6To/archivo.txt"
segment .bss
	texto resb 30
	id_archiv resd 1

segment .text
	global _start
_start:
	mov eax, 8	;servicio para crear archivos,trabajar con archivos
	mov ebx, archivo	; direccion del archivo
	mov ecx, 1		;modo de acceso  
					;--> O-RDONLY 0: El archivo se abre solo para leer
					;--> O-WDONLY 1: El archivo se abre para escritura
					;--> O-RDWR 2: El archivo se abre para escritura y lectura
					;--> O-CREATED 256: Crea el archivo si no existe
					;--> O-APPEND 2000h: El archivo se abre solo para escritura al final	
	
	mov edx,777h
	int 80h

	test eax,eax	;Instruccion de comparacion realiza la operacion logica "Y" de dos operandos
			;NO afecta a ninguno, SOLO al registro de estado
				;TEST reg,reg
				;TEST reg,mem
				;TEST mem,reg
				;TEST reg,inmediato
				;TEST mem,inmediato
	jz salir	;se ejecuta cuando existe errores en archivo

	escribir msj1,len1
	
	mov dword [id_archiv],eax
	call leer
	; ***********escritura archivo**********
	mov eax, 4
	mov ebx, [id_archiv]
	mov ecx, texto
	mov edx, 15
	int 80h
salir:
	mov eax, 1 
	int 80h

leer:
	mov eax, 3
	mov ebx, 2
	mov ecx, msj1
	mov edx, 15
	int 80h
	ret

;Adriana Conde
;Clase, 12 de octubre de 2020

segment .datacd 
	arreglo db 3,2,0,7,5
	len_arreglo equ $-arreglo
	new_line db 10, ""

segment .bss
	num resb 1

segment .text
	global _start
_start:
	mov esi, arreglo ; esi = fijar tamanio del arreglo, posicionar en memoria
	mov edi, 0 	 ; edi= contener el indice de arreglo

imprimir:
	mov al,[esi]
	add al,'0'
	mov [num],al

	add esi,1
	add edi,1	; [edi]
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, new_line
	mov edx, 1
	int 80h

	cmp edi,len_arreglo	;cmp 3,4 => activa carry
				;cmp 4,3 => desactiva carry y zero
				;cmp 3,3 => desactiva carry y activa zero
	jb imprimir		; se activa cuando la bandera carry=0

salir:
	mov eax,1
	int 80h

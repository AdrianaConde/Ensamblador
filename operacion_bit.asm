;Adriana Conde
;lunes, 06 de julio
section .data
	par_msg db 'Numero Par'
	len1 equ $-par_msg

	impar_msg db 'Numero Impar'
	len2 equ $ -impar_msg

section .text
	global _start

_start:
	mov ax,9
	and ax,1
	jz par
	jmp impar
par:
	mov ax,4
	and ax,1
	mov ecx, par_msg
	mov edx, len1
	int 80h
	jmp salir
impar:
	mov ax,4
	and ax,1
	mov ecx, impar_msg
	mov edx, len2
	int 80h
	jmp salir
salir:
	mov eax,1
	int 80h

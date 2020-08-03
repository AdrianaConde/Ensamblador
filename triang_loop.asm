;Adriana Conde
;Lunes,03 de agosto de 2020

section .data
	asterisco db '*'
	new_line db 10, ''
section .text
	global _start
_start:
	mov ecx,8
	mov ebx,1
l1:
	push rcx
	push rbx
	mov ecx,ebx

l2:
;------loop de colum------
	push rcx
	;----Asterisco----
	mov eax,4
	mov ebx,1
	mov ecx,asterisco
	mov edx,1
	int 80h
	pop rcx
	loop l2

	;-----Nueva Linea----
	mov eax,4
	mov ebx,1
	mov ecx,new_line
	mov edx,1
	int 80h

;------loop de filas------
	pop rbx
	pop rcx
	inc ebx	
	loop l1

; ------salir---------
	mov eax,1
	int 80h

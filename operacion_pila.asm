;Adriana Conde
;Miercoles , 22 de julio de 2020

; imprimir ******

section .data 
	asterisco db '*'

section .text
	global _start
_start:
	mov rcx,9

imprimir:
	dec rcx
	push rcx
	mov rax,4
	mov rbx,1
	mov rcx,asterisco
	mov rdx,1
	int 80h
	pop rcx		; siempre un push y pop
	cmp rcx,0	; condicion
	jnz imprimir
	;jmp imprimir

	mov rax,1
	int 80h


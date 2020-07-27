;Adriana Conde 
;27 de julio de 2020

%macro imprimir 1
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,1
	int 80h
%endmacro

section .data 
	asterisco db '*'
	line db "",10

section .text
	global _start
_start:
	mov rbx,9	;fila
	mov rcx, 9	;columna

principal:
	push rbx
	cmp rbx,0
	jz salir ; Salta si es 0
	jmp colum
	pop rbx

colum:
	dec rcx
	push rcx
	imprimir asterisco	;cx = asterisco
	pop rcx		
	cmp rcx,0		
	jg column	;(jnz colum) jg operando prim>seg  
	imprimir line

	pop rbx
	dec rbx
	mov rcx,9
	pop rbx		
	jmp principal

salir:
	mov rax,1
	int 80h


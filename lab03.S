.intel_syntax noprefix

.data
expression:
	.string "6523+8-+3+-"

format:
	.asciz "%d"

.text
.global main
main:
	mov rcx, 0
	lea rsi, expression
	mov rax, 0

read:
	mov al, [rsi]
	cmp al, 48
	jge number
	cmp al, '+'
	je adder
	cmp al, '-'
	je subber
	cmp al, 0
	je checkstack
	inc rsi
	inc rcx
	jmp read

number:
	push rax
	inc rcx
	jmp nextsymbol

nextsymbol:
	sub rax, 48
	inc rsi
	inc rcx
	jmp read

adder:
	pop r9
	dec rcx
	pop r8
	dec rcx
	add r8, r9
	push r8
	jmp nextsymbol

subber:
	pop r9
	dec rcx
	pop r8
	dec rcx
	cmp r9, r8
	jl smaller
	cmp r9, r8
	jg greater

smaller:
	sub r8, r9
	push r8
	jmp nextsymbol

greater:
	sub r9, r8
	push r9
	jmp nextsymbol


checkstack:
	cmp rcx, 0
	je printer

printer:
	push rax
	push rcx
	lea rdi, [format]
	mov rsi, rax
	xor rax, rax
	call printf
	pop rcx
	pop rax
	jmp exit

exit:
	ret

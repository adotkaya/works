.intel_syntax noprefix
.data

array:
	.byte 3, 9, 8, 9, 1

format:
	.asciz "%d\n"

.text

.global main
main:
	lea rax, array
	mov rsi, 0 /* i */
	mov rbx, 0 /* j */
	mov ecx, 4 /* outloop counter size */
	mov rdx, 5 /* inloop counter size */

myOutloop:
	cmp rsi, ecx
	jne myOutloopDone
myInloop:
	cmp rsi, rbx
	jne notEqu
	cmp [array+rsi], [array+rbx]
	je notEqu
	cmp rbx, rdx
	je myInloopDone
	inc rbx
	inc rsi
	jmp myInloop
myInloopDone:
	jmp myOutloop
myOutloopDone:
	ret
notEqu:
	xor rax, rax
	xor rcx, rcx

print:
	push rax
	push rcx
	lea rdi, [format]
	mov rsi, rax
	xor rax, rax
	call printf
	pop rcx
	pop rax

exit:
	ret

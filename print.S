/*
 * print.S
 *
 *  Created on: Mar 3, 2022
 *      Author: student
 */

 .intel_syntax noprefix
.data
	number_format:
		.string "%d "
	char_format:
		.string "%c"

# rdi -> data to be printed
# rsi -> print format
.global print
print:

	#prologue
	push rax
	push rcx

	#body
	mov rax, rdi
	mov rcx, rsi
	lea rdi, [rsi]
	mov rsi, rax
	xor rax, rax
	call printf

	#epilogue
	pop rcx
	pop rax
ret



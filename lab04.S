.intel_syntax noprefix
.data
	number_format:
		.string "%d "
	char_format:
		.string "%c"
	expression:
		.string "(2455+233)x(268x(23+988))"
	values:
		.string "2455,233,268,23,988"
	number:
		.skip 1000

.text

.global main
main:

	lea rdi, [expression]
	call extract_numbers
ret

.global extract_numbers
extract_numbers:
	mov rcx, rdi
	xor r10, r10
	outerloop:
		mov r10b, BYTE PTR [rcx]
		cmp r10b, 0
		je outerloopEnd

		mov rdi, r10
		lea rsi, [number_format]
		call print

		inc rcx
		jmp outerloop
	outerloopEnd:
		mov rax, 0
ret




numberOcc:
	push r10
	inc rsi
	mov r8, 10
	pop r10
	mov rax, r10
	mul r8
	add rax, rdx
	push rax

	jmp outerloop





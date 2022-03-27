.intel_syntax noprefix
.text

.global linked_stack_init
linked_stack_init:
	mov rdi, 8
	call malloc
	xor rcx, rcx
	mov [rax], rcx

ret

.global linked_stack_push
linked_stack_push:
	push rdi
	push rsi
	#16 çünkü hem stack hem push tutuyorsun
	#malloc rdi ile çalışıyor
	mov rdi, 16
	call malloc

	pop rsi
	pop rdi

	# +8 çünkü data'ya erişmeye çalışıyoruz
	mov [rax+8],rsi
	mov rcx, [rdi]
	mov [rax],rcx
	#stack'e rax'daki adresi at
	mov [rdi], rax

ret

.global linked_stack_pop
linked_stack_pop:
	mov rcx, [rdi]
	mov rax, [rcx+8]
	mov rdx, [rcx]
	#stack'in head'i rdi,
	mov [rdi], rdx

	#rax return değerimiz, koruma altına aldık
	push rax
	mov rdi, rcx
	call free
	pop rax


ret

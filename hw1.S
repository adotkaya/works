.intel_syntax noprefix
    .global main
    .text
main:
    push rbx
    push r15
    push r14
    push r13
    push r12

    mov r11, 0

    // Your code goes here.
    // You can use rax, rbx, rcx, rdx, rdi, rsi
    // You can use r8, r9, r10, r11, r12, r13, r14, r15

    // Loop, inner loop:   jnz, dec, cmp
    // Access to memory:

animalLoop:
	lea edi, BYTE PTR [strAnimal] 	#animalArr   		    edi
	mov ecx, 0 				#element counter
	mov eax, 1				#starting number

	mov [edi + ecx], eax    # mov to array x
	add ecx, 1
	add eax, 1
	cmp eax, 11
	jl animalLoop

voiceLoop:
	lea ebx, BYTE PTR [strVoice] 	#voiceArr   			ebx
	mov ecx, 0 				#element counter
	mov eax, 1				#starting number

	mov [ebx + ecx], eax    # mov to array x
	add ecx, 1
	add eax, 1
	cmp eax, 11
	jl voiceLoop

numLoop:
	lea edx, BYTE PTR [arrNum]		#numArr     			edx
	mov ecx, 0 				#element counter
	mov eax, 1				#starting number

	mov [edx + ecx], eax    # mov to array x
	add ecx, 1
	add eax, 1
	cmp eax, 11
	jl numLoop

loop1:
	mov r15, 2  #loop counter
	mov al, BYTE PTR [strIntro + 0]
	mov BYTE PTR [result + r11], al
    inc r11
    mov al, BYTE PTR [strAnimal + r11]
    mov BYTE PTR [result + r11], al
    inc r11
    dec r15
    cmp r15, 0
    jne loop1

loop2:
	mov r15, 6  #loop counter
	mov r12, 0
	mov al, BYTE PTR[strAnd + 0]
	mov BYTE PTR[result + r11], al
	inc r11
	mov al, BYTE PTR [strAnimal + r11]
	mov BYTE PTR[result + r11], al
	inc r11
	mov al, BYTE PTR [strVoice + r12]
	mov BYTE PTR[result + r11], al
	dec r15
	cmp r15, 0
	jne loop2

loop3:
	mov r15, 2  #loop counter
	inc r11
	mov al, BYTE PTR [strIntro + 0]
	mov BYTE PTR [result + r11], al
    inc r11
    mov al, BYTE PTR [strAnimal + 2]
    mov BYTE PTR [result + r11], al
    inc r11
    dec r15
    cmp r15, 0
    jne loop3

loop4:
	mov r15, 6  #loop counter
	mov r12, 2
	mov al, BYTE PTR[strAnd + 0]
	mov BYTE PTR[result + r11], al
	inc r11
	mov al, BYTE PTR [strAnimal + r11]
	mov BYTE PTR[result + r11], al
	inc r11
	mov al, BYTE PTR [strVoice + r12]
	mov BYTE PTR[result + r11], al
	dec r15
	cmp r15, 0
	jne loop4

loop1end:
	ret

loop2end:
	jmp loop1

loop3end:
	jmp loop2


    /////////////////////////
    // Print the result
    push    rax
    push    rcx
    lea     rdi, [rip + result]
    mov     rsi, rax
    xor     rax, rax
    call    printf
    pop     rcx
    pop     rax
    /////////////////////

    pop r12
    pop r13
    pop r14
    pop r15
    pop rbx
    ret



.data

arrNum:
    .word 6, 5, 4, 3

strIntro:
    .string "On the radio there's a little"
strAnimal:
    .string "chick", "hen",   "cock",         "turkey",        "pigeon", "cat", "dog" , "goat", "lamb", "cow" , "bull"
strVoice:
    .string "cheep", "co-co", "a-doodle-doo", "gobble gobble", "cru cru" , "mew", "woof", "mah", "bah", "moo", "muu"
strOutro:
    .string "And the tractor brumm, and the tractor bruum, and the tractor bruum and the chick oh oh"
strAnd:
    .string ", and"

result:
    .skip 10000

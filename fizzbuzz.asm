section .text
	global _start

_start:
	;MOV [num], byte 1
mainLoop:
	;Starts at 1
	ADD [num], byte 1
	;Change the number below to whatever number of times you want the loop to run
	CMP [num], byte 100
	
	JG quit
	
	MOV al, [num]
	XOR ah, ah
	MOV bl, 15
	DIV bl
	CMP ah, 0
	JE sectFizzBuzz

	MOV al, [num]
	XOR ah, ah
	MOV bl, 3
	DIV bl
	CMP ah, 0
	JE sectFizz
	
	MOV al, [num]
	XOR ah, ah
	MOV bl, 5
	DIV bl
	CMP ah, 0
	JE sectBuzz
	
	JNE sectNeither

	LOOP mainLoop
sectFizz:
	MOV edx, fizzLen
	MOV ecx, fizz
	MOV ebx, 1
	MOV eax, 4
	INT 0x80
	JMP mainLoop
sectBuzz:
	MOV edx, buzzLen
	MOV ecx, buzz
	MOV ebx, 1
	MOV eax, 4
	INT 0x80
	JMP mainLoop
sectFizzBuzz:
	MOV edx, fizzBuzzLen
	MOV ecx, fizzBuzz
	MOV ebx, 1
	MOV eax, 4
	INT 0x80
	JMP mainLoop
sectNeither:
	MOV edx, neitherLen
	MOV ecx, neither
	MOV ebx, 1
	MOV eax, 4
	INT 0x80
	JMP mainLoop
quit:
	MOV edx, len
	MOV ecx, msg
	MOV ebx, 1
	MOV eax, 4
	INT 0x80

	MOV eax, 1
	INT 0x80
section .data
	msg db 'Thanks for coming to my tedtalk',10
	len equ $ - msg
	num db 0

	fizz db 'Fizz!',10
	fizzLen equ $ - fizz

	buzz db 'Buzz!',10
	buzzLen equ $ - buzz

	fizzBuzz db 'Fizzbuzz!',10
	fizzBuzzLen equ $ - fizzBuzz

	neither db 'Not fizz, buzz or fizzbuzz!',10
	neitherLen equ $ - neither

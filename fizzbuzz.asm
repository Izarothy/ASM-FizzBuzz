;Fizzbuzz in ASM
;Print 1 to N (int)
;If number divisible by 3 print "fizz"
;If number divisible by 5 print "buzz"
;If number divisible by 15 print "fizzbuzz"
;Otherwise print number

segment .text
	global _start

_start:	
	;mov edx, fizzlen
	;mov ecx, fizz
	;mov ebx, STDOUT
	;mov eax, SYS_WRITE
	;0x80

	;mov edx, buzzlen
	;mov ecx, buzz
	;mov ebx, STDOUT
	;mov eax, SYS_WRITE
	;0x80

	;mov edx, fizzbuzzlen
	;mov ecx, fizzbuzzlen
	;mov ebx, STDOUT
	;mov eax, SYS_WRITE
	;0x80
	
	mov edx, len
	mov ecx, msg
	mov ebx, STDOUT
	mov eax, SYS_WRITE
	0x80

	mov eax, SYS_EXIT
	0x80
section .data
	SYS_WRITE equ 4
	SYS_EXIT equ 1
	STDOUT equ 1

	NUM equ 100

	msg db 'Hello'
	len equ $ - msg
	fizz db 'Fizz!'
	buzz db 'Buzz!'
	fizzbuzz db 'Fizzbuzz!'
	
	fizzlen equ $ - fizz
	buzzlen equ $ - buzz
	fizzbuzzlen equ $ - fizzbuzz	
	

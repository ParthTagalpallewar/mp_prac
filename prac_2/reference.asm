;Name : shrinidhi kulkarni
;RollNo : 21342
;Batch : F-3
;DOP- 10 / 03 / 2023


;title :
;CO1 mapped-Understand and apply various addressing modes an instruction set to implement 
;64-bit assembly language programs using FOSS (Free Open Source Software)

section .data
m1 db 'Enter the string',10,13
msg1 equ $-m1

section .bss
string resb 200
result resb 200

section .text
global _start
_start:

mov rax,1
mov rdi,1
mov rsi,m1
mov rdx,msg1
syscall

mov rax,0
mov rdi,0
mov rsi,result
mov rdx,40
syscall

;logic of counting starts
dec rax
mov rbx,rax
mov rdi,result
mov cx,16

up: 
rol rbx,04
mov al,bl
and al,0Fh
cmp al,09h
jg add_37
add al,30h
jmp skip

add_37:add al,37h

skip: mov[rdi],al
inc rdi
dec cx
jnz up
;logic of counting end

mov rax,1
mov rdi,1
mov rsi,result
mov rdx,16
syscall

mov rax,60
mov rdi,0
syscall





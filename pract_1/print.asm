section .data

msg db "Enter 5 64 bit hexadecimal numbers", 10, 13
msg_len equ $-msg

;Micro for printing number
%macro print 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endmacro

section .text
global _start

_start:

print msg, msg_len

mov rax, 60
mov rdi, 0
syscall
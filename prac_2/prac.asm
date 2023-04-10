;Assignment 1: Take string as input from user and print length of string

;DATA section
section .data
msg db "Enter String to find length: ", 10, 13
msg_len equ $-msg

msg1 db "Length of string is: ", 10, 13
msg1_len equ $-msg1

newLine db 0xA
lenNewLine equ $-newLine

cnt db 16

;Bss section
section .bss
str: resb 50
strlen: resb 50

;Micro for printing number
%macro print 2
mov rax, 1
mov rdi, 1
mov rsi, %1
mov rdx, %2
syscall
%endmacro

;macro for read input from user
%macro read 2
mov rax, 0
mov rdi, 0
mov rsi, %1
mov rdx, %2
syscall
%endmacro

section .text
global _start

_start:

;printing msg "to take input form user"
print msg, msg_len

;take input form user
read data, 20

;Length of Input is stored in rax register with enter(/n)
dec rax 
mov rbx, rax
mov rdi, strlen

;length is stored in rax register in hexadecimal format so convert it to ascii
Loop:
rol rbx, 4
mov al, bl
and al, 0fh

cmp al, 09h
jbe BELOW_9
add al, 07h

BELOW_9:
add al, 30h
mov [rdi], rax

inc rdi
dec byte[count]
jnz Loop


;print msg for output
print msg1, msg1_len

;print length we counted
print strlen, 50

;print new line at end
print newLine, lenNewLine

;system call for ending program
mov rax, 60
mov rdi, 0
syscall
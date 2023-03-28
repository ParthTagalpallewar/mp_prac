;Assignment 1: Take five 64bit hex numbers and store it into array and print it

section .data
msg db "Enter 5 64 bit hexadecimal numbers: ", 10, 13
msg_len equ $-msg

msg1 db "Entered Numbers are: ", 10, 13
msg1_len equ $-msg1A

section .bss
data resb 86
counter resb 1

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

;setting counter and rbx for looping
mov byte[counter], 5
mov rbx, data

;Taking input form user and storing it in array
L1:
read rbx, 17

add rbx, 17
dec byte[counter]
jnz L1

;printing data "to show data entered by user"
print msg1, msg1_len


;setting counter and rbx for looping
mov byte[counter], 5
mov rbx, data 

;printing data store in array
L2:
print rbx, 17

add rbx, 17
dec byte[counter]
jnz L2

;system call for ending program
mov rax, 60
mov rdi, 0
syscall
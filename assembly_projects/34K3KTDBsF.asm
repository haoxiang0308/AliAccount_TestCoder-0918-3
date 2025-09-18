; Program to print "Hello" to the console
; File: 34K3KTDBsF.asm

section .data
    hello db 'Hello', 0xA, 0  ; String "Hello" followed by newline and null terminator

section .text
    global _start

_start:
    ; Write system call
    mov rax, 1        ; sys_write
    mov rdi, 1        ; stdout
    mov rsi, hello    ; buffer
    mov rdx, 6        ; count (5 chars + newline)
    syscall

    ; Exit system call
    mov rax, 60       ; sys_exit
    mov rdi, 0        ; exit status
    syscall
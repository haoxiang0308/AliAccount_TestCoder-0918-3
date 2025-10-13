section .data
    hello db 'Hello', 0

section .text
    global _start

_start:
    ; write syscall
    mov rax, 1          ; sys_write
    mov rdi, 1          ; stdout
    mov rsi, hello      ; message
    mov rdx, 5          ; length
    syscall

    ; exit syscall
    mov rax, 60         ; sys_exit
    mov rdi, 0          ; status
    syscall
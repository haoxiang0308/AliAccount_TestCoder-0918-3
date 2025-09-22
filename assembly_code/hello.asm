section .data
    hello db 'Hello', 0xA, 0

section .text
    global _start

_start:
    ; write system call
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, hello      ; message
    mov edx, 6          ; length
    int 0x80            ; call kernel

    ; exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit status
    int 0x80            ; call kernel
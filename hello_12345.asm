section .data
    hello db 'Hello', 0Ah    ; String to print with newline
    hello_len equ $ - hello  ; Length of the string

section .text
    global _start

_start:
    ; Write system call
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, hello      ; message to write
    mov edx, hello_len  ; number of bytes to write
    int 0x80            ; call kernel

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit status 0
    int 0x80            ; call kernel
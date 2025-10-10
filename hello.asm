section .data
    hello db 'Hello', 0

section .text
    global _start

_start:
    ; write(1, hello, 5)
    mov eax, 4          ; sys_write system call number
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; message to write
    mov edx, 5          ; number of bytes to write
    int 0x80            ; call kernel

    ; exit(0)
    mov eax, 1          ; sys_exit system call number
    mov ebx, 0          ; exit status
    int 0x80            ; call kernel
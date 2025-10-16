section .data
    hello db 'Hello', 0xA  ; The string to print, followed by a newline
    hello_len equ $ - hello ; Length of the string

section .text
    global _start

_start:
    ; Write the string to stdout
    mov eax, 4          ; sys_write system call number
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; buffer to write
    mov edx, hello_len  ; number of bytes to write
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; sys_exit system call number
    xor ebx, ebx        ; exit status
    int 0x80            ; call kernel
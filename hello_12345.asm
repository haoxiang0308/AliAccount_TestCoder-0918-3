global _start

section .text
_start:
    ; write system call
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, msg        ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; exit system call
    mov eax, 1          ; sys_exit
    mov ebx, 0          ; exit status
    int 0x80            ; call kernel

section .data
    msg db 'Hello', 0xA ; message string with newline
    msg_len equ $ - msg ; length of message string
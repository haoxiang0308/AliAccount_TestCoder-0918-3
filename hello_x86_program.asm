section .data
    hello_msg db 'Hello', 0xA    ; Message string with newline
    msg_len equ $ - hello_msg    ; Length of the message

section .text
    global _start

_start:
    ; Write system call
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, hello_msg  ; message to write
    mov edx, msg_len    ; message length
    int 0x80            ; call kernel

    ; Exit system call
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit status 0
    int 0x80            ; call kernel
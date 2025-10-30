section .data
    hello_msg db 'Hello', 0xA    ; Define the string 'Hello' followed by a newline
    msg_len equ $ - hello_msg    ; Calculate the length of the string

section .text
    global _start

_start:
    ; Write system call
    mov eax, 4          ; sys_write system call number
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello_msg  ; pointer to the message
    mov edx, msg_len    ; length of the message
    int 0x80            ; call kernel

    ; Exit system call
    mov eax, 1          ; sys_exit system call number
    mov ebx, 0          ; exit status
    int 0x80            ; call kernel
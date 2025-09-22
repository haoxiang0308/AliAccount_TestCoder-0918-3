section .data
    msg db 'Hello', 0xA  ; Message to print, followed by newline character
    len equ $ - msg      ; Length of the message

section .text
    global _start

_start:
    ; Write system call
    mov eax, 4           ; sys_write system call number
    mov ebx, 1           ; file descriptor 1 (stdout)
    mov ecx, msg         ; pointer to the message
    mov edx, len         ; message length
    int 0x80             ; call kernel

    ; Exit system call
    mov eax, 1           ; sys_exit system call number
    mov ebx, 0           ; exit status
    int 0x80             ; call kernel
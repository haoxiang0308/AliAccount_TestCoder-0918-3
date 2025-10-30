section .text
    global _start

; Function to add two numbers
; Receives two numbers in EAX and EBX registers, returns sum in EAX
add_numbers:
    add eax, ebx      ; Add EBX to EAX
    ret               ; Return with result in EAX

_start:
    ; Example usage of the function
    mov eax, 5        ; Load first number into EAX
    mov ebx, 3        ; Load second number into EBX
    call add_numbers  ; Call the add function
    ; Result is now in EAX (8 in this case)
    
    ; Exit program
    mov ebx, 0        ; Exit status
    mov eax, 1        ; Exit syscall number
    int 0x80          ; Call kernel
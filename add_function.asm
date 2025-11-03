section .text
    global add_numbers

; Function to add two numbers
; Input: Two integers in EAX and EBX registers
; Output: Sum in EAX register
add_numbers:
    add eax, ebx    ; Add EBX to EAX
    ret             ; Return with result in EAX
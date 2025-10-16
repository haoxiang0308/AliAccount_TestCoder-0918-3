section .text
    global add_numbers

; Function to add two numbers
; Parameters: 
;   rdi - first number
;   rsi - second number
; Returns: sum in rax
add_numbers:
    mov rax, rdi    ; Move first number to rax
    add rax, rsi    ; Add second number to rax
    ret             ; Return with sum in rax
; x86 Assembly function to add two numbers
section .text
global add_numbers

; Function: add_numbers
; Parameters: Two integers passed in EAX and EBX registers
; Returns: Sum of the two numbers in EAX register
add_numbers:
    push ebp
    mov ebp, esp
    
    ; Add the two numbers (EAX already contains first parameter)
    ; Second parameter is in EBX
    add eax, ebx
    
    ; Restore stack frame and return
    mov esp, ebp
    pop ebp
    ret

; Alternative version that accepts parameters on the stack
; Function: add_numbers_stack
; Parameters: Two integers passed on the stack (pushed right-to-left)
; Returns: Sum of the two numbers in EAX register
global add_numbers_stack
add_numbers_stack:
    push ebp
    mov ebp, esp
    
    ; Get the two parameters from the stack
    ; [ebp+8] is first parameter, [ebp+12] is second parameter
    mov eax, [ebp+8]    ; Load first number into EAX
    mov ebx, [ebp+12]   ; Load second number into EBX
    add eax, ebx        ; Add them together
    
    ; Restore stack frame and return
    mov esp, ebp
    pop ebp
    ret
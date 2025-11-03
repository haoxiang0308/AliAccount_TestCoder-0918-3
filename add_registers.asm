; x86汇编程序 - 使用寄存器计算和
section .data
    result db 0          ; 存储结果的变量

section .text
    global _start

_start:
    ; 将值加载到寄存器中
    mov eax, 10          ; 将10加载到EAX寄存器
    mov ebx, 20          ; 将20加载到EBX寄存器
    mov ecx, 30          ; 将30加载到ECX寄存器
    
    ; 计算和 (EAX + EBX + ECX)
    add eax, ebx         ; EAX = EAX + EBX (10 + 20 = 30)
    add eax, ecx         ; EAX = EAX + ECX (30 + 30 = 60)
    
    ; 将结果存储到内存中
    mov [result], al     ; 将结果的低8位存储到result变量中
    
    ; 程序退出
    mov eax, 1           ; 系统调用号 (sys_exit)
    mov ebx, 0           ; 退出状态
    int 0x80             ; 调用内核
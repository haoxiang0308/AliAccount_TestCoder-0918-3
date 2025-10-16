; x86汇编程序：使用寄存器计算和并保存结果
section .data
    sum_result dd 0      ; 存储计算结果

section .text
    global _start

_start:
    ; 初始化寄存器
    mov eax, 5           ; EAX = 5
    mov ebx, 15          ; EBX = 15
    mov ecx, 25          ; ECX = 25
    
    ; 计算寄存器之和
    lea edx, [eax + ebx] ; EDX = EAX + EBX = 5 + 15 = 20
    add edx, ecx         ; EDX = EDX + ECX = 20 + 25 = 45
    
    ; 将结果保存到内存
    mov [sum_result], edx ; 保存结果到内存位置
    
    ; 退出程序
    mov eax, 1           ; 系统调用号 (sys_exit)
    xor ebx, ebx         ; 清零EBX寄存器作为退出状态
    int 0x80             ; 调用内核
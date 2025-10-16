section .text
    global _start

_start:
    ; 将值加载到寄存器中
    mov eax, 10      ; 将10放入EAX寄存器
    mov ebx, 20      ; 将20放入EBX寄存器
    mov ecx, 30      ; 将30放入ECX寄存器
    
    ; 计算和
    add eax, ebx     ; EAX = EAX + EBX (10 + 20 = 30)
    add eax, ecx     ; EAX = EAX + ECX (30 + 30 = 60)
    
    ; 结果现在在EAX寄存器中 (EAX = 60)
    
    ; 将结果存储到内存位置（可选）
    mov [result], eax
    
    ; 退出程序
    mov eax, 1       ; sys_exit系统调用号
    mov ebx, 0       ; 退出状态
    int 0x80         ; 调用内核

section .data
    result dd 0      ; 定义一个双字（4字节）变量存储结果
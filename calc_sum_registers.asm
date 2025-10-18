; x86汇编程序：使用寄存器计算和
section .data
    ; 定义一些变量用于存储结果
    sum_result dd 0    ; 32位整数变量存储结果

section .bss
    ; 未初始化数据段
    output_buffer resb 10  ; 用于输出的缓冲区

section .text
    global _start

_start:
    ; 将不同的数值加载到多个寄存器中
    mov eax, 100       ; 将100加载到EAX寄存器
    mov ebx, 50        ; 将50加载到EBX寄存器
    mov ecx, 25        ; 将25加载到ECX寄存器
    mov edx, 75        ; 将75加载到EDX寄存器
    
    ; 使用寄存器执行加法运算
    add eax, ebx       ; EAX = EAX + EBX (100 + 50 = 150)
    add eax, ecx       ; EAX = EAX + ECX (150 + 25 = 175)
    add eax, edx       ; EAX = EAX + EDX (175 + 75 = 250)
    
    ; 将最终结果保存到内存中
    mov [sum_result], eax  ; 将EAX寄存器的值（250）保存到sum_result变量中
    
    ; 程序正常退出
    mov eax, 1         ; sys_exit系统调用号
    xor ebx, ebx       ; 将EBX设置为0（退出状态）
    int 0x80           ; 调用Linux内核
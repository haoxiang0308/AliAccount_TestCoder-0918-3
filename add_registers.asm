; x86汇编程序：使用寄存器计算和
section .data
    result db 0        ; 存储结果的变量

section .text
    global _start

_start:
    ; 将数值加载到寄存器中
    mov eax, 10        ; 将10加载到EAX寄存器
    mov ebx, 20        ; 将20加载到EBX寄存器
    mov ecx, 30        ; 将30加载到ECX寄存器
    
    ; 计算和
    add eax, ebx       ; EAX = EAX + EBX (10 + 20 = 30)
    add eax, ecx       ; EAX = EAX + ECX (30 + 30 = 60)
    
    ; 将结果保存到内存中
    mov [result], eax  ; 将EAX的值保存到result变量中
    
    ; 退出程序
    mov eax, 1         ; sys_exit系统调用号
    int 0x80           ; 调用内核
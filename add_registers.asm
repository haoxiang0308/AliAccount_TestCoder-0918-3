; x86汇编程序：计算寄存器的和并保存结果
section .data
    result dd 0          ; 用于存储结果的内存位置

section .text
    global _start

_start:
    ; 将一些值加载到寄存器中
    mov eax, 10          ; EAX = 10
    mov ebx, 20          ; EBX = 20
    mov ecx, 30          ; ECX = 30
    mov edx, 40          ; EDX = 40

    ; 计算寄存器的和
    add eax, ebx         ; EAX = EAX + EBX = 10 + 20 = 30
    add eax, ecx         ; EAX = EAX + ECX = 30 + 30 = 60
    add eax, edx         ; EAX = EAX + EDX = 60 + 40 = 100

    ; 将结果保存到内存中
    mov [result], eax    ; 将EAX的值保存到result位置

    ; 程序退出
    mov eax, 1           ; sys_exit系统调用号
    mov ebx, 0           ; 退出状态码
    int 0x80             ; 调用内核
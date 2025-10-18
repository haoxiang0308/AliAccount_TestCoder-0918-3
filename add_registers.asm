section .data
    num1 dd 15          ; 第一个数字
    num2 dd 25          ; 第二个数字

section .bss
    result resd 1       ; 用于存储结果的空间

section .text
    global _start

_start:
    ; 将两个数字加载到寄存器中
    mov eax, [num1]     ; 将num1加载到EAX寄存器
    mov ebx, [num2]     ; 将num2加载到EBX寄存器
    
    ; 计算和
    add eax, ebx        ; EAX = EAX + EBX
    
    ; 将结果保存到内存
    mov [result], eax   ; 将结果存储到result变量
    
    ; 程序退出
    mov eax, 1          ; sys_exit系统调用号
    xor ebx, ebx        ; 退出状态码
    int 0x80            ; 调用内核
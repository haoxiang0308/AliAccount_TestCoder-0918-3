section .data
    num1 dd 10          ; 第一个数
    num2 dd 20          ; 第二个数
    result dd 0         ; 存储结果

section .text
    global _start

_start:
    ; 将num1加载到EAX寄存器
    mov eax, [num1]
    
    ; 将num2加到EAX寄存器
    add eax, [num2]
    
    ; 将结果存储到result变量
    mov [result], eax
    
    ; 程序退出
    mov ebx, 0          ; 退出状态
    mov eax, 1          ; sys_exit系统调用号
    int 0x80            ; 调用内核
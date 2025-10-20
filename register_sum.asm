; x86汇编程序 - 计算寄存器的和
section .data
    result_msg db "Sum of registers: ", 0
    newline db 10, 0

section .bss
    sum resb 4

section .text
    global _start

_start:
    ; 初始化一些寄存器的值
    mov eax, 10      ; 第一个数
    mov ebx, 20      ; 第二个数
    mov ecx, 30      ; 第三个数
    mov edx, 40      ; 第四个数

    ; 计算寄存器的和
    ; 将所有寄存器的值加到eax中
    add eax, ebx     ; eax = eax + ebx = 10 + 20 = 30
    add eax, ecx     ; eax = eax + ecx = 30 + 30 = 60
    add eax, edx     ; eax = eax + edx = 60 + 40 = 100

    ; 将结果存储到内存
    mov [sum], eax

    ; 程序退出
    mov eax, 1       ; sys_exit
    mov ebx, 0       ; exit status
    int 0x80         ; 调用系统中断
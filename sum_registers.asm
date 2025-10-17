; x86汇编程序：使用寄存器计算和
section .data
    result_msg db 'Sum result: ', 0
    newline db 10, 0

section .bss
    result resb 10

section .text
    global _start

_start:
    ; 将一些值加载到寄存器中
    mov eax, 10      ; 第一个数
    mov ebx, 20      ; 第二个数
    mov ecx, 30      ; 第三个数
    mov edx, 40      ; 第四个数

    ; 计算和 (使用eax作为累加器)
    add eax, ebx     ; eax = eax + ebx = 10 + 20 = 30
    add eax, ecx     ; eax = eax + ecx = 30 + 30 = 60
    add eax, edx     ; eax = eax + edx = 60 + 40 = 100

    ; 将结果存储到内存中
    mov [result], eax

    ; 退出程序
    mov eax, 1       ; sys_exit
    mov ebx, 0       ; exit status
    int 0x80
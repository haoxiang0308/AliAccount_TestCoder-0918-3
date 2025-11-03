; x86汇编程序 - 使用寄存器计算和 (随机命名版本)
section .data
    output_msg db 'Sum result: ', 0
    newline db 10, 0

section .bss
    result resb 4        ; 为结果预留4字节空间

section .text
    global _start

_start:
    ; 初始化寄存器中的值
    mov eax, 5           ; 第一个操作数
    mov ebx, 15          ; 第二个操作数
    mov ecx, 25          ; 第三个操作数
    mov edx, 35          ; 第四个操作数
    
    ; 执行加法运算
    add eax, ebx         ; eax = eax + ebx = 5 + 15 = 20
    add eax, ecx         ; eax = eax + ecx = 20 + 25 = 45
    add eax, edx         ; eax = eax + edx = 45 + 35 = 80
    
    ; 将结果存储到内存
    mov [result], eax    ; 将最终结果存储到result变量
    
    ; 程序正常退出
    mov eax, 1           ; sys_exit
    xor ebx, ebx         ; ebx = 0 (退出状态)
    int 0x80             ; 调用系统内核
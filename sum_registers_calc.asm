; x86汇编程序 - 寄存器加法计算
section .data
    ; 数据段 - 定义常量和初始化数据

section .bss
    ; 未初始化数据段

section .text
    global _start

_start:
    ; 使用不同的寄存器进行加法运算
    mov edi, 100         ; 将100加载到EDI寄存器
    mov esi, 200         ; 将200加载到ESI寄存器
    mov ebp, 300         ; 将300加载到EBP寄存器
    
    ; 执行加法运算
    add edi, esi         ; EDI = EDI + ESI = 100 + 200 = 300
    add edi, ebp         ; EDI = EDI + EBP = 300 + 300 = 600
    
    ; 将计算结果存储到内存（使用ESP栈指针寄存器）
    push edi             ; 将结果压入栈中
    
    ; 程序退出
    mov eax, 1           ; 系统调用号 (sys_exit)
    mov ebx, 0           ; 退出状态
    int 0x80             ; 调用内核
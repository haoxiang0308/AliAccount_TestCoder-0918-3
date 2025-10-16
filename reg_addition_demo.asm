; x86汇编程序：寄存器加法运算示例
section .data
    output dd 0          ; 输出结果存储位置

section .bss
    ; 未初始化数据段

section .text
    global _start

_start:
    ; 加载初始值到寄存器
    mov eax, 100         ; EAX = 100
    mov ebx, 200         ; EBX = 200
    mov ecx, 300         ; ECX = 300
    mov esi, 400         ; ESI = 400
    mov edi, 500         ; EDI = 500

    ; 使用不同方法计算寄存器之和
    push eax             ; 保存EAX值
    add eax, ebx         ; EAX = EAX + EBX = 100 + 200 = 300
    add eax, ecx         ; EAX = EAX + ECX = 300 + 300 = 600
    add eax, esi         ; EAX = EAX + ESI = 600 + 400 = 1000
    add eax, edi         ; EAX = EAX + EDI = 1000 + 500 = 1500
    
    ; 将最终结果存储到内存
    mov [output], eax    ; 保存计算结果
    
    ; 恢复EAX原始值（演示栈操作）
    pop eax              ; 恢复原始EAX值

    ; 退出程序
    mov eax, 1           ; 系统调用退出号
    mov ebx, 0           ; 退出状态码
    int 0x80             ; 调用系统内核
; x86汇编程序 - 计算寄存器的和
section .data
    result_msg db 'Sum of registers: ', 0
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

    ; 计算所有寄存器的和
    ; 将ebx, ecx, edx的值加到eax中
    add eax, ebx     ; eax = eax + ebx = 10 + 20 = 30
    add eax, ecx     ; eax = eax + ecx = 30 + 30 = 60
    add eax, edx     ; eax = eax + edx = 60 + 40 = 100

    ; 此时eax包含所有寄存器值的和 (100)

    ; 将结果转换为字符串以便输出
    mov ebx, eax     ; 将结果保存到ebx
    mov edi, result  ; 指向结果字符串缓冲区
    mov eax, ebx     ; 将数值复制到eax
    call num_to_string

    ; 输出结果 (这里简化处理，实际的系统调用会更复杂)
    ; 退出程序
    mov eax, 1       ; sys_exit
    mov ebx, 0       ; exit status
    int 0x80

; 将数字转换为字符串的函数
num_to_string:
    push eax
    push ebx
    push ecx
    push edx
    
    mov ecx, 0       ; 计数器
    mov ebx, 10      ; 除数

convert_loop:
    xor edx, edx     ; 清除edx
    div ebx          ; eax / 10, 余数在edx中
    add dl, '0'      ; 转换为ASCII字符
    push dx          ; 将字符压入栈
    inc ecx          ; 增加计数器
    test eax, eax    ; 检查商是否为0
    jnz convert_loop ; 如果不为0则继续循环

store_loop:
    pop ax           ; 从栈中弹出字符
    mov [edi], al    ; 存储到结果缓冲区
    inc edi          ; 移动到下一个位置
    loop store_loop  ; 循环直到ecx为0

    mov byte [edi], 0 ; 添加字符串结束符

    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
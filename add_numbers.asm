section .text
    global _start

_start:
    ; Загружаем два числа в регистры
    mov eax, 5      ; Первое число
    mov ebx, 10     ; Второе число

    ; Складываем числа
    add eax, ebx    ; Результат сложения в eax

    ; Выход из программы, результат в eax
    mov ebx, eax    ; Перемещаем результат в ebx для системного вызова exit
    mov eax, 1      ; Номер системного вызова sys_exit
    int 0x80        ; Вызов ядра Linux
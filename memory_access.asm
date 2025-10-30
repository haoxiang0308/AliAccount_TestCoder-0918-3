section .data
    ; Dados estáticos
    msg db 'Dados armazenados na memória e escritos no arquivo', 0xA
    msg_len equ $ - msg
    file_content db 'Conteúdo armazenado na memória: ', 0
    data_to_store db 'Hello World Assembly!', 0
    random_name db 'random_file_', 0
    extension db '.txt', 0
    ; Buffer para nome do arquivo aleatório
    filename_buffer db 16 dup(0)  ; Buffer para nome do arquivo
    
section .bss
    ; Área de memória não inicializada
    buffer resb 256  ; Buffer para leitura/escrita
    
section .text
    global _start

_start:
    ; Chama função para gerar nome aleatório
    call generate_random_name
    
    ; Abrir/criar arquivo para escrita
    mov eax, 5          ; sys_open
    mov ebx, filename_buffer
    mov ecx, 577        ; O_CREAT | O_WRONLY
    mov edx, 0644o      ; Permissões do arquivo
    int 0x80
    
    mov ebx, eax        ; fd do arquivo
    
    ; Escrever mensagem no arquivo
    mov eax, 4          ; sys_write
    mov ecx, msg
    mov edx, msg_len
    int 0x80
    
    ; Escrever conteúdo adicional
    mov eax, 4          ; sys_write
    mov ecx, data_to_store
    mov edx, 21         ; Tamanho da string
    int 0x80
    
    ; Fechar arquivo
    mov eax, 6          ; sys_close
    int 0x80
    
    ; Saída do programa
    mov eax, 1          ; sys_exit
    mov ebx, 0
    int 0x80

; Função para gerar nome aleatório baseado em tempo
generate_random_name:
    ; Copiar nome base para o início do buffer primeiro
    mov esi, random_name
    mov edi, filename_buffer
    mov ecx, 12         ; Tamanho de 'random_file_'
    cld
    rep movsb
    
    ; Obter tempo atual como fonte de aleatoriedade
    mov eax, 13         ; sys_time
    mov ebx, 0
    int 0x80
    
    ; Converter número para string hexadecimal
    mov ebx, eax        ; Número aleatório
    mov edi, filename_buffer + 19  ; Posição para o último dígito hexadecimal
    mov ecx, 8          ; 8 dígitos hexadecimais
    
convert_loop:
    cmp ecx, 0
    je done_convert
    
    mov eax, ebx
    and eax, 0x0F       ; Pegar 4 bits (1 dígito hex)
    
    ; Converter para caractere
    cmp eax, 9
    jg hex_letter
    add eax, '0'
    jmp store_char
    
hex_letter:
    sub eax, 10
    add eax, 'A'
    
store_char:
    mov [edi], al
    dec edi
    shr ebx, 4
    dec ecx
    jmp convert_loop
    
done_convert:
    ; Adicionar extensão
    mov esi, extension
    mov edi, filename_buffer + 20  ; Posição após os 8 dígitos hexadecimais
    mov ecx, 4          ; Tamanho de '.txt'
    rep movsb
    
    ret
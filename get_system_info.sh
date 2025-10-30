#!/bin/bash

# Função para obter informações do sistema e salvar em um arquivo com nome aleatório
get_system_info() {
    # Gerando um nome de arquivo aleatório
    random_filename="system_info_$(date +%s)_$((RANDOM)).txt"
    
    # Coletando informações do sistema
    {
        echo "Informações do Sistema - $(date)"
        echo "=================================================="
        echo "Nome do Host: $(hostname)"
        echo "Usuário: $(whoami)"
        echo "Sistema Operacional: $(uname -s)"
        echo "Versão do Kernel: $(uname -r)"
        echo "Arquitetura: $(uname -m)"
        echo "Versão da Distribuição: $(cat /etc/os-release 2>/dev/null | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '\"' || echo 'N/A')"
        echo "Uptime: $(uptime -p 2>/dev/null || uptime)"
        echo "Data e Hora Atuais: $(date)"
        echo ""
        echo "Uso de Memória:"
        free -h
        echo ""
        echo "Espaço em Disco:"
        df -h
        echo ""
        echo "Processador:"
        cat /proc/cpuinfo | grep "model name" | uniq | sed 's/model name.*: //'
        echo "Número de CPUs: $(nproc)"
        echo ""
        echo "Informações de Rede:"
        ip addr show 2>/dev/null || ifconfig
    } > "$random_filename"
    
    echo "Informações do sistema salvas em: $random_filename"
    echo "$random_filename"
}

# Chamar a função
get_system_info
#!/usr/bin/env python3
import platform
import psutil
import os
import datetime
import random

def get_system_info():
    """
    Função para obter informações do sistema e salvar em um arquivo com nome aleatório
    """
    # Obtém informações do sistema
    system_info = {
        'Computer Name': platform.node(),
        'User Name': os.environ.get('USER', os.environ.get('USERNAME', 'Unknown')),
        'OS': platform.system(),
        'OS Version': platform.version(),
        'OS Release': platform.release(),
        'Architecture': platform.architecture()[0],
        'Processor': platform.processor() or platform.machine(),
        'Machine': platform.machine(),
        'Total Physical Memory (bytes)': psutil.virtual_memory().total,
        'Available Physical Memory (bytes)': psutil.virtual_memory().available,
        'Used Physical Memory (bytes)': psutil.virtual_memory().used,
        'CPU Count': psutil.cpu_count(),
        'CPU Count (logical)': psutil.cpu_count(logical=True),
        'Disk Usage': {partition.device: f"{psutil.disk_usage(partition.mountpoint).total} bytes total, {psutil.disk_usage(partition.mountpoint).used} bytes used" for partition in psutil.disk_partitions()[:3]}, # Limita a 3 partições
        'Boot Time': datetime.datetime.fromtimestamp(psutil.boot_time()),
        'Current Time': datetime.datetime.now()
    }

    # Gera um nome de arquivo aleatório
    random_filename = f"SystemInfo_{datetime.datetime.now().strftime('%Y%m%d_%H%M%S')}_{random.randint(1000, 9999)}.txt"
    
    # Caminho completo do arquivo
    file_path = os.path.join(os.getcwd(), random_filename)

    # Converte as informações para string e salva no arquivo
    content = "=== Informações do Sistema ===\n"
    content += f"Data/Hora: {datetime.datetime.now()}\n\n"
    
    for key, value in system_info.items():
        content += f"{key}: {value}\n"

    # Escreve o conteúdo no arquivo
    with open(file_path, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"Informações do sistema salvas em: {file_path}")
    
    # Retorna o caminho do arquivo
    return file_path

# Chama a função
if __name__ == "__main__":
    get_system_info()
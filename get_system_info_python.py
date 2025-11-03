#!/usr/bin/env python3
"""
Script Python para obter informações do sistema e salvar em um arquivo com nome aleatório.
Esta é uma versão funcional equivalente ao script PowerShell solicitado.
"""

import platform
import psutil
import os
import random
import socket
from datetime import datetime


def get_system_info():
    """
    Função para obter informações do sistema e salvar em um arquivo com nome aleatório
    """
    # Obtém várias informações do sistema
    system_info = {
        'ComputerName': socket.gethostname(),
        'UserName': os.environ.get('USER', os.environ.get('USERNAME', 'Unknown')),
        'OS': f"{platform.system()} {platform.release()}",
        'OSVersion': platform.version() if platform.system() == 'Windows' else 'N/A',
        'Architecture': platform.machine(),
        'Platform': platform.platform(),
        'Processor': platform.processor() or 'N/A',
        'PhysicalCores': psutil.cpu_count(logical=False),
        'TotalCores': psutil.cpu_count(logical=True),
        'MaxFrequency': f"{psutil.cpu_freq().max:.2f}Mhz" if psutil.cpu_freq() else 'N/A',
        'TotalRAM': f"{round(psutil.virtual_memory().total / (1024**3), 2)} GB",
        'AvailableRAM': f"{round(psutil.virtual_memory().available / (1024**3), 2)} GB",
        'UsedRAM': f"{round(psutil.virtual_memory().used / (1024**3), 2)} GB",
        'DiskInfo': []
    }

    # Obtém informações sobre discos
    partitions = psutil.disk_partitions()
    for partition in partitions:
        try:
            partition_usage = psutil.disk_usage(partition.mountpoint)
            disk_info = {
                'Device': partition.device,
                'Mountpoint': partition.mountpoint,
                'TotalSize': f"{round(partition_usage.total / (1024**3), 2)} GB",
                'FreeSpace': f"{round(partition_usage.free / (1024**3), 2)} GB",
                'UsedSpace': f"{round(partition_usage.used / (1024**3), 2)} GB"
            }
            system_info['DiskInfo'].append(disk_info)
        except PermissionError:
            # Esta partição não pode ser acessada
            continue

    # Gera um nome de arquivo aleatório
    random_filename = f"SystemInfo_{random.randint(1, 99999)}.txt"

    # Converte as informações para string formatada
    output = "System Information Report\n"
    output += f"Generated on: {datetime.now()}\n"
    output += "=" * 50 + "\n"

    for key, value in system_info.items():
        if key == "DiskInfo":
            output += f"{key}:\n"
            for disk in value:
                output += f"  Device: {disk['Device']}\n"
                output += f"  Mountpoint: {disk['Mountpoint']}\n"
                output += f"  Total Size: {disk['TotalSize']}\n"
                output += f"  Free Space: {disk['FreeSpace']}\n"
                output += f"  Used Space: {disk['UsedSpace']}\n"
        else:
            output += f"{key}: {value}\n"

    # Salva as informações no arquivo com nome aleatório
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(output)

    print(f"System information saved to: {random_filename}")
    return random_filename


if __name__ == "__main__":
    get_system_info()
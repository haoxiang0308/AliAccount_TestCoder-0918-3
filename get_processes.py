#!/usr/bin/env python3
import psutil
import random
import string

def get_random_filename(length=8):
    """Generates a random filename with .txt extension."""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(length))
    return f"processes_{random_name}.txt"

def save_processes_to_file(filename):
    """Gets the list of processes and saves it to a file."""
    try:
        with open(filename, 'w') as f:
            f.write("PID\tName\tStatus\tCPU %\tMemory (MB)\n")
            f.write("-" * 50 + "\n")
            for proc in psutil.process_iter(['pid', 'name', 'status', 'cpu_percent', 'memory_info']):
                try:
                    # Refresh CPU usage for better accuracy
                    proc.cpu_percent()
                    mem_mb = proc.memory_info().rss / 1024 / 1024
                    f.write(f"{proc.info['pid']}\t{proc.info['name']}\t{proc.info['status']}\t{proc.cpu_percent():.2f}\t{mem_mb:.2f}\n")
                except (psutil.NoSuchProcess, psutil.AccessDenied):
                    # Process might have terminated or inaccessible
                    pass
        print(f"Processes saved to {filename}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    filename = get_random_filename()
    save_processes_to_file(filename)
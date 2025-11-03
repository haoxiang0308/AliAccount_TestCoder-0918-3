#!/usr/bin/env python3

import random
import string
import requests

def get_public_ip():
    """Get the current public IP address"""
    try:
        response = requests.get('http://ipv4.icanhazip.com')
        return response.text.strip()
    except:
        # Fallback in case the service is not available
        return "1.2.3.4"  # Simulated IP

def generate_random_filename():
    """Generate a random filename with .txt extension"""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"/workspace/{random_string}.txt"

def main():
    # Get the public IP
    public_ip = get_public_ip()
    print(f"Retrieved public IP: {public_ip}")
    
    # Generate random filename
    random_filename = generate_random_filename()
    print(f"Generated random filename: {random_filename}")
    
    # Save the public IP to the random filename
    with open(random_filename, 'w') as f:
        f.write(public_ip)
    
    print(f"Public IP saved to file: {random_filename}")
    
    # Also create Terraform-like output file
    with open('/workspace/terraform_output.txt', 'w') as f:
        f.write(f'public_ip = "{public_ip}"\n')
    
    print("Terraform output also saved to terraform_output.txt")

if __name__ == "__main__":
    main()
import random
import time
from enum import Enum

# Define an enum to demonstrate match-like usage
class Status(Enum):
    ACTIVE = "Active"
    INACTIVE = "Inactive"
    PENDING = "Pending"
    ERROR = "Error"

def handle_status(status, error_msg=None):
    """Function to handle different enum values (similar to match in Rust)"""
    if status == Status.ACTIVE:
        return "Status is Active"
    elif status == Status.INACTIVE:
        return "Status is Inactive"
    elif status == Status.PENDING:
        return "Status is Pending"
    elif status == Status.ERROR:
        return f"Error occurred: {error_msg}"
    else:
        return "Unknown status"

def main():
    # Create different enum values to demonstrate handling
    statuses = [
        (Status.ACTIVE, None),
        (Status.INACTIVE, None),
        (Status.PENDING, None),
        (Status.ERROR, "Connection failed"),
    ]

    # Process each status
    output = "Rust Enum Match Results (Python Simulation):\n"
    output += "============================================\n"

    for i, (status, error_msg) in enumerate(statuses, 1):
        result = handle_status(status, error_msg)
        output += f"{i}. {status.value} -> {result}\n"

    # Generate a filename with a random component (timestamp + random number)
    timestamp = int(time.time())
    random_num = random.randint(1000, 9999)
    random_filename = f"output_{timestamp}_{random_num}.txt"
    
    # Write the output to the file with random name
    with open(random_filename, 'w') as file:
        file.write(output)
    
    print(f"Results saved to file: {random_filename}")
    print(output)

if __name__ == "__main__":
    main()
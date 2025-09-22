#!/usr/bin/env python3

def is_even(n):
    """Check if a number is even"""
    return n % 2 == 0

# Test the function
if __name__ == "__main__":
    test_number = 42
    if is_even(test_number):
        print(f"{test_number} is even")
    else:
        print(f"{test_number} is odd")
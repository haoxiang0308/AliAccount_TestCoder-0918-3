# Recursive factorial function in Python
def factorial(n):
    if n <= 1:
        return 1
    else:
        return n * factorial(n - 1)

# Test the function
if __name__ == "__main__":
    test_value = 5
    result = factorial(test_value)
    print(f"Factorial of {test_value} is {result}")
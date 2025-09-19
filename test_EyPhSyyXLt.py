def reverse_string(s):
    """Reverse a string."""
    return s[::-1]

def test_reverse_string():
    """Test the string reversal function."""
    # Test normal string
    assert reverse_string("hello") == "olleh"
    
    # Test empty string
    assert reverse_string("") == ""
    
    # Test single character
    assert reverse_string("a") == "a"
    
    # Test palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test string with spaces
    assert reverse_string("hello world") == "dlrow olleh"
    
    # Test string with special characters
    assert reverse_string("hello!@#$%") == "%$#@!olleh"

def test_reverse_string_with_numbers():
    """Test string reversal with numbers."""
    assert reverse_string("12345") == "54321"
    assert reverse_string("abc123") == "321cba"

if __name__ == "__main__":
    # Run the tests
    test_reverse_string()
    test_reverse_string_with_numbers()
    print("All tests passed!")
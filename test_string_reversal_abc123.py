import pytest

def reverse_string(s):
    """Function to reverse a string."""
    return s[::-1]

def test_string_reversal():
    """Test function for string reversal."""
    # Test basic string reversal
    assert reverse_string("hello") == "olleh"
    assert reverse_string("world") == "dlrow"
    
    # Test edge cases
    assert reverse_string("") == ""
    assert reverse_string("a") == "a"
    assert reverse_string("ab") == "ba"
    
    # Test with special characters and numbers
    assert reverse_string("12345") == "54321"
    assert reverse_string("!@#$%") == "%$#@!"
    assert reverse_string("Hello, World!") == "!dlroW ,olleH"
    
    # Test palindrome
    assert reverse_string("racecar") == "racecar"

if __name__ == "__main__":
    pytest.main()
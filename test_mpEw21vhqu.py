def reverse_string(s):
    """Reverse a string."""
    return s[::-1]


def test_reverse_string():
    """Test the string reversal function."""
    # Test with a regular string
    assert reverse_string("hello") == "olleh"
    
    # Test with an empty string
    assert reverse_string("") == ""
    
    # Test with a single character
    assert reverse_string("a") == "a"
    
    # Test with a palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test with numbers as string
    assert reverse_string("12345") == "54321"
    
    # Test with special characters
    assert reverse_string("hello, world!") == "!dlrow ,olleh"


if __name__ == "__main__":
    test_reverse_string()
    print("All tests passed!")
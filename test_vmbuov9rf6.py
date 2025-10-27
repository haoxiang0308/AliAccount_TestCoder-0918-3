import pytest
import random
import string


def reverse_string(s):
    """Function to reverse a string."""
    return s[::-1]


def test_string_reversal():
    """Test function for string reversal."""
    # Test with simple strings
    assert reverse_string("hello") == "olleh"
    assert reverse_string("world") == "dlrow"
    
    # Test with empty string
    assert reverse_string("") == ""
    
    # Test with single character
    assert reverse_string("a") == "a"
    
    # Test with palindrome
    assert reverse_string("racecar") == "racecar"
    
    # Test with numbers and special characters
    assert reverse_string("12345") == "54321"
    assert reverse_string("!@#$%") == "%$#@!"
    
    # Test with random string
    random_str = ''.join(random.choices(string.ascii_letters + string.digits, k=10))
    reversed_str = reverse_string(random_str)
    assert reversed_str == random_str[::-1]
    # Double reversal should give original string
    assert reverse_string(reversed_str) == random_str


if __name__ == "__main__":
    pytest.main()
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
    
    # Test with special characters and spaces
    assert reverse_string("hello world!") == "!dlrow olleh"
    assert reverse_string("12345") == "54321"
    assert reverse_string("A man a plan a canal Panama") == "amanaP lanac a nalp a nam A"

if __name__ == "__main__":
    pytest.main()